@php
    use Botble\Base\Facades\BaseHelper;
@endphp

{{-- Header Style 14 — Transparent overlay (organic): logo-left + main-menu center + icons right (header-abs-2). --}}
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
            {{-- Demo header-abs-2 (html/home-organic.html L1252-1268) emits just `nav-icon-item
                 link` — no text-white. CSS for `.header-abs-2` handles the two-state colour:
                 light icons over the hero, dark icons after scroll. Passing colorMode='dark'
                 here would force `text-white` and break the scrolled-state contrast. --}}
            @include(Theme::getThemeNamespace('partials.header.ecommerce-action-buttons'))
        </div>
    </div>
</div>
