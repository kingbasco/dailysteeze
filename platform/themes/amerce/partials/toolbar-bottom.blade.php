@php
    use Botble\Ecommerce\Facades\Cart;
    use Botble\Ecommerce\Facades\EcommerceHelper;

    $hasEcom = is_plugin_active('ecommerce');
    $shopUrl = $hasEcom && \Illuminate\Support\Facades\Route::has('public.products') ? route('public.products') : url('/');
    $accountUrl = $hasEcom
        ? (auth('customer')->check() ? route('customer.overview') : '#sign')
        : url('/');
    $accountToggle = ($hasEcom && ! auth('customer')->check()) ? 'data-bs-toggle="modal"' : '';

    $cartCount = $hasEcom ? Cart::instance('cart')->count() : 0;
@endphp

{{-- Mobile fixed bottom toolbar — Shop / Search / Account / Wishlist / Cart --}}
<div class="tf-toolbar-bottom">
    <div class="toolbar-item">
        <a href="{{ $shopUrl }}">
            <span class="toolbar-icon"><i class="icon icon-storefront"></i></span>
            <span class="toolbar-label">{{ __('Shop') }}</span>
        </a>
    </div>
    <div class="toolbar-item">
        <a href="#search" data-bs-toggle="modal">
            <span class="toolbar-icon"><i class="icon icon-MagnifyingGlass"></i></span>
            <span class="toolbar-label">{{ __('Search') }}</span>
        </a>
    </div>
    <div class="toolbar-item">
        <a href="{{ $accountUrl }}" {!! $accountToggle !!}>
            <span class="toolbar-icon"><i class="icon icon-User"></i></span>
            <span class="toolbar-label">{{ __('Account') }}</span>
        </a>
    </div>
    @if ($hasEcom && EcommerceHelper::isWishlistEnabled())
        <div class="toolbar-item">
            <a href="{{ route('public.wishlist') }}">
                <span class="toolbar-icon"><i class="icon icon-HeartStraight"></i></span>
                <span class="toolbar-label">{{ __('Wishlist') }}</span>
            </a>
        </div>
    @endif
    @if ($hasEcom)
        <div class="toolbar-item">
            <a href="#shoppingCart" data-bs-toggle="offcanvas">
                <span class="toolbar-icon">
                    <i class="icon icon-Handbag"></i>
                    <span class="toolbar-count" data-cart-count>{{ $cartCount }}</span>
                </span>
                <span class="toolbar-label">{{ __('Cart') }}</span>
            </a>
        </div>
    @endif
</div>
