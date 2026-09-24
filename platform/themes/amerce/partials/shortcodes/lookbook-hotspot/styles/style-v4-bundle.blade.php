@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    /**
     * `tf-lookbook-hover lookbook-hover-v2` — banner LEFT (with pinned dropdowns) +
     * Bundle & Save right column (numbered bundle-prd-v2 cards). Mirrors home-furniture
     * §7 demo (lines 2338-2557).
     *
     *   <div class="container"><div class="row gy-30">
     *     <div class="col-lg-6">
     *       <div class="banner-lookbook wrap-lookbook_hover">
     *         <img class="img-banner" .../>
     *         <div class="lookbook-item position{N}">                <-- one per hotspot
     *           <div class="dropdown ...">
     *             <div class="tf-pin-btn bundle-pin-item swiper-button" data-slide="N-1" id="pinN" ...>
     *               <span></span>
     *             </div>
     *             <div class="dropdown-menu">                        <-- mini lookbook-product card
     *               <div class="lookbook-product"><a class="image"><img/></a>
     *                 <div class="content"><a class="name-prd">{name}</a>
     *                   <div class="price-wrap">{price-new}{price-old}</div></div></div>
     *             </div>
     *           </div>
     *         </div>
     *       </div>
     *     </div>
     *     <div class="col-lg-6">
     *       <div class="bundle-hover-wrap">
     *         <div class="sect-heading type-2"><h3>Bundle & Save</h3><p>{subtitle}</p></div>
     *         <ul class="bundle-list">
     *           <li class="bundle-prd-v2 bundle-hover-item pin{N}">
     *             <div class="prd-order"><span>{N}</span></div>
     *             <div class="prd-image"><img/></div>
     *             <div class="prd-info"><a class="info_name">{name}</a></div>
     *             <div class="prd-price price-wrap">{price-new}{price-old}</div>
     *           </li>
     *         </ul>
     *       </div>
     *     </div>
     *   </div></div>
     *
     * Pin numbering ties pin#N → bundle item .pinN via shared class for hover sync
     * (theme JS handles cross-highlight).
     *
     * Demo's color/material select dropdowns inside each bundle card are NOT rendered
     * here (would require per-product variation data). The base bundle-prd-v2 markup
     * + numbered cards + names + prices is the v1 deliverable.
     *
     * Hotspot data comes from parent index — uses each hotspot's product.
     * Right-column "Bundle & Save" subtitle comes from `subtitle` attr (default copy fallback).
     */
    $bannerImage = $shortcode->image ?? null;
    $bundleHeading  = trim((string) ($shortcode->bundle_heading ?? __('Bundle & Save')));
    $bundleSubtitle = trim((string) ($shortcode->bundle_subtitle ?? ($shortcode->subtitle ?? '')));

    // Pin position class names follow demo: position10, position11, position12 (etc).
    // Allows per-hotspot positioning via theme CSS.
    $positions = ['position10', 'position11', 'position12', 'position13', 'position14', 'position15'];

    // Dropdown placement alternates per demo (dropend / dropstart) for visual balance.
    $dropdowns = ['dropdown dropup-center dropdown-custom dropend', 'dropdown dropup-center dropdown-custom dropstart'];
@endphp

<div class="container">
    <div class="row gy-30">
        <div class="col-lg-6">
            <div class="banner-lookbook wrap-lookbook_hover">
                @if ($bannerImage)
                    {!! RvMedia::image($bannerImage, 'lookbook', 'hero-banner', false, ['class' => 'img-banner', 'loading' => 'lazy', 'width' => 885, 'height' => 720]) !!}
                @endif
                @foreach ($hotspots as $i => $h)
                    @php
                        $product = $h['product'];
                        $pinNum  = $i + 1;
                        $position = $positions[$i] ?? 'position15';
                        $dropdown = $dropdowns[$i % 2];
                        $priceNew = format_price($product->front_sale_price_with_taxes ?? $product->sale_price ?? $product->price);
                        $priceOld = ($product->front_sale_price && $product->front_sale_price < $product->price)
                            ? format_price($product->price) : null;
                    @endphp
                    <div class="lookbook-item {{ $position }}">
                        <div class="{{ $dropdown }}">
                            <div role="dialog"
                                 class="tf-pin-btn @if ($i === 0) style-2 @endif bundle-pin-item swiper-button"
                                 data-slide="{{ $i }}"
                                 id="pin{{ $pinNum }}"
                                 data-bs-toggle="dropdown"
                                 aria-expanded="false">
                                <span></span>
                            </div>
                            <div class="dropdown-menu">
                                <div class="lookbook-product">
                                    <a href="{{ $product->url ?: '#' }}" class="image">
                                        {!! RvMedia::image($product->image ?? null, $product->name, 'thumb', false, ['width' => 88, 'height' => 88, 'loading' => 'lazy']) !!}
                                    </a>
                                    <div class="content">
                                        <a href="{{ $product->url ?: '#' }}"
                                           class="name-prd text-body-1 fw-medium link-underline-primary text-line-clamp-2">
                                            {!! BaseHelper::clean($product->name) !!}
                                        </a>
                                        <div class="price-wrap">
                                            <span class="price-new text-primary fw-semibold">{{ $priceNew }}</span>
                                            @if ($priceOld)
                                                <span class="price-old text-caption-01 cl-text-3">{{ $priceOld }}</span>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
        <div class="col-lg-6">
            <div class="bundle-hover-wrap">
                <div class="sect-heading type-2 wow fadeInUp">
                    <h3 class="s-title">{!! BaseHelper::clean($bundleHeading) !!}</h3>
                    @if ($bundleSubtitle !== '')
                        <p class="s-desc cl-text-2 text-body-1">{!! BaseHelper::clean($bundleSubtitle) !!}</p>
                    @endif
                </div>
                <ul class="bundle-list wow fadeInUp">
                    @foreach ($hotspots as $i => $h)
                        @php
                            $product = $h['product'];
                            $pinNum  = $i + 1;
                            $priceNew = format_price($product->front_sale_price_with_taxes ?? $product->sale_price ?? $product->price);
                            $priceOld = ($product->front_sale_price && $product->front_sale_price < $product->price)
                                ? format_price($product->price) : null;
                        @endphp
                        <li class="bundle-prd-v2 bundle-hover-item pin{{ $pinNum }}">
                            <div class="prd-order">
                                <span>{{ $pinNum }}</span>
                            </div>
                            <div class="prd-image">
                                {!! RvMedia::image($product->image ?? null, $product->name, 'thumb', false, ['width' => 100, 'height' => 100, 'loading' => 'lazy']) !!}
                            </div>
                            <div class="prd-info">
                                <a href="{{ $product->url ?: '#' }}"
                                   class="info_name fw-medium link link-underline text-line-clamp-1">
                                    {!! BaseHelper::clean($product->name) !!}
                                </a>
                            </div>
                            <div class="prd-price price-wrap">
                                <span class="price-new text-primary fw-semibold">{{ $priceNew }}</span>
                                @if ($priceOld)
                                    <span class="price-old text-caption-01 cl-text-3">{{ $priceOld }}</span>
                                @endif
                            </div>
                        </li>
                    @endforeach
                </ul>
            </div>
        </div>
    </div>
</div>
