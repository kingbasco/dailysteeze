@if (is_plugin_active('marketplace'))
    @php
        /**
         * @var \Botble\Shortcode\Compilers\Shortcode $shortcode
         * @var \Illuminate\Support\Collection $vendors
         */
        $allowed = ['style-grid', 'style-slider'];
        $style = in_array($shortcode->style, $allowed, true) ? $shortcode->style : 'style-grid';
    @endphp

    @if (! empty($vendors) && (is_countable($vendors) ? count($vendors) : 0) > 0)
        <section class="ecommerce-vendors ecommerce-vendors--{{ $style }} flat-spacing">
            <div class="container">
                @if ($shortcode->title || $shortcode->subtitle)
                    @include(Theme::getThemeNamespace('partials.section-title'), [
                        'title' => $shortcode->title,
                        'subtitle' => $shortcode->subtitle,
                        'align' => 'center',
                    ])
                @endif

                @include(Theme::getThemeNamespace('partials.shortcodes.ecommerce-vendors.styles.' . $style))
            </div>
        </section>
    @endif
@endif
