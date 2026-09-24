@php
    /**
     * @var \Botble\Shortcode\Compilers\Shortcode $shortcode
     * @var array $resolved
     */
    $allowed = ['style-tabs', 'style-columns', 'style-bundle'];
    $style = in_array($shortcode->style, $allowed, true) ? $shortcode->style : 'style-tabs';
@endphp

@if (! empty($resolved))
    <section class="ecommerce-product-groups ecommerce-product-groups--{{ $style }} flat-spacing">
        <div class="container">
            @if ($shortcode->title)
                @include(Theme::getThemeNamespace('partials.section-title'), [
                    'title' => $shortcode->title,
                    'align' => 'center',
                ])
            @endif

            @include(Theme::getThemeNamespace('partials.shortcodes.ecommerce-product-groups.styles.' . $style))
        </div>
    </section>
@endif
