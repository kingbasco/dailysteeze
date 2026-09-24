@php
    use Botble\Base\Facades\BaseHelper;
@endphp

{{-- Footer-menu widget link color rules (footer-s2 dark variant) live in
     assets/sass/component/_inline-migrated.scss. --}}

<div class="position-relative">
    <div class="br-line fake-class bg-white_10 top-0"></div>
    <div class="{{ $footerContainerClass }}">
        <div class="footer-inner flat-spacing-2">
            <div class="br-line fake-class bg-white_10 bottom-0"></div>

            <div class="col-left">
                <div class="footer-col-block type-white footer-wrap-3 ms-0 mb-sm-0">
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

            <div class="br-line type-vertical"></div>

            <div class="col-right">
                <div class="footer-col-block type-white footer-wrap-1 mx-xl-auto mb-lg-0">
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

                <div class="footer-col-block type-white footer-wrap-2 mx-xl-auto mb-lg-0">
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

                <div class="footer-col-block type-white footer-wrap-4 mb-0">
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
                            <a href="mailto:{{ $footerEmail }}" class="cl-text-3 link mb-12">{{ $footerEmail }}</a>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@if ($marqueeText = (string) theme_option('footer_marquee_text'))
    @php
        // Per-preset modifier on the marquee container (e.g. `type-2` for home-garden
        // — matches `infiniteSlide-footer-text type-2` in html/home-garden.html line 3449).
        $marqueeClass = trim((string) theme_option('footer_marquee_class', ''));
    @endphp
    <div class="footer-inner-slide-text">
        <div class="{{ $footerContainerClass }}">
            <div class="infiniteSlide-footer-text {{ $marqueeClass }}">
                <div class="infiniteSlide-element">
                    <div class="infiniteSlide infiniteSlide-wrapper" data-clone="3">
                        <div class="infiniteSlide-slide">
                            <p class="ft-text text-display text-white fw-semibold">
                                {{ $marqueeText }}&nbsp;
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endif

<div class="footer-bottom">
    <div class="{{ $footerContainerClass }}">
        <div class="inner-bottom position-relative">
            <div class="br-line fake-class bg-white_10 top-0"></div>
            <div class="tf-list list-currenci">
                @include(Theme::getThemeNamespace('partials.currency-switcher'), ['colorMode' => 'dark'])
                @include(Theme::getThemeNamespace('partials.language-switcher'), ['colorMode' => 'dark'])
            </div>

            @if ($copyright)
                <p class="text-nocopy cl-text-2">{!! BaseHelper::clean($copyright) !!}</p>
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
