@php
    use Botble\Base\Facades\BaseHelper;
@endphp

{{-- Header Style 4 — Boxed centered (header-s4): search-left + logo-center + icons-right top bar; main menu in bottom bar. --}}
<div class="header-inner_wrap">
    <div class="container">
        <div class="header-inner">
            <div class="box-open-menu-mobile d-xl-none">
                <a href="#mobileMenu" data-bs-toggle="offcanvas" class="btn-open-menu" aria-label="{{ __('Open menu') }}">
                    <i class="icon icon-List"></i>
                </a>
            </div>

            <div class="header-left d-none d-xl-block">
                @include(Theme::getThemeNamespace('partials.header.search-form'), ['formClasses' => 'form-search-nav style-2'])
            </div>

            <div class="header-center">
                <a href="{{ BaseHelper::getHomepageUrl() }}" class="logo-site">
                    {{ Theme::getLogoImage(['class' => 'logo-light'], 'logo', 30) }}
                    {{ Theme::getLogoImage(['class' => 'logo-dark'], 'logo_dark', 30) }}
                </a>
            </div>

            <div class="header-right">
                @include(Theme::getThemeNamespace('partials.header.ecommerce-action-buttons'), ['inlineSearchAtXl' => true])
            </div>
        </div>
    </div>
</div>

<div class="header-bottom_wrap d-none d-xl-block">
    <div class="container">
        <div class="header-bottom">
            <nav class="box-navigation">
                @include(Theme::getThemeNamespace('partials.header.main-menu'), ['menuClass' => 'justify-content-center'])
            </nav>
        </div>
    </div>
</div>
