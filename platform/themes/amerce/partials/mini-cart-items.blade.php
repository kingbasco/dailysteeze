@php
    use Botble\Ecommerce\Facades\Cart;
    use Botble\Ecommerce\Facades\EcommerceHelper;
    use Botble\Media\Facades\RvMedia;
    use Illuminate\Support\Arr;

    $cartContent = $cartContent ?? Cart::instance('cart')->content();
    $cartUpdateUrl = route('public.cart.update');
    // Load product models in one batch so we can render sale + original price
    // (mirrors shofy/partials/mini-cart/content.blade.php).
    $cartProducts = Cart::instance('cart')->products();
@endphp

@if ($cartContent->isEmpty())
    {{-- Empty state — script.js (D::s) hides this when sibling .tf-mini-cart-item children exist. --}}
    <div class="box-text_empty type-shop_cart">
        <div class="shop-empty_top">
            <span class="icon">
                <i class="icon-Handbag"></i>
            </span>
            <h4 class="text-emp">{{ __('Your cart is empty') }}</h4>
            <p class="cl-text-2">{{ __('Your cart is currently empty. Let us assist you in finding the right product.') }}</p>
        </div>
        <div class="shop-empty_bot">
            <a href="{{ route('public.products') }}" class="tf-btn animate-btn">{{ __('Shopping') }}</a>
            <a href="{{ url('/') }}" class="tf-btn btn-stroke">{{ __('Back to home') }}</a>
        </div>
    </div>
@endif

@foreach ($cartContent as $cartItem)
    @php
        $product = $cartProducts->find($cartItem->id);
        $productImage = Arr::get($cartItem->options, 'image');
        $productUrl   = $product?->original_product?->url ?: Arr::get($cartItem->options, 'url', '#');
        $optionAttrs  = Arr::get($cartItem->options, 'attributes');
    @endphp
    {{-- NOT using `.file-delete` — that class triggers main.js mock-delete handler.
         The X button below uses the plugin's `data-bb-toggle="remove-from-cart"`
         for a real AJAX remove, then `ecommerce.cart.removed` cleans the row. --}}
    <div class="tf-mini-cart-item" data-cart-row="{{ $cartItem->rowId }}">
        <a href="{{ $productUrl }}" class="tf-mini-cart-image d-block">
            <img
                loading="lazy"
                width="100"
                height="133"
                src="{{ RvMedia::getImageUrl($productImage, 'thumb', false, RvMedia::getDefaultImage()) }}"
                alt="{{ $cartItem->name }}">
        </a>

        <div class="tf-mini-cart-info">
            <a href="{{ $productUrl }}" class="name fw-medium link text-line-clamp-2">
                {{ $cartItem->name }}
            </a>

            {{-- Inline quantity widget — POSTs to public.cart.update on change.
                 Self-contained handlers in main.js (look for "mini-cart-qty"). --}}
            <div class="wg-quantity wg-quantity--mini mt-2"
                 data-cart-row-id="{{ $cartItem->rowId }}"
                 data-cart-update-url="{{ $cartUpdateUrl }}"
                 data-line-price="{{ (float) $cartItem->price }}">
                <button type="button"
                        class="btn-quantity btn-decrease"
                        data-bb-toggle="mini-cart-qty-down"
                        aria-label="{{ __('Decrease quantity') }}">
                    <i class="icon icon-minus"></i>
                </button>
                <input class="quantity-product"
                       type="number"
                       value="{{ (int) $cartItem->qty }}"
                       min="1"
                       step="1"
                       data-bb-toggle="mini-cart-qty">
                <button type="button"
                        class="btn-quantity btn-increase"
                        data-bb-toggle="mini-cart-qty-up"
                        aria-label="{{ __('Increase quantity') }}">
                    <i class="icon icon-plus"></i>
                </button>
            </div>

            <div class="tf-mini-cart-line-price mt-2" data-mini-cart-line-total>
                @if ($product)
                    @include(EcommerceHelper::viewPath('includes.product-price'), [
                        'product' => $product,
                        'priceWrapperClassName' => 'd-flex align-items-baseline gap-2',
                        'priceClassName' => 'price-new fw-semibold text-primary',
                        'priceOriginalWrapperClassName' => '',
                        'priceOriginalClassName' => 'price-old text-caption-01 cl-text-2 text-decoration-line-through',
                        'priceFormatted' => format_price($cartItem->price * $cartItem->qty),
                    ])
                @else
                    <span class="price-new fw-semibold text-primary">
                        {{ format_price($cartItem->price * $cartItem->qty) }}
                    </span>
                @endif
            </div>

            @if (! empty($optionAttrs))
                <div class="text-caption-01 cl-text-2 mt-1">{{ $optionAttrs }}</div>
            @endif
        </div>

        {{-- Close (X) — replaces the previous "Remove" link. Uses the plugin's
             standard data-bb-toggle so the AJAX remove fires; ecommerce.cart.removed
             listener (main.js) then removes this row visually. --}}
        <a
            href="{{ route('public.cart.remove', $cartItem->rowId) }}"
            class="tf-mini-cart-del mini-cart-remove"
            title="{{ __('Remove this item') }}"
            aria-label="{{ __('Remove item') }}"
            data-bb-toggle="remove-from-cart"
            data-row-id="{{ $cartItem->rowId }}"
        >
            <i class="icon icon-X2"></i>
        </a>
    </div>
@endforeach
