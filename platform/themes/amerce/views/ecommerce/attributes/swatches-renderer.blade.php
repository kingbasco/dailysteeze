{{--
    Theme override of plugins/ecommerce::themes.attributes.swatches-renderer.
    Two amerce-specific tweaks vs the plugin default:
      1. Above each attribute swatch, render a Size Guide trigger row when
         the attribute set is "size" AND the product has a size guide
         resolved by FOB Product Size Guide. The trigger opens the modal
         emitted via THEME_FRONT_FOOTER (display_mode = popup). Matches the
         html demo's Size Guide placement (above the size tile picker).
      2. Falls through to the plugin's _layouts/* views unchanged otherwise.
--}}
@php
    $key = mt_rand();

    $sizeGuide = null;
    if (
        isset($product)
        && is_plugin_active('fob-product-size-guide')
        && class_exists(\FriendsOfBotble\ProductSizeGuide\Services\SizeGuideService::class)
    ) {
        $sizeGuide = app(\FriendsOfBotble\ProductSizeGuide\Services\SizeGuideService::class)
            ->getSizeGuideForProduct($product);
    }
@endphp

<div
    class="product-attributes product-attribute-swatches"
    id="product-attributes-{{ $product->id }}"
    data-target="{{ route('public.web.get-variation-by-attributes', $product->getKey()) }}"
>
    @php
        $variationInfo = $productVariationsInfo;
        $variationNextIds = [];
    @endphp

    @foreach ($attributeSets as $set)
        @if (! $loop->first)
            @php
                $variationInfo = $productVariationsInfo->where('attribute_set_id', $set->id)->whereIn('variation_id', $variationNextIds);
            @endphp
        @endif

        @php
            $showSizeGuideTrigger = false;
            if ($sizeGuide && $set->slug === 'size' && theme_option('enabled_product_size_guide', true)) {
                // Check if any of the product's categories have the size guide explicitly disabled.
                $categoryEnabled = true;
                foreach ($product->categories as $category) {
                    if (! \Botble\Base\Facades\MetaBox::getMetaData($category, 'enabled_size_guide', true)) {
                        $categoryEnabled = false;
                        break;
                    }
                }

                if ($categoryEnabled) {
                    $displayMode = setting('product_size_guide_display_mode', 'inline');
                    if ($displayMode === 'popup' || $displayMode === 'both') {
                        $showSizeGuideTrigger = true;
                    } elseif ($displayMode === 'conditional') {
                        $rowCount = is_array($sizeGuide->table_rows) ? count($sizeGuide->table_rows) : 0;
                        $rowThreshold = (int) setting('product_size_guide_row_threshold', 10);
                        $showSizeGuideTrigger = $rowCount > $rowThreshold;
                    }
                }
            }
        @endphp
 
        @if ($showSizeGuideTrigger)
            <div class="bb-size-guide-trigger-row">
                {{-- bb-size-guide-link styled in component/elements/_product-size-guide.scss.
                     Avoid theme's .tf-btn-line-2 / .style-primary — they apply
                     -webkit-text-fill-color:transparent for a gradient effect
                     which makes the label invisible (only the underline shows). --}}
                <a href="#sizeGuideModal"
                   data-bs-toggle="modal"
                   class="bb-size-guide-link">
                    {{ __('Size Guide') }}
                </a>
            </div>
        @endif

        @php
            // EcommerceHelper::viewPath returns the theme override if present,
            // otherwise the plugin default. Fallback to dropdown when neither
            // theme nor plugin has the requested display_layout.
            $layout = EcommerceHelper::viewPath('attributes._layouts.' . $set->display_layout);
            if (! view()->exists($layout)) {
                $layout = EcommerceHelper::viewPath('attributes._layouts.dropdown');
            }
        @endphp
        @include($layout)

        @php
            [$variationNextIds] = handle_next_attributes_in_product($attributes->where('attribute_set_id', $set->id), $productVariationsInfo, $set->id, $selected->pluck('id')->toArray(), $loop->index, $variationNextIds);
        @endphp
    @endforeach
</div>
