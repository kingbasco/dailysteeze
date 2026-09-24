@php
    // Honor the parent template's resolved filter position
    // (products.blade.php sets 'drawer' for full-width / 'sidebar' for left/right
    // layouts) before falling back to the global theme option.
    $filterPosition = $filterPosition ?? theme_option('default_filter_position', 'sidebar');
    $sortBy = request()->query('sort-by', 'default_sorting');
    $perPage = (int) request()->query('per-page', (int) theme_option('number_of_products_per_page', 12));
    $sortOptions = [
        'default_sorting' => __('Default'),
        'newest' => __('Newest'),
        'oldest' => __('Oldest'),
        'price_asc' => __('Price, low to high'),
        'price_desc' => __('Price, high to low'),
        'name_asc' => __('Alphabetically, A-Z'),
        'name_desc' => __('Alphabetically, Z-A'),
        'rating_desc' => __('Top rated'),
    ];
    $perPageOptions = [12, 24, 36, 48];
@endphp

<form
    method="GET"
    action="{{ url()->current() }}"
    class="tf-shop-control sticky-top no-offset"
    data-bb-toggle="product-filters-top"
>
    @foreach (request()->except(['sort-by', 'per-page', 'layout', 'page']) as $key => $value)
        @if (is_array($value))
            @foreach ($value as $item)
                <input type="hidden" name="{{ $key }}[]" value="{{ $item }}">
            @endforeach
        @else
            <input type="hidden" name="{{ $key }}" value="{{ $value }}">
        @endif
    @endforeach

    @if ($filterPosition === 'drawer' || $filterPosition === 'dropdown')
        <button
            type="button"
            class="tf-btn-filter"
            data-action="open-filter-{{ $filterPosition }}"
            data-bs-toggle="offcanvas"
            data-bs-target="#filterShop"
        >
            <span class="icon icon-filter"></span>
            <span class="text">{{ __('Show Filters') }}</span>
        </button>
    @elseif ($filterPosition === 'sidebar')
        {{-- Mobile-only trigger for pinned sidebar variant (Left / Right shop layout
             modes). Below 1200px the pinned .sidebar-filter is positioned off-screen
             by CSS (drawer behavior); without this trigger mobile / tablet visitors
             have no way to open it. JS handler in main.js (handleSidebarFilter)
             listens on [data-action="open-filter-sidebar"]. --}}
        <button
            type="button"
            class="tf-btn-filter d-xl-none"
            data-action="open-filter-sidebar"
        >
            <span class="icon icon-filter"></span>
            <span class="text">{{ __('Show Filters') }}</span>
        </button>
    @endif

    @php
        // Active state mirrors products-listing.blade.php resolution: ?layout= wins, else admin default.
        $activeLayout = request()->query('layout') ?: theme_option('ecommerce_product_item_layout', 'grid');
        $activeLayout = in_array($activeLayout, ['grid', 'list'], true) ? $activeLayout : 'grid';
    @endphp
    <ul class="tf-control-layout" data-bb-toggle="layout-switch">
        <li
            class="tf-view-layout-switch sw-layout-list list-layout @if ($activeLayout === 'list') active @endif"
            data-action="set-layout"
            data-layout="list"
        >
            <i class="icon-List"></i>
        </li>
        <li
            class="tf-view-layout-switch sw-layout-grid @if ($activeLayout === 'grid') active @endif"
            data-action="set-layout"
            data-layout="grid"
        >
            <i class="icon-grid-4"></i>
        </li>
    </ul>

    <input type="hidden" name="layout" value="{{ $activeLayout }}">

    <div class="tf-control-sorting">
        <label for="sort-by-select" class="visually-hidden">{{ __('Sort by') }}</label>
        <div class="tf-dropdown-sort" data-bs-toggle="dropdown">
            <div class="btn-select">
                <span class="text-sort-value">{{ $sortOptions[$sortBy] ?? $sortOptions['default_sorting'] }}</span>
                <span class="icon icon-CaretDown"></span>
            </div>
            <div class="dropdown-menu">
                @foreach ($sortOptions as $value => $label)
                    <div
                        class="select-item @if ($sortBy === $value) active @endif"
                        data-action="set-sort"
                        data-sort-value="{{ $value }}"
                    >
                        <span class="text-value-item">{{ $label }}</span>
                    </div>
                @endforeach
            </div>
        </div>
        <select name="sort-by" class="visually-hidden" data-bb-toggle="sort-select">
            @foreach ($sortOptions as $value => $label)
                <option value="{{ $value }}" @selected($sortBy === $value)>{{ $label }}</option>
            @endforeach
        </select>
    </div>

    <div class="tf-control-per-page">
        <label for="per-page-select" class="visually-hidden">{{ __('Items per page') }}</label>
        <select id="per-page-select" name="per-page" class="form-select" data-action="set-per-page">
            @foreach ($perPageOptions as $option)
                <option value="{{ $option }}" @selected($perPage === $option)>{{ $option }} / {{ __('page') }}</option>
            @endforeach
        </select>
    </div>

    <noscript>
        <button type="submit" class="tf-btn animate-btn">
            <span class="text">{{ __('Apply') }}</span>
        </button>
    </noscript>
</form>
