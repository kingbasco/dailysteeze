@php
    $allowed = ['style-1', 'style-2', 'style-tabs'];
    $style = in_array($shortcode->style ?? '', $allowed, true) ? $shortcode->style : 'style-1';
@endphp

<section {!! $shortcode->htmlAttributes() !!} class="tf-section banner-collection banner-collection-{{ $style }}">
    @include(Theme::getThemeNamespace("partials.shortcodes.banner-collection.styles.$style"), ['shortcode' => $shortcode])
</section>
