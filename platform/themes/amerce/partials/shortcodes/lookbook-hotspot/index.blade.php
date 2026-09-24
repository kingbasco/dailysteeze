@php
    $allowed = ['style-v1', 'style-v2', 'style-v3', 'style-v4-carousel', 'style-v4-bundle', 'style-bundle-carousel-left', 'style-bundle-slider', 'style-banner-3', 'style-swiper-banners', 'style-3-up-swiper-banners', 'style-decor-swiper-banners'];
    $style = in_array($shortcode->style ?? '', $allowed, true) ? $shortcode->style : 'style-v1';
    $rawHotspots = \Botble\Shortcode\Facades\Shortcode::fields()->getTabsData(
        ['x_percent', 'y_percent', 'product_id', 'column', 'overline'],
        $shortcode
    );

    // Server-side validation: clamp 0-100, resolve product
    $hotspots = [];
    if (is_plugin_active('ecommerce') && class_exists(\Botble\Ecommerce\Models\Product::class)) {
        $productIds = collect($rawHotspots)->pluck('product_id')->filter()->map(fn ($id) => (int) $id)->unique();
        $products = $productIds->isNotEmpty()
            ? \Botble\Ecommerce\Models\Product::query()
                ->whereIn('id', $productIds)
                ->wherePublished()
                ->with(['slugable'])
                ->get()
                ->keyBy('id')
            : collect();
        foreach ($rawHotspots as $h) {
            $pid = (int) ($h['product_id'] ?? 0);
            $product = $products->get($pid);
            if (! $product) {
                continue;
            }
            $column = (int) ($h['column'] ?? 1);
            $hotspots[] = [
                'x'        => max(0, min(100, (float) ($h['x_percent'] ?? 0))),
                'y'        => max(0, min(100, (float) ($h['y_percent'] ?? 0))),
                'column'   => in_array($column, [1, 2], true) ? $column : 1,
                'overline' => trim((string) ($h['overline'] ?? '')),
                'product'  => $product,
            ];
        }
    }

    // Mini-list (style-v3 only, optional) — when `mini_list_product_ids` CSV attr present,
    // fetch those products and pass to the partial so it renders col-xl-4 mini-list alongside
    // col-xl-8 lookbook (matches home-jewelry.html §10 composite layout).
    $miniListProducts = collect();
    if ($style === 'style-v3'
        && ! empty($shortcode->mini_list_product_ids ?? '')
        && is_plugin_active('ecommerce')
        && class_exists(\Botble\Ecommerce\Models\Product::class)
    ) {
        $miniIds = \Botble\Shortcode\ShortcodeField::parseIds($shortcode->mini_list_product_ids);
        if (! empty($miniIds)) {
            $miniListProducts = \Botble\Ecommerce\Models\Product::query()
                ->whereIn('id', $miniIds)
                ->wherePublished()
                ->with(['slugable'])
                ->orderByRaw('FIELD(id, ' . implode(',', array_map('intval', $miniIds)) . ')')
                ->get();
        }
    }

    // Demo home-jewelry §10 wrapper class is `section-lookbook-hover-v03` (not `-v3`).
    // Append numeric-padded variant per style for grep-friendly demo match.
    $sectionVersion = match ($style) {
        'style-v1' => '01',
        'style-v2' => '02',
        'style-v3' => '03',
        default    => '',
    };
    $extraSectionClass = $sectionVersion ? "section-lookbook-hover-v{$sectionVersion}" : '';
@endphp

@php
    // style-v4-bundle wraps in `tf-lookbook-hover lookbook-hover-v2` instead of the
    // generic `section-lookbook-hover` outer class — matches furniture §7 demo wrapper.
    // style-v2 (pet-care) renders its own `tf-lookbook-hover lookbook-hover-v1` wrapper
    // inside; the outer `section-lookbook-hover` adds a conflicting flex layout on
    // `.col-left` (align-items: start, flex-direction: column) that prevents the banner
    // image from filling the column height. Use a minimal wrapper for style-v2.
    // style-bundle-slider (home-baby §7) is a bare `<section>` in the demo — a
    // centered heading + a 2-up swiper of hotspotted banner slides, no outer
    // section-lookbook-hover flex layout.
    // style-banner-3 (home-office-equipment §4) is a bare `<div class="px-20">`
    // in the demo — a single full-width `banner-lookbook style-3` image with
    // fixed-position pins, no section wrapper / no flat-spacing.
    // style-swiper-banners (home-pod §5) is a bare `<div class="bare-section">`
    // in the demo — a 2-up swiper of hotspotted banners, zero vertical padding.
    // style-decor-swiper-banners (home-decor §5) is a bare `<div>` (no section,
    // no flat-spacing, no section class) — the style file itself emits the
    // `<div class="container-full-3">` + numbered swiper-type-number swiper +
    // box-nav-pag "Shop The Look" prev/next/fraction nav. Match the demo's
    // zero-outer-padding wrapper.
    $sectionWrapper = match ($style) {
        'style-v4-bundle' => 'tf-section flat-spacing tf-lookbook-hover lookbook-hover-v2',
        'style-v2' => "tf-section flat-spacing lookbook-hotspot lookbook-{$style}",
        'style-bundle-slider' => "lookbook-hotspot lookbook-{$style}",
        'style-banner-3' => "px-20 lookbook-hotspot lookbook-{$style}",
        'style-swiper-banners' => "bare-section lookbook-hotspot lookbook-{$style}",
        'style-3-up-swiper-banners' => "tf-section flat-spacing lookbook-hotspot lookbook-{$style}",
        'style-decor-swiper-banners' => "lookbook-hotspot lookbook-{$style}",
        default => "tf-section section-lookbook-hover {$extraSectionClass} lookbook-hotspot lookbook-{$style} flat-spacing",
    };
@endphp
<section {!! $shortcode->htmlAttributes() !!} class="{{ $sectionWrapper }}">
    @include(Theme::getThemeNamespace("partials.shortcodes.lookbook-hotspot.styles.$style"), [
        'shortcode'        => $shortcode,
        'hotspots'         => $hotspots,
        'miniListProducts' => $miniListProducts,
    ])
</section>
