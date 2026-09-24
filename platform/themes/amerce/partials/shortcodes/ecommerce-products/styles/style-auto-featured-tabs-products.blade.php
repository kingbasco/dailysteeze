@php
    $perView = max(1, min(6, (int) ($perView ?? 4)));
    $sliderId = 'ecommerce-products-auto-tabs-' . uniqid();
@endphp

@if ($products && count($products) > 0)
    <div
        dir="ltr"
        id="{{ $sliderId }}"
        class="swiper tf-swiper"
        data-laptop="5"
        data-preview="{{ $perView }}"
        data-tablet="3"
        data-mobile-sm="2"
        data-mobile="2"
        data-space-lg="30"
        data-space-md="15"
        data-space="10"
        data-pagination="2"
        data-pagination-sm="2"
        data-pagination-md="3"
        data-pagination-lg="{{ $perView }}"
    >
        <div class="swiper-wrapper">
            @foreach ($products as $product)
                <div class="swiper-slide">
                    @includeIf(Theme::getThemeNamespace('views.ecommerce.includes.product-item'), [
                        'product' => $product,
                        'productWrapperClass' => 'square',
                    ])
                </div>
            @endforeach
        </div>
        <div class="sw-line-default style-2 tf-sw-pagination"></div>
    </div>
@else
    <p class="text-center text-muted py-4">{{ __('No products available in this tab.') }}</p>
@endif
