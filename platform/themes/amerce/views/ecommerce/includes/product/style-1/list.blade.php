@php
    /**
     * Style-1 list card — wide row layout for shop list view.
     * Image left (with badges + sale marquee + countdown), info right
     * (name, rating, price, description, swatch preview, action row).
     *
     * Inputs:
     *   $product       \Botble\Ecommerce\Models\Product
     *   $showQuickView bool
     *   $showQuickShop bool
     */
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

    $isOnSale = $product->front_sale_price !== null
        && $product->price > 0
        && (float) $product->front_sale_price < (float) $product->price;
    $salePercent = $isOnSale
        ? (int) round((1 - ((float) $product->front_sale_price / (float) $product->price)) * 100)
        : 0;
@endphp

<div class="card-product__layout product-style_list d-flex">
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

        @if ($isOnSale && $salePercent > 0)
            <div class="product-marquee_sale">
                <div class="marquee-wrapper">
                    <div class="initial-child-container">
                        @for ($m = 1; $m <= 5; $m++)
                            <div class="marquee-child-item">{{ __('HOT SALE :percent% OFF', ['percent' => $salePercent]) }}</div>
                            <i class="icon icon-Star2"></i>
                        @endfor
                    </div>
                </div>
            </div>
        @endif
    </div>

    <div class="card-product_info">
        @include(Theme::getThemeNamespace('views.ecommerce.includes.product.store-name'), ['product' => $product])
        <a href="{{ $product->url }}" class="name-product lh-24 fw-medium link-underline-text text-line-clamp-2">
            {{ $product->name }}
        </a>

        @include(EcommerceHelper::viewPath('includes.product.style-1.rating'), ['product' => $product])
        @include(EcommerceHelper::viewPath('includes.product.style-1.price'), ['product' => $product])

        @if ($product->description)
            <p class="description text-caption-01 text-line-clamp-3 mb-0">
                {{ \Illuminate\Support\Str::limit(strip_tags($product->description), 220) }}
            </p>
        @endif

        @include(EcommerceHelper::viewPath('includes.product.style-1.actions'), [
            'product' => $product,
            'showQuickView' => true,
            'showQuickShop' => false,
        ])
    </div>
</div>
