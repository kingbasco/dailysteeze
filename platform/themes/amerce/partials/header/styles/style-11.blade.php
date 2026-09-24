@php
    use Botble\Base\Facades\BaseHelper;

    $headerCategories = collect();
    if (is_plugin_active('ecommerce')) {
        $headerCategories = app(\Botble\Ecommerce\Repositories\Interfaces\ProductCategoryInterface::class)
            ->advancedGet([
                'condition' => ['parent_id' => 0, 'status' => 'published'],
                'with'      => ['slugable', 'activeChildren', 'activeChildren.activeChildren'],
                'take'      => 8,
            ]);
    }
@endphp

{{-- Header Style 11 — Modern minimal centered (header-s9): logo + category dropdown + main-menu all left, inline search + icons right (no header-center). --}}
<div class="header-inner_wrap">
    <div class="container-full full-v4">
        <div class="header-inner px-0">
            <div class="box-open-menu-mobile d-xl-none">
                <a href="#mobileMenu" data-bs-toggle="offcanvas" class="btn-open-menu" aria-label="{{ __('Open menu') }}">
                    <i class="icon icon-List"></i>
                </a>
            </div>

            <div class="header-left">
                <a href="{{ BaseHelper::getHomepageUrl() }}" class="logo-site">
                    {{ Theme::getLogoImage(['class' => 'logo-light'], 'logo', 30) }}
                    {{ Theme::getLogoImage(['class' => 'logo-dark'], 'logo_dark', 30) }}
                </a>
                @include(Theme::getThemeNamespace('partials.header.browse-by-category'), [
                    'categories'   => $headerCategories,
                    'wrapClass'    => 'nav-category-wrap style-3 main-action-active d-none d-xxl-block',
                    'btnIconClass' => '',
                    'nameClass'    => 'name-category fw-medium lh-24',
                ])
                <nav class="box-navigation d-none d-xl-block">
                    @include(Theme::getThemeNamespace('partials.header.main-menu'))
                </nav>
            </div>

            <div class="header-right">
                @include(Theme::getThemeNamespace('partials.header.search-form'), ['formClasses' => 'form-search-nav style-3 d-none d-xl-block'])
                @include(Theme::getThemeNamespace('partials.header.ecommerce-action-buttons'), ['inlineSearchAtXl' => true])
            </div>
        </div>
    </div>
</div>
