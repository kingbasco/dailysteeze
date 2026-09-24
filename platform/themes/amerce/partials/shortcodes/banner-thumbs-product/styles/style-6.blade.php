@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Ecommerce\Facades\EcommerceHelper;
    use Botble\Ecommerce\Facades\FlashSale;
    use Botble\Theme\Facades\Theme;

    /**
     * Mirrors html/home-garden.html "Banner Product Single" (lines 2858-3118).
     * This is essentially a PDP (Product Detail Page) snippet rendered as a
     * homepage banner.
     *
     * It pulls the first product from $products and renders:
     * - LEFT (col-lg-7): Product gallery with vertical thumbnails.
     * - RIGHT (col-lg-5): Product info (title, rating, price, description, variants, cart actions).
     */
    $product = $products->first();
@endphp

@if ($product)
    @php
        $flashSale = null;
        if (FlashSale::isEnabled()) {
            $flashSale = FlashSale::getFlashSaleForProduct($product);
        }

        $isOutOfStock      = method_exists($product, 'isOutOfStock') ? $product->isOutOfStock() : false;
        $isPreOrder        = (bool) ($product->is_pre_order ?? false);
        $hasCustomerNote   = (bool) ($product->customer_note_enabled ?? false);
        $hasVolumeDiscount = (bool) ($product->enable_volume_discount ?? false);
        $hasBuyXGetY       = (bool) ($product->enable_buy_x_get_y ?? false);
        $hasBundleTogether = (bool) ($product->frequently_bought_together ?? false);
    @endphp

    <section {!! $shortcode->htmlAttributes() !!} class="banner-product-single style-6 section-image-zoom flat-spacing-8">
        <div class="container">
            <div class="row">
                <div class="col-lg-7">
                    {{-- row_left gallery layout rules live in
                         assets/sass/component/_inline-migrated.scss. --}}
                    <div class="row_left_wrapper">
                        @include(Theme::getThemeNamespace('views.ecommerce.includes.product-gallery-right-thumbnail'), [
                            'product' => $product,
                        ])
                    </div>
                    {{-- The `row_left` class is added by assets/js/main.js
                         → bannerThumbsStyle6() on DOM ready. --}}
                </div>
                <div class="col-lg-5">
                    @include(Theme::getThemeNamespace('views.ecommerce.includes.product-detail'), [
                        'product'           => $product,
                        'flashSale'         => $flashSale,
                        'isOutOfStock'      => $isOutOfStock,
                        'isPreOrder'        => $isPreOrder,
                        'hasCustomerNote'   => $hasCustomerNote,
                        'hasVolumeDiscount' => $hasVolumeDiscount,
                        'hasBuyXGetY'       => $hasBuyXGetY,
                        'hasBundleTogether' => $hasBundleTogether,
                    ])
                </div>
            </div>
        </div>
    </section>

@endif
