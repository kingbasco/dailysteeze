@php
    use Botble\Ecommerce\Facades\EcommerceHelper;
    use Botble\Theme\Facades\Theme;

    $shopLayout = Theme::get('shopLayout') ?: theme_option('ecommerce_shop_layout', 'default');
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

@if (isset($category) || isset($tag) || isset($collection) || isset($brand))
    @php $listingContext = $category ?? $tag ?? $collection ?? $brand ?? null; @endphp
    @if ($listingContext)
        @includeIf("plugins/ecommerce::themes.includes.product-listing-page-description", ["data" => $listingContext])
    @endif
@endif

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
    {{-- Breadcrumb is rendered by layouts/base.blade.php. --}}

    @if ($shopLayout === 'sub-collection')
        @include(Theme::getThemeNamespace('views.ecommerce.includes.sub-collections-swiper'), [
            'parentCategory' => $category ?? null,
        ])
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
