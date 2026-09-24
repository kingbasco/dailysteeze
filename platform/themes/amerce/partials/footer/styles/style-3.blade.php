@php
    use Botble\Base\Facades\BaseHelper;

    // Feature slider items shown above the main footer.
    $footerFeatures = [
        ['icon' => 'icon-ArrowUDownLeft', 'title' => __('14-Day Returns'),    'text' => __('Risk-free shopping with easy returns.')],
        ['icon' => 'icon-Package',        'title' => __('Free Shipping'),     'text' => __('No extra costs, just the price you see.')],
        ['icon' => 'icon-Headset',        'title' => __('24/7 Support'),      'text' => __('24/7 support, always here just for you.')],
        ['icon' => 'icon-SealPercent',    'title' => __('Member Discounts'),  'text' => __('Special prices for our loyal customers.')],
    ];
@endphp

<div class="flat-spacing-4">
    <div class="{{ $footerContainerClass }}">
        <div dir="ltr" class="swiper tf-swiper" data-preview="4" data-tablet="3" data-mobile-sm="2"
             data-mobile="1" data-space-lg="30" data-space-md="20" data-space="10" data-pagination="1"
             data-pagination-sm="2" data-pagination-md="3" data-pagination-lg="4">
            <div class="swiper-wrapper">
                @foreach ($footerFeatures as $feature)
                    <div class="swiper-slide">
                        <div class="box-icon_V01 style-3 wow fadeInLeft">
                            <span class="icon text-white">
                                <i class="{{ $feature['icon'] }}"></i>
                            </span>
                            <div class="content">
                                <h6 class="title text-white">{{ $feature['title'] }}</h6>
                                <p class="text cl-text-3">{{ $feature['text'] }}</p>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
            <div class="sw-line-default tf-sw-pagination"></div>
        </div>
    </div>
</div>

<div class="position-relative">
    <div class="br-line fake-class top-0 bg-white_10"></div>
    <div class="br-line fake-class bottom-0 bg-white_10 d-none d-sm-flex"></div>
    <div class="{{ $footerContainerClass }}">
        <div class="footer-inner flat-spacing">
            <div class="col-left">
                <div class="footer-col-block type-white footer-wrap-start">
                    <p class="footer-heading footer-heading-mobile text-white">{{ __('Our Store') }}</p>
                    <div class="tf-collapse-content">
                        <p class="cl-text-3 mb-4">{{ __('24/7 Support Center:') }}</p>
                        @if ($footerPhone)
                            <a href="tel:{{ preg_replace('/[^0-9+]/', '', $footerPhone) }}" class="text-white link h4 fw-medium mb-12">{{ $footerPhone }}</a>
                        @endif
                        @if ($footerAddress)
                            <a href="{{ $footerMapUrl }}" target="_blank" rel="noopener noreferrer" class="cl-text-3 link mb-4">{{ $footerAddress }}</a>
                        @endif
                        @if ($footerEmail)
                            <a href="mailto:{{ $footerEmail }}" class="cl-text-3 link">{{ $footerEmail }}</a>
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
                        <p class="footer-heading footer-heading-mobile text-white">{{ __('My Account') }}</p>
                        <div class="tf-collapse-content">
                            <ul class="footer-menu-list">
                                <li><a href="{{ url('login') }}" class="cl-text-3 link">{{ __('Login') }}</a></li>
                                <li><a href="{{ url('register') }}" class="cl-text-3 link">{{ __('Sign up') }}</a></li>
                                <li><a href="{{ url('customer/overview') }}" class="cl-text-3 link">{{ __('My Account') }}</a></li>
                                <li><a href="{{ url('wishlist') }}" class="cl-text-3 link">{{ __('Wish List') }}</a></li>
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

<div class="footer-bottom">
    <div class="{{ $footerContainerClass }}">
        <div class="inner-bottom">
            <div class="tf-list list-currenci">
                @include(Theme::getThemeNamespace('partials.currency-switcher'))
                @include(Theme::getThemeNamespace('partials.language-switcher'))
            </div>

            @if ($copyright)
                <p class="text-nocopy cl-text-3">{!! BaseHelper::clean($copyright) !!}</p>
            @endif

            @if (! empty($paymentIcons))
                <ul class="tf-list payment-list">
                    @foreach ($paymentIcons as $icon)
                        <li>
                            <img loading="lazy" width="38" height="24"
                                 src="{{ $icon['url'] }}"
                                 alt="{{ $icon['alt'] }}">
                        </li>
                    @endforeach
                </ul>
            @endif
        </div>
    </div>
</div>
