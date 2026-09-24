@php
    use Botble\Ecommerce\Facades\EcommerceHelper;
    use Botble\Theme\Facades\Theme;

    if (! EcommerceHelper::hasAnyProductFilters()) {
        return;
    }

    $dataForFilter = EcommerceHelper::dataForFilter($category ?? null);
    $dataForFilter = array_pad($dataForFilter, 9, null);
    [$categories, $brands, $tags, $rand, $categoriesRequest, $urlCurrent, $categoryId, $maxFilterPrice, $labels] = $dataForFilter;
@endphp

<div class="tf-filter-dropdown" data-bb-toggle="filter-dropdown">
    <form
        action="{{ url()->current() }}"
        data-action="filter-form"
        data-target-url="{{ route('public.products') }}"
        method="GET"
        class="bb-product-form-filter meta-dropdown-filter d-flex flex-wrap gap-2"
    >
        @include(EcommerceHelper::viewPath('includes.filters.filter-hidden-fields'))

        @if (EcommerceHelper::isEnabledFilterProductsByCategories())
            <div class="dropup dropdown-filter">
                <button
                    type="button"
                    class="dropdown-toggle btn"
                    id="drop-filter-categories"
                    data-bs-toggle="dropdown"
                    data-bs-auto-close="outside"
                    aria-expanded="false"
                >
                    <span class="text-value">{{ __('Categories') }}</span>
                    <span class="icon icon-CaretDown"></span>
                </button>
                <div class="dropdown-menu p-3" aria-labelledby="drop-filter-categories">
                    @include(Theme::getThemeNamespace('views.ecommerce.includes.filters.category'), [
                        'categories' => $categories,
                    ])
                </div>
            </div>
        @endif

        @if (EcommerceHelper::isEnabledFilterProductsByPrice() && (! EcommerceHelper::hideProductPrice() || EcommerceHelper::isCartEnabled()))
            <div class="dropup dropdown-filter">
                <button
                    type="button"
                    class="dropdown-toggle btn"
                    id="drop-filter-price"
                    data-bs-toggle="dropdown"
                    data-bs-auto-close="outside"
                    aria-expanded="false"
                >
                    <span class="text-value">{{ __('Price') }}</span>
                    <span class="icon icon-CaretDown"></span>
                </button>
                <div class="dropdown-menu p-3" aria-labelledby="drop-filter-price">
                    @include(Theme::getThemeNamespace('views.ecommerce.includes.filters.price'), [
                        'maxFilterPrice' => $maxFilterPrice,
                    ])
                </div>
            </div>
        @endif

        @if (EcommerceHelper::isEnabledFilterProductsByBrands())
            <div class="dropup dropdown-filter">
                <button
                    type="button"
                    class="dropdown-toggle btn"
                    id="drop-filter-brands"
                    data-bs-toggle="dropdown"
                    data-bs-auto-close="outside"
                    aria-expanded="false"
                >
                    <span class="text-value">{{ __('Brands') }}</span>
                    <span class="icon icon-CaretDown"></span>
                </button>
                <div class="dropdown-menu p-3" aria-labelledby="drop-filter-brands">
                    @include(Theme::getThemeNamespace('views.ecommerce.includes.filters.brand'), [
                        'brands' => $brands,
                    ])
                </div>
            </div>
        @endif

        @if (EcommerceHelper::isEnabledFilterProductsByAttributes())
            <div class="dropup dropdown-filter">
                <button
                    type="button"
                    class="dropdown-toggle btn"
                    id="drop-filter-attributes"
                    data-bs-toggle="dropdown"
                    data-bs-auto-close="outside"
                    aria-expanded="false"
                >
                    <span class="text-value">{{ __('Attributes') }}</span>
                    <span class="icon icon-CaretDown"></span>
                </button>
                <div class="dropdown-menu p-3" aria-labelledby="drop-filter-attributes">
                    @include(Theme::getThemeNamespace('views.ecommerce.includes.filters.attribute'), [
                        'categoryId' => $categoryId,
                        'view' => $view ?? null,
                    ])
                </div>
            </div>
        @endif

        @if (EcommerceHelper::isReviewEnabled())
            <div class="dropup dropdown-filter">
                <button
                    type="button"
                    class="dropdown-toggle btn"
                    id="drop-filter-rating"
                    data-bs-toggle="dropdown"
                    data-bs-auto-close="outside"
                    aria-expanded="false"
                >
                    <span class="text-value">{{ __('Rating') }}</span>
                    <span class="icon icon-CaretDown"></span>
                </button>
                <div class="dropdown-menu p-3" aria-labelledby="drop-filter-rating">
                    @include(Theme::getThemeNamespace('views.ecommerce.includes.filters.rating'))
                </div>
            </div>
        @endif
    </form>
</div>
