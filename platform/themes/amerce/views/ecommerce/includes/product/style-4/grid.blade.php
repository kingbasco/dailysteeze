@php
    /**
     * Style-4 grid card — 3D flip.
     * Two faces inside a `flip-inner`. Front: image. Back: name/price/actions.
     * CSS handles `transform: rotateY(180deg)` on hover.
     */
    use Botble\Media\Facades\RvMedia;

    $showQuickView = $showQuickView ?? true;
    $showQuickShop = $showQuickShop ?? true;

    $primaryImage = RvMedia::getImageUrl($product->image, 'product-grid', false, RvMedia::getDefaultImage());
    $hoverImage = null;
    if (! empty($product->images) && is_iterable($product->images)) {
        foreach ($product->images as $img) {
            if (! is_string($img) || trim($img) === '' || $img === $product->image) {
                continue;
            }
            $hoverImage = RvMedia::getImageUrl($img, 'product-grid', false, null);
            if ($hoverImage) {
                break;
            }
        }
    }
@endphp

<div class="card-product_wrapper card-product-style-4__wrapper flip-card">
    <div class="flip-inner">
        <div class="flip-front">
            <a href="{{ $product->url }}" class="product-img" aria-label="{{ $product->name }}">
                <img
                    class="img-product"
                    loading="lazy"
                    width="330"
                    height="440"
                    src="{{ $primaryImage }}"
                    alt="{{ $product->name }}"
                >
            </a>

            @include(EcommerceHelper::viewPath('includes.product.badges'), ['product' => $product])
            @include(EcommerceHelper::viewPath('includes.product.countdown'), ['product' => $product])
        </div>

        <div class="flip-back">
            @if ($hoverImage)
                <img
                    class="flip-back__bg"
                    loading="lazy"
                    width="330"
                    height="440"
                    src="{{ $hoverImage }}"
                    alt="{{ $product->name }}"
                >
            @endif

            <div class="flip-back__content">
                @include(Theme::getThemeNamespace('views.ecommerce.includes.product.store-name'), ['product' => $product])
                <a href="{{ $product->url }}" class="name-product lh-24 fw-medium link-underline-text text-line-clamp-2">
                    {{ $product->name }}
                </a>

                @include(EcommerceHelper::viewPath('includes.product.style-4.rating'), ['product' => $product])
                @include(EcommerceHelper::viewPath('includes.product.style-4.price'), ['product' => $product])

                @include(EcommerceHelper::viewPath('includes.product.style-4.actions'), [
                    'product' => $product,
                    'showQuickView' => $showQuickView,
                    'showQuickShop' => $showQuickShop,
                ])
            </div>
        </div>
    </div>
</div>
