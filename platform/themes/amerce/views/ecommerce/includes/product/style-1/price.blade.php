@php
    /**
     * Style-1 price facet — shop card.
     * Renders `.price-wrap > .price-new (+ .price-old when on sale)` to match
     * the demo. Currency + tax-inclusive amounts come from the plugin's price
     * helpers so storefront currency switching keeps working.
     *
     * Input: $product
     */
    use Botble\Ecommerce\Facades\EcommerceHelper;

    $shouldShowPrice =
        (! EcommerceHelper::hideProductPrice() || EcommerceHelper::isCartEnabled())
        && (! EcommerceHelper::hideProductPriceWhenZero() || (float) $product->price > 0);

    if (! $shouldShowPrice) {
        return;
    }

    $currentPrice = $product->front_sale_price_with_taxes ?? $product->price_with_taxes ?? $product->price;
    $originalPrice = $product->price_with_taxes ?? $product->price;
    $isOnSale = $product->front_sale_price !== null
        && $product->price > 0
        && (float) $product->front_sale_price < (float) $product->price;
@endphp

<div class="price-wrap card-product__price">
    <span class="price-new text-primary fw-semibold">
        {{ format_price($currentPrice) }}
    </span>
    @if ($isOnSale)
        <span class="price-old text-caption-01 cl-text-3">
            {{ format_price($originalPrice) }}
        </span>
    @endif
</div>
