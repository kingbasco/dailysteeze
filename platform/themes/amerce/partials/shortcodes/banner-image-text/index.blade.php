@php
    $allowed = ['style-1', 'style-2', 'style-3', 'style-abs-2', 'style-abs-left', 'style-wide-abs', 'style-highlight-swiper', 'style-text-centered', 'style-plant-care-spotlight', 'style-banner-v02', 'style-banner-v05', 'style-section-cls-v02', 'style-auto-banner-sale', 'style-feature', 'style-parallax-promo'];
    $style = in_array($shortcode->style ?? '', $allowed, true) ? $shortcode->style : 'style-1';
    // Some variants emit their own outer wrapper (with their own padding / full-bleed
    // structure); adding the default `tf-section banner-image-text-...` wrapper duplicates
    // padding or breaks layout for those.
    // style-parallax-promo emits `<div class="flat-spacing"><div class="container">` directly.
    $skipWrapper = in_array($style, ['style-text-centered', 'style-banner-v02', 'style-banner-v05', 'style-section-cls-v02', 'style-auto-banner-sale', 'style-feature', 'style-parallax-promo'], true);
@endphp

@if ($skipWrapper)
    @include(Theme::getThemeNamespace("partials.shortcodes.banner-image-text.styles.$style"), ['shortcode' => $shortcode])
@else
    <section {!! $shortcode->htmlAttributes() !!} class="tf-section banner-image-text banner-image-text-{{ $style }}">
        @include(Theme::getThemeNamespace("partials.shortcodes.banner-image-text.styles.$style"), ['shortcode' => $shortcode])
    </section>
@endif
