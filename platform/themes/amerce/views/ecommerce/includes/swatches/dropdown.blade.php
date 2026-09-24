{{-- Dropdown swatch — generic select-like dropdown for attributes (size, material, etc.). --}}
@php
    use Botble\Base\Facades\BaseHelper;

    $first = $attribute->values->first() ?? null;
@endphp

@if (isset($attribute) && $attribute->values->isNotEmpty())
    <div class="variant-picker-item product-swatch product-swatch-dropdown"
         data-attribute-id="{{ $attribute->id }}">
        <div class="variant-picker-label">
            <div>
                {{ $attribute->productAttributeSet->title ?? '' }}:
                <span class="variant-picker-label-value value-currentSize text-capitalize fw-medium"
                      data-bb-value="current-size">
                    {{ BaseHelper::clean(optional($first)->title ?? '') }}
                </span>
            </div>
        </div>
        <div class="tf-variant-dropdown full" data-bs-toggle="dropdown">
            <div class="btn-select">
                <span class="text-sort-value">{{ BaseHelper::clean(optional($first)->title ?? '') }}</span>
                <span class="icon icon-CaretDown"></span>
            </div>
            <div class="dropdown-menu">
                @foreach ($attribute->values as $value)
                    <button type="button"
                            @class(['select-item size-btn dropdown-item', 'active' => $loop->first])
                            data-attribute-value-id="{{ $value->id }}"
                            data-size="{{ BaseHelper::clean($value->title) }}">
                        <span class="text-value-item">{{ BaseHelper::clean($value->title) }}</span>
                    </button>
                @endforeach
            </div>
        </div>
        <select name="attribute_{{ $attribute->id }}"
                class="visually-hidden"
                aria-hidden="true"
                tabindex="-1"
                data-bb-toggle="swatch-dropdown-input">
            @foreach ($attribute->values as $value)
                <option value="{{ $value->id }}" @selected($loop->first)>{{ BaseHelper::clean($value->title) }}</option>
            @endforeach
        </select>
    </div>
@endif
