<?php

use Botble\Base\Facades\BaseHelper;
use Botble\Ecommerce\Facades\EcommerceHelper;
use Botble\Language\Facades\Language;
use Botble\Shortcode\View\View;
use Botble\Theme\Theme;
use Illuminate\View\View as IlluminateView;

return [

    'inherit' => null,

    'events' => [

        'before' => function ($theme): void {
            // Reserved for inherited theme prep
        },

        'beforeRenderTheme' => function (Theme $theme): void {

            $version = get_cms_version() . '.3';

            // ---- Bootstrap CSS — RTL-aware swap ----
            if (BaseHelper::isRtlEnabled()) {
                $theme->asset()->usePath()->add('bootstrap', 'css/vendors/bootstrap.rtl.min.css');
                $theme->asset()->usePath()->add('theme-rtl', 'css/rtl.css', ['theme'], version: $version);
            } else {
                $theme->asset()->usePath()->add('bootstrap', 'css/vendors/bootstrap.min.css');
            }

            // ---- Ecommerce assets — single helper call ----
            // EcommerceHelper::registerThemeAssets() was introduced in ecommerce 3.11.8.
            // Older plugin builds (<= 3.11.7) registered the front-ecommerce assets via
            // their own boot hook and DON'T expose this method — calling it there throws
            // BadMethodCallException on every frontend render (white-screen 500 site-wide).
            // Guard with method_exists so the theme degrades gracefully on older plugins
            // instead of hard-crashing; on 3.11.8+ behaviour is unchanged.
            if (is_plugin_active('ecommerce')
                && method_exists(\Botble\Ecommerce\Supports\EcommerceHelper::class, 'registerThemeAssets')
            ) {
                EcommerceHelper::registerThemeAssets();
            }

            // bootstrap-select powers ONLY the currency + language switchers in the footer.
            // Skip the asset on single-currency single-locale sites (no <select> rendered).
            // Mirrors the @if guards in partials/{currency,language}-switcher.blade.php.
            $needsSelectPicker = false;
            if (is_plugin_active('ecommerce') && get_all_currencies()->count() > 1) {
                $needsSelectPicker = true;
            }
            if (! $needsSelectPicker && is_plugin_active('language')) {
                try {
                    $needsSelectPicker = count(Language::getSupportedLocales()) > 1;
                } catch (Throwable $e) {
                }
            }

            // ---- Vendor CSS ----
            // Decorative animations only — safe to defer to footer to unblock render.
            $theme->asset()->container('footer')->usePath()->add('animate', 'css/vendors/animate.css');
            $theme->asset()->usePath()->add('swiper', 'css/vendors/swiper-bundle.min.css');
            if ($needsSelectPicker) {
                // bootstrap-select reset for the inner UL (without it, the UL inherits Bootstrap 5
                // .dropdown-menu defaults and renders as a duplicate floating popover below the trigger)
                $theme->asset()->usePath()->add('bs-select', 'css/vendors/bootstrap-select.min.css');
            }
            // image-compare-viewer — powers the [before-after-image] shortcode.
            // Deferred to footer; only used on specific pages, no FOUC risk above the fold.
            $theme->asset()->container('footer')->usePath()->add('image-compare', 'css/vendors/image-compare-viewer.min.css');
            $theme->asset()->usePath()->add('icomoon', 'css/icomoon.css');
            $theme->asset()->usePath()->add('fonts', 'css/fonts.css');
            $theme->asset()->usePath()->add('theme', 'css/theme.css', version: $version);

            // Marketplace styles — gated by plugin so the stylesheet isn't loaded
            // on installs where the marketplace plugin is disabled. Compiled by
            // vite from assets/sass/marketplace.scss; depends on theme.css for
            // CSS-variable tokens (--primary, --text, --line, --surface, etc.).
            if (is_plugin_active('marketplace')) {
                $theme->asset()->usePath()->add('marketplace', 'css/marketplace.css', ['theme'], version: $version);
            }

            // ---- Footer JS chain ----
            // jQuery first (no defer — must be ready before any inline jQuery in templates)
            $theme->asset()->container('footer')->usePath()->add('jquery', 'js/vendors/jquery.min.js');

            // jQuery 4 compat shim — must load IMMEDIATELY after jquery.min.js so legacy
            // third-party libraries (range-slider, jquery.validate, jvectormap, ACL profile)
            // find $.proxy/$.isArray/$.isFunction/$.trim/etc. as expected. Synchronous, no defer.
            $theme->asset()->container('footer')->usePath()->add('jquery-compat', 'js/vendors/jquery-compat.js', ['jquery'], version: $version);

            // Vendor plugins called by bundled script.js (parallaxie, selectpicker, isotope,
            // imagesLoaded, noUiSlider, odometer, countTo) — must load BEFORE script.js so the
            // bundle's $(document).ready chain can call them. Match the HTML reference per-page
            // includes: load globally so SPA-style nav and any homepage variant works.
            $theme->asset()->container('footer')->usePath()->add('bootstrap', 'js/vendors/bootstrap.min.js', attributes: ['defer']);
            if ($needsSelectPicker) {
                $theme->asset()->container('footer')->usePath()->add('bs-select', 'js/vendors/bootstrap-select.min.js', attributes: ['defer']);
            }
            $theme->asset()->container('footer')->usePath()->add('swiper', 'js/vendors/swiper-bundle.min.js', attributes: ['defer']);
            $theme->asset()->container('footer')->usePath()->add('countdown', 'js/vendors/count-down.js', attributes: ['defer']);
            $theme->asset()->container('footer')->usePath()->add('countto', 'js/vendors/countto.js', attributes: ['defer']);
            $theme->asset()->container('footer')->usePath()->add('odometer', 'js/vendors/odometer.min.js', attributes: ['defer']);
            $theme->asset()->container('footer')->usePath()->add('parallaxie', 'js/vendors/parallaxie.js', attributes: ['defer']);
            $theme->asset()->container('footer')->usePath()->add('nouislider', 'js/vendors/nouislider.min.js', attributes: ['defer']);
            $theme->asset()->container('footer')->usePath()->add('imagesloaded', 'js/vendors/imagesloaded.pkgd.min.js', attributes: ['defer']);
            $theme->asset()->container('footer')->usePath()->add('isotope', 'js/vendors/jquery.isotope.min.js', attributes: ['defer']);
            $theme->asset()->container('footer')->usePath()->add('infinityslide', 'js/vendors/infinityslide.js', attributes: ['defer']);
            // image-compare-viewer — lib exposes window.ImageCompare; the wrapper
            // mounts every `.image-compare` element using its data-* attributes.
            $theme->asset()->container('footer')->usePath()->add('image-compare', 'js/vendors/image-compare-viewer.min.js', attributes: ['defer']);
            $theme->asset()->container('footer')->usePath()->add('image-compare-init', 'js/vendors/image-compare-viewer.js', attributes: ['defer']);
            $theme->asset()->container('footer')->usePath()->add('wow', 'js/vendors/wow.min.js', attributes: ['defer']);

            // Theme bundle last — depends on all vendors above.
            $theme->asset()->container('footer')->usePath()->add('theme', 'js/script.js', attributes: ['defer'], version: $version);

            if (is_plugin_active('ecommerce')) {
                $theme->asset()->container('footer')->usePath()->add('ecommerce', 'js/ecommerce.js', ['front-ecommerce-js'], attributes: ['defer'], version: $version);
                // Converts the AJAX-loaded `<select.dropdown_product_cate>` into a styled
                // dropdown for header-s3 has-by-category presets (matches html/home-electronics.html).
                $theme->asset()->container('footer')->usePath()->add('category-search-dropdown', 'js/category-search-dropdown.js', ['front-ecommerce-js'], attributes: ['defer'], version: $version);
            }

            // ---- Shortcode composer — covers ALL views that may host shortcodes ----
            if (function_exists('shortcode')) {
                $theme->composer([
                    'page',
                    'post',
                    'ecommerce.product',
                    'ecommerce.products',
                    'ecommerce.product-category',
                    'ecommerce.product-tag',
                    'ecommerce.product-collection',
                    'ecommerce.brand',
                    'ecommerce.search',
                    'ecommerce.cart',
                    'marketplace.stores',
                    'marketplace.store',
                ], fn (View $view) => $view->withShortcodes());
            }

            // ---- partialComposer for header.* — inject color theme options into ALL header partials ----
            $theme->partialComposer('header.*', function (IlluminateView $view): void {
                $view->with([
                    'headerTopBackgroundColor' => theme_option('header_top_background_color', '#010F1C'),
                    'headerTopTextColor' => theme_option('header_top_text_color', '#FFFFFF'),
                    'headerMainBackgroundColor' => theme_option('header_main_background_color', '#FFFFFF'),
                    'headerMainTextColor' => theme_option('header_main_text_color', '#1E1E1E'),
                ]);
            });
        },

        'beforeRenderLayout' => [
            'default' => function (Theme $theme): void {
                // Per-layout asset overrides
            },
        ],
    ],
];
