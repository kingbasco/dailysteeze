@php
    // Mirrors home-fashion.html `.banner-v01` markup. Theme.css doesn't yet ship
    // SCSS for `.banner-v01`, so we inline the size + positioning here:
    // - banner-v01 wrapper:   position:relative; constrained height; section margin
    // - bn_image img:         width:100%; height:100%; object-fit:cover  (image fills box)
    // - bn_content:           absolutely positioned over the image, vertical-centred
    // - infiniteSlide-text:   absolutely anchored to bottom of the box
    // Use the original image (no thumbnail size). The banner source is already
    // sized for a 1920x620 strip; the `hero-banner` 1920x1080 thumbnail forces a
    // taller aspect and crops the model's head off when the box is 620px tall.
    $imageUrl = RvMedia::getImageUrl($shortcode->image ?? $shortcode->background_image ?? null);
    $alignment = in_array($shortcode->text_alignment ?? '', ['left', 'center', 'right'], true)
        ? $shortcode->text_alignment
        : 'center';

    // subheading_position: render subheading 'above' or 'below' heading.
    // Default 'below' preserves fashion preset rendering. HomeFurniture §8 demo
    // (banner-v03 parallaxie, lines 2558-2586) has subheading ABOVE heading.
    // Added 2026-05-15 for HomeFurniture parity.
    $subheadingPosition = in_array($shortcode->subheading_position ?? '', ['above', 'below'], true)
        ? $shortcode->subheading_position
        : 'below';

    // Comma-separated phrases for the looping marquee under the banner.
    // Empty value disables the ribbon.
    $marqueeRaw = trim((string) ($shortcode->marquee_text ?? 'NEW SEASON PICKS, TRENDING STYLES, LIMITED DROPS'));
    $marqueeItems = array_filter(array_map('trim', explode(',', $marqueeRaw)));
@endphp

<div class="banner-v01">
    <div class="bn_image">
        <img loading="lazy" width="1920" height="620" src="{{ $imageUrl }}" alt="{{ BaseHelper::clean($shortcode->heading ?? '') }}">
    </div>

    <div class="bn_content" style="position:absolute; inset:0; display:flex; align-items:center;">
        <div class="container">
            <div class="text-{{ $alignment }}">
                @if ($subheadingPosition === 'above' && ! empty($shortcode->subheading ?? ''))
                    <p class="desc text-white mb-12 fw-medium text-uppercase">{!! BaseHelper::clean($shortcode->subheading) !!}</p>
                @endif

                @if (! empty($shortcode->heading ?? ''))
                    <div class="h1 title text-white mb-12">{!! BaseHelper::clean($shortcode->heading) !!}</div>
                @endif

                @if ($subheadingPosition !== 'above' && ! empty($shortcode->subheading ?? ''))
                    <p class="desc text-white mb-32">{!! BaseHelper::clean($shortcode->subheading) !!}</p>
                @endif

                @if (! empty($shortcode->button_text ?? ''))
                    <a href="{{ $shortcode->button_url ?: '#' }}" class="tf-btn btn-white {{ $subheadingPosition === 'above' ? 'mt-32' : '' }}">
                        <span>{!! BaseHelper::clean($shortcode->button_text) !!}</span>
                    </a>
                @endif
            </div>
        </div>
    </div>

    @if (! empty($marqueeItems))
        <div class="infiniteSlide-text wow fadeInUp" style="position:absolute; left:0; right:0; bottom:24px;">
            <div class="infiniteSlide infiniteSlide-wrapper" data-clone="5">
                @foreach ($marqueeItems as $item)
                    <p class="text h1 fw-semibold" style="color:transparent; -webkit-text-fill-color:transparent; -webkit-text-stroke:1px rgba(255,255,255,0.85); font-size:64px; line-height:1; letter-spacing:2px; white-space:nowrap; padding:0 24px; margin:0;">{!! BaseHelper::clean($item) !!}</p>
                @endforeach
            </div>
        </div>
    @endif
</div>
