{{-- Color swatches — rounded chips with tooltip. Receives $attribute, $product. --}}
@php
    use Botble\Base\Facades\BaseHelper;
@endphp

@if (isset($attribute) && $attribute->values->isNotEmpty())
    <div class="variant-picker-item variant-color product-swatch product-swatch-color-rounded"
         data-attribute-id="{{ $attribute->id }}">
        <div class="variant-picker-label">
            <div>
                {{ $attribute->productAttributeSet->title ?? '' }}:
                <span class="variant-picker-label-value value-currentColor text-capitalize fw-medium"
                      data-bb-value="current-color">
                    {{ BaseHelper::clean($attribute->values->first()->title ?? '') }}
                </span>
            </div>
        </div>
        <div class="variant-picker-values d-flex flex-wrap gap-2">
            @foreach ($attribute->values as $value)
                <label @class([
                            'hover-tooltip tooltip-bot color-btn swatch-color rounded-circle',
                            'active' => $loop->first,
                       ])
                       data-color="{{ BaseHelper::clean($value->color ?? $value->title) }}"
                       data-attribute-value-id="{{ $value->id }}"
                       title="{{ BaseHelper::clean($value->title) }}">
                    <input type="radio"
                           name="attribute_{{ $attribute->id }}"
                           value="{{ $value->id }}"
                           class="visually-hidden"
                           @checked($loop->first)>
                    <span class="check-color swatch-color__chip rounded-circle"
                          style="background-color:{{ BaseHelper::clean($value->color ?? '#cccccc') }};"
                          aria-label="{{ BaseHelper::clean($value->title) }}"></span>
                    <span class="tooltip">{{ BaseHelper::clean($value->title) }}</span>
                </label>
            @endforeach
        </div>
    </div>
@endif
