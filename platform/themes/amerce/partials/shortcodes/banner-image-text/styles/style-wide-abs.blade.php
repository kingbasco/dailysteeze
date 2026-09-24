@php
    /**
     * Wide promo banner with absolute-positioned content used by home-mental
     * Section 8 (Banner Text). Mirrors html/home-mental.html lines 3571-3596
     * (`banner-image-text type-abs style-14 type-2`).
     */
@endphp

<div class="container">
    <div class="banner-image-text type-abs style-14 type-2">
        <a href="{{ $shortcode->button_url ?: '#' }}" class="bn-image img-style">
            {!! RvMedia::image($shortcode->image, $shortcode->heading ?? '', 'hero-banner', false, [
                'width' => 1410,
                'height' => 400,
                'loading' => 'lazy',
                'style' => 'aspect-ratio: 1410 / 400; object-fit: cover; width: 100%; height: auto;'
            ]) !!}
        </a>
        <div class="bn-content wow fadeInUp">
            @if (! empty($shortcode->heading ?? ''))
                <a href="{{ $shortcode->button_url ?: '#' }}" class="title h2 fw-medium link">
                    {!! BaseHelper::clean($shortcode->heading) !!}
                </a>
            @endif
            @if (! empty($shortcode->subheading ?? ''))
                <p class="desc text-body-1 cl-text-2 sm-cl-black letter-space--1">
                    {!! BaseHelper::clean($shortcode->subheading) !!}
                </p>
            @endif
            @if (! empty($shortcode->button_text ?? ''))
                <a href="{{ $shortcode->button_url ?: '#' }}" class="btn-action tf-btn btn-white">
                    {!! BaseHelper::clean($shortcode->button_text) !!}
                </a>
            @endif
        </div>
    </div>
</div>
