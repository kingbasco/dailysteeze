@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Ecommerce\Facades\Cart;
    use Botble\Ecommerce\Facades\EcommerceHelper;
    use Botble\Media\Facades\RvMedia;
@endphp

@if (is_plugin_active('ecommerce'))
@php
    $cartContent = Cart::instance('cart')->content();
    $cartCount = Cart::instance('cart')->count();
    $cartSubtotal = (float) Cart::instance('cart')->rawSubTotal();
    $cartTax = (float) Cart::instance('cart')->rawTax();
    $cartTotal = (float) Cart::instance('cart')->rawTotal();
    $taxEnabled = EcommerceHelper::isTaxEnabled();
    $showRecommendations = (bool) theme_option('mini_cart_show_recommendations', true);
    $freeshipThreshold = (float) theme_option('mini_cart_freeship_threshold', 100);
    $freeshipRemaining = max(0, $freeshipThreshold - $cartSubtotal);
    $freeshipProgress = $freeshipThreshold > 0
        ? min(100, round(($cartSubtotal / $freeshipThreshold) * 100, 2))
        : 0;
    $freeshipUnlocked = $freeshipThreshold > 0 && $cartSubtotal >= $freeshipThreshold;
@endphp

<div class="offcanvas offcanvas-end popup-shopping-cart" id="shoppingCart" tabindex="-1" aria-labelledby="shoppingCartLabel">
    @if ($showRecommendations)
        {{-- Recommendations slot — ecommerce.js fetches and hydrates the body lazily. --}}
        <div class="tf-minicart-recommendations file-delete" data-minicart-recommendations hidden>
            <div class="title d-flex justify-content-between align-items-center">
                <h5 id="shoppingCartLabel">{{ __('You Might Like') }}</h5>
                <i class="icon icon-X2 link remove fs-24 cs-pointer"></i>
            </div>
            <div class="wrap-recommendations">
                <div class="list-cart" data-minicart-recommendations-slot></div>
            </div>
        </div>
    @endif

    <div class="canvas-wrapper">
        <div class="popup-header">
            <div class="d-flex align-items-center justify-content-between mb-12">
                <h5 class="title">{{ __('Shopping Cart') }}</h5>
                <span class="icon-X2 icon-close-popup" data-bs-dismiss="offcanvas" aria-label="{{ __('Close') }}"></span>
            </div>
            @if ($freeshipThreshold > 0)
                <div class="cart-threshold"
                     data-cart-threshold="{{ $freeshipThreshold }}"
                     @if ($freeshipUnlocked) data-freeship-unlocked @endif>
                    <p class="text" data-cart-threshold-text>
                        @if ($freeshipUnlocked)
                            {{ __('🎉 You qualify for free shipping!') }}
                        @else
                            {!! BaseHelper::clean(__('Buy :amount more to get free shipping', [
                                'amount' => '<span class="text-primary fw-7" data-freeship-remaining>' . format_price($freeshipRemaining) . '</span>',
                            ])) !!}
                        @endif
                    </p>
                    <div class="tf-progress-bar tf-progress-ship">
                        <div class="value"
                             style="width: {{ $freeshipProgress }}%"
                             data-progress="{{ $freeshipProgress }}"></div>
                    </div>
                </div>
            @endif
        </div>

        <div class="wrap">
            {{-- `.list-file-delete` removed deliberately: it bound the theme's
                 mock-delete + total-recalc helpers (main.js, deleteFile()), which
                 zero out the subtotal because they expect the legacy markup. --}}
            <div class="tf-mini-cart-wrap wrap-empty_text">
                <div class="tf-mini-cart-main">
                    <div class="tf-mini-cart-sroll">
                        <div
                            class="tf-mini-cart-items list-empty"
                            id="mini-cart-content"
                            data-mini-cart-slot
                        >
                            {!! Theme::partial('mini-cart-items', ['cartContent' => $cartContent]) !!}
                        </div>
                    </div>
                </div>

                <div class="tf-mini-cart-bottom box-empty_clear" data-cart-bottom @if ($cartCount === 0) hidden @endif>
                    <div class="tf-mini-cart-bottom-wrap">
                        @php
                            // Persist the effective tax rate for JS so Tax/Total can
                            // live-update from the next subtotal without a re-render.
                            $taxRate = ($taxEnabled && $cartSubtotal > 0) ? round($cartTax / $cartSubtotal, 6) : 0;
                        @endphp
                        <div class="tf-mini-cart-totals"
                             data-tax-enabled="{{ $taxEnabled ? '1' : '0' }}"
                             data-tax-rate="{{ $taxRate }}">
                            {{-- NB: do NOT add the legacy `.tf-totals-total-value` class
                                 here — main.js's deleteFile/updateTotalPrice helper writes
                                 "$0.00" to anything matching that selector when the
                                 mini-cart's quantity input fires an `input` event. We
                                 update the value via the [data-cart-subtotal] hook instead. --}}
                            <div class="tf-mini-cart-total-row">
                                <span class="label">{{ __('Subtotal:') }}</span>
                                <span class="value" data-cart-subtotal>
                                    {{ format_price($cartSubtotal) }}
                                </span>
                            </div>
                            @if ($taxEnabled)
                                {{-- Tax row hidden when amount is 0 to avoid noise.
                                     `data-cart-tax-row` lets JS toggle visibility on
                                     cart updates without re-rendering the panel. --}}
                                <div class="tf-mini-cart-total-row"
                                     data-cart-tax-row
                                     @if ($cartTax <= 0) hidden @endif>
                                    <span class="label">{{ __('Tax:') }}</span>
                                    <span class="value" data-cart-tax>{{ format_price($cartTax) }}</span>
                                </div>
                                <div class="tf-mini-cart-total-row tf-mini-cart-total-row--grand">
                                    <span class="label">{{ __('Total:') }}</span>
                                    <span class="value" data-cart-total>{{ format_price($cartTotal) }}</span>
                                </div>
                            @endif
                        </div>
                        @php
                            $checkoutToken = session('tracked_start_checkout');
                            $checkoutUrl = $checkoutToken
                                ? route('public.checkout.information', $checkoutToken)
                                : route('public.cart');
                        @endphp
                        <div class="tf-mini-cart-view-checkout">
                            <a href="{{ $checkoutUrl }}" class="tf-btn animate-btn w-100">{{ __('Checkout') }}</a>
                            <a href="{{ route('public.cart') }}" class="tf-btn btn-stroke w-100">{{ __('View Cart') }}</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endif
