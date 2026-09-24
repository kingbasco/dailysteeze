@php
    use Botble\Theme\Facades\Theme;

    // Visitor URL override (?layout=grid|list) wins over the admin default.
    $requestLayout = request()->query('layout');
    $viewMode = $viewMode
        ?? (in_array($requestLayout, ['grid', 'list'], true) ? $requestLayout : null)
        ?? theme_option('ecommerce_product_item_layout', 'grid');
    $viewMode = in_array($viewMode, ['grid', 'list'], true) ? $viewMode : 'grid';
    $columnsDesktop = (int) theme_option('ecommerce_products_per_row', 4);
    $columnsTablet = (int) theme_option('ecommerce_products_per_row_tablet', 3);
    $columnsMobile = (int) theme_option('ecommerce_products_per_row_mobile', 2);
    $paginationStyle = theme_option('default_pagination_style', 'numbered');
    // Mobile-first: tf-col-N is base, md-col-N kicks in @≥768px, xl-col-N @≥1200px.
    $gridClass = $viewMode === 'list'
        ? 'tf-list-layout'
        : sprintf('tf-col-%d md-col-%d xl-col-%d', $columnsMobile, $columnsTablet, $columnsDesktop);
@endphp

<div class="wrapper-control-shop gridLayout-wrapper" data-bb-toggle="product-list">
    <div class="meta-filter-shop">
        <div class="count-text text-caption-01" data-bb-value="product-count">
            @if ($products instanceof \Illuminate\Contracts\Pagination\LengthAwarePaginator)
                {{ __('Showing :first–:last of :total results', [
                    'first' => $products->firstItem() ?: 0,
                    'last' => $products->lastItem() ?: 0,
                    'total' => $products->total(),
                ]) }}
            @else
                {{ $products->count() === 1
                    ? __(':count product', ['count' => $products->count()])
                    : __(':count products', ['count' => $products->count()]) }}
            @endif
        </div>
        <div class="br-line type-vertical"></div>
        <div id="applied-filters" data-bb-toggle="applied-filters"></div>
        <button
            type="button"
            class="remove-all-filters d-none"
            data-action="clear-filters"
            data-url="{{ url()->current() }}"
        >
            <i class="icon icon-X2"></i>
            {{ __('Clear all') }}
        </button>
    </div>

    @if ($products->isEmpty())
        @include(EcommerceHelper::viewPath('includes.listing-empty-state'))
    @else
        {{--
            bb-product-items-wrapper IS the grid container — the ecommerce
            plugin's AJAX filter handler (front-ecommerce.js) replaces this
            element's content with the rendered cards on filter success.
            Keeping the grid classes here means cards land directly into a
            grid; nesting an inner #productsLayout would be wiped on AJAX.
        --}}
        <div
            class="wrapper-shop tf-grid-layout {{ $gridClass }} bb-product-items-wrapper"
            id="productsLayout"
            data-view-mode="{{ $viewMode }}"
        >
            @foreach ($products as $product)
                @include(Theme::getThemeNamespace('views.ecommerce.includes.product-item'), [
                    'product' => $product,
                    'view_mode' => $viewMode,
                ])
            @endforeach
        </div>

        @if ($products instanceof \Illuminate\Contracts\Pagination\LengthAwarePaginator && $products->hasPages())
            @if ($paginationStyle === 'load-more')
                @include(EcommerceHelper::viewPath('includes.pagination-load-more'), ['products' => $products])
            @elseif ($paginationStyle === 'infinite')
                @include(EcommerceHelper::viewPath('includes.pagination-infinite'), ['products' => $products])
            @else
                @include(EcommerceHelper::viewPath('includes.pagination-numbered'), ['products' => $products])
            @endif
        @endif
    @endif
</div>
