@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    /**
     * lookbook-hotspot style-swiper-banners — a `data-preview="2"` swiper of
     * full-width shoppable `banner-lookbook wrap-lookbook_hover` banners.
     * Mirrors html/home-pod.html §5 "Lookbook" (lines 2052-2155): two 960×600
     * banner slides, each with preset-position pins (`lookbook-item position4/5/6`).
     *
     * Hotspots are split between the two banners by their `column` value
     * (1 → first banner, 2 → second banner). Within a banner the pins use the
     * theme's preset `position{4 + localIndex}` classes (the demo uses fixed
     * preset positions, NOT free x/y placement). Banner art is wide (960×600) —
     * passed as the original image (no RvMedia size string would double-crop it).
     *
     * The index wraps this in a bare `<div class="bare-section">` (zero vertical
     * padding) — see lookbook-hotspot/index.blade.php $sectionWrapper.
     */
    $hotspots = $hotspots ?? [];
    $image1 = $shortcode->image ?? null;
    $image2 = $shortcode->image_2 ?? null;

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

<div dir="ltr" class="swiper tf-swiper" data-preview="2" data-tablet="1" data-mobile-sm="1" data-mobile="1"
    data-space="0" data-pagination="1" data-pagination-sm="1" data-pagination-md="2" data-pagination-lg="2">
    <div class="swiper-wrapper">
        @foreach ($banners as $banner)
            <div class="swiper-slide">
                <div class="banner-lookbook wrap-lookbook_hover">
                    {!! RvMedia::image($banner['image'], '', false, false, ['class' => 'img-banner', 'loading' => 'lazy', 'width' => 960, 'height' => 600]) !!}

                    @foreach (array_slice($banner['pins'], 0, 3) as $i => $h)
                        @php $product = $h['product']; @endphp
                        <div class="lookbook-item position{{ 4 + $i }}">
                            <div class="dropdown dropup-center dropdown-custom dropend">
                                <div role="dialog" class="tf-pin-btn bundle-pin-item" data-bs-toggle="dropdown"
                                    aria-expanded="false" aria-label="{{ __('View product :name', ['name' => $product->name]) }}">
                                    <span></span>
                                </div>
                                <div class="dropdown-menu">
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
    <div class="sw-line-default style-2 tf-sw-pagination"></div>
</div>
