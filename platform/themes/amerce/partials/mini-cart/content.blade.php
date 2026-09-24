@php
    use Botble\Ecommerce\Facades\Cart;
    use Botble\Ecommerce\Facades\EcommerceHelper;
    use Botble\Media\Facades\RvMedia;

    $cartContent = Cart::instance('cart')->content();
    $cartCount   = Cart::instance('cart')->count();
@endphp

<div class="mini-cart__content px-3 py-2">
    @if ($cartCount === 0)
        <div class="text-center py-5">
            <span class="icon icon-Bag fs-1 mb-3 d-inline-block" aria-hidden="true"></span>
            <p class="cl-text-2 mb-3">{{ __('Your cart is empty.') }}</p>
            <a href="{{ route('public.products') }}" class="tf-btn animate-btn">
                {{ __('Continue shopping') }}
            </a>
        </div>
    @else
        <ul class="mini-cart__items list-unstyled m-0 p-0">
            @foreach ($cartContent as $cartItem)
                @php
                    $product      = isset($products) ? $products->firstWhere('id', $cartItem->id) : null;
                    $productImage = $cartItem->options['image'] ?? ($product?->image);
                    $productUrl   = $product?->url ?: '#';
                @endphp
                <li class="mini-cart__item d-flex gap-3 py-3 border-bottom" data-cart-row="{{ $cartItem->rowId }}">
                    <a href="{{ $productUrl }}" class="mini-cart__thumb flex-shrink-0">
                        <img
                            loading="lazy"
                            width="80"
                            height="100"
                            src="{{ RvMedia::getImageUrl($productImage, 'thumb', false, RvMedia::getDefaultImage()) }}"
                            alt="{{ $cartItem->name }}">
                    </a>

                    <div class="mini-cart__body flex-grow-1">
                        <a href="{{ $productUrl }}" class="mini-cart__name fw-medium link lh-24 d-block">
                            {{ $cartItem->name }}
                        </a>

                        @include(EcommerceHelper::viewPath('includes.cart-item-options-extras'), [
                            'cartItem' => $cartItem,
                            'options'  => $cartItem->options,
                        ])

                        <div class="mini-cart__qty-price d-flex justify-content-between align-items-center mt-2">
                            <span class="text-caption-01 cl-text-2">
                                {{ $cartItem->qty }} &times; {{ format_price($cartItem->price) }}
                            </span>
                            <span class="fw-semibold text-primary">
                                {{ format_price($cartItem->price * $cartItem->qty) }}
                            </span>
                        </div>
                    </div>

                    <a
                        href="{{ route('public.cart.remove', $cartItem->rowId) }}"
                        class="mini-cart__remove flex-shrink-0"
                        data-action="cart-remove"
                        data-row-id="{{ $cartItem->rowId }}"
                        aria-label="{{ __('Remove item') }}">
                        <i class="icon icon-X2" aria-hidden="true"></i>
                    </a>
                </li>
            @endforeach
        </ul>
    @endif
</div>
