@php
    /**
     * @var \Botble\Shortcode\Compilers\Shortcode $shortcode
     * @var \Botble\Ecommerce\Models\FlashSale $flashSale
     */
    $allowed = ['style-1', 'style-2'];
    $style = in_array($shortcode->style, $allowed, true) ? $shortcode->style : 'style-1';
@endphp

@if (! empty($flashSale))
    <section class="ecommerce-flash-sale ecommerce-flash-sale--{{ $style }} flat-spacing">
        <div class="container">
            @include(Theme::getThemeNamespace('partials.shortcodes.ecommerce-flash-sale.styles.' . $style))
        </div>
    </section>
@endif
