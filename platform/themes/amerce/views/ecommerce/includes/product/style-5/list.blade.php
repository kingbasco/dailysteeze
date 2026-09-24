@php
    use Botble\Media\Facades\RvMedia;

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

<div class="card-product__layout card-product-style-5__layout product-style_list d-flex">
    <div class="card-product_wrapper">
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
    </div>

    <div class="card-product_info">
        @include(Theme::getThemeNamespace('views.ecommerce.includes.product.store-name'), ['product' => $product])
        <a href="{{ $product->url }}" class="name-product lh-24 fw-medium link-underline-text text-line-clamp-2">
            {{ $product->name }}
        </a>

        @include(EcommerceHelper::viewPath('includes.product.style-5.rating'), ['product' => $product])
        @include(EcommerceHelper::viewPath('includes.product.style-5.price'), ['product' => $product])

        @if ($product->description)
            <p class="description text-caption-01 mb-10 text-line-clamp-3">
                {{ \Illuminate\Support\Str::limit(strip_tags($product->description), 220) }}
            </p>
        @endif

        @include(EcommerceHelper::viewPath('includes.product.style-5.actions'), [
            'product' => $product,
            'showQuickView' => true,
            'showQuickShop' => false,
        ])
    </div>
</div>
