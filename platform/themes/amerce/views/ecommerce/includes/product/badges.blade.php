@php
    /**
     * Single product badge — shop card shows ONE pill at a time.
     * Priority: Sold out > Sale (-N%) > New > Featured.
     * Uses .product-badge_item modifier classes (.sale, .new, .trend) so the
     * theme's existing CSS handles colours; no Tabler bg-* classes needed here.
     *
     * Input: $product
     */
    use Botble\Base\Facades\BaseHelper;

    $isOnSale = $product->front_sale_price !== null
        && $product->price > 0
        && (float) $product->front_sale_price < (float) $product->price;

    $discountPercentage = $isOnSale
        ? (int) round((1 - ((float) $product->front_sale_price / (float) $product->price)) * 100)
        : 0;

    $isNew = method_exists($product, 'isNew') ? $product->isNew(30) : false;
    $isFeatured = (bool) ($product->is_featured ?? false);
    $isOutOfStock = method_exists($product, 'isOutOfStock') ? $product->isOutOfStock() : false;

    [$badgeClass, $badgeLabel] = match (true) {
        $isOutOfStock         => ['sale',  __('Sold out')],
        $isOnSale && $discountPercentage > 0 => ['sale',  '-' . $discountPercentage . '%'],
        $isOnSale             => ['sale',  __('Sale')],
        $isNew                => ['new',   __('New')],
        $isFeatured           => ['trend', __('Featured')],
        default               => [null,    null],
    };
@endphp

@if ($badgeClass !== null)
    <ul class="product-badge_list card-badges">
        <li class="product-badge_item text-caption-01 {{ $badgeClass }}">
            {!! BaseHelper::clean($badgeLabel) !!}
        </li>
    </ul>
@endif
