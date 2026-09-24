@php
    use Botble\Base\Facades\BaseHelper;

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

    $searchAction = $hasEcommerceSearch ? route('public.products') : url('/search');
    $ajaxSearchUrl = $hasEcommerceSearch ? route('public.ajax.search-products') : null;
@endphp

{{-- Header Style 10 — Furniture boutique (header-s8 has-by-category): logo + category browser + inline search left, icons right; main-menu in bottom bar with offer text right. --}}
<div class="br-line fake-class bottom-0 d-xl-none"></div>
<div class="header-inner_wrap">
    <div class="container-full">
        <div class="header-inner">
            <div class="box-open-menu-mobile d-xl-none">
                <a href="#mobileMenu" data-bs-toggle="offcanvas" class="btn-open-menu" aria-label="{{ __('Open menu') }}">
                    <i class="icon icon-List"></i>
                </a>
            </div>

            <div class="box-open-header-bottom">
                <div class="btn-open-header-bottom cs-pointer">
                    <i class="icon icon-List fs-24"></i>
                </div>
            </div>

            <div class="header-left">
                <a href="{{ BaseHelper::getHomepageUrl() }}" class="logo-site d-flex">
                    {{ Theme::getLogoImage(['class' => 'logo-light'], 'logo', 30) }}
                    {{ Theme::getLogoImage(['class' => 'logo-dark'], 'logo_dark', 30) }}
                </a>
                <div class="wrap-left d-none d-xl-flex">
                    @include(Theme::getThemeNamespace('partials.header.browse-by-category'), [
                        'categories'   => $headerCategories,
                        'wrapClass'    => 'nav-category-wrap style-4 main-action-active d-none d-xl-block',
                        'btnIconClass' => '',
                        'nameClass'    => 'name-category fw-medium lh-24',
                    ])
                    <form
                        action="{{ $searchAction }}"
                        method="GET"
                        role="search"
                        @class(['form-search-nav style-5 d-none d-xl-flex', 'bb-form-quick-search' => $hasEcommerceSearch])
                        @if ($hasEcommerceSearch) data-ajax-url="{{ $ajaxSearchUrl }}" @endif
                    >
                        <input type="text" name="q" placeholder="{{ __('Search Products') }}" autocomplete="off" required>
                        <button type="submit" class="btn-action-submit" aria-label="{{ __('Search') }}">
                            <i class="icon icon-MagnifyingGlass"></i>
                        </button>
                        @if ($hasEcommerceSearch)
                            <div class="bb-quick-search-results"></div>
                        @endif
                    </form>
                </div>
            </div>

            <div class="header-right">
                @include(Theme::getThemeNamespace('partials.header.ecommerce-action-buttons'), ['inlineSearchAtXl' => true])
            </div>
        </div>
    </div>
</div>

<div class="header-bottom_wrap d-none d-xl-block">
    <div class="container-full">
        <div class="header-bottom">
            <div class="col-left">
                <nav class="box-navigation">
                    @include(Theme::getThemeNamespace('partials.header.main-menu'))
                </nav>
            </div>
            <div class="col-right">
                @php
                    $offersText = theme_option('header_special_offers_text', __('Special Offers!'));
                    $offersUrl = theme_option('header_special_offers_url');
                @endphp
                @if ($offersUrl)
                    <a href="{{ $offersUrl }}" class="d-flex fw-medium align-items-center gap-8 lh-24 text-primary">
                        <i class="icon icon-SealPercent fs-24"></i>
                        {{ $offersText }}
                    </a>
                @else
                    <p class="d-flex fw-medium align-items-center gap-8 lh-24">
                        <i class="icon icon-SealPercent fs-24"></i>
                        {{ $offersText }}
                    </p>
                @endif
            </div>
        </div>
    </div>
</div>
