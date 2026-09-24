@php
    use Botble\Base\Facades\BaseHelper;
@endphp

<div class="br-line fake-class top-0"></div>
<div class="footer-inner flat-spacing">
    <div class="{{ $footerContainerClass }}">
        <div class="row">
            <div class="col-md-6 col-lg-4">
                <div class="footer-col-block footer-wrap-3 mb-md-0 ms-0">
                    <p class="footer-heading footer-heading-mobile">{{ __('Our Store') }}</p>
                    <div class="tf-collapse-content">
                        <p class="cl-text-2 mb-4">{{ __('24/7 Support Center:') }}</p>
                        @if ($footerPhone)
                            <a href="tel:{{ preg_replace('/[^0-9+]/', '', $footerPhone) }}" class="link h4 fw-medium mb-12">{{ $footerPhone }}</a>
                            <br>
                        @endif
                        @if ($footerAddress)
                            <a href="{{ $footerMapUrl }}" target="_blank" rel="noopener noreferrer" class="cl-text-2 link mb-4">{{ $footerAddress }}</a>
                            <br>
                        @endif
                        @if ($footerEmail)
                            <a href="mailto:{{ $footerEmail }}" class="cl-text-2 link mb-12">{{ $footerEmail }}</a>
                        @endif

                        @if ($socialLinks)
                            {!! BaseHelper::clean($socialLinks) !!}
                        @else
                            <div class="d-flex align-items-center gap-20">
                                @foreach ($defaultSocials as $s)
                                    <a href="{{ $s['url'] }}" target="_blank" rel="noopener noreferrer" class="d-flex" aria-label="{{ $s['name'] ?? '' }}">
                                        <i class="fs-20 link icon {{ $s['icon'] }}" aria-hidden="true"></i>
                                    </a>
                                @endforeach
                            </div>
                        @endif
                    </div>
                </div>
            </div>

            <div class="col-sm-6 col-md-6 col-lg-2">
                <div class="footer-col-block footer-wrap-1 mx-xl-auto mb-lg-0">
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
            </div>

            <div class="col-sm-6 col-md-6 col-lg-2">
                <div class="footer-col-block footer-wrap-2 mx-xl-auto mb-lg-0">
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
            </div>

            <div class="col-md-6 col-lg-4">
                <div class="footer-col-block footer-wrap-3 ms-0 ms-lg-auto mb-0">
                    <p class="footer-heading footer-heading-mobile">{{ $newsletterTitle }}</p>
                    <div class="tf-collapse-content">
                        @if ($newsletterDesc)
                            <p class="footer-desc cl-text-2 mb-16">{{ $newsletterDesc }}</p>
                        @endif
                        @if (is_plugin_active('newsletter'))
                            <form class="form-sub" action="{{ route('public.newsletter.subscribe') }}" method="POST">
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

<div class="footer-bottom">
    <div class="{{ $footerContainerClass }}">
        <div class="br-line d-none d-sm-block"></div>
        <div class="inner-bottom">
            <div class="tf-list list-currenci">
                @include(Theme::getThemeNamespace('partials.currency-switcher'))
                @include(Theme::getThemeNamespace('partials.language-switcher'))
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
