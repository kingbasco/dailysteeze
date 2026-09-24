@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    /**
     * lookbook-hotspot style-decor-swiper-banners — 1-up numbered swiper of
     * shoppable `banner-lookbook wrap-lookbook_hover style-2` cards with a
     * `box-nav-pag` "Shop The Look" prev/next/fraction navigation footer.
     *
     * Mirrors html/home-decor.html §5 (lines 1813-1992): two 1920x640 banners,
     * each with 2 preset-position pins (position4 + position5), wrapped in
     * `<div class="container-full-3">` and the demo's `swiper-type-number
     * rounded-top-20` swiper class. The index renders no outer flat-spacing
     * for this style — only a `<section class="lookbook-hotspot
     * lookbook-style-decor-swiper-banners">` wrapper.
     *
     * Hotspots use the same `column` split as style-swiper-banners (column 1
     * → first banner, column 2 → second banner). Up to 2 pins per banner.
     *
     * Knobs (shortcode attrs):
     *   nav_title — "Shop The Look" (default). Drives the box-nav-pag h6 label.
     */
    $hotspots = $hotspots ?? [];
    $image1   = $shortcode->image ?? null;
    $image2   = $shortcode->image_2 ?? null;
    $navTitle = trim((string) ($shortcode->nav_title ?? '')) ?: __('Shop The Look');

    // Split hotspots into the two banners by `column` (default column 1).
    $banner1Pins = [];
    $banner2Pins = [];
    foreach ($hotspots as $h) {
        if ((int) ($h['column'] ?? 1) === 2) {
            $banner2Pins[] = $h;
        } else {
            $banner1Pins[] = $h;
        }
    }

    $banners = [];
    if (! empty($image1)) {
        $banners[] = ['image' => $image1, 'pins' => $banner1Pins];
    }
    if (! empty($image2)) {
        $banners[] = ['image' => $image2, 'pins' => $banner2Pins];
    }
@endphp

<div class="container-full-3">
    <div dir="ltr" class="swiper tf-swiper swiper-type-number rounded-top-20"
         data-preview="1" data-tablet="1" data-mobile-sm="1" data-mobile="1"
         data-loop="true" data-pagination-fraction="true">
        <div class="swiper-wrapper">
            @foreach ($banners as $banner)
                <div class="swiper-slide">
                    <div class="banner-lookbook wrap-lookbook_hover style-2">
                        {!! RvMedia::image($banner['image'], '', false, false, ['class' => 'img-banner', 'loading' => 'lazy', 'width' => 1920, 'height' => 640]) !!}

                        @foreach (array_slice($banner['pins'], 0, 2) as $i => $h)
                            @php $product = $h['product']; @endphp
                            <div class="lookbook-item position{{ 4 + $i }}">
                                <div class="dropdown dropup-center dropdown-custom {{ $i === 0 ? 'dropend' : 'dropstart' }}">
                                    <div role="dialog" class="tf-pin-btn bundle-pin-item" data-bs-toggle="dropdown"
                                         aria-expanded="false" aria-label="{{ __('View product :name', ['name' => $product->name]) }}">
                                        <span></span>
                                    </div>
                                    <div class="dropdown-menu pst-2">
                                        <div class="lookbook-product">
                                            <a href="{{ $product->url ?: '#' }}" class="image">
                                                {!! RvMedia::image($product->image ?? null, $product->name, 'thumb', false, ['width' => 88, 'height' => 88]) !!}
                                            </a>
                                            <div class="content">
                                                <a href="{{ $product->url ?: '#' }}" class="name-prd link fw-medium lh-24 text-line-clamp-2">
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
                </div>
            @endforeach
        </div>

        <div class="box-nav-pag">
            <p class="title lh-24">{!! BaseHelper::clean($navTitle) !!}</p>
            <div class="nav-pag_wrap">
                <div class="nav-prev-swiper">
                    <i class="icon icon-ArrowLeft"></i>
                </div>
                <div class="pagination-fraction text-body-1"></div>
                <div class="nav-next-swiper">
                    <i class="icon icon-ArrowRight"></i>
                </div>
            </div>
        </div>
    </div>
</div>
