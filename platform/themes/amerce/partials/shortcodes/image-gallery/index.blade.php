@php
    $allowed = ['style-default', 'style-paired-overlay', 'style-paired-banner-side', 'style-paired-banner-overlay-cf', 'style-auto-promo-duo', 'style-auto-banner-trio', 'style-paired-banner-image-top'];
    $style = in_array($shortcode->style ?? '', $allowed, true) ? $shortcode->style : 'style-default';
    $items = \Botble\Shortcode\Facades\Shortcode::fields()->getTabsData(
        ['image', 'link'],
        $shortcode
    );
@endphp

@php
    $isFullBleed = in_array($style, ['style-paired-overlay', 'style-paired-banner-overlay-cf'], true);
    // skip_spacing='yes' drops the `flat-spacing` block — home-baby §10 demo
    // wraps style-default in a bare `bare-section` section (no vertical padding).
    $skipSpacing = in_array($style, ['style-paired-banner-side', 'style-auto-promo-duo', 'style-auto-banner-trio', 'style-paired-banner-image-top'], true)
        || ($shortcode->skip_spacing ?? '') === 'yes';
    // extra_section_class: appended to the <section> class — lets a preset add the
    // demo's own spacing utilities when `skip_spacing` drops `flat-spacing`
    // (home-fashion-2 §9 demo wrapper is `bare-section px-10 pb-40`).
    $extraSectionClass = trim((string) ($shortcode->extra_section_class ?? ''));
    $sectionClass = $isFullBleed
        ? 'gallery image-gallery image-gallery-' . $style
        : 'tf-section gallery image-gallery image-gallery-' . $style . ($skipSpacing ? '' : ' flat-spacing');
    $sectionClass = trim($sectionClass . ' ' . $extraSectionClass);
@endphp
<section {!! $shortcode->htmlAttributes() !!} class="{{ $sectionClass }}">
    @include(Theme::getThemeNamespace("partials.shortcodes.image-gallery.styles.$style"), [
        'shortcode' => $shortcode,
        'items'     => $items,
    ])
</section>
