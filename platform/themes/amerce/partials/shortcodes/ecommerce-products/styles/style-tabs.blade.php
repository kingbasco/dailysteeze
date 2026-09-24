@php
    /**
     * Tabbed product slider used by home-mental §4 ("Top Picks This Week") and
     * home-fashion-2 §3 (centered "New Arrivals / Best Sellers / On Sale" tabs).
     * Mirrors html/home-mental.html lines 1777-3078 (left-title + right-tabs row),
     * html/home-fashion-2.html lines 1733-1763 (tabs-only centered) and
     * html/home-headphone.html lines 1476-1545 (left promo banner + tabs, the
     * `left_banner_*` knobs render a col-lg-3 banner + col-lg-9 tab-content split).
     *
     * Tab data is loaded by the ecommerce-products shortcode handler when
     * style === 'style-tabs'. Falls back to a single-tab slider when no tabs
     * are configured.
     */
    $tabs = $tabs ?? [];
    if (empty($tabs)) {
        $tabs = [[
            'label' => $shortcode->title ?: __('All'),
            'slug' => 'tab-1',
            'products' => $products ?? collect(),
        ]];
    }
    $perView = max(1, min(6, (int) ($shortcode->items_per_row ?: 4)));
    // tab-nav-style: 'v1' = large centered heading-style tabs (`tab-btn-wrap-v1`,
    // html/home-pod.html §7 line 2238 — `style-2 justify-content-sm-center` w/ h3 labels),
    // 'v2' = plain, 'v3' = slash-separated (home-electronics demo),
    // 'v4' = LEFT vertical icon nav in a `grid-cls-v4` 2-column layout
    // (home-office-equipment §6 — each tab is an icon image + label).
    $tabNavStyle = ($shortcode->tab_nav_style ?: 'v2');
    $tabNavStyle = in_array($tabNavStyle, ['v1', 'v2', 'v3', 'v4'], true) ? $tabNavStyle : 'v2';
    $viewAllUrl  = trim((string) ($shortcode->view_all_url ?? ''));
    $viewAllText = trim((string) ($shortcode->view_all_text ?? '')) ?: __('View All Products');

    // ---- Layout knobs ----
    // tabs_only_centered = 'yes' renders tabs-only centered (no title/subtitle col),
    // matching home-fashion-2 demo. Auto-enabled when title+subtitle are both empty.
    $hasTitle = ! empty($shortcode->title ?? '') || ! empty($shortcode->subtitle ?? '');
    $tabsOnlyCentered = ($shortcode->tabs_only_centered ?? '') === 'yes' || ! $hasTitle;

    // header_layout: 'split' (default — heading LEFT, tab nav + view-all RIGHT) or
    // 'stacked-center' (heading + subtitle CENTERED, tab nav row CENTERED below).
    // 'stacked-center' added 2026-05-15 for HomeFurniture §9 demo parity (Top Sellers
    // You Can't Miss with 6 v3 slash tabs centered under the heading).
    $headerLayout = in_array($shortcode->header_layout ?? '', ['split', 'stacked-center'], true)
        ? $shortcode->header_layout
        : 'split';
    $useStackedCenter = $headerLayout === 'stacked-center' && $hasTitle;
    // tab_nav_class_extra: extra modifier(s) on .tab-btn-wrap-vX (e.g.
    // 'style-4 justify-content-sm-center mb-0' for fashion-2).
    $tabNavClassExtra = trim((string) ($shortcode->tab_nav_class_extra ?? ''));
    $tabNavPosition = $shortcode->tab_nav_position ?: 'right';
    if (! in_array($tabNavPosition, ['right', 'under-title'], true)) {
        $tabNavPosition = 'right';
    }
    // tab_btn_class_extra: extra classes on each .tf-btn-tab anchor (e.g. 'py-4').
    $tabBtnClassExtra = trim((string) ($shortcode->tab_btn_class_extra ?? ''));
    // tab_label_class: CSS class on the inner <span> tab label (default 'fw-medium';
    // fashion-2 demo uses 'h4' for larger heading-style tab labels).
    $tabLabelClass = trim((string) ($shortcode->tab_label_class ?? '')) ?: 'fw-medium';

    // ---- Grid-with-banner layout (construction demo §4) ----
    // tab_content_layout: 'swiper' (default) or 'grid-with-banner'.
    // When 'grid-with-banner', each tab pane renders a `wrap-prd` layout:
    //   col-prd-1: banner + 2 product grid
    //   col-prd-2: 4 product grid
    // Banner attrs: banner_image, banner_heading, banner_subheading,
    //               banner_button_text, banner_button_url.
    $tabLayout       = trim((string) ($shortcode->tab_content_layout ?? 'swiper'));
    $isGridWithBanner = $tabLayout === 'grid-with-banner';
    $bannerImage     = (string) ($shortcode->banner_image ?? '');
    $bannerHeading   = (string) ($shortcode->banner_heading ?? '');
    $bannerSubheading = (string) ($shortcode->banner_subheading ?? '');
    $bannerBtnText   = (string) ($shortcode->banner_button_text ?? __('Shop Now'));
    $bannerBtnUrl    = (string) ($shortcode->banner_button_url ?? '#');
    $productWrapperClass = trim((string) ($shortcode->product_wrapper_class ?? ''));
    $cardStyle       = trim((string) ($shortcode->card_style ?? ''));
    $cardExtraClass  = trim((string) ($shortcode->card_extra_class ?? ''));
    // grid_rows: swiper `data-grid` row count (home-baby §4 demo uses 2 → 4x2 grid).
    $gridRows        = max(1, min(3, (int) ($shortcode->grid_rows ?? 1)));
    // show_marquee='no' suppresses the loud HOT-SALE marquee strip on cards
    // (home-baby §4 demo cards have none).
    $showMarquee     = ($shortcode->show_marquee ?? 'yes') !== 'no';

    // ---- Left promo-banner column (home-headphone §3 "Top Pick") ----
    // When `left_banner_image` is set, the `.tab-content` is wrapped in a
    // `row > col-lg-3` (promo banner-image-text type-abs style-16) + `col-lg-9`
    // (tab content) split. Heading stays outside the row. When empty the
    // `.tab-content` renders directly as before (backward compatible).
    // Mirrors html/home-headphone.html lines 1518-1540.
    $leftBannerImage      = trim((string) ($shortcode->left_banner_image ?? ''));
    $hasLeftBanner        = $leftBannerImage !== '';
    $leftBannerTitle      = trim((string) ($shortcode->left_banner_title ?? ''));
    $leftBannerDesc       = trim((string) ($shortcode->left_banner_desc ?? ''));
    $leftBannerButtonText = trim((string) ($shortcode->left_banner_button_text ?? '')) ?: __('Shop Now');
    $leftBannerButtonUrl  = trim((string) ($shortcode->left_banner_button_url ?? '')) ?: '#';
    // Tab content ALWAYS loads via AJAX — only tab 0 is server-rendered, the rest
    // are fetched on click. Keeps the initial page light no matter how many tabs.
    // Falls back to bootstrap tabs only if the AJAX route is unavailable.
    $loadTabsAjax = \Illuminate\Support\Facades\Route::has('public.ajax.ecommerce-products-tab');
    $ajaxUrl = $loadTabsAjax ? route('public.ajax.ecommerce-products-tab') : '';
@endphp

<div
    class="flat-animate-tab"
    @if ($loadTabsAjax && $ajaxUrl)
        data-featured-tabs
        data-ajax-url="{{ $ajaxUrl }}"
        data-limit="{{ (int) ($shortcode->limit ?: 8) }}"
        data-items-per-row="{{ $perView }}"
        data-product-wrapper-class="{{ $productWrapperClass }}"
        data-grid-rows="{{ $gridRows }}"
        data-show-marquee="{{ $showMarquee ? 'yes' : 'no' }}"
    @endif
>
    @if ($tabNavStyle === 'v4')
        {{-- v4: LEFT vertical icon nav (`grid-cls-v4`) — home-office-equipment §6.
             item1 = `tab-btn-wrap-v4` icon+label tabs; item2 = the shared
             `.tab-content` panes. Heading stays a plain centered block above. --}}
        @if (! empty($shortcode->title ?? '') || ! empty($shortcode->subtitle ?? ''))
            <div class="sect-heading type-2 text-center wow fadeInUp">
                @if (! empty($shortcode->title ?? ''))
                    <h3 class="s-title">{!! BaseHelper::clean($shortcode->title) !!}</h3>
                @endif
                @if (! empty($shortcode->subtitle ?? ''))
                    <p class="s-desc text-body-1 cl-text-2">{!! BaseHelper::clean($shortcode->subtitle) !!}</p>
                @endif
            </div>
        @endif
        <div class="grid-cls-v4">
            <div class="item1">
                <ul class="tab-btn-wrap-v4 {{ $tabNavClassExtra }} wow fadeInUp" role="tablist">
                    @foreach ($tabs as $i => $tab)
                        <li class="nav-tab-item" role="presentation">
                            <a href="#{{ $tab['slug'] }}"
                               @if (! $loadTabsAjax) data-bs-toggle="tab" @endif
                               class="tf-btn-tab {{ $tabBtnClassExtra }} @if ($i === 0) active @endif"
                               @if ($loadTabsAjax)
                                   data-featured-tab
                                   data-source="{{ $tab['source'] ?? ($shortcode->source ?: 'latest') }}"
                                   data-category="{{ $tab['category_value'] ?? '' }}"
                                   data-loaded="{{ ! empty($tab['loaded']) ? 'true' : 'false' }}"
                               @endif
                               role="tab">
                                @if (! empty($tab['icon']))
                                    <div class="img">
                                        {!! RvMedia::image($tab['icon'], $tab['label'], 'thumb', false, ['width' => 62, 'height' => 62, 'loading' => 'lazy']) !!}
                                    </div>
                                @endif
                                <span class="text h6">{{ $tab['label'] }}</span>
                            </a>
                        </li>
                    @endforeach
                </ul>
            </div>
            <div class="item2">
                @include(Theme::getThemeNamespace('partials.shortcodes.ecommerce-products.styles.partials.tab-content'))
            </div>
        </div>
    @else
    @if ($useStackedCenter)
        {{-- header_layout='stacked-center': title + subtitle CENTERED, then tab nav row
             CENTERED below. HomeFurniture §9 demo (Top Sellers You Can't Miss, 6 v3
             slash tabs). Mirrors v4 heading block + a centered tabs strip. --}}
        <div class="sect-heading type-2 text-center wow fadeInUp">
            @if (! empty($shortcode->title ?? ''))
                <h3 class="s-title">{!! BaseHelper::clean($shortcode->title) !!}</h3>
            @endif
            @if (! empty($shortcode->subtitle ?? ''))
                <p class="s-desc text-body-1 cl-text-2">{!! BaseHelper::clean($shortcode->subtitle) !!}</p>
            @endif
            <div class="overflow-auto text-nowrap d-flex justify-content-center">
                <ul class="tab-btn-wrap-{{ $tabNavStyle }} {{ $tabNavClassExtra }}" role="tablist">
                    @foreach ($tabs as $i => $tab)
                        <li class="nav-tab-item" role="presentation">
                            <a href="#{{ $tab['slug'] }}"
                               @if (! $loadTabsAjax) data-bs-toggle="tab" @endif
                               class="tf-btn-tab {{ $tabBtnClassExtra }} @if ($i === 0) active @endif"
                               @if ($loadTabsAjax)
                                   data-featured-tab
                                   data-source="{{ $tab['source'] ?? ($shortcode->source ?: 'latest') }}"
                                   data-category="{{ $tab['category_value'] ?? '' }}"
                                   data-loaded="{{ ! empty($tab['loaded']) ? 'true' : 'false' }}"
                               @endif
                               role="tab">
                                <span class="{{ $tabLabelClass }}">{{ $tab['label'] }}</span>
                            </a>
                        </li>
                        @if ($tabNavStyle === 'v3' && $i < count($tabs) - 1)
                            <li class="spread" aria-hidden="true">/</li>
                        @endif
                    @endforeach
                </ul>
            </div>
        </div>
    @elseif ($tabsOnlyCentered)
        <div class="sect-heading type-2 overflow-auto text-nowrap">
            <ul class="tab-btn-wrap-{{ $tabNavStyle }} {{ $tabNavClassExtra }}" role="tablist">
                @foreach ($tabs as $i => $tab)
                    <li class="nav-tab-item" role="presentation">
                        <a href="#{{ $tab['slug'] }}"
                           @if (! $loadTabsAjax) data-bs-toggle="tab" @endif
                           class="tf-btn-tab {{ $tabBtnClassExtra }} @if ($i === 0) active @endif"
                           @if ($loadTabsAjax)
                               data-featured-tab
                               data-source="{{ $tab['source'] ?? ($shortcode->source ?: 'latest') }}"
                               data-category="{{ $tab['category_value'] ?? '' }}"
                               data-loaded="{{ ! empty($tab['loaded']) ? 'true' : 'false' }}"
                           @endif
                           role="tab">
                            <span class="{{ $tabLabelClass }}">{{ $tab['label'] }}</span>
                        </a>
                    </li>
                    @if ($tabNavStyle === 'v3' && $i < count($tabs) - 1)
                        <li class="spread" aria-hidden="true">/</li>
                    @endif
                @endforeach
            </ul>
        </div>
    @else
        <div class="sect-heading d-block d-md-flex type-2 has-col-right wow fadeInUp">
            <div>
                @if (! empty($shortcode->title ?? ''))
                    <h3 class="s-title">{!! BaseHelper::clean($shortcode->title) !!}</h3>
                @endif
                @if (! empty($shortcode->subtitle ?? ''))
                    <p class="s-desc text-body-1 cl-text-2">{!! BaseHelper::clean($shortcode->subtitle) !!}</p>
                @endif
                @if ($tabNavPosition === 'under-title')
                    <div class="overflow-auto">
                        <ul class="tab-btn-wrap-{{ $tabNavStyle }} {{ $tabNavClassExtra }}" role="tablist">
                            @foreach ($tabs as $i => $tab)
                                <li class="nav-tab-item" role="presentation">
                                    <a href="#{{ $tab['slug'] }}"
                                       @if (! $loadTabsAjax) data-bs-toggle="tab" @endif
                                       class="tf-btn-tab {{ $tabBtnClassExtra }} @if ($i === 0) active @endif"
                                       @if ($loadTabsAjax)
                                           data-featured-tab
                                           data-source="{{ $tab['source'] ?? ($shortcode->source ?: 'latest') }}"
                                           data-category="{{ $tab['category_value'] ?? '' }}"
                                           data-loaded="{{ ! empty($tab['loaded']) ? 'true' : 'false' }}"
                                       @endif
                                       role="tab">
                                        <span class="{{ $tabLabelClass }}">{{ $tab['label'] }}</span>
                                    </a>
                                </li>
                                @if ($tabNavStyle === 'v3' && $i < count($tabs) - 1)
                                    <li class="spread" aria-hidden="true">/</li>
                                @endif
                            @endforeach
                        </ul>
                    </div>
                @endif
            </div>
            <div class="col-right {{ $tabNavPosition === 'right' ? 'overflow-auto' : '' }}" data-wow-delay="0.1s">
                @if ($tabNavPosition === 'right')
                    <ul class="tab-btn-wrap-{{ $tabNavStyle }} {{ $tabNavClassExtra }}" role="tablist">
                        @foreach ($tabs as $i => $tab)
                            <li class="nav-tab-item" role="presentation">
                                <a href="#{{ $tab['slug'] }}"
                                   @if (! $loadTabsAjax) data-bs-toggle="tab" @endif
                                   class="tf-btn-tab {{ $tabBtnClassExtra }} @if ($i === 0) active @endif"
                                   @if ($loadTabsAjax)
                                       data-featured-tab
                                       data-source="{{ $tab['source'] ?? ($shortcode->source ?: 'latest') }}"
                                       data-category="{{ $tab['category_value'] ?? '' }}"
                                       data-loaded="{{ ! empty($tab['loaded']) ? 'true' : 'false' }}"
                                   @endif
                                   role="tab">
                                    <span class="{{ $tabLabelClass }}">{{ $tab['label'] }}</span>
                                </a>
                            </li>
                            @if ($tabNavStyle === 'v3' && $i < count($tabs) - 1)
                                <li class="spread" aria-hidden="true">/</li>
                            @endif
                        @endforeach
                    </ul>
                @endif
                @if ($viewAllUrl !== '')
                    <a href="{{ $viewAllUrl }}" class="tf-btn-line-2 py-4 style-primary">
                        <span class="fw-semibold">{!! BaseHelper::clean($viewAllText) !!}</span>
                    </a>
                @endif
            </div>
        </div>
    @endif
    @if ($hasLeftBanner)
        <div class="row">
            <div class="col-lg-3">
                <div class="banner-image-text type-abs style-16">
                    <a href="{{ $leftBannerButtonUrl }}" class="bn-image img-style">
                        {{-- Original image (450x608 portrait) — NOT `medium` (800x800 square),
                             which center-crops the portrait promo art to a square. --}}
                        {!! RvMedia::image($leftBannerImage, $leftBannerTitle ?: __('Banner'), null, false, ['width' => 450, 'height' => 608, 'loading' => 'lazy']) !!}
                    </a>
                    <div class="bn-content wow fadeInUp">
                        @if ($leftBannerTitle !== '')
                            <a href="{{ $leftBannerButtonUrl }}" class="title h4 fw-medium text-white link mb-3">
                                {!! BaseHelper::clean($leftBannerTitle) !!}
                            </a>
                        @endif
                        @if ($leftBannerDesc !== '')
                            <p class="desc text-caption-01 text-white mb-12">
                                {!! BaseHelper::clean($leftBannerDesc) !!}
                            </p>
                        @endif
                        <a href="{{ $leftBannerButtonUrl }}" class="btn-action tf-btn-line-2 style-white">
                            <span class="fw-semibold">{!! BaseHelper::clean($leftBannerButtonText) !!}</span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-lg-9">
    @endif
    @include(Theme::getThemeNamespace('partials.shortcodes.ecommerce-products.styles.partials.tab-content'))
    @if ($hasLeftBanner)
            </div>{{-- /.col-lg-9 --}}
        </div>{{-- /.row --}}
    @endif
    @endif{{-- /tabNavStyle v4 vs v2/v3 --}}
</div>
