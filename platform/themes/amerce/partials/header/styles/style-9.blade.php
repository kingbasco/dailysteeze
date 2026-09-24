@php
    use Botble\Base\Facades\BaseHelper;
@endphp

{{-- Header Style 9 — Classic single-row: logo + inline nav left, search + icons right (header-s7). --}}
<div class="container-full">
    <div class="header-inner">
        <div class="box-open-menu-mobile d-xl-none">
            <a href="#mobileMenu" data-bs-toggle="offcanvas" class="btn-open-menu" aria-label="{{ __('Open menu') }}">
                <i class="icon icon-List"></i>
            </a>
        </div>

        <div class="header-left d-none d-xl-flex">
            <a href="{{ BaseHelper::getHomepageUrl() }}" class="logo-site">
                {{ Theme::getLogoImage(['class' => 'logo-light'], 'logo', 30) }}
                {{ Theme::getLogoImage(['class' => 'logo-dark'], 'logo_dark', 30) }}
            </a>
            <nav class="box-navigation">
                @include(Theme::getThemeNamespace('partials.header.main-menu'))
            </nav>
        </div>

        <div class="header-center d-xl-none">
            <a href="{{ BaseHelper::getHomepageUrl() }}" class="logo-site">
                {{ Theme::getLogoImage(['class' => 'logo-light'], 'logo', 30) }}
                {{ Theme::getLogoImage(['class' => 'logo-dark'], 'logo_dark', 30) }}
            </a>
        </div>

        <div class="header-right">
            @include(Theme::getThemeNamespace('partials.header.search-form'), ['formClasses' => 'form-search-nav style-3 d-none d-xl-block'])
            @include(Theme::getThemeNamespace('partials.header.ecommerce-action-buttons'), ['inlineSearchAtXl' => true])
        </div>
    </div>
</div>
