@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Ecommerce\Facades\Cart;
    use Botble\Ecommerce\Facades\EcommerceHelper;
    use Botble\Ecommerce\Facades\OrderHelper;
    use Botble\Theme\Facades\Theme;

    Theme::layout('full-width');
    Theme::set('pageTitle', __('Shopping cart'));
    Theme::set('hideBreadcrumb', true);

    $cartContent = Cart::instance('cart')->content();
    $cartCount   = Cart::instance('cart')->count();

    $rawSubTotal       = Cart::instance('cart')->rawSubTotal();
    $rawTax            = EcommerceHelper::isTaxEnabled() ? Cart::instance('cart')->rawTax() : 0;
    $rawTotal          = Cart::instance('cart')->rawTotal();
    $couponDiscount    = $couponDiscountAmount    ?? 0;
    $promotionDiscount = $promotionDiscountAmount ?? 0;
    $totalDiscount     = $couponDiscount + $promotionDiscount;
    $grandTotal        = max(0, $rawTotal - $totalDiscount);
    $appliedCoupon     = session('applied_coupon_code');
@endphp

{{-- Wrapper for AJAX replacement after qty/coupon/remove updates.
     `data.cart_content` from PublicCartController::getDataForResponse re-renders
     this whole blade — JS swaps this div with the new HTML so totals can never
     drift out of sync. --}}
<div data-cart-page-area>
<section class="section-page-title text-center flat-spacing-2 pb-0">
    <div class="container">
        <div class="main-page-title">
            <h3 class="letter-space-0">{{ __('Shopping cart') }}</h3>
            <p class="text-body-1 cl-text-2">
                {{ __('Review your selected items, update quantities, and get ready for a smooth and easy checkout experience.') }}
            </p>
        </div>
    </div>
</section>

<section class="section-shoping-cart flat-spacing-2 pb-0">
    @if ($cartCount === 0 || ! isset($products) || $products->isEmpty())
        <div class="container">
            <div class="empty-state text-center py-5">
                <span class="icon icon-Bag fs-1 mb-3 d-inline-block" aria-hidden="true"></span>
                <h4 class="mb-3">{{ __('Your cart is empty') }}</h4>
                <p class="cl-text-2 mb-3">
                    {{ __('Looks like you have not added anything to your cart yet.') }}
                </p>
                <a href="{{ route('public.products') }}" class="tf-btn animate-btn">
                    {{ __('Continue shopping') }}
                </a>
            </div>
        </div>
    @else
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    @if (session('success_msg'))
                        <div class="alert alert-success mb-3" role="alert">{{ session('success_msg') }}</div>
                    @endif
                    @if (session('error_msg'))
                        <div class="alert alert-danger mb-3" role="alert">{{ session('error_msg') }}</div>
                    @endif

                    {{-- Update form: row hidden inputs (`items[<key>][rowId]`) and the
                         qty inputs from cart-quantity.blade.php (`name="items[<key>][values][qty]"`)
                         POST together to public.cart.update. The plugin also wires
                         `data-bb-toggle="update-cart"` on each input for inline AJAX updates. --}}
                    <x-core::form
                        method="post"
                        :url="route('public.cart.update')"
                        class="form-shop-cart cart-form"
                        data-cart-form>
                        <div class="overflow-auto">
                            <table class="tf-table-page-cart">
                                <thead>
                                    <tr>
                                        <th><p class="h6 fw-medium">{{ __('Product') }}</p></th>
                                        <th><p class="h6 fw-medium">{{ __('Price') }}</p></th>
                                        <th><p class="h6 fw-medium">{{ __('Quantity') }}</p></th>
                                        <th><p class="h6 fw-medium">{{ __('Total') }}</p></th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($cartContent as $key => $cartItem)
                                        @php($product = $products->find($cartItem->id))

                                        @continue(empty($product))

                                        <tr class="tf-cart_item"
                                            data-cart-row="{{ $cartItem->rowId }}"
                                            data-line-price="{{ (float) $cartItem->price }}">
                                            <td class="cart_product" data-cart-title="{{ __('Product') }}">
                                                {!! apply_filters('ecommerce_cart_before_item_content', null, $cartItem) !!}

                                                <a href="{{ $product->original_product->url }}" class="img-prd">
                                                    {{ RvMedia::image(
                                                        $cartItem->options['image'] ?? $product->original_product->image,
                                                        $product->original_product->name,
                                                        'thumb'
                                                    ) }}
                                                </a>
                                                <div class="infor-prd">
                                                    <input type="hidden" name="items[{{ $key }}][rowId]" value="{{ $cartItem->rowId }}">

                                                    <a href="{{ $product->original_product->url }}" class="prd_name fw-medium link lh-24">
                                                        {{ $product->original_product->name }}
                                                    </a>

                                                    <div class="text-caption-01 cl-text-2 mt-1">
                                                        {!! BaseHelper::clean($product->stock_status_html) !!}
                                                    </div>

                                                    @if (is_plugin_active('marketplace') && $product->original_product->store?->id)
                                                        <div class="text-caption-01 cl-text-2 mt-1">
                                                            <span>{{ __('Vendor:') }}</span>
                                                            <a href="{{ $product->original_product->store->url }}" class="fw-medium link">
                                                                {{ $product->original_product->store->name }}
                                                            </a>
                                                        </div>
                                                    @endif

                                                    @if (! empty($cartItem->options['attributes']))
                                                        <div class="text-caption-01 cl-text-2 mt-1">
                                                            {{ $cartItem->options['attributes'] }}
                                                        </div>
                                                    @endif

                                                    @if (EcommerceHelper::isEnabledProductOptions() && ! empty($cartItem->options['options']))
                                                        {!! render_product_options_html($cartItem->options['options'], $product->price()->getPrice()) !!}
                                                    @endif

                                                    @include(
                                                        EcommerceHelper::viewPath('includes.cart-item-options-extras'),
                                                        ['options' => $cartItem->options]
                                                    )

                                                    {!! apply_filters('ecommerce_cart_after_item_content', null, $cartItem) !!}
                                                </div>
                                            </td>
                                            <td class="cart_price" data-cart-title="{{ __('Price') }}">
                                                @include(EcommerceHelper::viewPath('includes.product-price'), [
                                                    'product' => $product,
                                                    'priceWrapperClassName' => 'd-flex flex-column gap-1',
                                                    'priceClassName' => 'fw-semibold text-primary',
                                                    'priceOriginalWrapperClassName' => '',
                                                    'priceOriginalClassName' => 'small cl-text-2 text-decoration-line-through',
                                                    'priceFormatted' => format_price($cartItem->price),
                                                ])
                                            </td>
                                            <td class="cart_quantity" data-cart-title="{{ __('Quantity') }}">
                                                @include(Theme::getThemeNamespace('views.ecommerce.includes.cart-quantity'), [
                                                    'product'  => $product,
                                                    'cartItem' => $cartItem,
                                                    'key'      => $key,
                                                ])
                                            </td>
                                            <td class="cart_total fw-semibold text-primary" data-cart-title="{{ __('Total') }}">
                                                <span data-cart-row-line-total>
                                                    {{ format_price($cartItem->price * $cartItem->qty) }}
                                                </span>
                                            </td>
                                            <td class="cart_action text-end" data-cart-title="{{ __('Remove') }}">
                                                <button
                                                    type="button"
                                                    class="cart-action-btn"
                                                    data-url="{{ route('public.cart.remove', $cartItem->rowId) }}"
                                                    data-bb-toggle="remove-from-cart"
                                                    {!! EcommerceHelper::jsAttributes('remove-from-cart', $product, ['data-product-quantity' => $cartItem->qty]) !!}
                                                    aria-label="{{ __('Remove item') }}">
                                                    <i class="icon icon-X2"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </x-core::form>

                    <div class="cart-actions d-flex flex-wrap gap-2 mt-20">
                        <a href="{{ route('public.products') }}" class="tf-btn btn-line animate-btn">
                            <span class="fw-semibold">{{ __('Continue shopping') }}</span>
                        </a>
                    </div>

                    {{-- Coupon form — POSTs to public.coupon.apply.
                         Pre-fills with the active coupon code so the user sees what's applied. --}}
                    <x-core::form
                        :url="route('public.coupon.apply')"
                        method="post"
                        id="coupon-form"
                        class="ip-discount-code mt-30">
                        <input
                            type="text"
                            name="coupon_code"
                            value="{{ BaseHelper::stringify(old('coupon_code', $appliedCoupon)) }}"
                            placeholder="{{ __('Enter coupon code') }}"
                            aria-label="{{ __('Coupon code') }}"
                            required>
                        <button type="submit" class="tf-btn animate-btn" @disabled($appliedCoupon)>
                            {{ __('Apply code') }}
                        </button>
                    </x-core::form>
                </div>

                <div class="col-lg-4">
                    {!! apply_filters('ecommerce_cart_sidebar_before_checkout', null, $products) !!}

                    <aside class="fl-sidebar-cart mt-lg-0 sticky-top">
                        <div class="box-order-summary">
                            <h5 class="title mb-20">{{ __('Order summary') }}</h5>

                            <div class="subtotal d-flex justify-content-between align-items-center">
                                <p class="fw-medium lh-24 mb-0">{{ __('Subtotal') }}</p>
                                <span class="total fw-medium lh-24" data-cart-subtotal>
                                    {{ format_price($rawSubTotal) }}
                                </span>
                            </div>

                            {{-- Standard Botble cart hook: plugins (e.g. Loyalty Points) inject a
                                 row right after the subtotal. Amerce uses a custom cart, so this
                                 must be re-declared alongside ecommerce_cart_after_subtotal. --}}
                            {!! apply_filters('ecommerce_cart_table_after_subtotal', null) !!}

                            {!! apply_filters('ecommerce_cart_after_subtotal', null, $products) !!}

                            @if (EcommerceHelper::isTaxEnabled())
                                {{-- Tax row hidden when amount is 0; JS toggles
                                     `[hidden]` on cart updates if tax shifts. --}}
                                <div class="tax d-flex justify-content-between align-items-center mt-2"
                                     data-cart-tax-row
                                     @if ($rawTax <= 0) hidden @endif>
                                    <p class="fw-medium lh-24 mb-0">{{ __('Tax') }}</p>
                                    <span class="total fw-medium lh-24" data-cart-tax>
                                        {{ format_price($rawTax) }}
                                    </span>
                                </div>
                            @endif

                            @if ($couponDiscount > 0 && $appliedCoupon)
                                <div class="coupon d-flex justify-content-between align-items-center mt-2">
                                    <div>
                                        {{ __('Coupon') }}
                                        <span class="small">({{ $appliedCoupon }})</span>
                                        <a
                                            class="small link text-danger lh-1 ms-1"
                                            data-bb-toggle="remove-coupon"
                                            href="{{ route('public.coupon.remove') }}">
                                            {{ __('Remove') }}
                                        </a>
                                    </div>
                                    <span>-{{ format_price($couponDiscount) }}</span>
                                </div>
                            @endif

                            @if ($promotionDiscount > 0)
                                <div class="promotion d-flex justify-content-between align-items-center mt-2">
                                    <p class="fw-medium lh-24 mb-0">{{ __('Promotion') }}</p>
                                    <span class="total fw-medium lh-24">
                                        -{{ format_price($promotionDiscount) }}
                                    </span>
                                </div>
                            @endif

                            <div class="ship mt-20">
                                <p class="fw-medium lh-24 mb-1">{{ __('Shipping') }}</p>
                                <p class="text-caption-01 cl-text-2 mb-0">
                                    {{ __('Shipping options will be calculated at checkout.') }}
                                </p>
                            </div>

                            <h5 class="total-order d-flex justify-content-between align-items-center mt-20">
                                <span>{{ __('Total') }}</span>
                                <span class="total" data-cart-total>
                                    {{ format_price($grandTotal) }}
                                </span>
                            </h5>

                            <fieldset class="checkbox-wrap check-agree mt-20">
                                <input
                                    type="checkbox"
                                    name="checkout_agree"
                                    class="tf-check-rounded"
                                    id="amerce-cart-agree">
                                <label for="amerce-cart-agree">
                                    {!! __('I agree with the :terms.', [
                                        'terms' => '<a href="' . url('terms-and-conditions') . '" class="fw-medium text-decoration-underline link">' . e(__('terms and conditions')) . '</a>',
                                    ]) !!}
                                </label>
                            </fieldset>

                            <div class="list-ver text-center mt-20">
                                <a
                                    href="{{ route('public.checkout.information', OrderHelper::getOrderSessionToken()) }}"
                                    id="checkout-btn"
                                    class="action-checkout tf-btn w-100 animate-btn">
                                    <span class="fw-semibold">{{ __('Proceed to checkout') }}</span>
                                </a>
                                <a href="{{ route('public.products') }}" class="link-underline link mt-10 d-inline-block">
                                    <span class="fw-semibold">{{ __('or continue shopping') }}</span>
                                </a>
                            </div>

                            {!! apply_filters('ecommerce_cart_sidebar_after_checkout', null, $products) !!}
                        </div>
                    </aside>
                </div>
            </div>
        </div>
    @endif
</section>

{{-- Cross-sell suggestions. The plugin's `cross-sale-products.blade.php`
     requires `$parentProduct` (per-product cross-sells), which the cart page
     doesn't have — it gets a flat `$crossSellProducts` collection from
     PublicCartController::getDataForResponse instead. Render those directly
     using the theme's product-card dispatcher in a swiper. --}}
@if (
    $cartCount > 0
    && EcommerceHelper::isEnabledCrossSaleProducts()
    && isset($crossSellProducts)
    && $crossSellProducts->isNotEmpty()
)
    <section class="section-related-products flat-spacing">
        <div class="container">
            <div class="d-flex justify-content-between align-items-end mb-24 flex-wrap gap-2">
                <h3 class="h4 fw-medium m-0">{{ __('You may also like') }}</h3>
            </div>

            <div dir="ltr"
                 class="swiper tf-swiper wrap-sw-over"
                 data-preview="4"
                 data-tablet="3"
                 data-mobile-sm="2"
                 data-mobile="2"
                 data-space-lg="30"
                 data-space-md="20"
                 data-space="10">
                <div class="swiper-wrapper">
                    @foreach ($crossSellProducts as $product)
                        <div class="swiper-slide">
                            @include(Theme::getThemeNamespace('views.ecommerce.includes.product-item'))
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </section>
@endif
</div>{{-- /data-cart-page-area --}}
