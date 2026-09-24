@php
    use Botble\Ecommerce\Models\ProductCategory;
    use Botble\Base\Enums\BaseStatusEnum;

    $parentCategory = $parentCategory ?? null;

    $subCategoriesQuery = ProductCategory::query()
        ->where('status', BaseStatusEnum::PUBLISHED)
        ->with(['slugable']);

    if ($parentCategory && $parentCategory instanceof ProductCategory) {
        $subCategoriesQuery->where('parent_id', $parentCategory->getKey());
    } else {
        // Root-level categories when no parent context (e.g. /shop-sub-collection page).
        $subCategoriesQuery->where(function ($query) {
            $query->whereNull('parent_id')->orWhere('parent_id', 0);
        });
    }

    $subCategories = $subCategoriesQuery
        ->orderBy('order')
        ->orderBy('name')
        ->limit(12)
        ->get();

    if ($subCategories->isEmpty()) {
        return;
    }
@endphp

<section class="flat-spacing pb-0">
    <div class="container">
        <div
            dir="ltr"
            class="swiper tf-swiper"
            data-preview="6"
            data-tablet="4"
            data-mobile-sm="3"
            data-mobile="2"
            data-space-lg="30"
            data-space-md="15"
            data-space="10"
            data-pagination="2"
            data-pagination-sm="3"
            data-pagination-md="4"
            data-pagination-lg="6"
        >
            <div class="swiper-wrapper">
                @foreach ($subCategories as $subCategory)
                    <div class="swiper-slide">
                        <a href="{{ $subCategory->url }}" class="category-v01 hover-img">
                            <div class="cate-image img-style">
                                @if ($subCategory->image)
                                    <img
                                        loading="lazy"
                                        width="210"
                                        height="210"
                                        src="{{ RvMedia::getImageUrl($subCategory->image, 'medium', false, RvMedia::getDefaultImage()) }}"
                                        alt="{{ $subCategory->name }}"
                                    >
                                @else
                                    <img
                                        loading="lazy"
                                        width="210"
                                        height="210"
                                        src="{{ RvMedia::getDefaultImage() }}"
                                        alt="{{ $subCategory->name }}"
                                    >
                                @endif
                            </div>
                            <h5 class="cate-name text-center link link-underline">{{ $subCategory->name }}</h5>
                        </a>
                    </div>
                @endforeach
            </div>
            <div class="sw-line-default style-2 tf-sw-pagination"></div>
        </div>
    </div>
</section>
