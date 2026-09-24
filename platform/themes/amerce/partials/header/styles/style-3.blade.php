@php
    use Botble\Base\Facades\BaseHelper;

    // Style-3 is designed for transparent overlay over a dark hero (homepage).
    // On non-homepage pages there's no hero behind the header, so white text on
    // a white wrapper would be invisible — fall back to default colors.
    $isHomepage = BaseHelper::isHomepage() || request()->is('/');
    $navWhiteClass     = $isHomepage ? 'style-white-2' : '';
    $searchWhiteClass  = $isHomepage ? 'text-white' : '';
    $burgerWhiteClass  = $isHomepage ? 'text-white' : '';
    $actionColorMode   = $isHomepage ? 'dark' : 'light';
@endphp

{{-- Header Style 3 — Transparent overlay over hero (header-s7 hds7-type-2 header-abs-3).
     Mirrors html/home-fashion.html (lines 137-1404): logo + nav grouped LEFT with white
     text, mobile-only centered logo, "Search Products" modal trigger + account/wishlist/
     cart icons RIGHT. The colorMode='dark' flag flips action icons to white. --}}
<div class="container-full">
    <div class="header-inner">
        <div class="box-open-menu-mobile d-xl-none">
            <a href="#mobileMenu" data-bs-toggle="offcanvas" class="btn-open-menu {{ $burgerWhiteClass }}" aria-label="{{ __('Open menu') }}">
                <i class="icon icon-List"></i>
            </a>
        </div>

        <div class="header-left d-none d-xl-flex">
            <a href="{{ BaseHelper::getHomepageUrl() }}" class="logo-site">
                {{ Theme::getLogoImage(['class' => 'logo-light'], 'logo', 30) }}
                {{ Theme::getLogoImage(['class' => 'logo-dark'], 'logo_dark', 30) }}
            </a>
            <nav class="box-navigation {{ $navWhiteClass }}">
                @include(Theme::getThemeNamespace('partials.header.main-menu'))
            </nav>
        </div>

        <div class="header-center d-xl-none">
            <a href="{{ BaseHelper::getHomepageUrl() }}" class="logo-site">
                {{ Theme::getLogoImage(['class' => 'logo-light'], 'logo', 30) }}
                {{ Theme::getLogoImage(['class' => 'logo-dark'], 'logo_dark', 30) }}
            </a>
        </div>

        <div class="header-right align-items-center">
            <a href="#search" data-bs-toggle="modal" class="btn-open-search {{ $searchWhiteClass }} link-dark d-none d-xxl-flex" aria-label="{{ __('Search') }}">
                {{ __('Search Products') }}
                <i class="icon icon-MagnifyingGlass"></i>
            </a>
            <div class="br-line type-vertical h-24 d-none d-xxl-flex"></div>
            @include(Theme::getThemeNamespace('partials.header.ecommerce-action-buttons'), ['colorMode' => $actionColorMode, 'inlineSearchAtXl' => true])
        </div>
    </div>
</div>
