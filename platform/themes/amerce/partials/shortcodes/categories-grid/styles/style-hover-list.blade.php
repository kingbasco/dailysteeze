{{-- Categories with hover-image overlay — mirrors home-sneaker.html §2 (lines 1500-1530)
     `cate-list > wg-cate-text > cate-image (hidden) + cate-text (large + count subscript)`.
     Each category renders as large text in light grey by default; on hover the cate-image
     reveals next to the text. Per-category product count from `products_count`. --}}
<div class="container-full">
    <div class="cate-list wow fadeInUp">
        @forelse ($categories as $category)
            <a href="{{ $category->url ?: '#' }}" class="wg-cate-text">
                <div class="cate-image">
                    {!! RvMedia::image($category->image ?? null, $category->name, 'thumb', false, ['loading' => 'lazy', 'width' => 200, 'height' => 200]) !!}
                </div>
                <div class="cate-text text-display letter-space-0 fw-medium text-uppercase">
                    {!! BaseHelper::clean($category->name) !!}@if ($showCount)<span class="h6">{{ (int) ($category->products_count ?? 0) }}</span>@endif
                </div>
            </a>
        @empty
            <p class="text-muted">{{ __('No categories selected.') }}</p>
        @endforelse
    </div>
</div>
