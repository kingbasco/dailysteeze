@php
    use Botble\Ecommerce\Models\ProductSpecificationAttributeTranslation;
@endphp

@if ($attribute->type == 'checkbox')
    @if ($attribute->pivot->value ?? false)
        <span class="bb-product-specs__badge bb-product-specs__badge--yes">
            <x-core::icon name="ti ti-check" />
            <span>{{ __('Yes') }}</span>
        </span>
    @else
        <span class="bb-product-specs__badge bb-product-specs__badge--no">
            <x-core::icon name="ti ti-x" />
            <span>{{ __('No') }}</span>
        </span>
    @endif
@else
    {{ ProductSpecificationAttributeTranslation::getDisplayValue($product, $attribute, $currentLangCode) }}
@endif
