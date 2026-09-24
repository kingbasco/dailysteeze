@php
    $bg = RvMedia::getImageUrl($shortcode->image ?? $shortcode->background_image ?? null, 'hero-banner');
    $height = (int) ($shortcode->height ?? 420);
    $alignment = in_array($shortcode->text_alignment ?? '', ['left', 'center', 'right'], true)
        ? $shortcode->text_alignment
        : 'center';
    // Circular rotating text overlay (e.g. "AMERCE - AMERCE - AMERCE -") is
    // used by html/home-furniture.html line 1572-1577. When `circular_text`
    // attr is non-empty, render the wg-circular-text wrapper that the theme
    // JS picks up via #circularText.
    $circularText = trim((string) ($shortcode->circular_text ?? ''));
@endphp

<div class="container-full">
    <div class="banner-image-parallax parallaxie radius-10 overflow-hidden"
        data-bg="{{ $bg }}"
        style="min-height: {{ $height }}px; background-image: url('{{ $bg }}'); background-size: cover; background-position: center;">
        @if ($circularText !== '' || ! empty($shortcode->subheading ?? '') || ! empty($shortcode->heading ?? '') || ! empty($shortcode->button_text ?? ''))
            <div class="content text-{{ $alignment }} py-5 px-4">
                @if (! empty($shortcode->subheading ?? ''))
                    <p class="sub-text text-body-1 text-white mb-15">{!! BaseHelper::clean($shortcode->subheading) !!}</p>
                @endif
                @if (! empty($shortcode->heading ?? ''))
                    <h2 class="heading fw-medium text-white">{!! BaseHelper::clean($shortcode->heading) !!}</h2>
                @endif
                @if (! empty($shortcode->button_text ?? ''))
                    <a href="{{ $shortcode->button_url ?: '#' }}" class="tf-btn btn-white animate-hover-btn radius-3 mt-30">
                        <span>{!! BaseHelper::clean($shortcode->button_text) !!}</span>
                    </a>
                @endif
            </div>
        @endif
    </div>
</div>
@if ($circularText !== '')
    {{-- Circular rotating text — the wg-circular-text widget. The theme
         JS finds #circularText and renders the .original-text into a circular layout. --}}
    <div class="wg-circular-text">
        <p class="original-text">{!! BaseHelper::clean($circularText) !!}</p>
        <div class="circular-text" id="circularText"></div>
    </div>
@endif
