@php
    $allowed = ['style-default', 'style-fashion', 'style-furniture-parallax', 'style-organic'];
    $style = in_array($shortcode->style ?? '', $allowed, true) ? $shortcode->style : 'style-default';
    $slides = \Botble\Shortcode\Facades\Shortcode::fields()->getTabsData(
        ['image', 'subtitle', 'title', 'button_text', 'button_url', 'alignment'],
        $shortcode
    );
@endphp

<section {!! $shortcode->htmlAttributes() !!} class="tf-section hero-slideshow hero-{{ $style }}">
    @include(Theme::getThemeNamespace("partials.shortcodes.hero-slideshow.styles.$style"), [
        'shortcode' => $shortcode,
        'slides' => $slides,
    ])
</section>
