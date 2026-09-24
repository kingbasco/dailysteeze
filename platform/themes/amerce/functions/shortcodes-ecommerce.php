<?php

// ============================================================
// Ecommerce shortcodes registry
// 8 shortcodes: products, categories, brands, flash-sale,
// product-groups, coupons, collections, recently-viewed-products.
// All registrations gated by is_plugin_active('ecommerce') early-return below.
// ============================================================

use Botble\Base\Forms\FieldOptions\NumberFieldOption;
use Botble\Base\Forms\FieldOptions\OnOffFieldOption;
use Botble\Base\Forms\FieldOptions\TextFieldOption;
use Botble\Base\Forms\FieldOptions\UiSelectorFieldOption;
use Botble\Base\Forms\Fields\NumberField;
use Botble\Base\Forms\Fields\OnOffField;
use Botble\Base\Forms\Fields\TextField;
use Botble\Base\Forms\Fields\UiSelectorField;
use Botble\Ecommerce\Facades\Cart;
use Botble\Ecommerce\Facades\EcommerceHelper;
use Botble\Ecommerce\Models\Brand;
use Botble\Ecommerce\Models\Discount;
use Botble\Ecommerce\Models\FlashSale;
use Botble\Ecommerce\Models\Product;
use Botble\Ecommerce\Models\ProductCategory;
use Botble\Ecommerce\Models\ProductCollection;
use Botble\Ecommerce\Repositories\Interfaces\BrandInterface;
use Botble\Ecommerce\Repositories\Interfaces\FlashSaleInterface;
use Botble\Ecommerce\Repositories\Interfaces\ProductCategoryInterface;
use Botble\Ecommerce\Repositories\Interfaces\ProductCollectionInterface;
use Botble\Ecommerce\Repositories\Interfaces\ProductInterface;
use Botble\Shortcode\Facades\Shortcode;
use Botble\Shortcode\Forms\FieldOptions\ShortcodeTabsFieldOption;
use Botble\Shortcode\Forms\Fields\ShortcodeTabsField;
use Botble\Shortcode\Forms\ShortcodeForm;
use Botble\Slug\Models\Slug;
use Botble\Theme\Facades\Theme;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Str;

if (! is_plugin_active('ecommerce')) {
    return;
}

// ============================================================
// 1. [ecommerce-products] — Product listing block
// ============================================================
Shortcode::register(
    'ecommerce-products',
    __('Ecommerce: Products'),
    __('Show products in grid, slider, list, or featured layout'),
    function ($shortcode) {
        $with = ['slugable', 'productCollections', 'productLabels', 'productAttributeSets', 'variations.productAttributes', 'taxes'];
        if (is_plugin_active('marketplace')) {
            $with[] = 'store';
        }
        $repo = app(ProductInterface::class);

        // Build a single product query from a per-shortcode/per-tab spec.
        // `sale` source dispatches to the repository's getOnSaleProducts so the
        // active flash-sale window + sale_price > 0 logic stays consistent.
        $loadProducts = function (array $spec) use ($repo, $with) {
            $source = $spec['source'] ?? 'latest';
            $categoryIds = array_filter((array) ($spec['category_ids'] ?? []));

            if ($categoryIds) {
                $query = Product::query()
                    ->wherePublished()
                    ->where('is_variation', false)
                    ->with($with)
                    ->whereHas('categories', fn ($query) => $query->whereIn('ec_product_categories.id', $categoryIds));

                if ($source === 'best-seller') {
                    $query->orderByDesc('views');
                } elseif ($source === 'featured') {
                    $query->where('is_featured', 1);
                } else {
                    $query->latest('created_at');
                }

                return $query->limit((int) ($spec['limit'] ?? 12) ?: 12)->get();
            }

            $params = [
                'paginate' => false,
                'take' => (int) ($spec['limit'] ?? 12) ?: 12,
                'with' => $with,
            ];

            if ($source === 'manual' && ! empty($spec['product_ids'])) {
                $params['condition']['ec_products.id'] = $spec['product_ids'];
            } elseif ($source === 'best-seller') {
                $params['order_by'] = ['ec_products.views' => 'DESC'];
            } elseif ($source === 'featured') {
                $params['condition']['ec_products.is_featured'] = 1;
            } elseif ($source !== 'sale') {
                $params['order_by'] = ['ec_products.created_at' => 'DESC'];
            }

            if (! empty($spec['category_ids'])) {
                $params['categories'] = ['by' => 'id', 'value_in' => $spec['category_ids']];
            }

            if (! empty($spec['brand_ids'])) {
                $params['brand_ids'] = $spec['brand_ids'];
            }

            return $source === 'sale'
                ? $repo->getOnSaleProducts($params)
                : $repo->getProducts($params);
        };

        $baseSpec = [
            'source' => $shortcode->source ?: 'latest',
            'limit' => (int) $shortcode->limit ?: 12,
            'category_ids' => Shortcode::fields()->getIds('category_ids', $shortcode),
            'brand_ids' => Shortcode::fields()->getIds('brand_ids', $shortcode),
            'product_ids' => Shortcode::fields()->getIds('product_ids', $shortcode),
        ];

        // Tabs mode — parse pipe/comma-separated label/category/source lists
        // (one entry per tab) and load a separate product set per tab.
        if (in_array($shortcode->style ?? '', ['style-tabs', 'style-auto-featured-tabs'], true)) {
            $labels = array_values(array_filter(array_map('trim', explode('|', (string) ($shortcode->tab_labels ?? '')))));
            if (empty($labels)) {
                $labels = [__('Tab 1')];
            }
            $categoryGroups = array_pad(array_map('trim', explode('|', (string) ($shortcode->tab_categories ?? ''))), count($labels), '');
            $sources        = array_pad(array_map('trim', explode('|', (string) ($shortcode->tab_sources ?? ''))), count($labels), '');
            // tab_icons: pipe-separated media paths, one per tab — used by the
            // style-tabs `tab_nav_style=v4` vertical icon nav (home-office §6).
            $tabIcons       = array_pad(array_map('trim', explode('|', (string) ($shortcode->tab_icons ?? ''))), count($labels), '');
            $perTabLimit    = (int) ($shortcode->limit ?? 8) ?: 8;
            // Tab content always loads via AJAX (only tab 0 is server-rendered) when
            // the AJAX route is available — keeps the homepage payload light. Falls
            // back to fully server-rendered bootstrap tabs only if the route is missing.
            $ajaxTabs       = Route::has('public.ajax.ecommerce-products-tab');

            $tabs = [];
            foreach ($labels as $i => $label) {
                $catIds = $categoryGroups[$i] !== ''
                    ? collect(explode(',', $categoryGroups[$i]))
                        ->map(function (string $value) {
                            $value = trim($value);

                            if ($value === '') {
                                return null;
                            }

                            if (is_numeric($value)) {
                                return (int) $value;
                            }

                            $slug = Slug::query()
                                ->where('key', $value)
                                ->where('reference_type', ProductCategory::class)
                                ->first();

                            if ($slug) {
                                return (int) $slug->reference_id;
                            }

                            return ProductCategory::query()
                                ->where('name', $value)
                                ->value('id');
                        })
                        ->filter()
                        ->map(fn ($id) => (int) $id)
                        ->values()
                        ->all()
                    : $baseSpec['category_ids'];
                $tabs[] = [
                    'label' => $label,
                    'slug' => Str::slug($label) ?: 'tab-' . ($i + 1),
                    'source' => $sources[$i] !== '' ? $sources[$i] : $baseSpec['source'],
                    'category_ids' => $catIds,
                    'category_value' => $categoryGroups[$i] ?? '',
                    'icon' => $tabIcons[$i] ?? '',
                    'products' => (! $ajaxTabs || $i === 0) ? $loadProducts([
                        'source' => $sources[$i] !== '' ? $sources[$i] : $baseSpec['source'],
                        'limit' => $perTabLimit,
                        'category_ids' => $catIds,
                        'brand_ids' => $baseSpec['brand_ids'],
                        'product_ids' => $baseSpec['product_ids'],
                    ]) : collect(),
                    'loaded' => ! $ajaxTabs || $i === 0,
                ];
            }

            return Theme::partial('shortcodes.ecommerce-products.index', compact('shortcode', 'tabs') + ['products' => $tabs[0]['products'] ?? collect()]);
        }

        $products = $loadProducts($baseSpec);

        return Theme::partial('shortcodes.ecommerce-products.index', compact('shortcode', 'products'));
    }
);

Shortcode::setAdminConfig('ecommerce-products', function (array $attributes) {
    return ShortcodeForm::createFromArray($attributes)
        ->withLazyLoading()
        ->add('style', UiSelectorField::class, UiSelectorFieldOption::make()
            ->label(__('Layout'))
            ->choices([
                'style-grid' => ['label' => __('Grid'), 'image' => Theme::asset()->url('images/shortcodes/ecommerce-products/grid.png')],
                'style-slider' => ['label' => __('Slider'), 'image' => Theme::asset()->url('images/shortcodes/ecommerce-products/slider.png')],
                'style-list' => ['label' => __('List'), 'image' => Theme::asset()->url('images/shortcodes/ecommerce-products/list.png')],
                'style-featured' => ['label' => __('Featured'), 'image' => Theme::asset()->url('images/shortcodes/ecommerce-products/featured.png')],
            ])
            ->defaultValue($attributes['style'] ?? 'style-grid')
            ->numberItemsPerRow(4))
        ->add('title', TextField::class, TextFieldOption::make()->label(__('Title')))
        ->add('subtitle', TextField::class, TextFieldOption::make()->label(__('Subtitle')))
        ->add('source', 'customRadio', [
            'label' => __('Source'),
            'choices' => [
                'latest' => __('Latest products'),
                'best-seller' => __('Best sellers'),
                'featured' => __('Featured'),
                'sale' => __('On sale'),
                'manual' => __('Manual selection'),
            ],
            'default_value' => $attributes['source'] ?? 'latest',
        ])
        ->add('category_ids', 'multiCheckList', [
            'label' => __('Categories'),
            'choices' => ProductCategory::query()->pluck('name', 'id')->all(),
        ])
        ->add('brand_ids', 'multiCheckList', [
            'label' => __('Brands'),
            'choices' => Brand::query()->pluck('name', 'id')->all(),
        ])
        ->add('product_ids', 'multiCheckList', [
            'label' => __('Products (manual selection)'),
            // Only load the full product list when actually using manual selection
            // (or editing a shortcode that already has product_ids). Eager-loading
            // every product explodes the modal HTML on large catalogs (8k+ products).
            'choices' => (($attributes['source'] ?? null) === 'manual' || ! empty($attributes['product_ids']))
                ? Product::query()
                    ->wherePublished()
                    ->where('is_variation', false)
                    ->latest('created_at')
                    ->limit(500)
                    ->pluck('name', 'id')
                    ->all()
                : [],
        ])
        ->add('limit', NumberField::class, NumberFieldOption::make()->label(__('Limit'))->defaultValue($attributes['limit'] ?? 12))
        ->add('items_per_row', NumberField::class, NumberFieldOption::make()->label(__('Items per row'))->defaultValue($attributes['items_per_row'] ?? 4))
        ->add('show_view_all', OnOffField::class, OnOffFieldOption::make()->label(__('Show "View all" link'))->defaultValue(false))
        ->add('view_all_url', TextField::class, TextFieldOption::make()->label(__('"View all" URL')));
});

Shortcode::setPreviewImage('ecommerce-products', Theme::asset()->url('images/ui-blocks/ecommerce-products.png'));

// ============================================================
// 2. [ecommerce-categories] — Category grid
// ============================================================
Shortcode::register(
    'ecommerce-categories',
    __('Ecommerce: Categories'),
    __('Display product categories in grid, slider, or list layout'),
    function ($shortcode) {
        $ids = Shortcode::fields()->getIds('category_ids', $shortcode);
        $params = ['with' => ['slugable']];

        if (! empty($ids)) {
            $params['condition'][] = ['id', 'IN', $ids];
        } else {
            $params['condition']['parent_id'] = 0;
        }

        $params['take'] = (int) $shortcode->limit ?: 8;
        $categories = app(ProductCategoryInterface::class)->advancedGet($params);

        return Theme::partial('shortcodes.ecommerce-categories.index', compact('shortcode', 'categories'));
    }
);

Shortcode::setAdminConfig('ecommerce-categories', function (array $attributes) {
    return ShortcodeForm::createFromArray($attributes)
        ->withLazyLoading()
        ->add('style', UiSelectorField::class, UiSelectorFieldOption::make()
            ->label(__('Layout'))
            ->choices([
                'style-grid' => ['label' => __('Grid'), 'image' => Theme::asset()->url('images/shortcodes/ecommerce-categories/grid.png')],
                'style-slider' => ['label' => __('Slider'), 'image' => Theme::asset()->url('images/shortcodes/ecommerce-categories/slider.png')],
                'style-list' => ['label' => __('List'), 'image' => Theme::asset()->url('images/shortcodes/ecommerce-categories/list.png')],
            ])
            ->defaultValue($attributes['style'] ?? 'style-grid')
            ->numberItemsPerRow(3))
        ->add('title', TextField::class, TextFieldOption::make()->label(__('Title')))
        ->add('category_ids', 'multiCheckList', [
            'label' => __('Categories (empty = top-level)'),
            'choices' => ProductCategory::query()->pluck('name', 'id')->all(),
        ])
        ->add('items_per_row', NumberField::class, NumberFieldOption::make()->label(__('Items per row'))->defaultValue($attributes['items_per_row'] ?? 5))
        ->add('limit', NumberField::class, NumberFieldOption::make()->label(__('Limit'))->defaultValue($attributes['limit'] ?? 8))
        ->add('show_count', OnOffField::class, OnOffFieldOption::make()->label(__('Show product count'))->defaultValue(true));
});

Shortcode::setPreviewImage('ecommerce-categories', Theme::asset()->url('images/ui-blocks/ecommerce-categories.png'));

// ============================================================
// 3. [ecommerce-brands] — Brand strip
// ============================================================
Shortcode::register(
    'ecommerce-brands',
    __('Ecommerce: Brands'),
    __('Display brand logos in a row or slider'),
    function ($shortcode) {
        $ids = Shortcode::fields()->getIds('brand_ids', $shortcode);
        $params = ['condition' => ['status' => 'published']];

        if (! empty($ids)) {
            $params['condition'][] = ['id', 'IN', $ids];
        }

        $params['take'] = (int) $shortcode->limit ?: 12;
        $brands = app(BrandInterface::class)->advancedGet($params);

        return Theme::partial('shortcodes.ecommerce-brands.index', compact('shortcode', 'brands'));
    }
);

Shortcode::setAdminConfig('ecommerce-brands', function (array $attributes) {
    return ShortcodeForm::createFromArray($attributes)
        ->withLazyLoading()
        ->add('style', UiSelectorField::class, UiSelectorFieldOption::make()
            ->label(__('Layout'))
            ->choices([
                'style-default' => ['label' => __('Default'), 'image' => Theme::asset()->url('images/shortcodes/ecommerce-brands/default.png')],
            ])
            ->defaultValue('style-default')
            ->numberItemsPerRow(1))
        ->add('title', TextField::class, TextFieldOption::make()->label(__('Title')))
        ->add('brand_ids', 'multiCheckList', [
            'label' => __('Brands'),
            'choices' => Brand::query()->pluck('name', 'id')->all(),
        ])
        ->add('items_per_row', NumberField::class, NumberFieldOption::make()->label(__('Items per row'))->defaultValue($attributes['items_per_row'] ?? 6))
        ->add('limit', NumberField::class, NumberFieldOption::make()->label(__('Limit'))->defaultValue($attributes['limit'] ?? 12));
});

Shortcode::setPreviewImage('ecommerce-brands', Theme::asset()->url('images/ui-blocks/ecommerce-brands.png'));

// ============================================================
// 4. [ecommerce-flash-sale] — Flash sale countdown
// ============================================================
Shortcode::register(
    'ecommerce-flash-sale',
    __('Ecommerce: Flash sale'),
    __('Display a flash sale block with countdown timer and products'),
    function ($shortcode) {
        $flashSaleId = (int) ($shortcode->flash_sale_id ?: 0);
        $flashSale = $flashSaleId
            ? app(FlashSaleInterface::class)
                ->findById($flashSaleId, ['products.slugable', 'products.productLabels'])
            : null;

        if (! $flashSale) {
            return '';
        }

        return Theme::partial('shortcodes.ecommerce-flash-sale.index', compact('shortcode', 'flashSale'));
    }
);

Shortcode::setAdminConfig('ecommerce-flash-sale', function (array $attributes) {
    return ShortcodeForm::createFromArray($attributes)
        ->withLazyLoading()
        ->add('style', UiSelectorField::class, UiSelectorFieldOption::make()
            ->label(__('Layout'))
            ->choices([
                'style-1' => ['label' => __('Banner with grid'), 'image' => Theme::asset()->url('images/shortcodes/ecommerce-flash-sale/style-1.png')],
                'style-2' => ['label' => __('Slider'), 'image' => Theme::asset()->url('images/shortcodes/ecommerce-flash-sale/style-2.png')],
            ])
            ->defaultValue($attributes['style'] ?? 'style-1')
            ->numberItemsPerRow(2))
        ->add('flash_sale_id', 'customSelect', [
            'label' => __('Flash sale'),
            'choices' => FlashSale::query()->pluck('name', 'id')->all(),
        ])
        ->add('title', TextField::class, TextFieldOption::make()->label(__('Title')))
        ->add('subtitle', TextField::class, TextFieldOption::make()->label(__('Subtitle')))
        ->add('show_countdown', OnOffField::class, OnOffFieldOption::make()->label(__('Show countdown'))->defaultValue(true))
        ->add('background_image', 'mediaImage', ['label' => __('Background image')]);
});

Shortcode::setPreviewImage('ecommerce-flash-sale', Theme::asset()->url('images/ui-blocks/ecommerce-flash-sale.png'));

// ============================================================
// 5. [ecommerce-product-groups] — Tabbed product browsing
// ============================================================
Shortcode::register(
    'ecommerce-product-groups',
    __('Ecommerce: Product groups'),
    __('Tabbed groups of products (e.g. by category or featured collection)'),
    function ($shortcode) {
        $groups = is_string($shortcode->groups) ? (json_decode($shortcode->groups, true) ?: []) : [];
        $resolved = [];

        foreach ($groups as $group) {
            $params = [
                'paginate' => false,
                'take' => (int) ($group['limit'] ?? 8),
                'with' => ['slugable', 'productLabels'],
            ];

            if (! empty($group['category_ids'])) {
                $params['categories'] = ['by' => 'id', 'value_in' => (array) $group['category_ids']];
            }

            $resolved[] = [
                'tab_label' => $group['tab_label'] ?? '',
                'products' => app(ProductInterface::class)->getProducts($params),
            ];
        }

        return Theme::partial('shortcodes.ecommerce-product-groups.index', compact('shortcode', 'resolved'));
    }
);

Shortcode::setAdminConfig('ecommerce-product-groups', function (array $attributes) {
    return ShortcodeForm::createFromArray($attributes)
        ->withLazyLoading()
        ->add('style', UiSelectorField::class, UiSelectorFieldOption::make()
            ->label(__('Layout'))
            ->choices([
                'style-tabs' => ['label' => __('Tabs'), 'image' => Theme::asset()->url('images/shortcodes/ecommerce-product-groups/tabs.png')],
                'style-columns' => ['label' => __('Columns'), 'image' => Theme::asset()->url('images/shortcodes/ecommerce-product-groups/columns.png')],
                'style-bundle' => ['label' => __('Bundle'), 'image' => Theme::asset()->url('images/shortcodes/ecommerce-product-groups/bundle.png')],
            ])
            ->defaultValue($attributes['style'] ?? 'style-tabs')
            ->numberItemsPerRow(3))
        ->add('title', TextField::class, TextFieldOption::make()->label(__('Title')))
        ->add('groups', ShortcodeTabsField::class, ShortcodeTabsFieldOption::make()
            ->label(__('Groups'))
            ->fields([
                'tab_label' => ['type' => 'text', 'label' => __('Tab label')],
                'category_ids' => [
                    'type' => 'multiCheckList',
                    'label' => __('Categories'),
                    'choices' => ProductCategory::query()->pluck('name', 'id')->all(),
                ],
                'limit' => ['type' => 'number', 'label' => __('Limit'), 'default_value' => 8],
            ]));
});

Shortcode::setPreviewImage('ecommerce-product-groups', Theme::asset()->url('images/ui-blocks/ecommerce-product-groups.png'));

// ============================================================
// 6. [ecommerce-coupons] — Promo coupon strip
// ============================================================
Shortcode::register(
    'ecommerce-coupons',
    __('Ecommerce: Coupons'),
    __('Display active discount coupons as redeemable cards'),
    function ($shortcode) {
        $conditions = ['type' => 'coupon'];

        if (in_array($shortcode->featured_only, ['yes', true, 1, '1'], true)) {
            $conditions['display_at_checkout'] = 1;
        }

        $limit = (int) $shortcode->limit ?: 4;
        $coupons = Discount::query()->where($conditions)->limit($limit)->get();

        return Theme::partial('shortcodes.ecommerce-coupons.index', compact('shortcode', 'coupons'));
    }
);

Shortcode::setAdminConfig('ecommerce-coupons', function (array $attributes) {
    return ShortcodeForm::createFromArray($attributes)
        ->withLazyLoading()
        ->add('style', UiSelectorField::class, UiSelectorFieldOption::make()
            ->label(__('Layout'))
            ->choices([
                'style-default' => ['label' => __('Default'), 'image' => Theme::asset()->url('images/shortcodes/ecommerce-coupons/default.png')],
            ])
            ->defaultValue('style-default')
            ->numberItemsPerRow(1))
        ->add('title', TextField::class, TextFieldOption::make()->label(__('Title')))
        ->add('limit', NumberField::class, NumberFieldOption::make()->label(__('Limit'))->defaultValue($attributes['limit'] ?? 4))
        ->add('featured_only', OnOffField::class, OnOffFieldOption::make()->label(__('Only featured at checkout'))->defaultValue(false));
});

Shortcode::setPreviewImage('ecommerce-coupons', Theme::asset()->url('images/ui-blocks/ecommerce-coupons.png'));

// ============================================================
// 7. [ecommerce-collections] — Featured collections
// ============================================================
Shortcode::register(
    'ecommerce-collections',
    __('Ecommerce: Collections'),
    __('Display product collections as banner cards'),
    function ($shortcode) {
        $ids = Shortcode::fields()->getIds('collection_ids', $shortcode);
        $params = ['with' => ['slugable']];

        if (! empty($ids)) {
            $params['condition'][] = ['id', 'IN', $ids];
        }

        $params['take'] = (int) $shortcode->limit ?: 4;
        $collections = app(ProductCollectionInterface::class)->advancedGet($params);

        return Theme::partial('shortcodes.ecommerce-collections.index', compact('shortcode', 'collections'));
    }
);

Shortcode::setAdminConfig('ecommerce-collections', function (array $attributes) {
    return ShortcodeForm::createFromArray($attributes)
        ->withLazyLoading()
        ->add('style', UiSelectorField::class, UiSelectorFieldOption::make()
            ->label(__('Layout'))
            ->choices([
                'style-default' => ['label' => __('Default'),                'image' => Theme::asset()->url('images/shortcodes/ecommerce-collections/default.png')],
                'style-banner-grid' => ['label' => __('Banner grid (1 + 2)'),    'image' => Theme::asset()->url('images/shortcodes/ecommerce-collections/banner-grid.png')],
            ])
            ->defaultValue('style-default')
            ->numberItemsPerRow(2))
        ->add('title', TextField::class, TextFieldOption::make()->label(__('Title')))
        ->add('collection_ids', 'multiCheckList', [
            'label' => __('Collections'),
            'choices' => ProductCollection::query()->pluck('name', 'id')->all(),
        ])
        ->add('items_per_row', NumberField::class, NumberFieldOption::make()->label(__('Items per row'))->defaultValue($attributes['items_per_row'] ?? 4))
        ->add('limit', NumberField::class, NumberFieldOption::make()->label(__('Limit'))->defaultValue($attributes['limit'] ?? 4));
});

Shortcode::setPreviewImage('ecommerce-collections', Theme::asset()->url('images/ui-blocks/ecommerce-collections.png'));

// ============================================================
// 8. [recently-viewed-products] — Recently viewed strip
// ============================================================
Shortcode::register(
    'recently-viewed-products',
    __('Ecommerce: Recently viewed products'),
    __('Show products the visitor has recently viewed (per-user cookie/session driven)'),
    function ($shortcode) {
        // EcommerceHelper has no getProductsRecentlyViewedIds(); recently-viewed IDs
        // live in two places depending on auth state (mirrors the plugin's own
        // recently-viewed-products shortcode in EcommerceHelper/HookServiceProvider):
        //   - logged-in customers  -> server-side, via getProductsRecentlyViewed()
        //   - guests               -> the `recently_viewed` cart instance
        if (! EcommerceHelper::isEnabledCustomerRecentlyViewedProducts()) {
            return '';
        }

        $repository = app(ProductInterface::class);
        $params = [
            'paginate' => false,
            'take' => (int) $shortcode->limit ?: 10,
            'with' => ['slugable', 'productLabels'],
        ];

        if (auth('customer')->check()) {
            $products = $repository->getProductsRecentlyViewed(auth('customer')->id(), $params);
        } else {
            $ids = collect(Cart::instance('recently_viewed')->content())
                ->sortByDesc('updated_at')
                ->pluck('id')
                ->all();

            $products = $ids ? $repository->getProductsByIds($ids, $params) : collect();
        }

        if ($products->isEmpty()) {
            return '';
        }

        return Theme::partial('shortcodes.recently-viewed-products.index', compact('shortcode', 'products'));
    }
);

Shortcode::setAdminConfig('recently-viewed-products', function (array $attributes) {
    return ShortcodeForm::createFromArray($attributes)
        ->withLazyLoading()
        ->add('style', UiSelectorField::class, UiSelectorFieldOption::make()
            ->label(__('Layout'))
            ->choices([
                'style-default' => ['label' => __('Default'), 'image' => Theme::asset()->url('images/shortcodes/recently-viewed-products/default.png')],
            ])
            ->defaultValue('style-default')
            ->numberItemsPerRow(1))
        ->add('title', TextField::class, TextFieldOption::make()->label(__('Title'))->defaultValue($attributes['title'] ?? __('Recently viewed')))
        ->add('limit', NumberField::class, NumberFieldOption::make()->label(__('Limit'))->defaultValue($attributes['limit'] ?? 10));
});

Shortcode::setPreviewImage('recently-viewed-products', Theme::asset()->url('images/ui-blocks/recently-viewed-products.png'));
