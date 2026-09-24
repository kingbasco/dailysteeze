@php
    /**
     * Product card dispatcher.
     *
     * Routes any consumer to the correct style + facet partial:
     *   - Style is locked to {style-1, style-2, style-3, style-4, style-5}
     *   - View mode is locked to {grid, list, small}
     *   - Hover behaviour is owned by each style-N facet partial (no separate option).
     *
     * Inputs (any combination):
     *   $product      \Botble\Ecommerce\Models\Product  (required)
     *   $cardStyle    string  Override theme option (e.g. inside a shortcode)
     *   $viewMode     string  grid|list|small (default grid). Also accepts $view_mode.
     *   $showQuickView bool   (forwarded to grid facets, default true)
     *   $showQuickShop bool   (forwarded to grid facets, default value of theme option)
     */
    $allowedModes = ['grid', 'list', 'small'];

    $cardStyle = $cardStyle ?? theme_option('product_card_default_style', 'style-1');
    $cardStyle = in_array($cardStyle, ['style-1', 'style-2', 'style-3', 'style-4', 'style-5'], true) ? $cardStyle : 'style-1';

    $viewMode = $viewMode ?? ($view_mode ?? 'grid');
    $viewMode = in_array($viewMode, $allowedModes, true) ? $viewMode : 'grid';

    $showQuickView = $showQuickView ?? (theme_option('enable_quick_view', true) ? true : false);
    $showQuickShop = $showQuickShop ?? (theme_option('enable_quick_shop', true) ? true : false);

    // Extra CSS modifier class (e.g. "product-style_stroke" for bordered cards).
    $cardExtraClass = $cardExtraClass ?? trim((string) theme_option('product_card_extra_class', ''));

    $facetData = [
        'product' => $product,
        'showQuickView' => $showQuickView,
        'showQuickShop' => $showQuickShop,
        'productWrapperClass' => $productWrapperClass ?? null,
    ];

    if (isset($qty)) {
        $facetData['qty'] = $qty;
    }

    // Per-context decoration toggles — only forwarded when the caller sets them
    // explicitly, so the facet partials keep their own `?? true` defaults otherwise.
    foreach (['showActions', 'showBadges', 'showMarquee'] as $facetFlag) {
        if (isset($$facetFlag)) {
            $facetData[$facetFlag] = $$facetFlag;
        }
    }
@endphp

{{-- Emit the bare `style-N` class too: theme CSS targets `.card-product.style-N`
     (demo convention), so the hyphenated `card-product-style-N` alone never matches. --}}
<div class="card-product {{ $cardStyle }} card-product-{{ $cardStyle }} {{ $cardExtraClass }}" data-product-id="{{ $product->id }}">
    @include(EcommerceHelper::viewPath('includes.product.' . $cardStyle . '.' . $viewMode), $facetData)
</div>
