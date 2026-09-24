@php
    /**
     * Style-5 grid card — icon spread.
     * Action icons sit in the centre of the image area and fan outwards on hover.
     * Image stays static; only the actions list is animated by CSS.
     */
    use Botble\Media\Facades\RvMedia;

    $showQuickView = $showQuickView ?? true;
    $showQuickShop = $showQuickShop ?? true;

    // Style-5 cards are always square (demo: `card-product_wrapper square`),
    // so use the square `thumb` size — not the 4:5 `product-grid` crop.
    $primaryImage = RvMedia::getImageUrl($product->image, 'thumb', false, RvMedia::getDefaultImage());
    $hoverImage = null;
    if (! empty($product->images) && is_iterable($product->images)) {
        foreach ($product->images as $img) {
            if (! is_string($img) || trim($img) === '' || $img === $product->image) {
                continue;
            }
            $hoverImage = RvMedia::getImageUrl($img, 'thumb', false, null);
            if ($hoverImage) {
                break;
            }
        }
    }
@endphp

<div class="card-product_wrapper card-product-style-5__wrapper square">
    <a href="{{ $product->url }}" class="product-img" aria-label="{{ $product->name }}">
        <img
            class="img-product"
            loading="lazy"
            width="330"
            height="330"
            src="{{ $primaryImage }}"
            alt="{{ $product->name }}"
        >
        @if ($hoverImage)
            <img
                class="img-hover"
                loading="lazy"
                width="330"
                height="330"
                src="{{ $hoverImage }}"
                alt="{{ $product->name }}"
            >
        @endif
    </a>

    <div class="card-product-style-5__spread-zone">
        @include(EcommerceHelper::viewPath('includes.product.style-5.actions'), [
            'product' => $product,
            'showQuickView' => $showQuickView,
            'showQuickShop' => $showQuickShop,
        ])
    </div>

    @include(EcommerceHelper::viewPath('includes.product.badges'), ['product' => $product])
    @include(EcommerceHelper::viewPath('includes.product.countdown'), ['product' => $product])
</div>

<div class="card-product_info">
    @include(Theme::getThemeNamespace('views.ecommerce.includes.product.store-name'), ['product' => $product])
    <a href="{{ $product->url }}" class="name-product lh-24 fw-medium link-underline-text text-line-clamp-2">
        {{ $product->name }}
    </a>

    @include(EcommerceHelper::viewPath('includes.product.style-5.rating'), ['product' => $product])
    @include(EcommerceHelper::viewPath('includes.product.style-5.price'), ['product' => $product])
</div>
