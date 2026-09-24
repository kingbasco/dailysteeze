@php
    use Botble\Ecommerce\Facades\Cart;
    use Botble\Ecommerce\Facades\EcommerceHelper;
    use Botble\Ecommerce\Facades\OrderHelper;

    $cartCount  = Cart::instance('cart')->count();
    $rawSubTotal = Cart::instance('cart')->rawSubTotal();
    $rawTax      = EcommerceHelper::isTaxEnabled() ? Cart::instance('cart')->rawTax() : 0;
    $grandTotal  = max(0, $rawSubTotal + $rawTax);
@endphp

@if ($cartCount > 0)
    <div class="mini-cart__footer border-top px-3 py-3">
        <div class="d-flex justify-content-between align-items-center mb-2">
            <span class="fw-medium">{{ __('Subtotal') }}</span>
            <span class="fw-semibold text-primary" data-cart-subtotal>
                {{ format_price($rawSubTotal) }}
            </span>
        </div>

        @if (EcommerceHelper::isTaxEnabled())
            <div class="d-flex justify-content-between align-items-center mb-2">
                <span class="text-caption-01 cl-text-2">{{ __('Tax') }}</span>
                <span class="text-caption-01">{{ format_price($rawTax) }}</span>
            </div>
        @endif

        <div class="d-flex justify-content-between align-items-center mb-3">
            <span class="fw-semibold">{{ __('Total') }}</span>
            <span class="fw-semibold text-primary" data-cart-total>
                {{ format_price($grandTotal) }}
            </span>
        </div>

        <p class="text-caption-01 cl-text-2 mb-3">
            {{ __('Shipping and discounts are calculated at checkout.') }}
        </p>

        <div class="mini-cart__actions d-grid gap-2">
            <a href="{{ route('public.cart') }}" class="tf-btn btn-line w-100 animate-btn">
                <span class="fw-semibold">{{ __('View cart') }}</span>
            </a>
            <a
                href="{{ route('public.checkout.information', OrderHelper::getOrderSessionToken()) }}"
                class="tf-btn w-100 animate-btn">
                <span class="fw-semibold">{{ __('Checkout') }}</span>
            </a>
        </div>
    </div>
@endif
