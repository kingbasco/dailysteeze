@php
    use Botble\Base\Facades\BaseHelper;
@endphp

<div class="footer-inner flat-spacing position-relative">
    <div class="br-line fake-class top-0"></div>
    <div class="{{ $footerContainerClass }}">
        <div class="row">
            <div class="col-md-6 col-lg-4">
                <div class="footer-infor d-flex flex-column align-items-start mb-lg-0">
                    @if (theme_option('logo'))
                        <a href="{{ BaseHelper::getHomepageUrl() }}" class="logo-site mb-16">
                            {{ Theme::getLogoImage(['class' => 'logo-light'], 'logo', 30) }}
                            {{ Theme::getLogoImage(['class' => 'logo-dark'], 'logo_dark', 30) }}
                        </a>
                    @endif

                    @if ($footerAddress)
                        <p class="lh-26 cl-text-2">{{ $footerAddress }}</p>
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
                        <a href="tel:{{ preg_replace('/[^0-9+]/', '', $footerPhone) }}" class="cl-text-2 link mb-16">{{ $footerPhone }}</a>
                    @endif

                    {{-- Theme-native socials first (icomoon-styled, matches design). --}}
                    {{-- Fall back to Botble core social_links — array of objects with ->url/->name/->icon. --}}
                    @if (! empty($defaultSocials))
                        <ul class="tf-social-icon-2">
                            @foreach ($defaultSocials as $s)
                                <li>
                                    <a href="{{ $s['url'] }}" target="_blank" rel="noopener noreferrer" aria-label="{{ $s['name'] ?? '' }}">
                                        <i class="icon {{ $s['icon'] }}" aria-hidden="true"></i>
                                    </a>
                                </li>
                            @endforeach
                        </ul>
                    @elseif (! empty($socialLinks))
                        <ul class="tf-social-icon-2">
                            @foreach ($socialLinks as $link)
                                <li>
                                    <a href="{{ BaseHelper::clean($link->url) }}" target="_blank" rel="noopener noreferrer" aria-label="{{ BaseHelper::clean($link->name) }}">
                                        <i class="{{ BaseHelper::clean($link->icon) }}"></i>
                                    </a>
                                </li>
                            @endforeach
                        </ul>
                    @endif
                </div>
            </div>

            <div class="col-sm-6 col-md-6 col-lg-2">
                <div class="footer-col-block footer-wrap-1 mx-xl-auto">
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
                <div class="footer-col-block footer-wrap-2 mx-xl-auto">
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
                <div class="footer-col-block footer-wrap-3 mb-0">
                    <p class="footer-heading footer-heading-mobile">{{ $newsletterTitle }}</p>
                    <div class="tf-collapse-content">
                        @if ($newsletterDesc)
                            <p class="footer-desc cl-text-2">{{ $newsletterDesc }}</p>
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
                                'terms'   => '<a href="' . url('terms-of-service') . '" class="text-main link link-underline">' . __('Terms of Service') . '</a>',
                                'privacy' => '<a href="' . url('privacy-policy') . '" class="text-main link link-underline">' . __('Privacy Policy') . '</a>',
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
        <div class="br-line sm-d-none"></div>
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
