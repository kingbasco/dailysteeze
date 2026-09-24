@php
    /**
     * Style-1 small card — compact line item used in cart cross-sells,
     * recently-viewed strips, mini-cart recommendations.
     *
     * Inputs:
     *   $product
     *   $qty (optional, displayed when truthy)
     */
    use Botble\Media\Facades\RvMedia;

    $primaryImage = RvMedia::getImageUrl($product->image, 'thumb', false, RvMedia::getDefaultImage());
    $qty = $qty ?? null;
@endphp

<div class="card-product__layout list-cart-item">
    <a href="{{ $product->url }}" class="image" aria-label="{{ $product->name }}">
        <img
            loading="lazy"
            width="80"
            height="106"
            src="{{ $primaryImage }}"
            alt="{{ $product->name }}"
        >
    </a>

    <div class="content">
        @include(Theme::getThemeNamespace('views.ecommerce.includes.product.store-name'), ['product' => $product])
        <a class="name fw-medium link text-line-clamp-1" href="{{ $product->url }}">
            {{ $product->name }}
        </a>

        @include(EcommerceHelper::viewPath('includes.product.style-1.price'), ['product' => $product])

        @if ($qty)
            <span class="qty text-caption-01 cl-text-3">
                {{ __('Qty: :qty', ['qty' => (int) $qty]) }}
            </span>
        @endif
    </div>
</div>
