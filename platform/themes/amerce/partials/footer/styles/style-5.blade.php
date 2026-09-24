@php
    use Botble\Base\Facades\BaseHelper;

    /**
     * Footer Style 5 — mirrors html/home-furniture.html `tf-footer footer-s5 bg-dark`
     * (lines 4695-4894). TOP STRIP: 4-up swiper of `box-icon_V01 style-3` (white text
     * on dark) for service callouts. MIDDLE: position-relative with horizontal br-lines
     * top/bottom + 4 columns separated by vertical br-lines (Our Store / Company+Customer+
     * My Account / Newsletter). BOTTOM: footer-bottom with currency+lang + copyright +
     * payment list.
     *
     * Top-strip box-icon items are admin-driven via theme_option `footer_service_*`
     * fields (icon class, title, text), or fall back to demo defaults.
     */

    // Top-strip service callouts (4 boxes). Used by home-furniture's footer-s5 design;
    // skipped by home-pet-care's footer-s5 (which has the box-icon strip rendered as a
    // separate site-features section ABOVE the footer instead). Toggle via theme_option
    // `footer_show_service_strip` (default true preserves existing behavior).
    $showServiceStrip = (bool) theme_option('footer_show_service_strip', true);
    $services = [];
    if ($showServiceStrip) {
        for ($i = 1; $i <= 4; $i++) {
            $defaults = [
                1 => ['icon' => 'icon-ArrowUDownLeft', 'title' => __('14-Day Returns'),    'text' => __('Risk-free shopping with easy returns.')],
                2 => ['icon' => 'icon-Package',        'title' => __('Free Shipping'),     'text' => __('No extra costs, just the price you see.')],
                3 => ['icon' => 'icon-Headset',        'title' => __('24/7 Support'),      'text' => __('24/7 support, always here just for you.')],
                4 => ['icon' => 'icon-SealPercent',    'title' => __('Member Discounts'),  'text' => __('Special prices for our loyal customers.')],
            ];
            $iconClass = trim((string) theme_option("footer_service_icon_$i", $defaults[$i]['icon']));
            $title     = trim((string) theme_option("footer_service_title_$i", $defaults[$i]['title']));
            $text      = trim((string) theme_option("footer_service_text_$i", $defaults[$i]['text']));
            if ($title !== '' || $text !== '') {
                $services[] = ['icon' => $iconClass, 'title' => $title, 'text' => $text];
            }
        }
    }

    // Customer + My Account default link lists (style-5 has the extra My Account column).
    $defaultMyAccountLinks = [
        ['label' => __('Login'),       'url' => '/login'],
        ['label' => __('Sign up'),     'url' => '/register'],
        ['label' => __('My Account'),  'url' => '/customer/overview'],
        ['label' => __('Wish List'),   'url' => '/wishlist'],
    ];

    $hasCurrencies = is_plugin_active('ecommerce')
        && method_exists(\Botble\Ecommerce\Supports\CurrencySupport::class, 'currencies')
        && get_all_currencies()->count() > 1;
    $hasLanguages = is_plugin_active('language')
        && count(\Botble\Language\Facades\Language::getSupportedLocales() ?? []) > 1;
@endphp

{{-- TOP STRIP: 4-up box-icon_V01 style-3 swiper --}}
@if (! empty($services))
    <div class="flat-spacing-4">
        <div class="{{ $footerContainerClass }}">
            <div dir="ltr" class="swiper tf-swiper"
                data-preview="4" data-tablet="3" data-mobile-sm="2" data-mobile="1"
                data-space-lg="30" data-space-md="20" data-space="10"
                data-pagination="1" data-pagination-sm="2" data-pagination-md="3" data-pagination-lg="4">
                <div class="swiper-wrapper">
                    @foreach ($services as $svc)
                        <div class="swiper-slide">
                            <div class="box-icon_V01 style-3 wow fadeInLeft">
                                @if (! empty($svc['icon']))
                                    <span class="icon text-white"><i class="icon {{ $svc['icon'] }}"></i></span>
                                @endif
                                <div class="content">
                                    @if (! empty($svc['title']))
                                        <h6 class="title text-white">{!! BaseHelper::clean($svc['title']) !!}</h6>
                                    @endif
                                    @if (! empty($svc['text']))
                                        <p class="text cl-text-3">{!! BaseHelper::clean($svc['text']) !!}</p>
                                    @endif
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
                <div class="sw-line-default tf-sw-pagination"></div>
            </div>
        </div>
    </div>
@endif

{{-- Footer-s5 layout CSS (dark variant with gradient hero text) lives in
     assets/sass/component/_inline-migrated.scss. --}}
{{-- MIDDLE: 4-column footer with vertical dividers --}}
<div class="position-relative">
    <div class="br-line fake-class top-0 bg-white_10"></div>
    <div class="br-line fake-class bottom-0 bg-white_10 d-none d-sm-flex"></div>
    <div class="{{ $footerContainerClass }}">
        <div class="footer-inner flat-spacing">
            <div class="col-left">
                <div class="footer-col-block type-white footer-wrap-start">
                    <p class="footer-heading footer-heading-mobile text-white">{{ __('OUR STORE') }}</p>
                    <div class="tf-collapse-content">
                        <p class="cl-text-3 mb-4">{{ __('24/7 Support Center:') }}</p>
                        @if (! empty($footerPhone))
                            <a href="tel:{{ preg_replace('/[^0-9+]/', '', $footerPhone) }}" class="text-white link h4 fw-medium mb-12 d-block">
                                {{ $footerPhone }}
                            </a>
                        @endif
                        @if (! empty($footerAddress))
                            <a href="{{ $footerMapUrl ?: '#' }}" target="_blank" rel="noopener noreferrer" class="cl-text-3 link mb-4 d-block">
                                {{ $footerAddress }}
                            </a>
                        @endif
                        @if (! empty($footerEmail))
                            <a href="mailto:{{ $footerEmail }}" class="cl-text-3 link d-block">
                                {{ $footerEmail }}
                            </a>
                        @endif
                    </div>
                </div>
            </div>

            <div class="br-line type-vertical"></div>

            <div class="col-center">
                <div class="footer-link-list">
                    <div class="footer-col-block type-white footer-wrap-2">
                        <p class="footer-heading footer-heading-mobile text-white">{{ $companyTitle }}</p>
                        <div class="tf-collapse-content">
                            @if ($footerCompanySidebar)
                                {!! BaseHelper::clean($footerCompanySidebar) !!}
                            @else
                                <ul class="footer-menu-list">
                                    @foreach ($defaultCompanyLinks as $link)
                                        <li><a href="{{ url($link['url']) }}" class="cl-text-3 link">{{ $link['label'] }}</a></li>
                                    @endforeach
                                </ul>
                            @endif
                        </div>
                    </div>
                    <div class="footer-col-block type-white footer-wrap-3">
                        <p class="footer-heading footer-heading-mobile text-white">{{ $customerTitle }}</p>
                        <div class="tf-collapse-content">
                            @if ($footerCustomerSidebar)
                                {!! BaseHelper::clean($footerCustomerSidebar) !!}
                            @else
                                <ul class="footer-menu-list">
                                    @foreach ($defaultCustomerLinks as $link)
                                        <li><a href="{{ url($link['url']) }}" class="cl-text-3 link">{{ $link['label'] }}</a></li>
                                    @endforeach
                                </ul>
                            @endif
                        </div>
                    </div>
                    <div class="footer-col-block type-white footer-wrap-4">
                        <p class="footer-heading footer-heading-mobile text-white">{{ __('MY ACCOUNT') }}</p>
                        <div class="tf-collapse-content">
                            <ul class="footer-menu-list">
                                @foreach ($defaultMyAccountLinks as $link)
                                    <li><a href="{{ url($link['url']) }}" class="cl-text-3 link">{{ $link['label'] }}</a></li>
                                @endforeach
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="br-line type-vertical"></div>

            <div class="col-right">
                <div class="footer-col-block type-white footer-wrap-end">
                    <p class="footer-heading footer-heading-mobile text-white">{{ $newsletterTitle }}</p>
                    <div class="tf-collapse-content">
                        @if ($newsletterDesc)
                            <p class="footer-desc cl-text-3 mb-16">{{ $newsletterDesc }}</p>
                        @endif
                        @if (is_plugin_active('newsletter'))
                            <form class="form-sub mb-16" action="{{ route('public.newsletter.subscribe') }}" method="POST">
                                @csrf
                                <fieldset>
                                    <input type="email" name="email" placeholder="{{ __('Enter your e-mail') }}" required>
                                </fieldset>
                                <button type="submit" class="btn-action" aria-label="{{ __('Subscribe') }}">
                                    <i class="icon icon-ArrowUpRight"></i>
                                </button>
                            </form>
                        @endif
                        <p class="text-remember cl-text-3">
                            {!! BaseHelper::clean(__('By clicking subscribe, you agree to the :terms and :privacy.', [
                                'terms'   => '<a href="' . url('terms-of-service') . '" class="text-white link link-underline">' . __('Terms of Service') . '</a>',
                                'privacy' => '<a href="' . url('privacy-policy') . '" class="text-white link link-underline">' . __('Privacy Policy') . '</a>',
                            ])) !!}
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

{{-- HERO TEXT: giant gradient brand name (footer-hero-text) — demo home-sport.html lines ~3950+. --}}
@php
    $heroText = trim((string) theme_option('footer_hero_text', \Botble\Theme\Facades\Theme::getSiteTitle() . ' STORE'));
@endphp
@if ($heroText !== '')
    <div class="footer-hero-text">
        <div class="text">{{ $heroText }}</div>
    </div>
@endif

{{-- BOTTOM: currency + lang switchers, copyright, payment list --}}
<div class="footer-bottom">
    <div class="{{ $footerContainerClass }}">
        <div class="inner-bottom">
            @if ($hasCurrencies || $hasLanguages)
                <div class="tf-list list-currenci">
                    @if ($hasCurrencies)
                        @include(Theme::getThemeNamespace('partials.currency-switcher'), ['colorMode' => 'dark'])
                    @endif
                    @if ($hasLanguages)
                        @include(Theme::getThemeNamespace('partials.language-switcher'), ['colorMode' => 'dark'])
                    @endif
                </div>
            @endif
            @if ($copyright)
                <p class="text-nocopy cl-text-3 mb-0">{!! BaseHelper::clean($copyright) !!}</p>
            @endif
            @if (! empty($paymentIcons))
                <ul class="tf-list payment-list">
                    @foreach ($paymentIcons as $icon)
                        <li><img loading="lazy" width="38" height="24" src="{{ $icon['url'] }}" alt="{{ $icon['alt'] }}"></li>
                    @endforeach
                </ul>
            @endif
        </div>
    </div>
</div>
