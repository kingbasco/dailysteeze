@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    /**
     * 3-column composite (home-construction §4 pattern).
     * Mirrors html/home-construction.html lines 3694-3744 — `section-thumbs-arrival style-2`:
     *   <section class="section-thumbs-arrival style-2 flat-spacing">
     *     <div class="container-full">
     *       <div class="tf-grid-layout xl-col-3 md-col-2 gap-15">
     *         <div class="content order-1 order-md-0">                  <-- LEFT: heading + thumbs-prd card
     *           <div class="heading">
     *             <p class="h6">{overline}</p>
     *             <h1>{heading}</h1>
     *             <p class="text-body-1 cl-text-2">{description}</p>
     *           </div>
     *           <div class="thumbs-prd">                                 <-- single-product card
     *             <div class="prd-image"><img.../></div>
     *             <div class="prd-info">name + price-wrap (new + old)</div>
     *             <div class="prd-action">Add to Cart icon</div>
     *           </div>
     *         </div>
     *         <div class="hover-img4"><div class="img-style4 w-100 h-100"><img.../></div></div>  <-- 2 banner images RIGHT
     *         <div class="hover-img4 d-none d-xl-block"><.../></div>
     *
     * Single product driven by first product_ids id (or featured_* overrides).
     * 2 right banners come from `banner_image_1` + `banner_image_2` shortcode attrs.
     *
     * The parent index emits the outer <section class="tf-section banner-thumbs-product
     * banner-thumbs-style-thumbs-arrival"> wrapper — this partial only renders the inner
     * `section-thumbs-arrival style-2` markup so the demo's distinctive class hook is
     * present in the output.
     */
    $overline    = trim((string) ($shortcode->overline ?? ''));
    $heading     = trim((string) ($shortcode->heading ?? ''));
    $description = trim((string) ($shortcode->description ?? ''));

    $product = $products->first();

    $featuredName  = trim((string) ($shortcode->featured_name ?? ($product?->name ?? '')));
    $featuredImg   = trim((string) ($shortcode->featured_image ?? ''));
    $featuredImg   = $featuredImg !== '' ? $featuredImg : ($product?->image ?? null);
    $featuredPrice = trim((string) ($shortcode->featured_price ?? ''));
    $featuredOld   = trim((string) ($shortcode->featured_old_price ?? ''));
    $productUrl    = $product?->url ?: '#';

    if ($featuredPrice === '' && $product) {
        $featuredPrice = format_price($product->front_sale_price_with_taxes ?? $product->sale_price ?? $product->price);
    }
    if ($featuredOld === '' && $product && $product->front_sale_price && $product->front_sale_price < $product->price) {
        $featuredOld = format_price($product->price);
    }

    $banner1 = trim((string) ($shortcode->banner_image_1 ?? ''));
    $banner2 = trim((string) ($shortcode->banner_image_2 ?? ''));
@endphp

<section class="section-thumbs-arrival style-2 flat-spacing">
    <div class="container-full">
        <div class="tf-grid-layout xl-col-3 md-col-2 gap-15">
            <div class="content order-1 order-md-0">
                <div class="heading">
                    @if ($overline !== '')
                        <p class="h6">{!! BaseHelper::clean($overline) !!}</p>
                    @endif
                    @if ($heading !== '')
                        <h1>{!! BaseHelper::clean($heading) !!}</h1>
                    @endif
                    @if ($description !== '')
                        <p class="text-body-1 cl-text-2">{!! BaseHelper::clean($description) !!}</p>
                    @endif
                </div>
                @if ($featuredImg || $featuredName)
                    <div class="thumbs-prd">
                        @if ($featuredImg)
                            <div class="prd-image">
                                {!! RvMedia::image($featuredImg, $featuredName, 'thumb', false, ['width' => 100, 'height' => 100, 'loading' => 'lazy']) !!}
                            </div>
                        @endif
                        <div class="prd-info">
                            @if ($featuredName !== '')
                                <a href="{{ $productUrl }}" class="info_name text-body-1 link">
                                    {!! BaseHelper::clean($featuredName) !!}
                                </a>
                            @endif
                            @if ($featuredPrice !== '' || $featuredOld !== '')
                                <div class="info_price">
                                    <div class="price-wrap">
                                        @if ($featuredPrice !== '')
                                            <span class="price-new font-outfit">{{ $featuredPrice }}</span>
                                        @endif
                                        @if ($featuredOld !== '')
                                            <span class="price-old text-caption-01 cl-text-2 font-outfit">{{ $featuredOld }}</span>
                                        @endif
                                    </div>
                                </div>
                            @endif
                        </div>
                        <div class="prd-action">
                            <a href="#shoppingCart" data-bs-toggle="offcanvas"
                                class="hover-tooltip tooltip-left btn-action">
                                <i class="icon icon-Handbag"></i>
                                <span class="tooltip">{{ __('Add to Cart') }}</span>
                            </a>
                        </div>
                    </div>
                @endif
            </div>
            @if ($banner1)
                <div class="hover-img4">
                    <div class="img-style4 w-100 h-100">
                        {!! RvMedia::image($banner1, $heading ?: 'banner', attributes: ['width' => 580, 'height' => 580, 'loading' => 'lazy', 'class' => 'img-cove']) !!}
                    </div>
                </div>
            @endif
            @if ($banner2)
                <div class="hover-img4 d-none d-xl-block">
                    <div class="img-style4 w-100 h-100">
                        {!! RvMedia::image($banner2, $heading ?: 'banner', attributes: ['width' => 580, 'height' => 580, 'loading' => 'lazy', 'class' => 'img-cove']) !!}
                    </div>
                </div>
            @endif
        </div>
    </div>
</section>
