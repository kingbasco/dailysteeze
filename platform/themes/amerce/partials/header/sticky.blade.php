@php
    use Botble\Base\Facades\BaseHelper;

    /**
     * Sticky header — slides in on scroll past threshold (consumed by main.js).
     *
     * Mirrors the active `header_style`'s TOP row so the sticky state visually
     * matches the demo's behavior (where scrolling hides only the bottom-row
     * mega-menu while the top row remains pinned).
     *
     * For `header-s8 has-by-category` (furniture), `header-s3 has-by-category`
     * (electronics), and `header-s6 has-by-category` (default) we render the
     * logo + Browse-by-Category pill + inline search + nav-icon-list pattern.
     * Other styles fall back to the legacy nav-LEFT + logo-CENTER + actions-RIGHT
     * compact layout.
     */
    $stickyHeaderStyle = theme_option('header_style', 'style-2');

    // Styles that have a `has-by-category` variant: re-use their pill+search layout.
    $byCategoryStyles = ['style-7', 'style-8', 'style-10'];

    if (in_array($stickyHeaderStyle, $byCategoryStyles, true)) {
        $headerCategories = collect();
        if (is_plugin_active('ecommerce')) {
            $headerCategories = app(\Botble\Ecommerce\Repositories\Interfaces\ProductCategoryInterface::class)
                ->advancedGet([
                    'condition' => ['parent_id' => 0, 'status' => 'published'],
                    'with'      => ['slugable', 'activeChildren', 'activeChildren.activeChildren'],
                    'take'      => 10,
                ]);
        }

        $hasEcommerceSearch = is_plugin_active('ecommerce')
            && \Illuminate\Support\Facades\Route::has('public.products')
            && \Illuminate\Support\Facades\Route::has('public.ajax.search-products');

        $searchAction  = $hasEcommerceSearch ? route('public.products') : url('/search');
        $ajaxSearchUrl = $hasEcommerceSearch ? route('public.ajax.search-products') : null;
    }

    // Inline color overrides from Theme Options → Header. Sticky header always opaque
    // (no transparent-overlay variant), so apply both bg + fg unconditionally.
    $stickyStyleParts = [];
    if (! empty($headerMainBackgroundColor ?? null)) {
        $stickyStyleParts[] = 'background-color: ' . e($headerMainBackgroundColor);
    }
    if (! empty($headerMainTextColor ?? null)) {
        $stickyStyleParts[] = 'color: ' . e($headerMainTextColor);
    }
    $stickyStyleAttr = $stickyStyleParts ? ' style="' . implode('; ', $stickyStyleParts) . '"' : '';
@endphp

@if (in_array($stickyHeaderStyle, $byCategoryStyles, true))
{{-- has-by-category sticky variant: logo + Browse + inline search + actions --}}
<header class="tf-header header-sticky scr-box-shadow" data-sticky-threshold="120" hidden{!! $stickyStyleAttr !!}>
    <div class="container-full">
        <div class="header-inner">
            <div class="box-open-menu-mobile d-xl-none">
                <a href="#mobileMenu" data-bs-toggle="offcanvas" class="btn-open-menu" aria-label="{{ __('Open menu') }}">
                    <i class="icon icon-List"></i>
                </a>
            </div>

            <div class="header-left">
                <a href="{{ BaseHelper::getHomepageUrl() }}" class="logo-site d-flex">
                    {{ Theme::getLogoImage(['class' => 'logo-light'], 'logo', 30) }}
                </a>
                <div class="wrap-left d-none d-xl-flex">
                    @include(Theme::getThemeNamespace('partials.header.browse-by-category'), [
                        'categories'   => $headerCategories,
                        'wrapClass'    => 'nav-category-wrap style-4 main-action-active d-none d-xl-block',
                        'btnIconClass' => '',
                        'nameClass'    => 'name-category fw-medium lh-24',
                    ])
                    <form
                        action="{{ $searchAction }}"
                        method="GET"
                        role="search"
                        @class(['form-search-nav style-5 d-none d-xl-flex', 'bb-form-quick-search' => $hasEcommerceSearch])
                        @if ($hasEcommerceSearch) data-ajax-url="{{ $ajaxSearchUrl }}" @endif
                    >
                        <input type="text" name="q" placeholder="{{ __('Search Products') }}" autocomplete="off" required>
                        <button type="submit" class="btn-action-submit" aria-label="{{ __('Search') }}">
                            <i class="icon icon-MagnifyingGlass"></i>
                        </button>
                    </form>
                </div>
            </div>

            <div class="header-right">
                @include(Theme::getThemeNamespace('partials.header.ecommerce-action-buttons'))
            </div>
        </div>
    </div>
</header>
@else
{{-- Legacy compact sticky for non-by-category headers (nav LEFT + logo CENTER + actions RIGHT) --}}
<header class="tf-header header-sticky scr-box-shadow" data-sticky-threshold="120" hidden{!! $stickyStyleAttr !!}>
    <div class="container-full">
        <div class="header-inner">
            <div class="box-open-menu-mobile d-xl-none">
                <a href="#mobileMenu" data-bs-toggle="offcanvas" class="btn-open-menu" aria-label="{{ __('Open menu') }}">
                    <i class="icon icon-List"></i>
                </a>
            </div>

            <div class="header-left d-none d-xl-block">
                <nav class="box-navigation">
                    @include(Theme::getThemeNamespace('partials.header.main-menu'))
                </nav>
            </div>

            <div class="header-center">
                <a href="{{ BaseHelper::getHomepageUrl() }}" class="logo-site">
                    {{ Theme::getLogoImage(['class' => 'logo-light'], 'logo', 24) }}
                    {{ Theme::getLogoImage(['class' => 'logo-dark'], 'logo_dark', 24) }}
                </a>
            </div>

            <div class="header-right">
                @include(Theme::getThemeNamespace('partials.header.ecommerce-action-buttons'))
            </div>
        </div>
    </div>
</header>
@endif
