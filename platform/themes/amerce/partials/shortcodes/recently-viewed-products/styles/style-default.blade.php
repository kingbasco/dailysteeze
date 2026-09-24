@php
    $sliderId = 'recently-viewed-products-slider-' . uniqid();
@endphp

<div class="recently-viewed-products__slider tf-btn-swiper-main hover-sw-nav">
    <div dir="ltr"
         id="{{ $sliderId }}"
         class="swiper tf-swiper"
         data-preview="5"
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
