@php
    use Botble\Base\Facades\BaseHelper;

    /**
     * Footer Style 8 — white variant of style-5. Mirrors home-fashion-2.html
     * `tf-footer footer-s5 bg-white`. Same 5-col structure as style-5 / style-6
     * (TOP STRIP 4 box-icons + MIDDLE 5 cols + BOTTOM payment list) but with
     * pure white #fff background, BLACK text + icons, and subtle grey dividers.
     *
     * Top-strip box-icon items reuse the same `footer_service_*` theme options
     * as style-5/6 so admin-driven copy works for all three.
     */

    // Top-strip service callouts (4 boxes). Read from theme options or use demo defaults.
    $services = [];
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

{{-- TOP STRIP: 4-up box-icon_V01 style-3 grid (NOT swiper for cream variant — demo shows static 4-col). --}}
@if (! empty($services))
    <div class="flat-spacing-4">
        <div class="{{ $footerContainerClass }}">
            <div class="row gy-30 gx-30 justify-content-between">
                @foreach ($services as $svc)
                    <div class="col-md-6 col-lg-3">
                        <div class="box-icon_V01 style-3 wow fadeInLeft">
                            @if (! empty($svc['icon']))
                                <span class="icon"><i class="icon {{ $svc['icon'] }}"></i></span>
                            @endif
                            <div class="content">
                                @if (! empty($svc['title']))
                                    <h4 class="title">{!! BaseHelper::clean($svc['title']) !!}</h4>
                                @endif
                                @if (! empty($svc['text']))
                                    <p class="text cl-text-2">{!! BaseHelper::clean($svc['text']) !!}</p>
                                @endif
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
@endif

{{-- White variant footer layout (footer-s5.bg-white) lives in
     assets/sass/component/_inline-migrated.scss. --}}

{{-- MIDDLE: 5-col footer (Our Store / Company / Customer / My Account / Newsletter) with vertical dividers --}}
<div class="position-relative">
    <div class="br-line fake-class top-0"></div>
    <div class="br-line fake-class bottom-0 d-none d-sm-flex"></div>
    <div class="{{ $footerContainerClass }}">
        <div class="footer-inner flat-spacing">
            <div class="col-left">
                <div class="footer-col-block footer-wrap-start">
                    <p class="footer-heading footer-heading-mobile">{{ __('OUR STORE') }}</p>
                    <div class="tf-collapse-content">
                        <p class="cl-text-2 mb-4">{{ __('24/7 Support Center:') }}</p>
                        @if (! empty($footerPhone))
                            <a href="tel:{{ preg_replace('/[^0-9+]/', '', $footerPhone) }}" class="link h4 fw-medium mb-12 d-block">
                                {{ $footerPhone }}
                            </a>
                        @endif
                        @if (! empty($footerAddress))
                            <a href="{{ $footerMapUrl ?: '#' }}" target="_blank" rel="noopener noreferrer" class="cl-text-2 link mb-4 d-block">
                                {{ $footerAddress }}
                            </a>
                        @endif
                        @if (! empty($footerEmail))
                            <a href="mailto:{{ $footerEmail }}" class="cl-text-2 link d-block">
                                {{ $footerEmail }}
                            </a>
                        @endif
                    </div>
                </div>
            </div>

            <div class="br-line type-vertical"></div>

            <div class="col-center">
                <div class="footer-link-list">
                    <div class="footer-col-block footer-wrap-2">
                        <p class="footer-heading footer-heading-mobile">{{ $companyTitle }}</p>
                        <div class="tf-collapse-content">
                            @if ($footerCompanySidebar)
                                {!! BaseHelper::clean($footerCompanySidebar) !!}
                            @else
                                <ul class="footer-menu-list">
                                    @foreach ($defaultCompanyLinks as $link)
                                        <li><a href="{{ url($link['url']) }}" class="cl-text-2 link">{{ $link['label'] }}</a></li>
                                    @endforeach
                                </ul>
                            @endif
                        </div>
                    </div>
                    <div class="footer-col-block footer-wrap-3">
                        <p class="footer-heading footer-heading-mobile">{{ $customerTitle }}</p>
                        <div class="tf-collapse-content">
                            @if ($footerCustomerSidebar)
                                {!! BaseHelper::clean($footerCustomerSidebar) !!}
                            @else
                                <ul class="footer-menu-list">
                                    @foreach ($defaultCustomerLinks as $link)
                                        <li><a href="{{ url($link['url']) }}" class="cl-text-2 link">{{ $link['label'] }}</a></li>
                                    @endforeach
                                </ul>
                            @endif
                        </div>
                    </div>
                    <div class="footer-col-block footer-wrap-4">
                        <p class="footer-heading footer-heading-mobile">{{ __('MY ACCOUNT') }}</p>
                        <div class="tf-collapse-content">
                            <ul class="footer-menu-list">
                                @foreach ($defaultMyAccountLinks as $link)
                                    <li><a href="{{ url($link['url']) }}" class="cl-text-2 link">{{ $link['label'] }}</a></li>
                                @endforeach
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="br-line type-vertical"></div>

            <div class="col-right">
                <div class="footer-col-block footer-wrap-end">
                    <p class="footer-heading footer-heading-mobile">{{ $newsletterTitle }}</p>
                    <div class="tf-collapse-content">
                        @if ($newsletterDesc)
                            <p class="footer-desc cl-text-2 mb-16">{{ $newsletterDesc }}</p>
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
                        <p class="text-remember cl-text-2">
                            {!! BaseHelper::clean(__('By clicking subscribe, you agree to the :terms and :privacy.', [
                                'terms'   => '<a href="' . url('terms-of-service') . '" class="link link-underline">' . __('Terms of Service') . '</a>',
                                'privacy' => '<a href="' . url('privacy-policy') . '" class="link link-underline">' . __('Privacy Policy') . '</a>',
                            ])) !!}
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

{{-- BOTTOM: currency + lang switchers, copyright, payment list --}}
<div class="footer-bottom">
    <div class="{{ $footerContainerClass }}">
        <div class="inner-bottom">
            @if ($hasCurrencies || $hasLanguages)
                <div class="tf-list list-currenci">
                    @if ($hasCurrencies)
                        @include(Theme::getThemeNamespace('partials.currency-switcher'), ['colorMode' => 'light'])
                    @endif
                    @if ($hasLanguages)
                        @include(Theme::getThemeNamespace('partials.language-switcher'), ['colorMode' => 'light'])
                    @endif
                </div>
            @endif
            @if ($copyright)
                <p class="text-nocopy cl-text-2 mb-0">{!! BaseHelper::clean($copyright) !!}</p>
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
