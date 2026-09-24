{{-- "Browse Categories" mega dropdown — used by header style-2 --}}
@if (is_plugin_active('ecommerce'))
    @php
        $rootCategories = app(\Botble\Ecommerce\Repositories\Interfaces\ProductCategoryInterface::class)
            ->advancedGet([
                'condition' => ['parent_id' => 0, 'status' => 'published'],
                'with'      => ['slugable', 'children.slugable'],
                'take'      => 12,
            ]);
    @endphp

    <div class="categories-dropdown dropdown">
        <button type="button" class="btn btn-outline-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="icon icon-List me-1"></i>{{ __('Browse Categories') }}
        </button>
        <ul class="dropdown-menu categories-dropdown__menu">
            @foreach ($rootCategories as $category)
                @include(Theme::getThemeNamespace('partials.header.categories-item'), ['category' => $category])
            @endforeach
        </ul>
    </div>
@endif
