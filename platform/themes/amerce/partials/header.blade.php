@php
    use Botble\Base\Facades\BaseHelper;

    $isHomepage = BaseHelper::isHomepage() || request()->is('/');

    // Map theme_option header_style → HTML modifier class.
    // style-1  → header-s1                              (logo-left + nav + actions, custom simple)
    // style-2  → header-s2                              (left-nav + center-logo + right-actions, demo flagship)
    // style-3  → header-s7 hds7-type-2 header-abs-3     (transparent overlay over hero)
    // style-4  → header-s4                              (boxed centered)
    // style-5  → header-s5                              (modern minimal, light)
    // style-6  → header-s5 bg-dark                      (modern minimal, dark — same partial as style-5)
    // style-7  → header-s3 has-by-category              (logo + center search + bottom category bar)
    // style-8  → header-s6 has-by-category              (logo + inline nav + bottom category bar)
    // style-9  → header-s7                              (classic single-row with inline search)
    // style-10 → header-s8 has-by-category              (furniture: category dropdown + search left, menu in bottom bar)
    // style-11 → header-s9                              (modern minimal centered with category dropdown)
    // style-12 → header-s10                             (jewelry boutique: simple centered nav)
    // style-13 → header-abs                             (transparent overlay variant)
    // style-14 → header-abs-2                           (transparent overlay variant — organic)
    $allowedHeaderStyles = [
        'style-1', 'style-2', 'style-3',  'style-4',  'style-5',  'style-6',  'style-7',
        'style-8', 'style-9', 'style-10', 'style-11', 'style-12', 'style-13', 'style-14',
    ];
    $headerStyle = theme_option('header_style', 'style-2');
    $headerStyle = in_array($headerStyle, $allowedHeaderStyles, true) ? $headerStyle : 'style-2';

    $headerModifierMap = [
        'style-1'  => 'header-s1',
        'style-2'  => 'header-s2',
        'style-3'  => 'header-s7 hds7-type-2 header-abs-3',
        'style-4'  => 'header-s4',
        'style-5'  => 'header-s5',
        'style-6'  => 'header-s5 bg-dark',
        'style-7'  => 'header-s3 has-by-category',
        'style-8'  => 'header-s6 has-by-category',
        'style-9'  => 'header-s7',
        'style-10' => 'header-s8 has-by-category',
        'style-11' => 'header-s9',
        'style-12' => 'header-s10',
        'style-13' => 'header-abs',
        'style-14' => 'header-abs-2',
    ];
    $headerModifier = $headerModifierMap[$headerStyle];

    // Absolute-overlay modifiers (header-abs / -abs-2 / -abs-3) and the glass
    // overlay variant `hds7-type-2` apply a negative margin-bottom so the
    // header floats over the page's hero. On non-homepage pages (product,
    // category, cart, etc.) there's no hero behind the header — the negative
    // margin pulls subsequent content up *under* the header, causing the logo
    // to overlap the breadcrumb / product gallery (see report 260509-1454-
    // main-demo-product-page-header-overlap.md). Strip these modifiers off
    // when not on homepage so the header sits in normal flow.
    if (! $isHomepage) {
        $overlayModifiers = ['header-abs', 'header-abs-2', 'header-abs-3', 'hds7-type-2'];
        $headerModifier = trim(implode(' ', array_diff(
            preg_split('/\s+/', $headerModifier, -1, PREG_SPLIT_NO_EMPTY),
            $overlayModifiers
        )));
    }

    $stickyHeader = (bool) theme_option('sticky_header', true);
    $transparentOnHomepage = (bool) theme_option('header_transparent_on_homepage', false);

    // scr-box-shadow is the scroll-shadow hook; demos omit it on `has-by-category`
    // headers (the bottom category bar acts as a visual divider). Per-preset override
    // via `header_extra_class` (e.g., home-cosmetic uses `scr-box-shadow-2`,
    // home-headphone adds `mb-6`).
    $omitScrShadow = str_contains($headerModifier, 'has-by-category');
    $headerExtraClass = trim((string) theme_option('header_extra_class', ''));
    // Per-preset shadow variant (e.g. home-cosmetic uses `scr-box-shadow-2`).
    $shadowClass = trim((string) theme_option('header_shadow_class', 'scr-box-shadow'));

    $headerClasses = trim(implode(' ', array_filter([
        'tf-header',
        $headerModifier,
        ($stickyHeader && ! $omitScrShadow) ? $shadowClass : '',
        ($isHomepage && $transparentOnHomepage) ? 'header-transparent' : '',
        $headerExtraClass,
    ])));
    // Per-preset full wrapper OVERRIDE — replaces auto-derived classes entirely.
    // Use when demo `<header>` needs a bare/unique class string not covered by the
    // style allowlist (e.g. home-construction `<header class="tf-header">`).
    // Set to "tf-header" alone or any custom string. Set to "tf-header" → bare wrapper.
    $headerWrapperOverride = trim((string) theme_option('header_wrapper_override', ''));
    if ($headerWrapperOverride !== '') {
        $headerClasses = $headerWrapperOverride;
    }

    // Inline color overrides from Theme Options → Header. `$headerMainBackgroundColor`
    // and `$headerMainTextColor` are injected by partialComposer('header.*') in config.php.
    // Skip background-color on transparent-overlay variants (header-abs / -abs-2 / -abs-3
    // / header-transparent) so the floating header keeps its see-through hero treatment;
    // text color still applies.
    $hasTransparentOverlay = str_contains($headerClasses, 'header-abs')
        || str_contains($headerClasses, 'header-transparent');
    $headerStyleParts = [];
    if (! empty($headerMainBackgroundColor) && ! $hasTransparentOverlay) {
        $headerStyleParts[] = 'background-color: ' . e($headerMainBackgroundColor);
    }
    if (! empty($headerMainTextColor)) {
        $headerStyleParts[] = 'color: ' . e($headerMainTextColor);
    }
    $headerStyleAttr = $headerStyleParts ? ' style="' . implode('; ', $headerStyleParts) . '"' : '';
@endphp

<header class="{{ $headerClasses }}"{!! $headerStyleAttr !!}>
    @include(Theme::getThemeNamespace("partials.header.styles.{$headerStyle}"))
</header>

@if ($stickyHeader && ! str_contains($headerModifier, 'has-by-category'))
    @include(Theme::getThemeNamespace('partials.header.sticky'))
@endif
