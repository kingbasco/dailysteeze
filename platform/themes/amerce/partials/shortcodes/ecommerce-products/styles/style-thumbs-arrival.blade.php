@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    /**
     * ecommerce-products style-thumbs-arrival — 2-col "New arrivals" block.
     *
     * Mirrors html/home-decor.html §6 (lines 1994-2133): LEFT col-lg-6 with
     *   tag → h3 title → desc → sw-main-thumb swiper of small 88x88 product cards
     * + RIGHT col-lg-6 with
     *   sw-thumb swiper of large 700x700 product images + prev/next nav arrows.
     *
     * Index wires this style with `container_class='sw-thumbs-arrival tf-sw-thumbs'`
     * + `section_class='section-thumbs-arrival flat-spacing'`. The blade emits the
     * `<div class="container"><div class="row">...` content.
     *
     * Knobs (PageSeeder attrs):
     *   - tag_text    — small uppercase eyebrow (default "New arrivals")
     *   - heading     — alias for $shortcode->title (already passed via index)
     *   - description — alias for $shortcode->subtitle (used as the long blurb)
     *   - main_image_size — RvMedia size for the 700x700 right swiper (default false=original)
     *   - thumb_image_size — RvMedia size for 88x88 left thumbs (default thumb)
     *
     * Products: $products is the standard collection passed from the parent
     * ecommerce-products query (source=latest by default). Both swipers iterate
     * the same product set — LEFT renders compact thumbs, RIGHT renders large images.
     */
    $tagText      = trim((string) ($shortcode->tag_text ?? '')) ?: __('New arrivals');
    $heading      = (string) ($shortcode->title ?? '');
    $description  = (string) ($shortcode->subtitle ?? '');
    $mainImgSize  = $shortcode->main_image_size ?? false; // false = original
    if ($mainImgSize === 'false' || $mainImgSize === '' || $mainImgSize === 'original') {
        $mainImgSize = false;
    }
    $thumbImgSize = trim((string) ($shortcode->thumb_image_size ?? '')) ?: 'thumb';

    // Clamp the product set to a single product so the LEFT thumb-swiper and the
    // RIGHT main-image-swiper always show the same data. Multiple slides drift
    // out of sync during JS init even with the carousel.js bi-directional
    // controller wire (theme-js L206-207) — single-slide rendering avoids it.
    $products = collect($products)->take(1)->values();
@endphp

<div class="container">
    <div class="row flex-wrap-reverse gy-4">
        {{-- LEFT: tag + title + desc + thumbs swiper (small 88x88 product cards) --}}
        <div class="col-lg-6">
            <div class="col-left h-100">
                @if ($tagText !== '')
                    <p class="tag mb-8 cl-text-3">{!! BaseHelper::clean($tagText) !!}</p>
                @endif
                @if ($heading !== '')
                    <h3 class="title mb-16">{!! BaseHelper::clean($heading) !!}</h3>
                @endif
                @if ($description !== '')
                    <p class="desc mb-32 cl-text-2">{!! BaseHelper::clean($description) !!}</p>
                @endif
                <div class="mt-auto">
                    <div dir="ltr" class="swiper sw-main-thumb mt-auto pb-20 mb--20">
                        <div class="swiper-wrapper">
                            @foreach ($products as $product)
                                @php
                                    $priceDisplay = format_price($product->front_sale_price_with_taxes ?? $product->sale_price ?? $product->price);
                                @endphp
                                <div class="swiper-slide">
                                    <div class="thumbs-prd">
                                        <div class="prd-image">
                                            {!! RvMedia::image($product->image ?? null, $product->name, $thumbImgSize, false, ['width' => 88, 'height' => 88, 'loading' => 'lazy']) !!}
                                        </div>
                                        <div class="prd-info">
                                            <a href="{{ $product->url ?: '#' }}" class="info_name text-body-1 link">
                                                {!! BaseHelper::clean($product->name) !!}
                                            </a>
                                            <p class="info_price">{!! $priceDisplay !!}</p>
                                        </div>
                                        <div class="prd-action">
                                            <a href="{{ $product->url ?: '#' }}" class="hover-tooltip tooltip-left btn-action">
                                                <i class="icon icon-Handbag"></i>
                                                <span class="tooltip">{{ __('Add to Cart') }}</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                        <div class="sw-line-default style-2 sw-pg-thumb d-xxl-none mt-30"></div>
                    </div>
                </div>
            </div>
        </div>

        {{-- RIGHT: large 700x700 main product images swiper with prev/next arrows --}}
        <div class="col-lg-6">
            <div class="col-right">
                <div dir="ltr" class="swiper sw-thumb">
                    <div class="swiper-wrapper">
                        @foreach ($products as $product)
                            <div class="swiper-slide">
                                <div class="sw-image">
                                    {!! RvMedia::image($product->image ?? null, $product->name, $mainImgSize, false, ['width' => 700, 'height' => 700, 'loading' => 'lazy']) !!}
                                </div>
                            </div>
                        @endforeach
                    </div>
                    <div class="group-action-nav_thumb">
                        <div class="tf-sw-nav-2 style-2 nav-prev-swiper">
                            <i class="icon icon-ArrowLeft"></i>
                        </div>
                        <div class="tf-sw-nav-2 style-2 nav-next-swiper">
                            <i class="icon icon-ArrowRight"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
