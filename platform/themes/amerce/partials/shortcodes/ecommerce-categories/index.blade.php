@php
    /**
     * @var \Botble\Shortcode\Compilers\Shortcode $shortcode
     * @var \Illuminate\Support\Collection $categories
     */
    $allowed = ['style-grid', 'style-slider', 'style-list'];
    $style = in_array($shortcode->style, $allowed, true) ? $shortcode->style : 'style-grid';
@endphp

@if (! empty($categories) && (is_countable($categories) ? count($categories) : 0) > 0)
    <section class="ecommerce-categories ecommerce-categories--{{ $style }} flat-spacing">
        <div class="container">
            @if ($shortcode->title)
                @include(Theme::getThemeNamespace('partials.section-title'), [
                    'title' => $shortcode->title,
                    'align' => 'center',
                ])
            @endif

            @include(Theme::getThemeNamespace('partials.shortcodes.ecommerce-categories.styles.' . $style))
        </div>
    </section>
@endif
