@php
    use Botble\Ecommerce\Facades\EcommerceHelper;

    if (! EcommerceHelper::hasAnyProductFilters()) {
        return;
    }
@endphp

{{--
    sidebar chrome around the ecommerce plugin's authoritative filter
    form. The plugin partial emits `<form class="bb-product-form-filter" data-action="{{ route('public.products') }}">`
    which is wired to the AJAX handler in plugins/ecommerce/public/js/front-ecommerce.js.
    All filter data (categories, brands, tags, labels, price, attributes,
    discounted-only) and behaviour stay 100% identical to themes that delegate
    to this same view (e.g. shofy).
--}}
<aside class="canvas-sidebar sidebar-filter canvas-filter left" id="filterSidebar">
    <div class="canvas-wrapper">
        <div class="canvas-header">
            <h4 class="title d-none d-xl-block">{{ __('Filters') }}</h4>
            <h5 class="title d-xl-none">{{ __('Filters') }}</h5>
            <button
                type="button"
                class="btn-close-canvas border-0 bg-transparent d-xl-none"
                data-action="close-filter-sidebar"
                aria-label="{{ __('Close filters') }}"
            >
                <span class="icon-X2 fs-24"></span>
            </button>
        </div>
        <div class="canvas-body">
            @include(EcommerceHelper::viewPath('includes.filters'))
        </div>
    </div>
</aside>
{{-- Backdrop for the mobile-drawer state of the pinned sidebar (Left / Right
     shop layout below xl breakpoint). Tapping the backdrop closes the
     sidebar via main.js handleSidebarFilter. --}}
<div class="sidebar-filter-backdrop" aria-hidden="true"></div>
