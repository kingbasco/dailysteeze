@php
    use Botble\Base\Facades\BaseHelper;

    extract(amerce_footer_contact());
@endphp

{{-- Mobile drawer (#mobileMenu / canvas-mb). The desktop menu is cloned into #wrapper-menu-navigation by main.js. --}}
<div class="offcanvas offcanvas-start canvas-mb" id="mobileMenu" tabindex="-1" aria-labelledby="mobileMenuLabel">
    <div class="canvas-header">
        <span class="icon-close-popup" data-bs-dismiss="offcanvas" aria-label="{{ __('Close') }}">
            <i class="icon icon-X2"></i>
        </span>
        @include(Theme::getThemeNamespace('partials.header.search-form'), [
            'formClasses' => 'form-search-nav',
            'placeholder' => __('What are you looking for?'),
        ])
    </div>

    <div class="canvas-body">
        <div class="mb-content-top">
            {{-- Filled at runtime by main.js cloning the desktop nav. --}}
            <ul class="nav-ul-mb" id="wrapper-menu-navigation"></ul>
        </div>

        @if ($footerAddress || $footerEmail || $footerPhone)
            <div class="need-help-wrap">
                <p class="nd-title h6 fw-medium mb-16" id="mobileMenuLabel">{{ __('Need Help?') }}</p>

                @if ($footerAddress)
                    <p class="lh-26 cl-text-2 mb-4">{{ $footerAddress }}</p>
                @endif

                @if ($footerMapUrl)
                    <a href="{{ $footerMapUrl }}" target="_blank" rel="noopener noreferrer" class="text-decoration-underline text-primary lh-26 mb-16">
                        {{ __('Open in Maps') }}
                    </a>
                @endif

                @if ($footerEmail)
                    <a href="mailto:{{ $footerEmail }}" class="cl-text-2 link mb-8">{{ $footerEmail }}</a>
                @endif

                @if ($footerPhone)
                    <a href="tel:{{ preg_replace('/[^0-9+]/', '', $footerPhone) }}" class="cl-text-2 link">{{ $footerPhone }}</a>
                @endif
            </div>
        @endif
    </div>

    <div class="canvas-footer">
        <div class="d-flex justify-content-center border-end">
            @include(Theme::getThemeNamespace('partials.currency-switcher'))
        </div>
        <div class="d-flex justify-content-center">
            @include(Theme::getThemeNamespace('partials.language-switcher'))
        </div>
    </div>
</div>
