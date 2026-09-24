@php
    /**
     * Left-rail filter for the store detail page: categories list only.
     * Search lives above the product grid in the main column; sort + per-page
     * + view-toggle are in the top toolbar (product-filters-top).
     *
     * Submits GET to current URL — plugin's PublicStoreController::getStore()
     * passes the request through GetProductService which reads standard ecommerce
     * filter keys (categories[]).
     *
     * Inputs:
     *   $store  \Botble\Marketplace\Models\Store
     */
    use Botble\Marketplace\Facades\MarketplaceHelper;

    $categories = method_exists(MarketplaceHelper::class, 'getCategoriesForVendor')
        ? MarketplaceHelper::getCategoriesForVendor($store->id)
        : collect();

    // Skip the entire filter card when this vendor has no categorized products —
    // an empty rounded panel adds visual noise without giving users anything to act on.
    if ($categories->isEmpty()) {
        return;
    }

    $selectedCategories = (array) request()->input('categories', []);
    $selectedCategories = array_map('strval', $selectedCategories);
    $searchTerm = (string) request()->input('q', '');

    // Build a parent → children map for hierarchical rendering. Categories without
    // a parent (or whose parent is not in this store's category set) become roots.
    $byId = $categories->keyBy('id');
    $childrenByParent = [];
    $rootCategories = collect();
    foreach ($categories as $cat) {
        $parentId = (int) ($cat->parent_id ?? 0);
        if ($parentId && $byId->has($parentId)) {
            $childrenByParent[$parentId][] = $cat;
        } else {
            $rootCategories->push($cat);
        }
    }
@endphp

<aside class="marketplace-store__filter">
    <form method="GET" action="{{ $store->url }}" class="marketplace-store__filter-form">
        {{-- Preserve current search term across category filter changes --}}
        @if ($searchTerm !== '')
            <input type="hidden" name="q" value="{{ $searchTerm }}">
        @endif

        @if ($rootCategories->isNotEmpty())
            <div class="marketplace-store__filter-group">
                <h5 class="marketplace-store__filter-title">{{ __('Categories') }}</h5>
                <ul class="marketplace-store__filter-categories list-unstyled mb-0">
                    @foreach ($rootCategories as $category)
                        @php($children = $childrenByParent[$category->id] ?? [])
                        @php($checked = in_array((string) $category->id, $selectedCategories, true))
                        <li class="marketplace-store__filter-category-item">
                            <label class="d-flex align-items-center gap-2">
                                <span class="marketplace-store__filter-category-icon" aria-hidden="true">
                                    <i class="icon icon-CheckCircle1"></i>
                                </span>
                                <input
                                    type="checkbox"
                                    class="form-check-input visually-hidden"
                                    name="categories[]"
                                    value="{{ $category->id }}"
                                    @checked($checked)
                                    data-auto-submit
                                >
                                <span class="marketplace-store__filter-category-name flex-grow-1">{{ $category->name }}</span>
                                @if (! empty($children))
                                    <span class="marketplace-store__filter-category-toggle" aria-hidden="true">+</span>
                                @endif
                            </label>

                            @if (! empty($children))
                                <ul class="marketplace-store__filter-category-children list-unstyled mt-1 ps-3">
                                    @foreach ($children as $child)
                                        @php($childChecked = in_array((string) $child->id, $selectedCategories, true))
                                        <li>
                                            <label class="d-flex align-items-center gap-2">
                                                <input
                                                    type="checkbox"
                                                    class="form-check-input"
                                                    name="categories[]"
                                                    value="{{ $child->id }}"
                                                    @checked($childChecked)
                                                    data-auto-submit
                                                >
                                                <span>{{ $child->name }}</span>
                                            </label>
                                        </li>
                                    @endforeach
                                </ul>
                            @endif
                        </li>
                    @endforeach
                </ul>
            </div>
        @endif

        @if (! empty($selectedCategories) || $searchTerm !== '')
            <a href="{{ $store->url }}" class="marketplace-store__filter-clear">
                <i class="icon icon-X2 me-1" aria-hidden="true"></i>
                {{ __('Clear filters') }}
            </a>
        @endif
    </form>
</aside>
