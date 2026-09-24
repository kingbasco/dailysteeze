@php
    $allowed = ['style-1', 'style-2', 'style-3'];
    $style = in_array($shortcode->style ?? '', $allowed, true) ? $shortcode->style : 'style-1';
@endphp

@if ($style === 'style-3')
    {{-- style-3: container-width `banner-v04 parallaxie` promo.
         Mirrors html/home-office-equipment.html line 3649 — wrapped in
         `flat-spacing pb-0 > container` (NOT the full-bleed `tf-section`
         section-parallax wrapper used by style-1/style-2). --}}
    <div {!! $shortcode->htmlAttributes() !!} class="flat-spacing pb-0 parallax-banner parallax-style-3">
        <div class="container">
            @include(Theme::getThemeNamespace("partials.shortcodes.parallax-banner.styles.$style"), ['shortcode' => $shortcode])
        </div>
    </div>
@else
    <section {!! $shortcode->htmlAttributes() !!} class="tf-section section-parallax parallax-banner parallax-{{ $style }}">
        @include(Theme::getThemeNamespace("partials.shortcodes.parallax-banner.styles.$style"), ['shortcode' => $shortcode])
    </section>
@endif
