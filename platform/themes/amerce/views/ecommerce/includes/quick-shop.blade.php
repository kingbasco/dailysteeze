@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Ecommerce\Facades\EcommerceHelper;
    use Botble\Theme\Facades\Theme;

    $selectedAttrs = $selectedAttrs ?? [];
    $isOutOfStock = method_exists($product, 'isOutOfStock') ? $product->isOutOfStock() : false;
@endphp

<div class="bb-product-detail tf-product-quick_add tf-quick-prd_variant">
    <div class="product-mini-view d-flex gap-3 mb-12">
        <a href="{{ $product->url }}" class="prd-image">
            <img class="img-product"
                 width="80"
                 height="107"
                 loading="lazy"
                 src="{{ RvMedia::getImageUrl($product->image) }}"
                 alt="{{ $product->name }}">
        </a>
        <div class="prd-content">
            <a href="{{ $product->url }}"
               class="prd-name fw-medium link-underline link text-capitalize">
                {{ $product->name }}
            </a>
            <div class="price-wrap">
                @include(EcommerceHelper::viewPath('includes.product-price'), [
                    'product' => $product,
                    'priceClassName' => 'price-new text-primary fw-semibold price-on-sale',
                    'priceOriginalClassName' => 'price-old text-caption-01 cl-text-3',
                ])
            </div>
        </div>
    </div>

    <x-core::form
        :url="route('public.cart.add-to-cart')"
        method="POST"
        class="add-to-cart-form"
        data-bb-toggle="product-form"
    >
        <input type="hidden" name="id" value="{{ $product->getIdForCart() }}" />

        @if ($product->variations->isNotEmpty())
            {!! render_product_swatches($product, ['selected' => $selectedAttrs]) !!}
        @endif

        {!! render_product_options($product) !!}

        <div class="product-total-quantity mt-3">
            <p class="title">{{ __('Quantity:') }}</p>
            <div class="group-action">
                @include(Theme::getThemeNamespace('views.ecommerce.includes.cart-quantity'), [
                    'product' => $product,
                    'isOutOfStock' => $isOutOfStock,
                ])

                @if (EcommerceHelper::isCartEnabled())
                    <button type="submit"
                            name="add-to-cart"
                            @class(['btn-action-price tf-btn type-xl animate-btn w-100', 'btn-disabled' => $isOutOfStock])
                            @disabled($isOutOfStock)
                            data-action="add-to-cart"
                            {!! EcommerceHelper::jsAttributes('add-to-cart-in-form', $product) !!}>
                        {{ __('Add to Cart') }}
                    </button>
                @endif
            </div>

            @if (EcommerceHelper::isQuickBuyButtonEnabled())
                <button type="submit"
                        name="checkout"
                        value="1"
                        @class(['tf-btn type-xl btn-primary animate-btn w-100', 'btn-disabled' => $isOutOfStock])
                        @disabled($isOutOfStock)>
                    {{ __('Buy It Now') }}
                </button>
            @endif
        </div>
    </x-core::form>
</div>
