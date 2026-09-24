@php
    $groupedCategories = ProductCategoryHelper::getProductCategoriesWithUrl()->groupBy('parent_id');
    $rootCategories = $groupedCategories->get(0);
@endphp

@if ($rootCategories)
    <ul class="dropdown_product_cate-list">
        @foreach ($rootCategories as $category)
            @php
                $hasChildren = $groupedCategories->has($category->id);
            @endphp
            <li @class(['has-children' => $hasChildren])>
                <a href="{{ route('public.single', $category->url) }}" class="dropdown_product_cate-link">
                    {{ $category->name }}
                </a>
                @if ($hasChildren)
                    <ul class="dropdown_product_cate-sublist">
                        @foreach ($groupedCategories->get($category->id) as $child)
                            <li>
                                <a href="{{ route('public.single', $child->url) }}" class="dropdown_product_cate-link">
                                    {{ $child->name }}
                                </a>
                            </li>
                        @endforeach
                    </ul>
                @endif
            </li>
        @endforeach
    </ul>
@endif
