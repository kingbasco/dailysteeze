@php
    // Theme option color values map onto the SCSS palette in
    // assets/sass/abstracts/_variable.scss. Defaults below mirror that palette
    // so an unconfigured install matches the shipped design.
    $themeMode       = theme_option('default_theme_mode', 'light');
    $primaryColor    = theme_option('primary_color',     '#DC4646');
    $secondaryColor  = theme_option('secondary_color',   '#70857A');
    $headingColor    = theme_option('heading_color',     '#101010');
    $bodyColor       = theme_option('body_text_color',   '#696E73');
    $linkColor       = theme_option('link_color',        $primaryColor);
    $linkHoverColor  = theme_option('link_hover_color',  '#C93A0B');
    $borderColor     = theme_option('border_color',      '#E9E9E9');
    $successColor    = theme_option('success_color',     '#3DAB25');
    $dangerColor     = theme_option('danger_color',      '#F03E3E');
@endphp
<!DOCTYPE html>
<html {!! Theme::htmlAttributes() !!}>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    {{-- FOUC prevention — read theme mode BEFORE CSS loads --}}
    <script>
        (function () {
            var stored = null;
            try { stored = localStorage.getItem('amerce-theme-mode'); } catch (e) {}
            var def = '{{ $themeMode }}';
            var mode = stored || def;
            if (mode === 'system') {
                mode = (window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches) ? 'dark' : 'light';
            }
            document.documentElement.setAttribute('data-bs-theme', mode);
            document.documentElement.classList.add(mode === 'dark' ? 'is_dark' : 'is_light');
        })();
    </script>

    @php
        // Translatable strings consumed by theme JS (main.js, shop.js, etc.).
        // Use `window.amerceI18n.key || 'Fallback'` in JS so missing keys degrade gracefully.
        $amerceI18n = [
            'remove_wishlist'      => __('Remove Wishlist'),
            'add_to_wishlist'      => __('Add to Wishlist'),
            'no_file_chosen'       => __('No File Chosen'),
            'before'               => __('Before'),
            'after'                => __('After'),
            'loading'              => __('Loading...'),
            'unable_to_load'       => __('Unable to load products.'),
            'in_stock'             => __('In Stock'),
            'out_of_stock'         => __('Out of stock'),
            'product_singular'     => __('Product'),
            'product_plural'       => __('Products'),
            'products_found_label' => __('found'),
            'link_copied'          => __('Link copied to clipboard'),
            'copy_failed'          => __('Copy failed, please copy the link manually.'),
            'subscription_success' => __('Subscribed successfully.'),
            'subscription_failed'  => __('Subscription failed. Please try again.'),
        ];
    @endphp
    <script>
        window.amerceI18n = {!! json_encode($amerceI18n, JSON_UNESCAPED_UNICODE | JSON_HEX_TAG | JSON_HEX_AMP | JSON_HEX_APOS | JSON_HEX_QUOT) !!};
    </script>

    {{-- LCP preload — homepage hero slider only. Cached forever; bust via
         `php artisan cache:forget amerce.lcp_hero_url` after admin slider edit
         (or hook an observer on SimpleSliderItem save/delete). --}}
    @if (\Illuminate\Support\Facades\Route::is('public.index'))
        @php
            $lcpHeroUrl = \Illuminate\Support\Facades\Cache::rememberForever('amerce.lcp_hero_url', function () {
                $slider = \Botble\SimpleSlider\Models\SimpleSlider::query()
                    ->where('status', \Botble\Base\Enums\BaseStatusEnum::PUBLISHED)
                    ->oldest('id')
                    ->first();
                $firstSlide = $slider?->publishedSliderItems()->first();
                if (! $firstSlide?->image) {
                    return null;
                }

                $original = \RvMedia::getImageUrl($firstSlide->image);

                return [
                    'src'    => $original,
                    'srcset' => \RvMedia::getImageUrl($firstSlide->image, 'hero-sm') . ' 400w, '
                              . \RvMedia::getImageUrl($firstSlide->image, 'hero-md') . ' 768w, '
                              . $original . ' 1920w',
                    'sizes'  => '100vw',
                ];
            });
        @endphp
        @if ($lcpHeroUrl)
            <link rel="preload"
                  as="image"
                  href="{{ $lcpHeroUrl['src'] }}"
                  imagesrcset="{{ $lcpHeroUrl['srcset'] }}"
                  imagesizes="{{ $lcpHeroUrl['sizes'] }}"
                  fetchpriority="high">
        @endif
    @endif

    {!! Theme::header() !!}

    {{-- Theme option color overrides — write directly into the SCSS palette
         vars defined in assets/sass/abstracts/_variable.scss so admin changes
         cascade through every component that already uses var(--primary), etc. --}}
    <style>
        :root {
            --primary:  {{ $primaryColor }};
            --secondary:{{ $secondaryColor }};
            --text:     {{ $headingColor }};
            --text-2:   {{ $bodyColor }};
            --line:     {{ $borderColor }};
            --success:  {{ $successColor }};
            --critical: {{ $dangerColor }};
            --link:       {{ $linkColor }};
            --link-hover: {{ $linkHoverColor }};
            {{-- Alias for the social-sharing package which references
                 var(--primary-color); without this its hover state turns
                 buttons invisible (white on undefined background). --}}
            --primary-color: {{ $primaryColor }};
            {{-- WCAG-safe darker variant of --primary for text on light backgrounds and
                 small-badge backgrounds that pair with white text. color-mix() has
                 baseline browser support (96%+); the var falls back to --primary
                 via the explicit overrides below. --}}
            --primary-dark: color-mix(in srgb, var(--primary) 55%, #000);
        }
        body { color: var(--text-2); }
        h1, h2, h3, h4, h5, h6 { color: var(--text); }
        {{-- Accessibility: ensure text using the primary brand color meets WCAG AA on
             white. Brand-tinted backgrounds with white text (sale badges, "new" pills)
             also need the darker tone to pass 4.5:1 contrast. --}}
        .text-primary,
        .price-new.text-primary,
        a.text-primary { color: var(--primary-dark) !important; }
        .badge-sale,
        .product-badge_item.sale,
        .product-badge_item.new { background-color: var(--primary-dark) !important; }
        {{-- Strikethrough old price on light backgrounds — darken to meet 4.5:1. --}}
        .cl-text-3.text-decoration-line-through { color: #595a5e !important; }
        {{-- Link/Link-hover are surfaced as `--link` / `--link-hover` so individual
             components can opt in (e.g. `.tf-rte a { color: var(--link) }`).
             Don't force every <a> to use them — header menus, breadcrumbs,
             toolbar links, etc. should keep their own theme text color. --}}

        .is_light img.logo-dark  { display: none; }
        .is_dark  img.logo-light { display: none; }
    </style>
</head>
<body @class([theme_option('homepage_body_class')]) {!! Theme::bodyAttributes() !!}>
    {!! apply_filters(THEME_FRONT_BODY, null) !!}

    @if (theme_option('preloader_enabled', true))
        {!! Theme::partial('preloader') !!}
    @endif

    <main id="wrapper">
        @if (! Theme::get('withoutLayout'))
            @if (theme_option('show_topbar', true))
                {!! Theme::partial('header.topbar') !!}
            @endif

            {!! Theme::partial('header') !!}
        @endif

        <div class="main-content {{ Theme::get('mainClass', '') }}">
            @if (! Theme::get('withoutLayout') && ! Theme::get('hideBreadcrumb', false))
                {!! Theme::partial('breadcrumb') !!}
            @endif

            @if (Theme::get('withContainer', true))
                <div class="container">
                    @yield('content')
                </div>
            @else
                @yield('content')
            @endif
        </div>

        @if (! Theme::get('withoutLayout'))
            {!! Theme::partial('footer') !!}
        @endif
    </main>

    @if (! Theme::get('withoutLayout'))
        {!! Theme::partial('mobile-offcanvas') !!}
        {!! Theme::partial('toolbar-bottom') !!}
    @endif

    @if (theme_option('scroll_to_top_enabled', true))
        {!! Theme::partial('scroll-to-top') !!}
    @endif

    {!! Theme::partial('search-modal') !!}

    @if (is_plugin_active('ecommerce'))
        {!! Theme::partial('mini-cart') !!}

        @includeIf(Theme::getThemeNamespace('views.ecommerce.includes.quick-view-modal'))
        @includeIf(\Botble\Ecommerce\Facades\EcommerceHelper::viewPath('includes.quick-shop-modal'))

        @if (! auth('customer')->check())
            {!! Theme::partial('sign-modal') !!}
            {!! Theme::partial('register-modal') !!}
            {!! Theme::partial('forgot-modal') !!}
        @endif
    @endif

    {!! Theme::footer() !!}
</body>
</html>
