@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    /**
     * Mirrors html/home-baby.html §7 "Bundle" (lines 5185-5323): a centered
     * `sect-heading type-2` above a 2-up swiper. Each slide is a
     * `banner-lookbook wrap-lookbook_hover` banner image (690x640, radius-16)
     * carrying its own hotspot pins.
     *
     * Hotspots are grouped into slides by their `column` field (1, 2, 3...).
     * Each slide's banner image is taken from `image` (col 1), `image_2`
     * (col 2), `image_3` (col 3) on the shortcode.
     */
    $hotspots = collect($hotspots ?? []);

    // Group hotspots into slides keyed by column; preserve column order.
    $slides = $hotspots->groupBy('column')->sortKeys();

    $bannerFor = function (int $column) use ($shortcode) {
        $key = $column <= 1 ? 'image' : 'image_' . $column;
        return $shortcode->{$key} ?? ($shortcode->image ?? null);
    };
@endphp

<div class="container">
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

    @if ($slides->isNotEmpty())
        <div dir="ltr" class="swiper tf-swiper"
            data-preview="2" data-tablet="2" data-mobile-sm="2" data-mobile="1"
            data-space-lg="30" data-space-md="20" data-space="10"
            data-pagination="1" data-pagination-sm="2" data-pagination-md="2" data-pagination-lg="2">
            <div class="swiper-wrapper">
                @foreach ($slides as $column => $slideHotspots)
                    <div class="swiper-slide">
                        <div class="banner-lookbook wrap-lookbook_hover">
                            {!! RvMedia::image($bannerFor((int) $column), '', false, false, ['class' => 'img-banner radius-16', 'loading' => 'lazy', 'width' => 690, 'height' => 640]) !!}

                            @foreach ($slideHotspots as $i => $h)
                                @php
                                    $product = $h['product'];
                                    $dropDir = $i % 2 === 0 ? 'dropend' : 'dropstart';
                                @endphp
                                <div class="lookbook-item position-absolute" style="left: {{ $h['x'] }}%; top: {{ $h['y'] }}%;">
                                    <div class="dropdown dropup-center dropdown-custom {{ $dropDir }}">
                                        <button type="button" class="tf-pin-btn bundle-pin-item swiper-button"
                                            data-slide="{{ $loop->parent->index }}" data-bs-toggle="dropdown" aria-expanded="false"
                                            aria-label="{{ __('View product :name', ['name' => $product->name]) }}">
                                            <span></span>
                                        </button>
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
            <div class="sw-dot-default tf-sw-pagination"></div>
        </div>
    @endif
</div>
