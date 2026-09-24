@php
    use Botble\Base\Facades\BaseHelper;
@endphp

{{-- Header Style 1 — Logo-left + nav-center + actions-right (header-s1) --}}
<div class="container-full">
    <div class="header-inner">
        <div class="box-open-menu-mobile d-xl-none">
            <a href="#mobileMenu" data-bs-toggle="offcanvas" class="btn-open-menu" aria-label="{{ __('Open menu') }}">
                <i class="icon icon-List"></i>
            </a>
        </div>

        <div class="header-left">
            <a href="{{ BaseHelper::getHomepageUrl() }}" class="logo-site">
                {{ Theme::getLogoImage(['class' => 'logo-light'], 'logo', 30) }}
                {{ Theme::getLogoImage(['class' => 'logo-dark'], 'logo_dark', 30) }}
            </a>
        </div>

        <div class="header-center d-none d-xl-block">
            <nav class="box-navigation">
                @include(Theme::getThemeNamespace('partials.header.main-menu'))
            </nav>
        </div>

        <div class="header-right">
            @if ((bool) theme_option('header_show_currency_language', true))
                <div class="tf-list list-currenci d-none d-xxl-flex">
                    @include(Theme::getThemeNamespace('partials.currency-switcher'))
                    @include(Theme::getThemeNamespace('partials.language-switcher'))
                </div>
                <div class="br-line type-vertical d-none d-xxl-flex"></div>
            @endif
            @include(Theme::getThemeNamespace('partials.header.ecommerce-action-buttons'))
        </div>
    </div>
</div>
