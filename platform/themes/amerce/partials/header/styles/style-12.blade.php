@php
    use Botble\Base\Facades\BaseHelper;
@endphp

{{-- Header Style 12 — Jewelry boutique: logo-left + main-menu center + icons right (header-s10). --}}
<div class="container">
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
            @include(Theme::getThemeNamespace('partials.header.ecommerce-action-buttons'))
        </div>
    </div>
</div>
