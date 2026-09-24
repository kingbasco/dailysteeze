@php
    use Botble\Base\Facades\BaseHelper;
@endphp

{{-- Header Style 5 — Modern minimal (header-s5): contact-left + center logo + actions-right; main-menu in bottom bar.
     Style 6 reuses this partial via @include — only the wrapper modifier class
     (bg-dark) differs (controlled in partials/header.blade.php).
     Scoped CSS for `.tf-header.header-s5` (white text override + logo flex centering
     + dropdown color restore) lives in assets/sass/component/_inline-migrated.scss. --}}
<div class="header-inner_wrap position-relative">
    <div class="br-line fake-class bg-white_10 bottom-0 d-none d-xl-flex"></div>
    <div class="container-full">
        <div class="header-inner">
            <div class="box-open-menu-mobile d-xl-none">
                <a href="#mobileMenu" data-bs-toggle="offcanvas" class="btn-open-menu" aria-label="{{ __('Open menu') }}">
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
                        <a href="tel:{{ preg_replace('/[^0-9+]/', '', $contactPhone) }}" class="link">{{ $contactPhone }}</a>
                    @endif
                    <a href="{{ $storeRoute }}" class="text-decoration-underline link">{{ __('Our Store') }}</a>
                    <a href="{{ $contactRoute }}" class="link">{{ __('Contact') }}</a>
                </div>
            </div>

            <div class="header-center">
                <a href="{{ BaseHelper::getHomepageUrl() }}" class="logo-site">
                    {{ Theme::getLogoImage(['class' => 'logo-light'], 'logo', 30) }}
                    {{ Theme::getLogoImage(['class' => 'logo-dark'], 'logo_dark', 30) }}
                </a>
            </div>

            <div class="header-right">
                <div class="tf-list list-currenci d-none d-xxl-flex">
                    @include(Theme::getThemeNamespace('partials.currency-switcher'), ['colorMode' => 'dark'])
                    @include(Theme::getThemeNamespace('partials.language-switcher'), ['colorMode' => 'dark'])
                </div>
                <div class="br-line type-vertical bg-white_10 d-none d-xxl-flex"></div>
                @include(Theme::getThemeNamespace('partials.header.ecommerce-action-buttons'))
            </div>
        </div>
    </div>
</div>

<div class="header-bottom_wrap d-none d-xl-block">
    <div class="container">
        <div class="header-bottom">
            <nav class="box-navigation style-white">
                @include(Theme::getThemeNamespace('partials.header.main-menu'), ['menuClass' => 'justify-content-center'])
            </nav>
        </div>
    </div>
</div>
