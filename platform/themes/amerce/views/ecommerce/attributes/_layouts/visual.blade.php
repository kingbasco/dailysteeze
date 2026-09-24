{{--
    Theme override of plugins/ecommerce::themes.attributes._layouts.visual.
    Emits the html-demo markup (.variant-picker-item.variant-color +
    .color-btn.style-image) so the theme's _product.scss styling applies
    (matches html/product-detail.html L1709-1748). Preserves the JS hooks
    that change-product-swatches.js depends on:
      - outer .product-attributes wrapper (already added by swatches-renderer)
      - per-set .attribute-swatches-wrapper[data-slug]
      - .visual-swatch class on the values container (label click handler)
      - <input.product-filter-item type=radio data-slug value> inside <label>
--}}
@php
    $displayAttributes = $attributes->where('attribute_set_id', $set->id);
    $selectedAttr = $selected->firstWhere('attribute_set_id', $set->id);
@endphp

@if ($displayAttributes && $displayAttributes->isNotEmpty())
    <div
        class="variant-picker-item variant-color attribute-swatches-wrapper"
        data-type="visual"
        data-slug="{{ $set->slug }}"
    >
        <div class="variant-picker-label">
            <div>
                {{ $set->title }}:
                <span class="variant-picker-label-value text-capitalize fw-medium">{{ $selectedAttr?->title }}</span>
            </div>
        </div>
        <div class="variant-picker-values visual-swatch">
            @foreach ($displayAttributes as $attribute)
                @php
                    $isDisabled = $variationInfo->where('id', $attribute->id)->isEmpty();
                    $isActive = $selected->where('id', $attribute->id)->isNotEmpty();
                    $imageUrl = $attribute->getAttributeImageUrl($set, $productVariations);
                @endphp
                <label
                    @class([
                        'hover-tooltip tooltip-bot color-btn',
                        'style-image' => $imageUrl,
                        'active' => $isActive,
                        'disabled' => $isDisabled,
                    ])
                    data-slug="{{ $attribute->slug }}"
                    data-color="{{ $attribute->slug }}"
                >
                    <input
                        type="radio"
                        name="attribute_{{ $set->slug }}_{{ $key }}"
                        data-slug="{{ $attribute->slug }}"
                        @if (! empty($referenceProduct)) data-reference-product="{{ $referenceProduct->slug }}" @endif
                        value="{{ $attribute->id }}"
                        @checked($isActive)
                        class="product-filter-item"
                        @disabled($isDisabled)
                    >
                    @if ($imageUrl)
                        <span class="img">
                            <img loading="lazy" width="60" height="60" src="{{ $imageUrl }}" alt="{{ $attribute->title }}">
                        </span>
                    @else
                        <span class="check-color" style="{{ $attribute->getAttributeStyle($set, $productVariations) }}"></span>
                    @endif
                    <span class="tooltip">{{ $attribute->title }}{{ $isDisabled ? ' — ' . __('Not available') : '' }}</span>
                </label>
            @endforeach
        </div>
    </div>
@endif
