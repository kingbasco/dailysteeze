@php
    /**
     * @var \Botble\Shortcode\Compilers\Shortcode $shortcode
     * @var \Illuminate\Support\Collection $products
     */
    $allowed = ['style-default'];
    $style = in_array($shortcode->style, $allowed, true) ? $shortcode->style : 'style-default';
@endphp

@if (! empty($products) && (is_countable($products) ? count($products) : 0) > 0)
    <section class="recently-viewed-products recently-viewed-products--{{ $style }} flat-spacing">
        <div class="container">
            @if ($shortcode->title)
                @include(Theme::getThemeNamespace('partials.section-title'), [
                    'title' => $shortcode->title,
                    'align' => 'center',
                ])
            @endif

            @include(Theme::getThemeNamespace('partials.shortcodes.recently-viewed-products.styles.' . $style))
        </div>
    </section>
@endif
