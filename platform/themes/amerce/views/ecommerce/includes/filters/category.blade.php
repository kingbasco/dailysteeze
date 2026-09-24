@php
    use Botble\Ecommerce\Facades\EcommerceHelper;

    $categoriesData = $categories ?? collect();
    $requestCategories = EcommerceHelper::parseFilterParams(request(), 'categories');
@endphp

@if ($categoriesData->isNotEmpty())
    <div class="widget-facet" data-bb-toggle="filter-category">
        <div
            class="facet-title"
            data-bs-target="#filter-category-collapse"
            role="button"
            data-bs-toggle="collapse"
            aria-expanded="true"
            aria-controls="filter-category-collapse"
        >
            <h6>{{ __('Categories') }}</h6>
            <span class="icon icon-CaretDown"></span>
        </div>
        <div id="filter-category-collapse" class="collapse show">
            <ul class="collapse-body filter-group-check group-category">
                @foreach ($categoriesData as $cat)
                    <li class="list-item">
                        <input
                            type="checkbox"
                            class="tf-check"
                            id="filter-category-{{ $cat->id }}"
                            name="categories[]"
                            value="{{ $cat->id }}"
                            @checked(in_array($cat->id, $requestCategories))
                            data-action="apply-filter"
                        >
                        <label for="filter-category-{{ $cat->id }}" class="label">
                            <span class="cate-text">{{ $cat->name }}</span>
                            @if (isset($cat->products_count))
                                <span class="count">({{ $cat->products_count }})</span>
                            @endif
                        </label>
                    </li>
                @endforeach
            </ul>
        </div>
    </div>
@endif
