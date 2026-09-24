@php
    use Botble\Ecommerce\Facades\EcommerceHelper;

    $brandsData = $brands ?? collect();
    $requestBrands = EcommerceHelper::parseFilterParams(request(), 'brands');
@endphp

@if ($brandsData->isNotEmpty())
    <div class="widget-facet" data-bb-toggle="filter-brand">
        <div
            class="facet-title"
            data-bs-target="#filter-brand-collapse"
            role="button"
            data-bs-toggle="collapse"
            aria-expanded="true"
            aria-controls="filter-brand-collapse"
        >
            <h6>{{ __('Brands') }}</h6>
            <span class="icon icon-CaretDown"></span>
        </div>
        <div id="filter-brand-collapse" class="collapse show">
            <ul class="collapse-body filter-group-check">
                @foreach ($brandsData as $brand)
                    <li class="list-item">
                        <input
                            type="checkbox"
                            class="tf-check style-2"
                            id="filter-brand-{{ $brand->id }}"
                            name="brands[]"
                            value="{{ $brand->id }}"
                            @checked(in_array($brand->id, $requestBrands))
                            data-action="apply-filter"
                        >
                        <label for="filter-brand-{{ $brand->id }}" class="label">
                            <span class="brand-text">{{ $brand->name }}</span>
                            @if (isset($brand->products_count))
                                <span class="count">({{ $brand->products_count }})</span>
                            @endif
                        </label>
                    </li>
                @endforeach
            </ul>
        </div>
    </div>
@endif
