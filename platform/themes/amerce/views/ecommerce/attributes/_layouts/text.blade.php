{{--
    Theme override of plugins/ecommerce::themes.attributes._layouts.text.
    Emits the html-demo markup (.variant-picker-item.variant-size +
    .size-btn tiles) so the theme's _product.scss styling applies
    (matches html/product-detail.html L1750-1768). Preserves the JS hooks
    that change-product-swatches.js depends on:
      - outer .product-attributes wrapper (already added by swatches-renderer)
      - per-set .attribute-swatches-wrapper[data-slug]
      - .text-swatch class on the values container (label click handler)
      - <input.product-filter-item type=radio data-slug value> inside <label>
--}}
@php
    $displayAttributes = $attributes->where('attribute_set_id', $set->id);
    $selectedAttr = $selected->firstWhere('attribute_set_id', $set->id);
@endphp

@if ($displayAttributes && $displayAttributes->isNotEmpty())
    <div
        class="variant-picker-item variant-size attribute-swatches-wrapper"
        data-type="text"
        data-slug="{{ $set->slug }}"
    >
        <div class="variant-picker-label">
            <div>
                {{ $set->title }}:
                <span class="variant-picker-label-value text-capitalize fw-medium">{{ $selectedAttr?->title }}</span>
            </div>
        </div>
        <div class="variant-picker-values text-swatch">
            @foreach ($displayAttributes as $attribute)
                @php
                    $isDisabled = ! $variationInfo->where('id', $attribute->id)->isNotEmpty();
                    $isActive = $selected->where('id', $attribute->id)->isNotEmpty();
                @endphp
                <label
                    @class([
                        'size-btn',
                        'active' => $isActive,
                        'disabled' => $isDisabled,
                    ])
                    data-slug="{{ $attribute->slug }}"
                    data-size="{{ $attribute->slug }}"
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
                    {{ $attribute->title }}
                </label>
            @endforeach
        </div>
    </div>
@endif
