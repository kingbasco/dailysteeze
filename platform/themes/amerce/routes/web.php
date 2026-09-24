<?php

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Http\Middleware\RequiresJsonRequestMiddleware;
use Botble\Ecommerce\Facades\Cart;
use Botble\Ecommerce\Http\Controllers\Fronts\PublicAjaxController;
use Botble\Ecommerce\Models\Product;
use Botble\Ecommerce\Models\ProductCategory;
use Botble\Ecommerce\Repositories\Interfaces\ProductInterface;
use Botble\SeoHelper\Facades\SeoHelper;
use Botble\Slug\Models\Slug;
use Botble\Theme\Facades\Theme;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

// Custom routes
// You can delete this route group if you don't need to add your custom routes.
Theme::registerRoutes(function (): void {
    // Public AJAX endpoints used by header live-search dropdown.
    // The ecommerce plugin ships PublicAjaxController + the bb-form-quick-search JS handler,
    // but does not register the public route — themes wire it themselves.
    if (is_plugin_active('ecommerce')) {
        Route::middleware(RequiresJsonRequestMiddleware::class)
            ->prefix('ajax')
            ->name('public.ajax.')
            ->group(function (): void {
                Route::get('search-products', [PublicAjaxController::class, 'ajaxSearchProducts'])
                    ->name('search-products');
                Route::get('categories-dropdown', [PublicAjaxController::class, 'ajaxGetCategoriesDropdown'])
                    ->name('categories-dropdown');
                Route::get('featured-tabs-products', function (Request $request) {
                    $source = $request->string('source')->trim()->toString() ?: 'latest';
                    $source = in_array($source, ['latest', 'best-seller', 'featured', 'sale'], true) ? $source : 'latest';
                    $limit = max(1, min(20, (int) $request->integer('limit', 10)));
                    $perView = max(1, min(6, (int) $request->integer('items_per_row', 4)));
                    $categoryValue = $request->string('category')->trim()->toString();
                    $categoryIds = [];

                    if ($categoryValue !== '') {
                        $categoryIds = collect(explode(',', $categoryValue))
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

                                return ProductCategory::query()->where('name', $value)->value('id');
                            })
                            ->filter()
                            ->map(fn ($id) => (int) $id)
                            ->values()
                            ->all();
                    }

                    $with = ['slugable', 'productCollections', 'productLabels', 'productAttributeSets', 'variations.productAttributes', 'taxes'];
                    if (is_plugin_active('marketplace')) {
                        $with[] = 'store';
                        $with[] = 'store.slugable';
                    }
                    $params = [
                        'paginate' => false,
                        'take' => $limit,
                        'with' => $with,
                    ];

                    if ($source === 'best-seller') {
                        $params['order_by'] = ['ec_products.views' => 'DESC'];
                    } elseif ($source === 'featured') {
                        $params['condition']['ec_products.is_featured'] = 1;
                    } elseif ($source !== 'sale') {
                        $params['order_by'] = ['ec_products.created_at' => 'DESC'];
                    }

                    if ($categoryIds) {
                        $params['categories'] = ['by' => 'id', 'value_in' => $categoryIds];
                    }

                    $repo = app(ProductInterface::class);
                    $products = $source === 'sale'
                        ? $repo->getOnSaleProducts($params)
                        : $repo->getProducts($params);

                    $layout = $request->string('layout')->trim()->toString();

                    if ($layout === 'grid-with-banner') {
                        return response()->json([
                            'html' => Theme::partial('shortcodes.ecommerce-products.styles.style-auto-featured-tabs-grid-banner', [
                                'products' => $products,
                                'bannerImage' => $request->string('banner_image')->trim()->toString(),
                                'bannerHeading' => $request->string('banner_heading')->trim()->toString(),
                                'bannerSubheading' => $request->string('banner_subheading')->trim()->toString(),
                                'bannerBtnText' => $request->string('banner_button_text')->trim()->toString() ?: __('Shop Now'),
                                'bannerBtnUrl' => $request->string('banner_button_url')->trim()->toString() ?: '#',
                            ]),
                        ]);
                    }

                    return response()->json([
                        'html' => Theme::partial('shortcodes.ecommerce-products.styles.style-auto-featured-tabs-products', [
                            'products' => $products,
                            'perView' => $perView,
                        ]),
                    ]);
                })->name('featured-tabs-products');
                Route::get('ecommerce-products-tab', function (Request $request) {
                    $source = $request->string('source')->trim()->toString() ?: 'latest';
                    $source = in_array($source, ['latest', 'best-seller', 'featured', 'sale'], true) ? $source : 'latest';
                    $limit = max(1, min(24, (int) $request->integer('limit', 8)));
                    $perView = max(1, min(6, (int) $request->integer('items_per_row', 4)));
                    $gridRows = max(1, min(3, (int) $request->integer('grid_rows', 1)));
                    $showMarquee = $request->string('show_marquee')->trim()->toString() !== 'no';
                    $categoryValue = $request->string('category')->trim()->toString();
                    $categoryIds = [];

                    if ($categoryValue !== '') {
                        $categoryIds = collect(explode(',', $categoryValue))
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

                                return ProductCategory::query()->where('name', $value)->value('id');
                            })
                            ->filter()
                            ->map(fn ($id) => (int) $id)
                            ->values()
                            ->all();
                    }

                    $with = ['slugable', 'productCollections', 'productLabels', 'productAttributeSets', 'variations.productAttributes', 'taxes'];
                    if (is_plugin_active('marketplace')) {
                        $with[] = 'store';
                        $with[] = 'store.slugable';
                    }

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
                        } elseif ($source !== 'sale') {
                            $query->latest('created_at');
                        }

                        $products = $query->limit($limit)->get();
                    } else {
                        $params = [
                            'paginate' => false,
                            'take' => $limit,
                            'with' => $with,
                        ];

                        if ($source === 'best-seller') {
                            $params['order_by'] = ['ec_products.views' => 'DESC'];
                        } elseif ($source === 'featured') {
                            $params['condition']['ec_products.is_featured'] = 1;
                        } elseif ($source !== 'sale') {
                            $params['order_by'] = ['ec_products.created_at' => 'DESC'];
                        }

                        $repo = app(ProductInterface::class);
                        $products = $source === 'sale'
                            ? $repo->getOnSaleProducts($params)
                            : $repo->getProducts($params);
                    }

                    return response()->json([
                        'html' => Theme::partial('shortcodes.ecommerce-products.styles.style-tabs-products', [
                            'products' => $products,
                            'perView' => $perView,
                            'productWrapperClass' => $request->string('product_wrapper_class')->trim()->toString(),
                            'gridRows' => $gridRows,
                            'showMarquee' => $showMarquee,
                        ]),
                    ]);
                })->name('ecommerce-products-tab');
            });
    }

    Route::get('brands', function () {
        if (! is_plugin_active('ecommerce') || ! class_exists(\Botble\Ecommerce\Models\Brand::class)) {
            abort(404);
        }

        $brands = \Botble\Ecommerce\Models\Brand::query()
            ->wherePublished()
            ->with(['slugable'])
            ->withCount('products')
            ->orderBy('order')
            ->orderBy('name')
            ->paginate(24);

        Theme::breadcrumb()->add(__('Brands'), url('/brands'));
        SeoHelper::setTitle(__('Brands'));

        return Theme::scope('ecommerce.brands', [
            'brands'   => $brands,
            'title'    => __('Shop by Brand'),
            'subtitle' => __('Discover products from the brands you love.'),
        ])->render();
    })->name('public.brands');

    Route::get('cart/fragment', function () {
        if (! is_plugin_active('ecommerce')) {
            abort(404);
        }

        $cart = Cart::instance('cart');
        $cartContent = $cart->content();

        $html = Theme::partial('mini-cart-items', ['cartContent' => $cartContent]);

        return response()->json([
            'data' => (string) $html,
            'count' => $cart->count(),
            'subtotal' => format_price($cart->rawSubTotal()),
            'raw_subtotal' => (float) $cart->rawSubTotal(),
        ]);
    })->name('public.theme.cart.fragment');

    Route::get('collections', function () {
        if (! is_plugin_active('ecommerce') || ! class_exists(ProductCategory::class)) {
            abort(404);
        }

        $categories = ProductCategory::query()
            ->where('status', BaseStatusEnum::PUBLISHED)
            ->where(function ($query): void {
                $query->whereNull('parent_id')->orWhere('parent_id', 0);
            })
            ->with(['slugable'])
            ->withCount('products')
            ->orderBy('order')
            ->orderBy('name')
            ->paginate(24);

        Theme::breadcrumb()->add(__('Collections'), url('/collections'));
        SeoHelper::setTitle(__('All Collections'));

        return Theme::scope('ecommerce.collections-list', [
            'categories' => $categories,
            'title'      => __('All Collections'),
            'subtitle'   => __('Discover every collection in our catalogue.'),
        ])->render();
    })->name('public.collections');
});

Theme::routes();
