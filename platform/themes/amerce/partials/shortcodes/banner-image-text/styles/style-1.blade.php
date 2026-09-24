@php
    $textColor = $shortcode->text_color ?? '';
    $overlay   = $shortcode->overlay_color ?? '';
@endphp

<div class="banner-image-text type-abs style-15 position-relative">
    <div class="banner-image">
        {!! RvMedia::image($shortcode->image, $shortcode->heading ?? '', 'hero-banner', false, ['class' => 'w-100', 'loading' => 'lazy']) !!}
    </div>

    @if ($overlay)
        <div class="banner-overlay" style="background-color: {{ $overlay }};"></div>
    @endif

    <div class="banner-content text-center" @if ($textColor) style="color: {{ $textColor }};" @endif>
        <div class="container">
            @if (! empty($shortcode->heading ?? ''))
                <h2 class="heading fw-medium">{!! BaseHelper::clean($shortcode->heading) !!}</h2>
            @endif
            @if (! empty($shortcode->subheading ?? ''))
                <p class="subheading text-body-1 mt-10">{!! BaseHelper::clean($shortcode->subheading) !!}</p>
            @endif
            @if (! empty($shortcode->button_text ?? ''))
                <a href="{{ $shortcode->button_url ?: '#' }}" class="tf-btn btn-fill animate-hover-btn radius-3 mt-30">
                    <span>{!! BaseHelper::clean($shortcode->button_text) !!}</span>
                </a>
            @endif
        </div>
    </div>
</div>
