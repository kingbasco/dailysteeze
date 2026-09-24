@php
    use Botble\Base\Facades\BaseHelper;

    /**
     * Header Style 8 — mirrors html/home-baby.html `tf-header header-s6 has-by-category`
     * (lines 50-1475).
     *   TOP row    (header-inner):  logo + inline main-menu nav LEFT, currency/language
     *                               switchers RIGHT (mobile: nav-icon-list).
     *   BOTTOM row (header-bottom): Browse-by-Category dropdown LEFT, search form CENTER,
     *                               account / wishlist / cart icons RIGHT.
     */
    $headerCategories = collect();
    if (is_plugin_active('ecommerce')) {
        $headerCategories = app(\Botble\Ecommerce\Repositories\Interfaces\ProductCategoryInterface::class)
            ->advancedGet([
                'condition' => ['parent_id' => 0, 'status' => 'published'],
                'with'      => ['slugable', 'activeChildren', 'activeChildren.activeChildren'],
                'take'      => 10,
            ]);
    }

    $hasEcommerceSearch = is_plugin_active('ecommerce')
        && \Illuminate\Support\Facades\Route::has('public.products')
        && \Illuminate\Support\Facades\Route::has('public.ajax.search-products');

    $searchAction  = $hasEcommerceSearch ? route('public.products') : url('/search');
    $ajaxSearchUrl = $hasEcommerceSearch ? route('public.ajax.search-products') : null;
@endphp

<div class="br-line fake-class bottom-0 d-xl-none"></div>
<div class="header-inner_wrap">
    <div class="container">
        <div class="header-inner">
            <div class="box-open-menu-mobile d-xl-none">
                <a href="#mobileMenu" data-bs-toggle="offcanvas" class="btn-open-menu" aria-label="{{ __('Open menu') }}">
                    <i class="icon icon-List"></i>
                </a>
            </div>

            <div class="header-left">
                <div class="box-open-header-bottom m-0">
                    <div class="btn-open-header-bottom cs-pointer">
                        <i class="icon icon-List fs-24"></i>
                    </div>
                </div>
                <a href="{{ BaseHelper::getHomepageUrl() }}" class="logo-site">
                    {{ Theme::getLogoImage(['class' => 'logo-light'], 'logo', 30) }}
                </a>
                <div class="d-none d-xl-block">
                    <nav class="box-navigation">
                        @include(Theme::getThemeNamespace('partials.header.main-menu'))
                    </nav>
                </div>
            </div>

            <div class="header-right">
                @if ((bool) theme_option('header_show_currency_language', true))
                    <div class="tf-list list-currenci d-none d-xl-flex">
                        @include(Theme::getThemeNamespace('partials.currency-switcher'))
                        <div class="br-line type-vertical"></div>
                        @include(Theme::getThemeNamespace('partials.language-switcher'))
                    </div>
                @endif
                <ul class="nav-icon-list d-xl-none">
                    <li class="d-none d-sm-block">
                        <a href="#search" data-bs-toggle="modal" class="nav-icon-item link" aria-label="{{ __('Search') }}">
                            <i class="icon icon-MagnifyingGlass"></i>
                        </a>
                    </li>
                    @if (is_plugin_active('ecommerce'))
                    <li>
                        @auth('customer')
                            <a href="{{ route('customer.overview') }}" class="nav-icon-item link" aria-label="{{ __('My account') }}">
                                <i class="icon icon-User"></i>
                            </a>
                        @else
                            <a href="#sign" data-bs-toggle="modal" class="nav-icon-item link" aria-label="{{ __('Sign in') }}">
                                <i class="icon icon-User"></i>
                            </a>
                        @endauth
                    </li>
                    @endif
                    @if (is_plugin_active('ecommerce'))
                        <li class="d-none d-sm-block">
                            <a href="{{ route('public.wishlist') }}" class="nav-icon-item link" aria-label="{{ __('Wishlist') }}">
                                <i class="icon icon-HeartStraight"></i>
                            </a>
                        </li>
                        <li>
                            <a href="#shoppingCart" data-bs-toggle="offcanvas" class="nav-icon-item link shop-cart" aria-label="{{ __('Cart') }}">
                                <i class="icon icon-Handbag"></i>
                                <span class="count" data-cart-count>{{ \Botble\Ecommerce\Facades\Cart::instance('cart')->count() }}</span>
                            </a>
                        </li>
                    @endif
                </ul>
            </div>
        </div>
        <div class="br-line d-none d-xl-flex"></div>
    </div>
</div>

<div class="header-bottom_wrap d-none d-xl-block">
    <div class="container">
        <div class="header-bottom">
            <div class="col-left">
                @include(Theme::getThemeNamespace('partials.header.browse-by-category'), [
                    'categories'    => $headerCategories,
                    'listClass'     => 'box-nav-category active-item radius-12',
                    'showCaretDown' => false,
                ])
            </div>

            <div class="col-center">
                <form
                    action="{{ $searchAction }}"
                    method="GET"
                    role="search"
                    @class(['form_search-product style-2 radius-8', 'bb-form-quick-search' => $hasEcommerceSearch])
                    @if ($hasEcommerceSearch) data-ajax-url="{{ $ajaxSearchUrl }}" @endif
                >
                    @if ($hasEcommerceSearch)
                        <div class="select-category">
                            <x-plugins-ecommerce::fronts.ajax-search.categories-dropdown
                                class="dropdown_product_cate"
                            />
                        </div>
                        <span class="br-line type-vertical"></span>
                    @endif
                    <fieldset class="fieldset-search">
                        <input class="ipt" type="text" name="q" placeholder="{{ __('Search Products') }}" autocomplete="off" required>
                        <button type="submit" class="btn-action" aria-label="{{ __('Search') }}">
                            <i class="icon icon-MagnifyingGlass"></i>
                        </button>
                    </fieldset>
                    @if ($hasEcommerceSearch)
                        <div class="bb-quick-search-results"></div>
                    @endif
                </form>
            </div>

            <div class="col-right">
                <ul class="nav-icon-list">
                    @if (is_plugin_active('ecommerce'))
                    <li>
                        @auth('customer')
                            <a href="{{ route('customer.overview') }}" class="nav-icon-item link has-text" aria-label="{{ __('My account') }}">
                                <i class="icon icon-User"></i>
                                <span class="d-none d-md-block">{{ __('My Account') }}</span>
                            </a>
                        @else
                            <a href="#sign" data-bs-toggle="modal" class="nav-icon-item link has-text" aria-label="{{ __('Sign in') }}">
                                <i class="icon icon-User"></i>
                                <span class="d-none d-md-block">{{ __('Login/Register') }}</span>
                            </a>
                        @endauth
                    </li>
                    @endif
                    @if (is_plugin_active('ecommerce'))
                        <li class="d-none d-sm-block">
                            <a href="{{ route('public.wishlist') }}" class="nav-icon-item link" aria-label="{{ __('Wishlist') }}">
                                <i class="icon icon-HeartStraight"></i>
                            </a>
                        </li>
                        <li>
                            <a href="#shoppingCart" data-bs-toggle="offcanvas" class="nav-icon-item link shop-cart" aria-label="{{ __('Cart') }}">
                                <i class="icon icon-Handbag"></i>
                                <span class="count" data-cart-count>{{ \Botble\Ecommerce\Facades\Cart::instance('cart')->count() }}</span>
                            </a>
                        </li>
                    @endif
                </ul>
            </div>
        </div>
    </div>
</div>
