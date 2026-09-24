@php
    use Botble\Base\Facades\BaseHelper;

    // Pull root categories for the "Browse by Category" mega-list (nav-category-wrap).
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

    // Per-preset overrides — demos for auto/electronics/mental diverge slightly:
    //   auto:        container       + nav-category-wrap style-2
    //   electronics: container-full  + nav-category-wrap (no style-2) + btn `gap-12` icon `fs-24`
    //   mental:      container       + nav-category-wrap (no style-2)
    $innerContainer  = trim((string) theme_option('header_inner_container', 'container'));
    $catModifier     = trim((string) theme_option('header_category_modifier', 'style-2'));
    $catBtnGap       = trim((string) theme_option('header_category_btn_gap', ''));
    $catBtnIconSize  = trim((string) theme_option('header_category_btn_icon_size', ''));
    $extraLinkLabel  = trim((string) theme_option('header_bottom_extra_link_label', ''));
    $extraLinkUrl    = trim((string) theme_option('header_bottom_extra_link_url', ''));
    $extraLinkTarget = trim((string) theme_option('header_bottom_extra_link_target', ''));
    $offerText       = trim((string) theme_option('header_bottom_offer_text', ''));
    $offerUrl        = trim((string) theme_option('header_bottom_offer_url', ''));
    $offerTarget     = trim((string) theme_option('header_bottom_offer_target', ''));

    $catWrapClasses  = trim('nav-category-wrap ' . ($catModifier !== '' ? $catModifier . ' ' : '') . 'main-action-active');
    $catBtnClasses   = trim('btn-nav-drop btn-active text-nowrap' . ($catBtnGap !== '' ? ' ' . $catBtnGap : ''));
    $catBtnIconClass = trim('icon icon-List' . ($catBtnIconSize !== '' ? ' ' . $catBtnIconSize : ''));
@endphp

{{-- Header Style 7 — Logo + center search + actions; bottom bar adds category browser + main menu (header-s3 has-by-category). --}}
<div class="br-line fake-class bottom-0 d-xl-none"></div>
<div class="header-inner_wrap">
    <div class="{{ $innerContainer }}">
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
                <a href="{{ BaseHelper::getHomepageUrl() }}" class="logo-site">
                    {{ Theme::getLogoImage(['class' => 'logo-light'], 'logo', 30) }}
                    {{ Theme::getLogoImage(['class' => 'logo-dark'], 'logo_dark', 30) }}
                </a>
            </div>

            <div class="header-center d-none d-xl-block">
                <form
                    action="{{ $searchAction }}"
                    method="GET"
                    role="search"
                    @class(['form_search-product', 'bb-form-quick-search' => $hasEcommerceSearch])
                    @if ($hasEcommerceSearch) data-ajax-url="{{ $ajaxSearchUrl }}" @endif
                >
                    {{-- AJAX-loaded category dropdown — mirrors Shofy theme pattern.
                         Empty <select data-bb-toggle="init-categories-dropdown"> gets <option> tags
                         appended on page-load by front-ecommerce.js (calls public.ajax.categories-dropdown,
                         appends `select` HTML payload). No data-bb-target → use native <select> path. --}}
                    <div class="select-category">
                        <x-plugins-ecommerce::fronts.ajax-search.categories-dropdown
                            class="dropdown_product_cate"
                        />
                    </div>
                    <span class="br-line type-vertical"></span>
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

            <div class="header-right">
                @include(Theme::getThemeNamespace('partials.header.ecommerce-action-buttons'), [
                    'inlineSearchAtXl' => true,
                    'accountLabel' => theme_option('header_account_label', ''),
                ])
            </div>
        </div>
    </div>
</div>

<div class="header-bottom_wrap d-none d-xl-block">
    <div class="{{ $innerContainer }}">
        <div class="header-bottom">
            <div class="col-left">
                @include(Theme::getThemeNamespace('partials.header.browse-by-category'), [
                    'categories'   => $headerCategories,
                    'wrapClass'    => $catWrapClasses,
                    'btnClass'     => $catBtnClasses,
                    'btnIconClass' => $catBtnIconClass,
                ])
                <nav @class(['box-navigation', 'd-flex align-items-center gap-24' => $extraLinkLabel !== '' && $extraLinkUrl !== ''])>
                    @include(Theme::getThemeNamespace('partials.header.main-menu'))
                    @if ($extraLinkLabel !== '' && $extraLinkUrl !== '')
                        <ul class="box-nav-menu">
                            <li class="menu-item">
                                <a href="{{ $extraLinkUrl }}" class="item-link" @if ($extraLinkTarget !== '') target="{{ $extraLinkTarget }}" @if ($extraLinkTarget === '_blank') rel="noopener noreferrer" @endif @endif>
                                    <span class="text cus-text">{{ __($extraLinkLabel) }}</span>
                                </a>
                            </li>
                        </ul>
                    @endif
                </nav>
            </div>
            @if ($offerText !== '')
                <div class="col-right">
                    @if ($offerUrl !== '')
                        <a href="{{ $offerUrl }}" class="text-primary fw-medium d-flex align-items-center gap-8" @if ($offerTarget !== '') target="{{ $offerTarget }}" @if ($offerTarget === '_blank') rel="noopener noreferrer" @endif @endif>
                            <i class="icon icon-SealPercent fs-24"></i>
                            {{ __($offerText) }}
                        </a>
                    @else
                        <p class="text-primary fw-medium d-flex align-items-center gap-8">
                            <i class="icon icon-SealPercent fs-24"></i>
                            {{ __($offerText) }}
                        </p>
                    @endif
                </div>
            @endif
        </div>
    </div>
</div>
