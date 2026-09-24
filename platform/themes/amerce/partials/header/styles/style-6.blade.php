@php
    use Botble\Base\Facades\BaseHelper;

    // Light/white logo for the dark variant — falls back to theme asset logo-white.svg
    // when no logo_dark theme option is configured.
    $darkVariantLogoUrl = Theme::asset()->url('images/logo/logo-white.svg');
@endphp

{{-- Header Style 6 — Modern minimal dark (header-s5 + bg-dark): contact-left + center logo + actions-right; main-menu in bottom bar. --}}
{{-- Mirrors style-5 structure but forces the white logo and uses dark-bg modifier classes (bg-white_10 borders, color-white selects). --}}
<div class="header-inner_wrap position-relative">
    <div class="br-line fake-class bg-white_10 bottom-0 d-none d-xl-flex"></div>
    <div class="container-full">
        <div class="header-inner">
            <div class="box-open-menu-mobile d-xl-none">
                <a href="#mobileMenu" data-bs-toggle="offcanvas" class="btn-open-menu text-white" aria-label="{{ __('Open menu') }}">
                    <i class="icon icon-List"></i>
                </a>
            </div>

            <div class="header-left d-none d-xl-block">
                <div class="tf-list">
                    @php
                        $contactPhone = (string) theme_option('contact_phone');
                        $storeRoute = url('/our-store');
                        $contactRoute = url('/contact');
                    @endphp
                    @if ($contactPhone !== '')
                        <a href="tel:{{ preg_replace('/[^0-9+]/', '', $contactPhone) }}" class="text-white link">{{ $contactPhone }}</a>
                    @endif
                    <a href="{{ $storeRoute }}" class="text-decoration-underline text-white link">{{ __('Our Store') }}</a>
                    <a href="{{ $contactRoute }}" class="text-white link">{{ __('Contact') }}</a>
                </div>
            </div>

            <div class="header-center">
                <a href="{{ BaseHelper::getHomepageUrl() }}" class="logo-site">
                    {{ Theme::getLogoImage(['class' => 'logo-light'], 'logo_dark', 30, $darkVariantLogoUrl) }}
                </a>
            </div>

            <div class="header-right">
                <div class="tf-list list-currenci d-none d-xxl-flex">
                    @include(Theme::getThemeNamespace('partials.currency-switcher'), ['colorMode' => 'dark'])
                    @include(Theme::getThemeNamespace('partials.language-switcher'), ['colorMode' => 'dark'])
                </div>
                <div class="br-line type-vertical bg-white_10 d-none d-xxl-flex"></div>
                @include(Theme::getThemeNamespace('partials.header.ecommerce-action-buttons'), ['colorMode' => 'dark'])
            </div>
        </div>
    </div>
</div>

<div class="header-bottom_wrap d-none d-xl-block">
    <div class="container">
        <div class="header-bottom">
            <nav class="box-navigation style-white">
                {{-- header-s5 demo centers the bottom-bar menu (box-nav-menu justify-content-center). --}}
                @include(Theme::getThemeNamespace('partials.header.main-menu'), ['menuClass' => 'justify-content-center'])
            </nav>
        </div>
    </div>
</div>
