@php
    $perView = max(1, min(6, (int) ($perView ?? 4)));
    $productWrapperClass = trim((string) ($productWrapperClass ?? ''));
    $sliderId = 'ecommerce-products-tabs-' . uniqid();
    // gridRows → swiper `data-grid` (multi-row grid mode); 1 = single-row slider.
    $gridRows = max(1, min(3, (int) ($gridRows ?? 1)));
    $showMarquee = $showMarquee ?? true;
@endphp

@if ($products && count($products) > 0)
    <div
        dir="ltr"
        id="{{ $sliderId }}"
        class="swiper tf-swiper wrap-sw-over"
        data-laptop="{{ $perView }}"
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
        @if ($gridRows > 1) data-grid="{{ $gridRows }}" @endif
    >
        <div class="swiper-wrapper">
            @foreach ($products as $product)
                <div class="swiper-slide">
                    @includeIf(Theme::getThemeNamespace('views.ecommerce.includes.product-item'), [
                        'product' => $product,
                        'productWrapperClass' => $productWrapperClass,
                        'cardStyle' => $cardStyle ?? null,
                        'cardExtraClass' => $cardExtraClass ?? null,
                        'showMarquee' => $showMarquee,
                    ])
                </div>
            @endforeach
        </div>
    </div>
@else
    <p class="text-center text-muted py-4">{{ __('No products available in this tab.') }}</p>
@endif
