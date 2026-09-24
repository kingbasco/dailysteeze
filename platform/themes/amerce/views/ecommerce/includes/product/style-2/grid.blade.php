@php
    /**
     * Style-2 grid card.
     * Full-bleed image with the action buttons overlaid on the image bottom
     * (revealed on hover); the info block (name, rating, price) sits below.
     *
     * Inputs: $product, $showQuickView, $showQuickShop
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

<div class="card-product_wrapper card-product-style-2__wrapper">
    <a href="{{ $product->url }}" class="product-img" aria-label="{{ $product->name }}">
        <img
            class="img-product"
            loading="lazy"
            width="330"
            height="440"
            src="{{ $primaryImage }}"
            alt="{{ $product->name }}"
        >
        @if ($hoverImage)
            <img
                class="img-hover"
                loading="lazy"
                width="330"
                height="440"
                src="{{ $hoverImage }}"
                alt="{{ $product->name }}"
            >
        @endif
    </a>

    @include(EcommerceHelper::viewPath('includes.product.badges'), ['product' => $product])
    @include(EcommerceHelper::viewPath('includes.product.countdown'), ['product' => $product])

    {{-- Action buttons live inside the positioned wrapper (matching styles 1/3/4/5).
         .product-action_list is position:absolute, so it must be contained by a
         positioned ancestor; the info block below is static, which let the buttons
         escape to the bottom of the page. --}}
    @include(EcommerceHelper::viewPath('includes.product.style-2.actions'), [
        'product' => $product,
        'showQuickView' => $showQuickView,
        'showQuickShop' => $showQuickShop,
    ])
</div>

<div class="card-product_info card-product-style-2__info card-slide-up">
    @include(Theme::getThemeNamespace('views.ecommerce.includes.product.store-name'), ['product' => $product])
    <a href="{{ $product->url }}" class="name-product lh-24 fw-medium link-underline-text text-line-clamp-2">
        {{ $product->name }}
    </a>

    @include(EcommerceHelper::viewPath('includes.product.style-2.rating'), ['product' => $product])
    @include(EcommerceHelper::viewPath('includes.product.style-2.price'), ['product' => $product])
</div>
