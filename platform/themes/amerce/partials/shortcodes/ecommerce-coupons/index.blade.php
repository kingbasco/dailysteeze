@php
    /**
     * @var \Botble\Shortcode\Compilers\Shortcode $shortcode
     * @var \Illuminate\Support\Collection $coupons
     */
    $allowed = ['style-default'];
    $style = in_array($shortcode->style, $allowed, true) ? $shortcode->style : 'style-default';
@endphp

@if (! empty($coupons) && (is_countable($coupons) ? count($coupons) : 0) > 0)
    <section class="ecommerce-coupons ecommerce-coupons--{{ $style }} flat-spacing">
        <div class="container">
            @if ($shortcode->title)
                @include(Theme::getThemeNamespace('partials.section-title'), [
                    'title' => $shortcode->title,
                    'align' => 'center',
                ])
            @endif

            @include(Theme::getThemeNamespace('partials.shortcodes.ecommerce-coupons.styles.' . $style))
        </div>
    </section>
@endif
