@php
    use Botble\Ecommerce\Facades\Cart;
    use Botble\Ecommerce\Facades\EcommerceHelper;

    // Header styles that render an inline search bar at xl+ (styles 4, 7, 8, 9, 10, 11, 13)
    // pass $inlineSearchAtXl = true so the modal-trigger icon hides at xl+ to avoid duplication,
    // while remaining visible at sm-lg where the inline bar is hidden.
    $inlineSearchAtXl = $inlineSearchAtXl ?? false;
    $searchIconClasses = $inlineSearchAtXl ? 'd-none d-sm-block d-xl-none' : 'd-none d-sm-block';

    // Dark-header variants (style-6, style-13, style-14) pass colorMode='dark' so the
    // icons render in white — otherwise they're invisible on bg-dark headers.
    $colorMode = $colorMode ?? 'light';
    $iconClass = 'nav-icon-item link' . ($colorMode === 'dark' ? ' text-white' : '');
    $accountLabel = trim((string) ($accountLabel ?? theme_option('header_account_label', '')));
@endphp

{{-- Header action icon list — search, account, wishlist, cart (matches demo). --}}
<ul class="nav-icon-list">
    <li class="{{ $searchIconClasses }}">
        <a href="#search" data-bs-toggle="modal" class="{{ $iconClass }}" aria-label="{{ __('Search') }}">
            <i class="icon icon-MagnifyingGlass"></i>
        </a>
    </li>

    @if (is_plugin_active('ecommerce'))
        <li>
            @auth('customer')
                <a href="{{ route('customer.overview') }}" @class([$iconClass, 'has-text' => $accountLabel !== '']) aria-label="{{ __('My account') }}">
                    <i class="icon icon-User"></i>
                    @if ($accountLabel !== '')
                        <span class="d-none d-xl-block">{{ __('My account') }}</span>
                    @endif
                </a>
            @else
                <a href="#sign" data-bs-toggle="modal" @class([$iconClass, 'has-text' => $accountLabel !== '']) aria-label="{{ __('Sign in') }}">
                    <i class="icon icon-User"></i>
                    @if ($accountLabel !== '')
                        <span class="d-none d-xl-block">{{ __($accountLabel) }}</span>
                    @endif
                </a>
            @endauth
        </li>

        @if (EcommerceHelper::isWishlistEnabled())
            <li class="d-none d-sm-block">
                <a href="{{ route('public.wishlist') }}" class="{{ $iconClass }}" aria-label="{{ __('Wishlist') }}">
                    <i class="icon icon-HeartStraight"></i>
                    @php $wishlistCount = Cart::instance('wishlist')->count(); @endphp
                    <span class="count" data-bb-value="wishlist-count" @if ($wishlistCount === 0) hidden @endif>{{ $wishlistCount }}</span>
                </a>
            </li>
        @endif

        <li>
            <a href="#shoppingCart" data-bs-toggle="offcanvas" class="{{ $iconClass }} shop-cart" aria-label="{{ __('Cart') }}">
                <i class="icon icon-Handbag"></i>
                @php $cartCount = Cart::instance('cart')->count(); @endphp
                <span class="count" data-cart-count @if ($cartCount === 0) hidden @endif>{{ $cartCount }}</span>
            </a>
        </li>
    @endif
</ul>
