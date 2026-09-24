@php
    $sliderId = 'ecommerce-flash-sale-slider-' . uniqid();
    $endDate = optional($flashSale->end_date)->endOfDay();
    $endIso = $endDate ? $endDate->toIso8601String() : null;
    $products = $flashSale->products ?? collect();
@endphp

<div class="ecommerce-flash-sale__header d-flex flex-wrap align-items-center justify-content-between gap-3 mb-4">
    <div>
        @if ($shortcode->title)
            <h2 class="ecommerce-flash-sale__title mb-1">{{ $shortcode->title }}</h2>
        @endif
        @if ($shortcode->subtitle)
            <p class="ecommerce-flash-sale__subtitle text-muted mb-0">{{ $shortcode->subtitle }}</p>
        @endif
    </div>

    @if ($shortcode->show_countdown && $endIso)
        <div class="ecommerce-flash-sale__countdown d-flex gap-2"
             data-countdown
             data-target-date="{{ $endIso }}">
            <div class="ecommerce-flash-sale__countdown-block text-center px-3 py-2 bg-dark text-white rounded">
                <span class="d-block h4 mb-0" data-countdown-days>00</span>
                <span class="small text-uppercase">{{ __('D') }}</span>
            </div>
            <div class="ecommerce-flash-sale__countdown-block text-center px-3 py-2 bg-dark text-white rounded">
                <span class="d-block h4 mb-0" data-countdown-hours>00</span>
                <span class="small text-uppercase">{{ __('H') }}</span>
            </div>
            <div class="ecommerce-flash-sale__countdown-block text-center px-3 py-2 bg-dark text-white rounded">
                <span class="d-block h4 mb-0" data-countdown-minutes>00</span>
                <span class="small text-uppercase">{{ __('M') }}</span>
            </div>
            <div class="ecommerce-flash-sale__countdown-block text-center px-3 py-2 bg-dark text-white rounded">
                <span class="d-block h4 mb-0" data-countdown-seconds>00</span>
                <span class="small text-uppercase">{{ __('S') }}</span>
            </div>
        </div>
    @endif
</div>

<div class="ecommerce-flash-sale__slider tf-btn-swiper-main hover-sw-nav">
    <div dir="ltr"
         id="{{ $sliderId }}"
         class="swiper tf-swiper"
         data-preview="4"
         data-tablet="3"
         data-mobile="2"
         data-mobile-sm="2"
         data-space="20"
         data-space-md="16">
        <div class="swiper-wrapper">
            @foreach ($products as $product)
                <div class="swiper-slide">
                    @includeIf(Theme::getThemeNamespace('views.ecommerce.includes.product-item'), ['product' => $product])
                </div>
            @endforeach
        </div>
    </div>
    <div class="tf-sw-nav nav-prev-{{ $sliderId }} nav-prev-swiper" aria-label="{{ __('Previous') }}">
        <i class="icon icon-arrLeft"></i>
    </div>
    <div class="tf-sw-nav nav-next-{{ $sliderId }} nav-next-swiper" aria-label="{{ __('Next') }}">
        <i class="icon icon-arrRight"></i>
    </div>
</div>
