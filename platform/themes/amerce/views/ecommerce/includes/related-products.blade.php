@php
    use Botble\Theme\Facades\Theme;

    $relatedProducts = $relatedProducts ?? get_related_products($product, (int) theme_option('number_of_related_product', 8));
    $perViewDesktop = (int) theme_option('number_of_related_product_per_row', 4);
@endphp

@if ($relatedProducts && $relatedProducts->isNotEmpty())
    <section class="section-related-products flat-spacing">
        <div class="container">
            <div class="d-flex justify-content-between align-items-end mb-24 flex-wrap gap-2">
                <h3 class="h4 fw-medium m-0">{{ __('Related Products') }}</h3>
            </div>

            <div dir="ltr"
                 class="swiper tf-swiper wrap-sw-over"
                 data-preview="{{ $perViewDesktop }}"
                 data-tablet="3"
                 data-mobile-sm="2"
                 data-mobile="2"
                 data-space-lg="30"
                 data-space-md="20"
                 data-space="10">
                <div class="swiper-wrapper">
                    @foreach ($relatedProducts as $product)
                        <div class="swiper-slide">
                            @include(Theme::getThemeNamespace('views.ecommerce.includes.product-item'))
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </section>
@endif
