@php
    /**
     * Left-anchored absolute-content banner used by home-mental Section 5
     * (Nature's Support / Vaccines Keep You Strong). Mirrors
     * html/home-mental.html lines 3083-3120 (`banner-image-text type-abs style-1`).
     *
     * Renders one card; the seeder emits two of these wrapped in a
     * `tf-grid-layout md-col-2` container to get the side-by-side layout.
     */
    $delay = $shortcode->wow_delay ?? null;
@endphp

<div class="container">
    <div class="banner-image-text type-abs style-1 wow fadeInLeft" @if ($delay) data-wow-delay="{{ $delay }}" @endif>
        <a href="{{ $shortcode->button_url ?: '#' }}" class="bn-image img-style">
            {!! RvMedia::image($shortcode->image, $shortcode->heading ?? '', 'medium', false, ['width' => 690, 'height' => 388, 'loading' => 'lazy']) !!}
        </a>
        <div class="bn-content">
            @if (! empty($shortcode->heading ?? ''))
                <a href="{{ $shortcode->button_url ?: '#' }}" class="title h3 fw-medium text-white link-dark">
                    {!! BaseHelper::clean($shortcode->heading) !!}
                </a>
            @endif
            @if (! empty($shortcode->subheading ?? ''))
                <p class="desc text-white text-body-1">
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
