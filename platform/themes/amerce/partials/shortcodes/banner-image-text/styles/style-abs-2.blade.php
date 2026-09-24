{{-- Mirrors html/home-electronics.html §7 (lines 4280-4304):
     `banner-image-text type-abs style-2` — wide landscape (1410x460) banner with
     absolute-positioned text overlay (left-aligned), white h1 + white desc + white CTA.
     Layout CSS for `.banner-image-text.type-abs.style-2` lives in
     assets/sass/component/_inline-migrated.scss. --}}
<div class="container">
    <div class="banner-image-text type-abs style-2">
        <a href="{{ $shortcode->button_url ?: '#' }}" class="bn-image img-style">
            {!! RvMedia::image($shortcode->image, $shortcode->heading ?? '', 'hero-banner', false, ['width' => 1410, 'height' => 460, 'class' => 'w-100', 'loading' => 'lazy']) !!}
        </a>
        <div class="bn-content wow fadeInUp">
            @if (! empty($shortcode->heading ?? ''))
                <a href="{{ $shortcode->button_url ?: '#' }}" class="title h1 fw-medium text-white link">
                    {!! BaseHelper::clean($shortcode->heading) !!}
                </a>
            @endif
            @if (! empty($shortcode->subheading ?? ''))
                <p class="desc text-white text-body-1 mt-10">
                    {!! BaseHelper::clean($shortcode->subheading) !!}
                </p>
            @endif
            @if (! empty($shortcode->button_text ?? ''))
                <a href="{{ $shortcode->button_url ?: '#' }}" class="btn-action tf-btn btn-white mt-30">
                    {!! BaseHelper::clean($shortcode->button_text) !!}
                </a>
            @endif
        </div>
    </div>
</div>
