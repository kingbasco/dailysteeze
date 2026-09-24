@php
    $allowed = ['style-1', 'style-6', 'style-thumbs-grid', 'style-thumbs-arrival', 'style-thumbs-v2'];
    $style = in_array($shortcode->style ?? '', $allowed, true) ? $shortcode->style : 'style-1';

    $products = collect();
    if (is_plugin_active('ecommerce') && class_exists(\Botble\Ecommerce\Models\Product::class)) {
        $ids = \Botble\Shortcode\ShortcodeField::parseIds($shortcode->product_ids ?? null);
        if (! empty($ids)) {
            $products = \Botble\Ecommerce\Models\Product::query()
                ->whereIn('id', $ids)
                ->wherePublished()
                ->with(['slugable', 'categories'])
                ->orderByRaw('FIELD(id, ' . implode(',', array_map('intval', $ids)) . ')')
                ->get();
        }
    }
@endphp

@php
    // style-thumbs-v2 is a full-bleed page-level section per demo home-fashion-2.html
    // — wrapping it in `.banner-thumbs-product` (border-radius 16px, padded by
    // upstream container) breaks the demo's edge-to-edge layout. Render the partial
    // directly so it owns its own outermost <section> tag.
    $skipWrapper = in_array($style, ['style-6', 'style-thumbs-v2', 'style-thumbs-arrival', 'style-thumbs-grid'], true);
@endphp

@if ($skipWrapper)
    @include(Theme::getThemeNamespace("partials.shortcodes.banner-thumbs-product.styles.$style"), [
        'shortcode' => $shortcode,
        'products'  => $products,
    ])
@else
    <section {!! $shortcode->htmlAttributes() !!} class="tf-section banner-thumbs-product banner-thumbs-{{ $style }}">
        @include(Theme::getThemeNamespace("partials.shortcodes.banner-thumbs-product.styles.$style"), [
            'shortcode' => $shortcode,
            'products'  => $products,
        ])
    </section>
@endif
