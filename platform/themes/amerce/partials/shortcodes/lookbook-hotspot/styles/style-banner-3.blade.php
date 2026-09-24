@php
    /**
     * lookbook-hotspot style-banner-3 — single full-width shoppable banner.
     * Mirrors html/home-office-equipment.html line 1824 (the workstation lookbook):
     * one `banner-lookbook style-3` image (935×640) with up to 3 fixed-position
     * pins (`lookbook-item position19/20/21`). The index wraps this in
     * `<section class="px-20 …">`.
     *
     * Unlike style-v1 (free x/y % placement), the demo uses the theme's preset
     * `position19..21` classes, so this style ignores x_percent/y_percent and
     * places pins at position{19 + index} for the first 3 hotspots.
     *
     * Wide banner art — pass the original image (no RvMedia size string), which
     * would double-crop the 935×640 source.
     */
    $hotspots = array_slice($hotspots ?? [], 0, 3);
@endphp

<div class="banner-lookbook style-3 wrap-lookbook_hover">
    {!! RvMedia::image($shortcode->image ?? null, BaseHelper::clean($shortcode->heading ?? ''), false, false, ['class' => 'img-banner radius-16', 'loading' => 'lazy', 'width' => 935, 'height' => 640]) !!}

    @foreach ($hotspots as $i => $h)
        @php $product = $h['product']; @endphp
        <div class="lookbook-item position{{ 19 + $i }}">
            <div class="dropdown dropup-center dropdown-custom dropstart">
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
