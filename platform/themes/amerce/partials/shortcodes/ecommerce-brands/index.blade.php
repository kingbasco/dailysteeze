@php
    /**
     * @var \Botble\Shortcode\Compilers\Shortcode $shortcode
     * @var \Illuminate\Support\Collection $brands
     */
    $allowed = ['style-default'];
    $style = in_array($shortcode->style, $allowed, true) ? $shortcode->style : 'style-default';
@endphp

@if (! empty($brands) && (is_countable($brands) ? count($brands) : 0) > 0)
    <section class="ecommerce-brands ecommerce-brands--{{ $style }} flat-spacing">
        <div class="container">
            @if ($shortcode->title)
                @include(Theme::getThemeNamespace('partials.section-title'), [
                    'title' => $shortcode->title,
                    'align' => 'center',
                ])
            @endif

            @include(Theme::getThemeNamespace('partials.shortcodes.ecommerce-brands.styles.' . $style))
        </div>
    </section>
@endif
