@php
    use Botble\Ecommerce\Facades\EcommerceHelper;
    use Botble\Theme\Facades\Theme;

    // Layout variant: default | left-sidebar | right-sidebar | full-width | sub-collection.
    // Resolution order: ?layout= URL override (sidebar values only) → Theme::get('shopLayout')
    // programmatic override → admin theme option default. The same `?layout=` query is also
    // used by products-listing.blade.php for grid/list — value sets don't overlap, so they
    // share the param cleanly. Anything not matching falls through to the admin defaults.
    $allowedShopLayouts = ['default', 'left-sidebar', 'right-sidebar', 'full-width', 'sub-collection'];
    $requestLayout = request()->query('layout');
    $shopLayout = (in_array($requestLayout, $allowedShopLayouts, true) ? $requestLayout : null)
        ?: (Theme::get('shopLayout') ?: theme_option('ecommerce_shop_layout', 'default'));

    // Sidebar visibility & container width derive from shopLayout, with the
    // theme-option `default_filter_position` still honored for the canonical
    // /products route (shopLayout === 'default').
    $themeFilterPosition = theme_option('default_filter_position', 'sidebar');

    [$layoutSidebar, $containerClass, $filterPosition] = match ($shopLayout) {
        'left-sidebar'    => ['left',  'container',      'sidebar'],
        'right-sidebar'   => ['right', 'container',      'sidebar'],
        'full-width'      => ['none',  'container-full', 'drawer'],
        'sub-collection'  => [
            $themeFilterPosition === 'sidebar' ? 'left' : 'none',
            'container',
            $themeFilterPosition === 'sidebar' ? 'sidebar' : 'drawer',
        ],
        default           => [
            $themeFilterPosition === 'sidebar' ? 'left' : 'none',
            'container',
            $themeFilterPosition,
        ],
    };
@endphp

<div
    @class([
        'page-shop',
        'has-sidebar' => $layoutSidebar !== 'none',
        'sidebar-' . $layoutSidebar => $layoutSidebar !== 'none',
        'shop-layout-' . $shopLayout,
    ])
    data-filter-position="{{ $filterPosition }}"
    data-shop-layout="{{ $shopLayout }}"
>
    {{-- Breadcrumb + page title come from layouts/base.blade.php; no duplicate include here. --}}

    @if ($shopLayout === 'sub-collection')
        @include(Theme::getThemeNamespace('views.ecommerce.includes.sub-collections-swiper'))
    @endif

    <section class="flat-spacing">
        <div class="{{ $containerClass }}">
            <div class="row">
                @if ($layoutSidebar === 'left')
                    <aside class="col-xl-3">
                        @include(Theme::getThemeNamespace('views.ecommerce.includes.filters-sidebar'))
                    </aside>
                @endif

                <main @class([
                    'col-xl-' . ($layoutSidebar === 'none' ? 12 : 9),
                    'order-xl-1' => $layoutSidebar === 'right',
                ])>
                    @if ($filterPosition === 'dropdown')
                        @include(Theme::getThemeNamespace('views.ecommerce.includes.filters-dropdown'))
                    @endif

                    @include(Theme::getThemeNamespace('views.ecommerce.includes.product-filters-top'))
                    @include(Theme::getThemeNamespace('views.ecommerce.includes.products-listing'), ['products' => $products])
                </main>

                @if ($layoutSidebar === 'right')
                    <aside class="col-xl-3 order-xl-2">
                        @include(Theme::getThemeNamespace('views.ecommerce.includes.filters-sidebar'))
                    </aside>
                @endif
            </div>
        </div>
    </section>

    @if ($filterPosition === 'drawer')
        @include(Theme::getThemeNamespace('views.ecommerce.includes.filters-drawer'))
    @endif
</div>
