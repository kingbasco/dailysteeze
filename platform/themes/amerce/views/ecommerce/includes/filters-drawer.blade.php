@php
    use Botble\Ecommerce\Facades\EcommerceHelper;

    if (! EcommerceHelper::hasAnyProductFilters()) {
        return;
    }
@endphp

{{-- Match html/shop-full-width.html demo: only `offcanvas offcanvas-start
     canvas-filter` on the root. Adding `filter-drawer-wrap` / `sidebar-filter`
     pulls in the inline-dropdown grid CSS that breaks the side panel.
     Body delegates to the same plugin partial the in-page sidebar uses
     (filters-sidebar.blade.php) so both layouts share .bb-product-filter
     card styling — no drift between sidebar / drawer rendering. --}}
<div
    class="offcanvas offcanvas-start canvas-filter"
    tabindex="-1"
    id="filterShop"
    aria-labelledby="filterShopLabel"
    data-bb-toggle="filter-drawer"
>
    <div class="canvas-wrapper">
        <div class="canvas-header">
            <div class="h5 title mb-0" id="filterShopLabel">{{ __('Filters') }}</div>
            <span
                class="icon-X2 fs-24 link icon-close-popup"
                role="button"
                tabindex="0"
                data-bs-dismiss="offcanvas"
                data-action="close-filter-drawer"
                aria-label="{{ __('Close filters') }}"
            ></span>
        </div>
        <div class="canvas-body">
            @include(EcommerceHelper::viewPath('includes.filters'))
        </div>
    </div>
</div>
