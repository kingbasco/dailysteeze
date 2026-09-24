@php
    use Botble\Ecommerce\Facades\EcommerceHelper;
    use Botble\Theme\Facades\Theme;

    $filterPosition = theme_option('default_filter_position', 'sidebar');
@endphp

@if (isset($category) || isset($tag) || isset($collection) || isset($brand))
    @php $listingContext = $category ?? $tag ?? $collection ?? $brand ?? null; @endphp
    @if ($listingContext)
        @includeIf("plugins/ecommerce::themes.includes.product-listing-page-description", ["data" => $listingContext])
    @endif
@endif

<div class="page-shop @if ($filterPosition === 'sidebar') has-sidebar @endif" data-filter-position="{{ $filterPosition }}">
    {{-- Breadcrumb is rendered by layouts/base.blade.php. --}}

    <section class="flat-spacing">
        <div class="container">
            <div class="row">
                @if ($filterPosition === 'sidebar')
                    <aside class="col-xl-3">
                        @include(Theme::getThemeNamespace('views.ecommerce.includes.filters-sidebar'))
                    </aside>
                @endif

                <main class="col-xl-{{ $filterPosition === 'sidebar' ? 9 : 12 }}">
                    @if ($filterPosition === 'dropdown')
                        @include(Theme::getThemeNamespace('views.ecommerce.includes.filters-dropdown'))
                    @endif

                    @include(Theme::getThemeNamespace('views.ecommerce.includes.product-filters-top'))
                    @include(Theme::getThemeNamespace('views.ecommerce.includes.products-listing'), ['products' => $products])
                </main>
            </div>
        </div>
    </section>

    @if ($filterPosition === 'drawer')
        @include(Theme::getThemeNamespace('views.ecommerce.includes.filters-drawer'))
    @endif
</div>
