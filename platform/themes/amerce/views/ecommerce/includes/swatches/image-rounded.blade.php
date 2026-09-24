{{-- Image swatches — rounded thumbnails with tooltip. Receives $attribute, $product. --}}
@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;
@endphp

@if (isset($attribute) && $attribute->values->isNotEmpty())
    <div class="variant-picker-item variant-color product-swatch product-swatch-image-rounded"
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
                            'hover-tooltip tooltip-bot color-btn style-image swatch-image rounded-circle overflow-hidden',
                            'active' => $loop->first,
                       ])
                       data-attribute-value-id="{{ $value->id }}"
                       title="{{ BaseHelper::clean($value->title) }}">
                    <input type="radio"
                           name="attribute_{{ $attribute->id }}"
                           value="{{ $value->id }}"
                           class="visually-hidden"
                           data-image="{{ RvMedia::getImageUrl($value->image ?? null, 'thumb') }}"
                           @checked($loop->first)>
                    <div class="img rounded-circle overflow-hidden">
                        {!! BaseHelper::clean(RvMedia::image($value->image ?? null, BaseHelper::clean($value->title), 'thumb', false, ['class' => 'swatch-image__chip rounded-circle'])) !!}
                    </div>
                    <span class="tooltip">{{ BaseHelper::clean($value->title) }}</span>
                </label>
            @endforeach
        </div>
    </div>
@endif
