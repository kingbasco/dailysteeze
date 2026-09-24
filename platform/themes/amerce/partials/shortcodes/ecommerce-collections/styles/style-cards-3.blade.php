@php
    /**
     * 3-card collection row matching home-jewelry.html "Section Collection"
     * (lines 1851-1903): tf-grid-layout md-col-3 with category-v07 cards.
     * Each card shows image + name + "Shop Now" inline link.
     *
     * Knobs:
     *   card_image_size — RvMedia size string for the card image. Default
     *                     'thumb' (400x400 SQUARE — back-compat with HomeFurniture
     *                     / HomeElectronics callers). HomeJewelry §5 demo art is
     *                     landscape 457x320 → pass 'original' (falsey RvMedia size)
     *                     to render the original aspect without center-cropping.
     *                     Allowlist: 'thumb' | 'product-list' | 'hero-banner' | 'original'.
     */
    $cardImageSizeRaw = trim((string) ($shortcode->card_image_size ?? 'thumb'));
    $cardImageSizeAllowed = ['thumb', 'product-list', 'hero-banner', 'original'];
    if (! in_array($cardImageSizeRaw, $cardImageSizeAllowed, true)) {
        $cardImageSizeRaw = 'thumb';
    }
    $cardImageSize = $cardImageSizeRaw === 'original' ? false : $cardImageSizeRaw;
@endphp

<div class="tf-grid-layout md-col-3 gap-20">
    @foreach ($collections as $collection)
        <div class="category-v07 hover-img4">
            <a href="{{ $collection->url ?: '#' }}" class="cate-image img-style4 mb-15">
                {!! \Botble\Media\Facades\RvMedia::image($collection->image, $collection->name, $cardImageSize, false, ['loading' => 'lazy']) !!}
            </a>
            <div class="cate-content">
                <a href="{{ $collection->url ?: '#' }}" class="cate_name h5 fw-medium d-block link mb-8">
                    {{ $collection->name }}
                </a>
                <a href="{{ $collection->url ?: '#' }}" class="btn-action tf-btn-line-2 style-primary">
                    <span class="text-caption-01 fw-semibold">{{ __('Shop Now') }}</span>
                </a>
            </div>
        </div>
    @endforeach
</div>
