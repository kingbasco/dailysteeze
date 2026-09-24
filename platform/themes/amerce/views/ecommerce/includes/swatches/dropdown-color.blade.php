{{-- Dropdown swatch — color-aware (each item shows a color chip). --}}
@php
    use Botble\Base\Facades\BaseHelper;

    $first = $attribute->values->first() ?? null;
@endphp

@if (isset($attribute) && $attribute->values->isNotEmpty())
    <div class="variant-picker-item variant-color product-swatch product-swatch-dropdown-color"
         data-attribute-id="{{ $attribute->id }}">
        <div class="variant-picker-label">
            <div>
                {{ $attribute->productAttributeSet->title ?? '' }}:
                <span class="variant-picker-label-value value-currentColor text-capitalize fw-medium"
                      data-bb-value="current-color">
                    {{ BaseHelper::clean(optional($first)->title ?? '') }}
                </span>
            </div>
        </div>
        <div class="tf-variant-dropdown full" data-bs-toggle="dropdown">
            <div class="btn-select">
                <span class="check-color me-2"
                      style="background-color:{{ BaseHelper::clean(optional($first)->color ?? '#cccccc') }};"
                      aria-hidden="true"></span>
                <span class="text-sort-value">{{ BaseHelper::clean(optional($first)->title ?? '') }}</span>
                <span class="icon icon-CaretDown"></span>
            </div>
            <div class="dropdown-menu">
                @foreach ($attribute->values as $value)
                    <button type="button"
                            @class(['select-item color-btn dropdown-item d-flex align-items-center gap-2', 'active' => $loop->first])
                            data-attribute-value-id="{{ $value->id }}"
                            data-color="{{ BaseHelper::clean($value->color ?? $value->title) }}"
                            data-label="{{ BaseHelper::clean($value->title) }}">
                        <span class="check-color"
                              style="background-color:{{ BaseHelper::clean($value->color ?? '#cccccc') }};"
                              aria-hidden="true"></span>
                        <span class="text-value-item">{{ BaseHelper::clean($value->title) }}</span>
                    </button>
                @endforeach
            </div>
        </div>
        <select name="attribute_{{ $attribute->id }}"
                class="visually-hidden"
                aria-hidden="true"
                tabindex="-1"
                data-bb-toggle="swatch-dropdown-color-input">
            @foreach ($attribute->values as $value)
                <option value="{{ $value->id }}"
                        data-color="{{ BaseHelper::clean($value->color ?? '#cccccc') }}"
                        @selected($loop->first)>
                    {{ BaseHelper::clean($value->title) }}
                </option>
            @endforeach
        </select>
    </div>
@endif
