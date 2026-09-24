@php
    $allowed = ['style-1', 'style-2-detail', 'style-2-banner', 'style-3-pdp'];
    $style = in_array($shortcode->style ?? '', $allowed, true) ? $shortcode->style : 'style-1';

    $product = null;
    if (! empty($shortcode->product_id ?? '') && is_plugin_active('ecommerce') && class_exists(\Botble\Ecommerce\Models\Product::class)) {
        $product = \Botble\Ecommerce\Models\Product::query()
            ->where('id', (int) $shortcode->product_id)
            ->wherePublished()
            ->with([
                'slugable',
                'categories',
                'categories.slugable',
                'options',
                'options.values',
                'variations.product',
                'defaultVariation.product',
                'brand',
            ])
            ->first();
    }
    $rawHotspots = \Botble\Shortcode\Facades\Shortcode::fields()->getTabsData(
        ['x', 'y', 'label'],
        $shortcode
    );
    $hotspots = collect($rawHotspots)->map(fn ($h) => [
        'x'     => max(0, min(100, (float) ($h['x'] ?? 0))),
        'y'     => max(0, min(100, (float) ($h['y'] ?? 0))),
        'label' => $h['label'] ?? '',
    ])->all();

    // section_bg: optional background utility on the outer <section>. Allowlisted to
    // safe Tabler/theme bg classes. Demo §6 of home-organic.html (L2341) wraps in
    // `flat-spacing bg-main`.
    $allowedBg = ['', 'bg-main', 'bg-main-2', 'bg-main-3', 'bg-main-4', 'bg-main-5'];
    $rawBg = $shortcode->section_bg ?? '';
    $sectionBg = in_array($rawBg, $allowedBg, true) ? $rawBg : '';
@endphp

<section {!! $shortcode->htmlAttributes() !!} @class(['tf-section', 'product-feature-zoom', 'product-feature-' . $style, 'flat-spacing', $sectionBg => $sectionBg !== ''])>
    @include(Theme::getThemeNamespace("partials.shortcodes.product-feature-zoom.styles.$style"), [
        'shortcode' => $shortcode,
        'product'   => $product,
        'hotspots'  => $hotspots,
    ])
</section>
