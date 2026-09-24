@php
    /**
     * @var \Botble\Shortcode\Compilers\Shortcode $shortcode
     * @var \Illuminate\Support\Collection $collections
     */
    $allowed = ['style-default', 'style-banner-grid', 'style-slider', 'style-slider-overlay', 'style-cards-3', 'style-2-up-horizontal', 'style-banner-split-v04', 'style-accordion-tabs', 'style-banner-grid-quad', 'style-banner-1plus2', 'style-banner-collection-v02'];
    $style = in_array($shortcode->style, $allowed, true) ? $shortcode->style : 'style-default';
    // These styles render their own container/wrapper.
    $bareStyles = ['style-accordion-tabs', 'style-2-up-horizontal', 'style-banner-split-v04', 'style-banner-grid-quad', 'style-slider-overlay', 'style-banner-collection-v02'];
    $isBare = in_array($style, $bareStyles, true);
    // Demo wrappers for style-banner-split-v04 (pet-care `section-banner-cls`,
    // electronics `section-collection banner-cls`) have NO `flat-spacing`
    // padding — the section sits flush against the categories above. Other
    // styles keep the default padding block.
    // style-banner-collection-v02 emits its own `section-banner-collection-v02
    // flat-spacing` wrapper, so the outer section must not add padding too.
    $stylesOwnSpacing = ['style-banner-split-v04', 'style-banner-collection-v02'];
    $spacingClass = $shortcode->spacing_class !== null
        ? (string) $shortcode->spacing_class
        : (in_array($style, $stylesOwnSpacing, true) ? '' : 'flat-spacing');
@endphp

@if (! empty($collections) && (is_countable($collections) ? count($collections) : 0) > 0)
    <section class="ecommerce-collections ecommerce-collections--{{ $style }} {{ $spacingClass }}">
        @if ($isBare)
            @include(Theme::getThemeNamespace('partials.shortcodes.ecommerce-collections.styles.' . $style))
        @else
            <div class="container">
                @if ($shortcode->title)
                    @include(Theme::getThemeNamespace('partials.section-title'), [
                        'title' => $shortcode->title,
                        'align' => 'center',
                    ])
                @endif

                @include(Theme::getThemeNamespace('partials.shortcodes.ecommerce-collections.styles.' . $style))
            </div>
        @endif
    </section>
@endif
