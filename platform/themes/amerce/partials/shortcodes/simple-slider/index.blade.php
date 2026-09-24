@php
    $allowedStyles = ['style-1', 'style-2', 'style-3', 'style-baby', 'style-headphone', 'style-split'];
    $style = in_array($shortcode->style ?? '', $allowedStyles, true) ? $shortcode->style : 'style-1';
    $sliders->loadMissing('metadata');
@endphp

{!! Theme::partial("shortcodes.simple-slider.$style", compact('sliders', 'shortcode', 'slider')) !!}
