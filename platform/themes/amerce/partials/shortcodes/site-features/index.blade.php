@php
    $allowed = ['style-1', 'style-2', 'style-3', 'style-flat-swiper'];
    $style = in_array($shortcode->style ?? '', $allowed, true) ? $shortcode->style : 'style-1';
    $items = \Botble\Shortcode\Facades\Shortcode::fields()->getTabsData(
        ['icon_class', 'title', 'description'],
        $shortcode
    );
    // outer_section_class: vertical spacing on the <section> — default `flat-spacing`.
    // html/home-cosmetic.html §11 (line 2526) is a bare `bare-section` wrapper (no-op =
    // zero padding); pass `outer_section_class => 'bare-section'` to match it.
    $outerSectionClass = trim((string) ($shortcode->outer_section_class ?? 'flat-spacing'));
@endphp

<section {!! $shortcode->htmlAttributes() !!} @class(['tf-section', 'site-features', "site-features-$style", $outerSectionClass => $outerSectionClass !== ''])>
    @include(Theme::getThemeNamespace("partials.shortcodes.site-features.styles.$style"), [
        'shortcode' => $shortcode,
        'items'     => $items,
    ])
</section>
