@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Theme\Facades\Theme;

    Theme::asset()->container('footer')->add(
        'range-slider-js',
        'vendor/core/plugins/ecommerce/libraries/range-slider.js',
        ['jquery']
    );

    $maxPrice = $maxFilterPrice ?? 0;
    $minRequest = BaseHelper::stringify(request()->query('min_price'));
    $maxRequest = BaseHelper::stringify(request()->query('max_price'));
@endphp

<div class="bb-product-filter widget-facet" data-bb-toggle="filter-price">
    <h4 class="bb-product-filter-title border-0 mb-3">{{ __('Filter By Price') }}</h4>
    <div class="bb-product-filter-content">
        <div class="widget-price filter-price">
            <div
                class="price-slider price-val-range"
                id="price-value-range"
                data-min="0"
                data-max="{{ $maxPrice }}"
            ></div>
            <div class="price-box tf-grid-layout tf-col-2 mt-3">
                <div class="box-wrap">
                    <div class="price-val_wrap">
                        <span class="cl-text-2 text-body-1">{{ __('From') }}</span>
                        <input
                            type="hidden"
                            name="min_price"
                            value="{{ $minRequest }}"
                            data-bb-toggle="price-min-input"
                        >
                        <div class="price-val from" id="price-min-value"></div>
                    </div>
                </div>
                <div class="box-wrap">
                    <div class="price-val_wrap">
                        <span class="cl-text-2 text-body-1">{{ __('To') }}</span>
                        <input
                            type="hidden"
                            name="max_price"
                            value="{{ $maxRequest }}"
                            data-bb-toggle="price-max-input"
                        >
                        <div class="price-val to" id="price-max-value"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
