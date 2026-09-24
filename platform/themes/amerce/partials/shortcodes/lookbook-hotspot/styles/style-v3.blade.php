@php
    $image1 = $shortcode->image ?? null;
    $image2 = $shortcode->image_2 ?? null;
    $columns = [
        1 => array_values(array_filter($hotspots, fn ($h) => ($h['column'] ?? 1) === 1)),
        2 => array_values(array_filter($hotspots, fn ($h) => ($h['column'] ?? 1) === 2)),
    ];

    // Mini-list (optional, home-jewelry §10): when miniListProducts is non-empty, render
    // col-xl-8 lookbook (existing 2-banner layout) + col-xl-4 mini-list (heading + carousel).
    // Otherwise keep current full-width 2-col lookbook layout.
    $hasMiniList   = isset($miniListProducts) && $miniListProducts->isNotEmpty();
    $miniListTitle    = trim((string) ($shortcode->mini_list_title ?? ''));
    $miniListSubtitle = trim((string) ($shortcode->mini_list_subtitle ?? ''));

    // `wide` (default no) — the no-mini-list branch normally sits in a centered
    // `container`. HomeSport's demo §7 (html/home-sport.html line 2421) uses a
    // near-full-width `px-20` wrapper instead; opt in without affecting the
    // container-based variants (HomeConstruct, HomeOffice).
    $noMiniListWrapper = ($shortcode->wide ?? 'no') === 'yes' ? 'px-20' : 'container';
@endphp

@if ($hasMiniList)
    {{-- Composite layout: lookbook LEFT (col-xl-8) + mini-list RIGHT (col-xl-4). --}}
    <div class="container">
        <div class="row">
            <div class="col-xl-8 col-md-6">
                <div class="tf-grid-layout xl-col-2 gap-10 h-100">
                    @foreach ([1 => $image1, 2 => $image2] as $col => $img)
                        <div class="banner-lookbook wrap-lookbook_hover w-100 h-100">
                            {!! RvMedia::image($img, '', 'hero-banner', false, ['class' => 'img-banner', 'loading' => 'lazy']) !!}
                            @foreach ($columns[$col] as $h)
                                @php $product = $h['product']; @endphp
                                <div class="lookbook-item" style="left: {{ $h['x'] }}%; top: {{ $h['y'] }}%;">
                                    <div class="dropdown dropup-center dropdown-custom">
                                        <button type="button" class="tf-pin-btn bundle-pin-item swiper-button"
                                            data-bs-toggle="dropdown" aria-expanded="false"
                                            aria-label="{{ __('View product :name', ['name' => $product->name]) }}">
                                            <span></span>
                                        </button>
                                        <div class="dropdown-menu">
                                            <div class="lookbook-product">
                                                <a href="{{ $product->url ?: '#' }}" class="image">
                                                    {!! RvMedia::image($product->image ?? null, $product->name, 'thumb', false, ['width' => 88, 'height' => 88]) !!}
                                                </a>
                                                <div class="content">
                                                    <a href="{{ $product->url ?: '#' }}"
                                                        class="name-prd text-body-1 fw-medium link-underline-primary text-line-clamp-2">
                                                        {!! BaseHelper::clean($product->name) !!}
                                                    </a>
                                                    <div class="price-wrap">
                                                        <span class="price-new text-primary fw-semibold">{!! format_price($product->front_sale_price_with_taxes ?? $product->price) !!}</span>
                                                        @if ($product->front_sale_price && $product->front_sale_price < $product->price)
                                                            <span class="price-old text-caption-01 cl-text-3">{!! format_price($product->price) !!}</span>
                                                        @endif
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    @endforeach
                </div>
            </div>

            <div class="col-xl-4 col-md-6">
                @if ($miniListTitle !== '' || $miniListSubtitle !== '')
                    <div class="heading mb-36">
                        @if ($miniListTitle !== '')
                            <h3 class="mb-8">{!! BaseHelper::clean($miniListTitle) !!}</h3>
                        @endif
                        @if ($miniListSubtitle !== '')
                            <p class="cl-text-2 text-body-1">{!! BaseHelper::clean($miniListSubtitle) !!}</p>
                        @endif
                    </div>
                @endif

                <div class="tf-sw-mobile swiper" data-screen="767" data-preview-md="2" data-preview="1" data-space="15">
                    <div class="swiper-wrapper wrap-product">
                        @foreach ($miniListProducts as $i => $product)
                            <div class="swiper-slide">
                                <div id="prd-{{ $i + 1 }}" class="card-product product-style_mini_list-v2">
                                    <div class="card-product_wrapper">
                                        <a href="{{ $product->url ?: '#' }}" class="product-img">
                                            {!! RvMedia::image($product->image ?? null, $product->name, 'thumb', false, ['class' => 'img-product', 'width' => 140, 'height' => 140, 'loading' => 'lazy']) !!}
                                        </a>
                                    </div>
                                    <div class="card-product_info">
                                        <a href="{{ $product->url ?: '#' }}"
                                            class="name-product text-body-1 fw-medium link-underline-text">
                                            {!! BaseHelper::clean($product->name) !!}
                                        </a>
                                        <div class="price-wrap mb-16 font-outfit">
                                            <span class="price-new">{!! format_price($product->front_sale_price_with_taxes ?? $product->price) !!}</span>
                                            @if ($product->front_sale_price && $product->front_sale_price < $product->price)
                                                <span class="price-old text-caption-01 cl-text-2">{!! format_price($product->price) !!}</span>
                                            @endif
                                        </div>
                                        <a href="{{ $product->url ?: '#' }}" class="tf-btn animate-btn">
                                            <span class="text fw-semibold">{{ __('View Product') }}</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                    <div class="sw-dot-default sw-pagination-mb d-flex d-md-none"></div>
                </div>
            </div>
        </div>
    </div>
@else
    {{-- Fallback: 2-col full-width lookbook (no mini-list). --}}
    <div class="{{ $noMiniListWrapper }}">
        @if (! empty($shortcode->title ?? '') || ! empty($shortcode->subtitle ?? ''))
            <div class="sect-heading type-2 text-center wow fadeInUp mb-30">
                @if (! empty($shortcode->title ?? ''))
                    <h3 class="s-title">{!! BaseHelper::clean($shortcode->title) !!}</h3>
                @endif
                @if (! empty($shortcode->subtitle ?? ''))
                    <p class="s-desc text-body-1 cl-text-2">{!! BaseHelper::clean($shortcode->subtitle) !!}</p>
                @endif
            </div>
        @endif
        <div class="tf-grid-layout xl-col-2 gap-10">
            @foreach ([1 => $image1, 2 => $image2] as $col => $img)
                <div class="banner-lookbook wrap-lookbook_hover style-2 overflow-hidden radius-10">
                    {!! RvMedia::image($img, '', 'hero-banner', false, ['class' => 'img-banner', 'loading' => 'lazy']) !!}
                @foreach ($columns[$col] as $h)
                    @php $product = $h['product']; @endphp
                    <div class="lookbook-item" style="left: {{ $h['x'] }}%; top: {{ $h['y'] }}%;">
                        <div class="dropdown dropup-center dropdown-custom">
                            <button type="button" class="tf-pin-btn bundle-pin-item swiper-button"
                                data-bs-toggle="dropdown" aria-expanded="false"
                                aria-label="{{ __('View product :name', ['name' => $product->name]) }}">
                                <span></span>
                            </button>
                            <div class="dropdown-menu">
                                <div class="lookbook-product">
                                    <a href="{{ $product->url ?: '#' }}" class="image">
                                        {!! RvMedia::image($product->image ?? null, $product->name, 'thumb', false, ['width' => 88, 'height' => 88]) !!}
                                    </a>
                                    <div class="content">
                                        <a href="{{ $product->url ?: '#' }}"
                                            class="name-prd text-body-1 fw-medium link-underline-primary text-line-clamp-2">
                                            {!! BaseHelper::clean($product->name) !!}
                                        </a>
                                        <div class="price-wrap">
                                            <span class="price-new text-primary fw-semibold">{!! format_price($product->front_sale_price_with_taxes ?? $product->price) !!}</span>
                                            @if ($product->front_sale_price && $product->front_sale_price < $product->price)
                                                <span class="price-old text-caption-01 cl-text-3">{!! format_price($product->price) !!}</span>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
                </div>
            @endforeach
        </div>
    </div>
@endif
