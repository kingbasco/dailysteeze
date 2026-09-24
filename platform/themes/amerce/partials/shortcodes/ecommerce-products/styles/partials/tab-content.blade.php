{{-- Shared `.tab-content` panes for style-tabs (all nav layouts: v2/v3 + v4).
     Expects from the parent scope: $tabs, $loadTabsAjax, $isGridWithBanner,
     $bannerImage/$bannerHeading/$bannerSubheading/$bannerBtnText/$bannerBtnUrl,
     $perView, $productWrapperClass, $cardStyle, $cardExtraClass, $gridRows,
     $showMarquee. --}}
<div class="tab-content">
    @foreach ($tabs as $i => $tab)
        @php
            $products = $tab['products'];
        @endphp
        <div class="tab-pane @if ($i === 0) active show @endif" id="{{ $tab['slug'] }}" role="tabpanel">
            <div data-featured-tabs-content>
            @if ($products && count($products) > 0)
                @if ($isGridWithBanner)
                    {{-- Grid-with-banner layout: wrap-prd > col-prd-1 (banner + 2 cards) + col-prd-2 (4 cards).
                         Mirrors section-top-pick-v02 in html/home-construction.html. --}}
                    @php
                        $prdList  = collect($products);
                        $leftCol  = $prdList->slice(0, 2)->values();
                        $rightCol = $prdList->slice(2, 4)->values();
                    @endphp
                    <div class="wrap-prd">
                        <div class="col-prd-1">
                            @if ($bannerImage !== '')
                                <div class="banner-image-text type-abs style-18 v2 mb-20">
                                    <a href="{{ $bannerBtnUrl ?: '#' }}" class="bn-image img-style">
                                        {!! RvMedia::image($bannerImage, $bannerHeading, 'medium', false, ['width' => 450, 'height' => 608, 'loading' => 'lazy']) !!}
                                    </a>
                                    <div class="bn-content wow fadeInUp">
                                        @if ($bannerHeading !== '')
                                            <a href="{{ $bannerBtnUrl ?: '#' }}" class="title text-white h3 fw-medium link mb-8">
                                                {!! nl2br(BaseHelper::clean($bannerHeading)) !!}
                                            </a>
                                        @endif
                                        @if ($bannerSubheading !== '')
                                            <p class="desc text-body-1 text-white mb-28">
                                                {!! nl2br(BaseHelper::clean($bannerSubheading)) !!}
                                            </p>
                                        @endif
                                        <a href="{{ $bannerBtnUrl ?: '#' }}" class="tf-btn btn-white hv-primary">
                                            {!! BaseHelper::clean($bannerBtnText) !!}
                                        </a>
                                    </div>
                                </div>
                            @endif
                            @if ($leftCol->isNotEmpty())
                                <div class="tf-grid-layout tf-col-2 gap-20">
                                    @foreach ($leftCol as $product)
                                        @includeIf(Theme::getThemeNamespace('views.ecommerce.includes.product-item'), ['product' => $product])
                                    @endforeach
                                </div>
                            @endif
                        </div>
                        <div class="col-prd-2">
                            @if ($rightCol->isNotEmpty())
                                <div class="tf-grid-layout tf-col-2 gap-20">
                                    @foreach ($rightCol as $product)
                                        @includeIf(Theme::getThemeNamespace('views.ecommerce.includes.product-item'), ['product' => $product])
                                    @endforeach
                                </div>
                            @endif
                        </div>
                    </div>
                @else
                    @include(Theme::getThemeNamespace('partials.shortcodes.ecommerce-products.styles.style-tabs-products'), [
                        'products' => $products,
                        'perView' => $perView,
                        'productWrapperClass' => $productWrapperClass,
                        'cardStyle' => $cardStyle,
                        'cardExtraClass' => $cardExtraClass,
                        'gridRows' => $gridRows,
                        'showMarquee' => $showMarquee,
                    ])
                @endif
            @elseif ($loadTabsAjax && empty($tab['loaded']))
                <div class="featured-tabs-loading py-5 text-center cl-text-2">{{ __('Loading...') }}</div>
            @else
                <p class="text-center text-muted py-4">{{ __('No products available in this tab.') }}</p>
            @endif
            </div>
        </div>
    @endforeach
</div>
