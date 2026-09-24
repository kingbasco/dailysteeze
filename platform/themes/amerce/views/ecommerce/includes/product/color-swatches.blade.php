@php
    /**
     * Renders the demo's `<ul class="product-color_list">` swatch row under
     * a product card's price block — mirrors html/home-fashion.html lines
     * 1628-1647. Source data comes from the plugin's
     * `variationAttributeSwatchesForProductList` HasMany, filtered to
     * visual-display attribute sets and de-duplicated by attribute_id.
     *
     * Inputs:
     *   $product \Botble\Ecommerce\Models\Product
     */
    use Botble\Base\Facades\BaseHelper;

    $product->loadMissing('variationAttributeSwatchesForProductList');

    $swatches = $product->variationAttributeSwatchesForProductList
        ->where('display_layout', 'visual')
        ->unique('attribute_id')
        ->values();
@endphp

@if ($swatches->isNotEmpty())
    <ul class="product-color_list">
        @foreach ($swatches as $index => $attribute)
            <li class="product-color-item color-swatch hover-tooltip tooltip-bot {{ $index === 0 ? 'active' : '' }}">
                <span class="tooltip color-filter">{{ BaseHelper::clean($attribute->attribute_title) }}</span>
                <span class="swatch-value" style="background-color: {{ $attribute->color ?: '#000' }};"></span>
            </li>
        @endforeach
    </ul>
@endif
