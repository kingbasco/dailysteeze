@php
    /**
     * Wide promo banner with parallax bg-image (banner-v02 pattern).
     * Mirrors html/home-garden.html lines 2691-2714 (`banner-v02 parallaxie`):
     * full-bleed image as a CSS background, hidden img tag for layout sizing,
     * centered title + description + CTA.
     */
    $imageUrl = RvMedia::getImageUrl($shortcode->image);
@endphp

<section class="flat-spacing">
    <div class="banner-v02 parallaxie" style="background-image: url('{{ $imageUrl }}');">
        <div class="bn_image">
            <img class="opacity-0" loading="lazy" width="1920" height="620"
                src="{{ $imageUrl }}" alt="{{ $shortcode->heading ?? '' }}">
        </div>
        <div class="bn_content">
            <div class="wrap">
                @if (! empty($shortcode->heading ?? ''))
                    <h3 class="title">
                        {!! nl2br(BaseHelper::clean($shortcode->heading)) !!}
                    </h3>
                @endif
                @if (! empty($shortcode->subheading ?? ''))
                    <p class="desc text-body-1">
                        {!! nl2br(BaseHelper::clean($shortcode->subheading)) !!}
                    </p>
                @endif
                @if (! empty($shortcode->button_text ?? ''))
                    <a href="{{ $shortcode->button_url ?: '#' }}" class="tf-btn animate-btn">
                        {!! BaseHelper::clean($shortcode->button_text) !!}
                    </a>
                @endif
            </div>
        </div>
    </div>
</section>
