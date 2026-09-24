@php
    $allowed = ['style-fashion', 'style-organic'];
    $style = in_array($shortcode->style ?? '', $allowed, true) ? $shortcode->style : 'style-fashion';
@endphp

@include(Theme::getThemeNamespace("partials.shortcodes.banner-products-composite.styles.$style"), [
    'shortcode' => $shortcode,
    'products'  => $products,
])
