<?php

namespace Database\Seeders\Themes\Main;

use Botble\Blog\Models\Category as BlogCategory;
use Botble\Blog\Models\Post;
use Botble\Blog\Models\Tag as BlogTag;
use Botble\Ecommerce\Models\Brand;
use Botble\Ecommerce\Models\Product;
use Botble\Ecommerce\Models\ProductAttribute;
use Botble\Ecommerce\Models\ProductAttributeSet;
use Botble\Ecommerce\Models\ProductCategory;
use Botble\Ecommerce\Models\ProductCollection;
use Botble\Ecommerce\Models\ProductLabel;
use Botble\Ecommerce\Models\ProductTag;
use Botble\Faq\Models\Faq;
use Botble\Faq\Models\FaqCategory;
use Botble\Language\Models\Language;
use Botble\Language\Models\LanguageMeta;
use Botble\LanguageAdvanced\Database\Seeders\BaseTranslationSeeder;
use Botble\LanguageAdvanced\Database\Seeders\Traits\HasLanguageSeeder;
use Botble\LanguageAdvanced\Database\Seeders\Traits\HasMenuTranslationSeeder;
use Botble\LanguageAdvanced\Database\Seeders\Traits\HasPageTranslation;
use Botble\LanguageAdvanced\Database\Seeders\Traits\HasThemeOptionSeeder;
use Botble\LanguageAdvanced\Database\Seeders\Traits\HasWidgetSeeder;
use Botble\Menu\Database\Traits\HasMenuSeeder;
use Botble\Menu\Facades\Menu as MenuFacade;
use Botble\Menu\Models\Menu;
use Botble\Menu\Models\MenuLocation;
use Botble\Menu\Models\MenuNode;
use Botble\Page\Models\Page;
use Botble\Testimonial\Models\Testimonial;

class TranslationSeeder extends BaseTranslationSeeder
{
    use HasLanguageSeeder;
    use HasMenuSeeder;
    use HasMenuTranslationSeeder;
    use HasPageTranslation;
    use HasThemeOptionSeeder;
    use HasWidgetSeeder;

    public function run(): void
    {
        if (! is_plugin_active('language')) {
            return;
        }

        // Languages are seeded by LanguageSeeder BEFORE MenuSeeder so that
        // LanguageMeta::saveMetaData() inside the menu/widget/page seeders
        // resolves to the actual default locale code. Re-running
        // createLanguages() here is a safety net for partial reseeds that
        // skip LanguageSeeder.
        $this->createLanguages();

        $locales = $this->locales();

        $this->seedThemeOptions($locales);
        $this->seedMenus($locales);
        $this->seedWidgets($locales);

        if (is_plugin_active('language-advanced')) {
            $this->seedPageTranslations($locales);
            $this->seedAllTranslatableModelsFromJson($locales);
            $this->seedSlugTranslations($this->getSlugTranslatableModels(), $locales);
        }
    }

    public function locales(): array
    {
        return ['vi', 'ar', 'fr', 'id', 'tr'];
    }

    protected function languages(): array
    {
        return [
            [
                'lang_name' => 'English',
                'lang_locale' => 'en',
                'lang_is_default' => true,
                'lang_code' => 'en',
                'lang_is_rtl' => false,
                'lang_flag' => 'us',
                'lang_order' => 0,
            ],
            [
                'lang_name' => 'Tiếng Việt',
                'lang_locale' => 'vi',
                'lang_is_default' => false,
                'lang_code' => 'vi',
                'lang_is_rtl' => false,
                'lang_flag' => 'vn',
                'lang_order' => 1,
            ],
            [
                'lang_name' => 'العربية',
                'lang_locale' => 'ar',
                'lang_is_default' => false,
                'lang_code' => 'ar',
                'lang_is_rtl' => true,
                'lang_flag' => 'sa',
                'lang_order' => 2,
            ],
            [
                'lang_name' => 'Français',
                'lang_locale' => 'fr',
                'lang_is_default' => false,
                'lang_code' => 'fr',
                'lang_is_rtl' => false,
                'lang_flag' => 'fr',
                'lang_order' => 3,
            ],
            [
                'lang_name' => 'Bahasa Indonesia',
                'lang_locale' => 'id',
                'lang_is_default' => false,
                'lang_code' => 'id',
                'lang_is_rtl' => false,
                'lang_flag' => 'id',
                'lang_order' => 4,
            ],
            [
                'lang_name' => 'Türkçe',
                'lang_locale' => 'tr',
                'lang_is_default' => false,
                'lang_code' => 'tr',
                'lang_is_rtl' => false,
                'lang_flag' => 'tr',
                'lang_order' => 5,
            ],
        ];
    }

    /**
     * Override to seed every menu defined by MenuSeeder, not only main-menu.
     * Footer menus need translated copies too so footer columns render in the
     * active locale.
     */
    protected function seedMenus(array $locales): void
    {
        $slugs = ['main-menu', 'footer-help', 'footer-company'];

        $menus = Menu::query()->whereIn('slug', $slugs)->get()->keyBy('slug');

        if ($menus->isEmpty()) {
            return;
        }

        // MenuSeeder ran before any Language rows existed and tagged each menu
        // with the dummy 'en_US' fallback code returned by getDefaultLocaleCode().
        // Normalize those metas to the real default locale ('en') now so the
        // frontend Menu locale filter narrows correctly per request.
        $this->normalizeOriginalMenuLanguageMeta($menus);

        $menuOrigins = [];
        foreach ($menus as $slug => $menu) {
            $menuOrigins[$slug] = $this->getLanguageMetaOrigin($menu);
        }

        $mainMenuLocation = MenuLocation::query()
            ->where('menu_id', $menus->get('main-menu')?->getKey())
            ->where('location', 'main-menu')
            ->first();
        $mainLocationOrigin = $mainMenuLocation ? $this->getLanguageMetaOrigin($mainMenuLocation) : null;

        $footerOneLocation = MenuLocation::query()
            ->where('menu_id', $menus->get('footer-help')?->getKey())
            ->where('location', 'footer-menu-1')
            ->first();
        $footerOneOrigin = $footerOneLocation ? $this->getLanguageMetaOrigin($footerOneLocation) : null;

        $footerTwoLocation = MenuLocation::query()
            ->where('menu_id', $menus->get('footer-company')?->getKey())
            ->where('location', 'footer-menu-2')
            ->first();
        $footerTwoOrigin = $footerTwoLocation ? $this->getLanguageMetaOrigin($footerTwoLocation) : null;

        foreach ($locales as $locale) {
            $translations = $this->loadMenuTranslations($locale);

            if (empty($translations)) {
                continue;
            }

            if (isset($translations['main-menu'])) {
                $main = $translations['main-menu'];
                $this->createMenuTranslation(
                    $locale,
                    'main-menu',
                    $main['name'],
                    $this->buildMainMenuItems($main, []),
                    $menuOrigins['main-menu'] ?? null,
                    $mainLocationOrigin
                );

                // createMenuTranslation only attaches main-menu to the main-menu
                // location. We need to additionally wire footer locations to
                // their translated menus.
                $this->attachFooterMenuLocation(
                    $locale,
                    'footer-help',
                    'footer-menu-1',
                    $translations,
                    $menuOrigins['footer-help'] ?? null,
                    $footerOneOrigin
                );

                $this->attachFooterMenuLocation(
                    $locale,
                    'footer-company',
                    'footer-menu-2',
                    $translations,
                    $menuOrigins['footer-company'] ?? null,
                    $footerTwoOrigin
                );
            }
        }

        MenuFacade::clearCacheMenuItems();
    }

    /**
     * Build the translated main-menu structure. MUST mirror MenuSeeder's
     * main-menu items exactly so language switcher swaps preserve order.
     */
    protected function buildMainMenuItems(array $labels, array $pageIds): array
    {
        return [
            ['title' => $labels['home'], 'url' => '/'],
            [
                'title' => $labels['shop'],
                'url' => '/products',
                'children' => [
                    ['title' => $labels['new_arrivals'], 'url' => '/products?source=latest'],
                    ['title' => $labels['best_sellers'], 'url' => '/products?sort=best-seller'],
                    ['title' => $labels['sale'], 'url' => '/products?on_sale=1'],
                    ['title' => $labels['all_products'], 'url' => '/products'],
                ],
            ],
            [
                'title' => $labels['categories'],
                // No top-level /product-categories listing route — point to /products.
                'url' => '/products',
                'children' => [
                    ['title' => $labels['outerwear'], 'url' => '/product-categories/outerwear'],
                    ['title' => $labels['tops_shirts'], 'url' => '/product-categories/tops-shirts'],
                    ['title' => $labels['bottoms'], 'url' => '/product-categories/bottoms'],
                    ['title' => $labels['dresses'], 'url' => '/product-categories/dresses'],
                    ['title' => $labels['footwear'], 'url' => '/product-categories/footwear'],
                    ['title' => $labels['accessories'], 'url' => '/product-categories/accessories'],
                ],
            ],
            ['title' => $labels['brands'], 'url' => '/brands'],
            ['title' => $labels['journal'], 'url' => '/blog'],
            ['title' => $labels['about'], 'url' => '/about'],
            ['title' => $labels['contact'], 'url' => '/contact'],
        ];
    }

    /**
     * Build, persist, and language-tag a translated copy of a footer menu so
     * the FooterMenuWidget can resolve it via the locale-suffixed slug.
     */
    protected function attachFooterMenuLocation(
        string $locale,
        string $baseSlug,
        string $location,
        array $translations,
        ?string $menuOrigin,
        ?string $locationOrigin
    ): void {
        if (! isset($translations[$baseSlug])) {
            return;
        }

        $payload = $translations[$baseSlug];
        $items = $this->buildFooterMenuItems($baseSlug, $payload);

        $slug = $this->localizedSlug($baseSlug, $locale);

        $menu = Menu::query()->updateOrCreate(
            ['slug' => $slug],
            ['name' => $payload['name']]
        );

        MenuNode::query()->where('menu_id', $menu->getKey())->delete();
        MenuLocation::query()->where('menu_id', $menu->getKey())->delete();

        $menuLocation = MenuLocation::query()->create([
            'menu_id' => $menu->getKey(),
            'location' => $location,
        ]);

        if ($locationOrigin) {
            LanguageMeta::saveMetaData($menuLocation, $locale, $locationOrigin);
        } else {
            LanguageMeta::saveMetaData($menuLocation, $locale);
        }

        foreach ($items as $position => $node) {
            $this->createMenuNode($position, $node, $menu->getKey());
        }

        if ($menuOrigin) {
            LanguageMeta::saveMetaData($menu, $locale, $menuOrigin);
        } else {
            LanguageMeta::saveMetaData($menu, $locale);
        }
    }

    /**
     * Footer-Help and Footer-Company items must mirror MenuSeeder exactly.
     */
    protected function buildFooterMenuItems(string $slug, array $labels): array
    {
        if ($slug === 'footer-help') {
            return [
                ['title' => $labels['contact_us'], 'url' => '/contact'],
                ['title' => $labels['faq'], 'url' => '/faq'],
                ['title' => $labels['shipping'], 'url' => '/shipping'],
                ['title' => $labels['returns_refunds'], 'url' => '/returns-refunds'],
                // Real Botble route is /customer/orders (auth-gated, but redirects to login — not 404).
                ['title' => $labels['order_tracking'], 'url' => '/customer/orders'],
            ];
        }

        return [
            ['title' => $labels['about'], 'url' => '/about'],
            ['title' => $labels['our_stores'], 'url' => '/our-stores'],
            // /blog?category=... has no public route — point to the Sustainability blog Category slug.
            ['title' => $labels['sustainability'], 'url' => '/sustainability'],
            ['title' => $labels['careers'], 'url' => '/careers'],
            ['title' => $labels['privacy_policy'], 'url' => '/privacy-policy'],
            ['title' => $labels['terms_conditions'], 'url' => '/terms-conditions'],
        ];
    }

    protected function getDefaultMenuSlugs(): array
    {
        return ['main-menu', 'footer-help', 'footer-company'];
    }

    /**
     * Slug-translatable models — translated names produce locale-aware URLs.
     */
    protected function getSlugTranslatableModels(): array
    {
        $models = [Page::class];

        if (is_plugin_active('blog')) {
            $models[] = Post::class;
            $models[] = BlogCategory::class;
            $models[] = BlogTag::class;
        }

        if (is_plugin_active('ecommerce')) {
            $models[] = Product::class;
            $models[] = ProductCategory::class;
            $models[] = ProductTag::class;
            $models[] = Brand::class;
            $models[] = ProductCollection::class;
            $models[] = ProductLabel::class;
            $models[] = ProductAttributeSet::class;
            $models[] = ProductAttribute::class;
        }

        if (is_plugin_active('faq')) {
            $models[] = Faq::class;
            $models[] = FaqCategory::class;
        }

        if (is_plugin_active('testimonial')) {
            $models[] = Testimonial::class;
        }

        return $models;
    }

    protected function getSkippedTables(): array
    {
        return ['pages'];
    }

    /**
     * Repoint legacy LanguageMeta rows for the original menus + their
     * MenuLocations to the real default locale, replacing the 'en_US' fallback
     * Botble inserts when no language rows exist yet. Also wipes any duplicate
     * meta rows left behind by repeated reseeds.
     */
    protected function normalizeOriginalMenuLanguageMeta($menus): void
    {
        $defaultCode = Language::query()
            ->where('lang_is_default', 1)
            ->value('lang_code')
            ?: config('app.locale', 'en');

        $menuIds = $menus->pluck('id')->all();
        if (! $menuIds) {
            return;
        }

        // Drop ALL menu / menu-location language meta for the source rows so
        // the upcoming insert chain can recreate them from a clean slate. The
        // translated menu copies (slug ending in -vi/-ar/-fr/-id) get the same
        // treatment via deleteTranslatedMenuLanguageMeta() so reseeds stay
        // idempotent.
        LanguageMeta::query()
            ->where('reference_type', Menu::class)
            ->whereIn('reference_id', $menuIds)
            ->delete();

        $locationIds = MenuLocation::query()
            ->whereIn('menu_id', $menuIds)
            ->pluck('id')
            ->all();

        if ($locationIds) {
            LanguageMeta::query()
                ->where('reference_type', MenuLocation::class)
                ->whereIn('reference_id', $locationIds)
                ->delete();
        }

        // Re-seed the original menus with the correct default locale meta so
        // the frontend filter narrows them correctly when the active locale
        // is the default.
        foreach ($menus as $menu) {
            LanguageMeta::saveMetaData($menu, $defaultCode);
        }

        if ($locationIds) {
            $locations = MenuLocation::query()->whereIn('id', $locationIds)->get();
            foreach ($locations as $location) {
                LanguageMeta::saveMetaData($location, $defaultCode);
            }
        }

        $this->deleteTranslatedMenuLanguageMeta();
    }

    /**
     * Wipe LanguageMeta for any pre-existing translated menu copies so
     * createMenuTranslation can re-attach fresh meta rows without dupes.
     */
    protected function deleteTranslatedMenuLanguageMeta(): void
    {
        $translatedMenus = Menu::query()
            ->where(function ($query): void {
                foreach ($this->locales() as $locale) {
                    $query->orWhere('slug', 'like', "%-{$locale}");
                }
            })
            ->get();

        if ($translatedMenus->isEmpty()) {
            return;
        }

        $menuIds = $translatedMenus->pluck('id')->all();

        LanguageMeta::query()
            ->where('reference_type', Menu::class)
            ->whereIn('reference_id', $menuIds)
            ->delete();

        $locationIds = MenuLocation::query()
            ->whereIn('menu_id', $menuIds)
            ->pluck('id')
            ->all();

        if ($locationIds) {
            LanguageMeta::query()
                ->where('reference_type', MenuLocation::class)
                ->whereIn('reference_id', $locationIds)
                ->delete();
        }
    }
}
