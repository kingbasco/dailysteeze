@php
    /**
     * parallax-banner style-3 — container-width `banner-v04 parallaxie` promo.
     * Mirrors html/home-office-equipment.html line 3649 (the "Perfectly Balanced
     * Work Kit" banner): bg-image fills a radius box, left-aligned white heading +
     * desc + button. The index wraps this in `flat-spacing pb-0 > container`.
     *
     * Wide banner art (demo banner-65.jpg is 1410×460) — pass the original image,
     * NOT an RvMedia size string, which would double-crop the strip.
     */
    $imageUrl = RvMedia::getImageUrl($shortcode->image ?? $shortcode->background_image ?? null);
@endphp

<div class="banner-v04 parallaxie" style="background-image: url('{{ $imageUrl }}')">
    <div class="bn_image">
        <img class="opacity-0 aspect-ratio-0" loading="lazy" width="1410" height="460"
            src="{{ $imageUrl }}" alt="{{ BaseHelper::clean($shortcode->heading ?? '') }}">
    </div>
    <div class="bn_content">
        <div class="wrap wow fadeInUp">
            @if (! empty($shortcode->heading ?? ''))
                <h1 class="title mb-12">
                    <a href="{{ $shortcode->button_url ?: '#' }}" class="text-white link">{!! BaseHelper::clean($shortcode->heading) !!}</a>
                </h1>
            @endif
            @if (! empty($shortcode->subheading ?? ''))
                <p class="desc text-body-1 text-white mb-32">{!! BaseHelper::clean($shortcode->subheading) !!}</p>
            @endif
            @if (! empty($shortcode->button_text ?? ''))
                <a href="{{ $shortcode->button_url ?: '#' }}" class="tf-btn btn-white">
                    {!! BaseHelper::clean($shortcode->button_text) !!}
                </a>
            @endif
        </div>
    </div>
</div>
