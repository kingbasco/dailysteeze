@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    /**
     * lookbook-hotspot style-3-up-swiper-banners — `data-preview="3"` swiper of
     * full-width shoppable `banner-lookbook wrap-lookbook_hover` banners.
     * Mirrors html/home-bag-accessories.html §7 "Lookbook" (lines 2575-2688):
     * three 570x570 radius-20 banner slides inside `container-full`, each with
     * exactly one hotspot pin (preset position16/17/18) — no heading.
     *
     * Hotspots are split between the three banners by their `column` value
     * (1 → banner 1, 2 → banner 2, 3 → banner 3). Each banner takes only its
     * first matching pin and emits a single `lookbook-item position{16 + banner}`
     * matching the demo's hard-coded preset positions.
     *
     * Banner art is square (570x570) — passed as the original image (no RvMedia
     * size string would double-crop it).
     *
     * Section index wraps this in `<section class="tf-section flat-spacing lookbook-hotspot ...">`.
     */
    $hotspots = $hotspots ?? [];
    $image1 = $shortcode->image ?? null;
    $image2 = $shortcode->image_2 ?? null;
    $image3 = $shortcode->image_3 ?? null;

    // Split hotspots into the three banners by `column` (default column 1).
    $pinsByColumn = [1 => [], 2 => [], 3 => []];
    foreach ($hotspots as $h) {
        $col = (int) ($h['column'] ?? 1);
        if (! isset($pinsByColumn[$col])) {
            $col = 1;
        }
        $pinsByColumn[$col][] = $h;
    }

    $banners = [];
    foreach ([$image1, $image2, $image3] as $bIdx => $img) {
        if (! empty($img)) {
            $banners[] = ['image' => $img, 'pin' => $pinsByColumn[$bIdx + 1][0] ?? null];
        }
    }
@endphp

<div class="container-full">
    <div dir="ltr" class="swiper tf-swiper" data-preview="3" data-tablet="2" data-mobile-sm="1" data-mobile="1"
        data-space-lg="30" data-space-md="15" data-space="10"
        data-pagination="1" data-pagination-sm="1" data-pagination-md="2" data-pagination-lg="3">
        <div class="swiper-wrapper">
            @foreach ($banners as $i => $banner)
                <div class="swiper-slide">
                    <div class="banner-lookbook wrap-lookbook_hover">
                        {!! RvMedia::image($banner['image'], '', false, false, ['class' => 'img-banner radius-20', 'loading' => 'lazy', 'width' => 570, 'height' => 570]) !!}

                        @if ($banner['pin'] !== null)
                            @php $product = $banner['pin']['product']; @endphp
                            <div class="lookbook-item position{{ 16 + $i }}">
                                <div class="dropdown dropup-center dropdown-custom dropend">
                                    <div role="dialog" class="tf-pin-btn bundle-pin-item" data-bs-toggle="dropdown"
                                        aria-expanded="false" aria-label="{{ __('View product :name', ['name' => $product->name]) }}">
                                        <span></span>
                                    </div>
                                    <div class="dropdown-menu radius-20">
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
                        @endif
                    </div>
                </div>
            @endforeach
        </div>
        <div class="sw-line-default style-2 tf-sw-pagination"></div>
    </div>
</div>
