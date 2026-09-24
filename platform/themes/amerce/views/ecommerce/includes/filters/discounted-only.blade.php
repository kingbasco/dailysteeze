@php
    $discountedOnly = (int) request()->input('discounted_only') === 1;
@endphp

<div class="bb-product-filter widget-facet" data-bb-toggle="filter-discounted-only">
    <h4 class="bb-product-filter-title border-0 mb-3">{{ trans('plugins/ecommerce::ecommerce.on_sale') }}</h4>
    <div class="bb-product-filter-content">
        <ul class="filter-group-check">
            <li class="list-item">
                <input
                    type="checkbox"
                    class="tf-check style-2"
                    id="discounted_only"
                    name="discounted_only"
                    value="1"
                    @checked($discountedOnly)
                    data-bb-toggle="product-form-filter-item"
                    data-action="apply-filter"
                >
                <label for="discounted_only" class="label">
                    <span>{{ trans('plugins/ecommerce::products.show_only_discounted_products') }}</span>
                </label>
            </li>
        </ul>
    </div>
</div>
