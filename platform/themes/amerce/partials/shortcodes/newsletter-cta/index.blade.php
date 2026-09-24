@php
    $allowed = ['style-default', 'style-banner'];
    $style = in_array($shortcode->style ?? '', $allowed, true) ? $shortcode->style : 'style-default';
    $newsletterActive = is_plugin_active('newsletter');
    $formAction = $newsletterActive ? route('public.newsletter.subscribe') : '#';
@endphp

<section {!! $shortcode->htmlAttributes() !!} class="tf-section newsletter-cta newsletter-cta-{{ $style }} flat-spacing"
    @if (! empty($shortcode->background_color ?? '')) style="background-color: {{ $shortcode->background_color }};" @endif>
    @include(Theme::getThemeNamespace("partials.shortcodes.newsletter-cta.styles.$style"), [
        'shortcode'        => $shortcode,
        'newsletterActive' => $newsletterActive,
        'formAction'       => $formAction,
    ])
</section>
