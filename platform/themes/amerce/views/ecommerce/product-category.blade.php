@php
    use Botble\Ecommerce\Facades\EcommerceHelper;
    use Botble\Theme\Facades\Theme;

    $filterPosition = theme_option('default_filter_position', 'sidebar');
@endphp

<div class="page-shop page-product-category @if ($filterPosition === 'sidebar') has-sidebar @endif" data-filter-position="{{ $filterPosition }}">
    {{-- Breadcrumb is rendered by layouts/base.blade.php — do NOT include
         it here or the breadcrumb + page-title section will appear twice. --}}

    @if (! empty($category))
        <div class="container pt-4">
            @include(EcommerceHelper::viewPath('includes.product-listing-page-description'))
        </div>
    @endif

    <section class="flat-spacing">
        <div class="container">
            <div class="row">
                @if ($filterPosition === 'sidebar')
                    <aside class="col-xl-3">
                        @include(Theme::getThemeNamespace('views.ecommerce.includes.filters-sidebar'), [
                            'category' => $category ?? null,
                        ])
                    </aside>
                @endif

                <main class="col-xl-{{ $filterPosition === 'sidebar' ? 9 : 12 }}">
                    @if ($filterPosition === 'dropdown')
                        @include(Theme::getThemeNamespace('views.ecommerce.includes.filters-dropdown'), [
                            'category' => $category ?? null,
                        ])
                    @endif

                    @include(Theme::getThemeNamespace('views.ecommerce.includes.product-filters-top'))
                    @include(Theme::getThemeNamespace('views.ecommerce.includes.products-listing'), ['products' => $products])
                </main>
            </div>
        </div>
    </section>

    @if ($filterPosition === 'drawer')
        @include(Theme::getThemeNamespace('views.ecommerce.includes.filters-drawer'), [
            'category' => $category ?? null,
        ])
    @endif
</div>
