@php
    $sliderId = $sliderId ?? ('ecommerce-products-slider-' . uniqid());
    $perView = (int) ($shortcode->items_per_row ?: 4);
    $perView = max(1, min(6, $perView));
    $gridRows = max(1, min(3, (int) ($shortcode->grid_rows ?? 1)));
    $productWrapperClass = trim((string) ($shortcode->product_wrapper_class ?? ''));
    $cardStyleOverride = trim((string) ($shortcode->card_style ?? ''));
    $paginationLg = (int) ($shortcode->pagination_lg ?? 0);
    $paginationMd = (int) ($shortcode->pagination_md ?? 0);
    $paginationSm = (int) ($shortcode->pagination_sm ?? 0);
    $paginationXs = (int) ($shortcode->pagination ?? 0);
@endphp

<div class="ecommerce-products__slider tf-btn-swiper-main hover-sw-nav">
    <div dir="ltr"
         id="{{ $sliderId }}"
         class="swiper tf-swiper wrap-sw-over"
         data-preview="{{ $perView }}"
         data-tablet="3"
         data-mobile="2"
         data-mobile-sm="2"
         data-space="10"
         data-space-md="20"
         data-space-lg="30"
         @if ($gridRows > 1) data-grid="{{ $gridRows }}" @endif
         @if ($paginationXs > 0) data-pagination="{{ $paginationXs }}" @endif
         @if ($paginationSm > 0) data-pagination-sm="{{ $paginationSm }}" @endif
         @if ($paginationMd > 0) data-pagination-md="{{ $paginationMd }}" @endif
         @if ($paginationLg > 0) data-pagination-lg="{{ $paginationLg }}" @endif>
        <div class="swiper-wrapper">
            @foreach ($products as $product)
                <div class="swiper-slide">
                    @includeIf(Theme::getThemeNamespace('views.ecommerce.includes.product-item'), [
                        'product' => $product,
                        'productWrapperClass' => $productWrapperClass,
                        'cardStyle' => $cardStyleOverride !== '' ? $cardStyleOverride : null,
                    ])
                </div>
            @endforeach
        </div>
    </div>
    @if (($shortcode->title_align ?? 'center') !== 'side-nav')
        <div class="tf-sw-nav nav-prev-{{ $sliderId }} nav-prev-swiper" aria-label="{{ __('Previous') }}">
            <i class="icon icon-arrLeft"></i>
        </div>
        <div class="tf-sw-nav nav-next-{{ $sliderId }} nav-next-swiper" aria-label="{{ __('Next') }}">
            <i class="icon icon-arrRight"></i>
        </div>
    @endif
</div>
