{{-- Mirrors html/home-electronics.html "Category" section (lines 1454-1587):
     full-width swiper of category-v02 style-3 cards (centered 100x100 icon-style image
     above a center-aligned name + items count), 8 cards visible on laptop, 6 on
     desktop default, line-style pagination. Trans: items count uses "items" not "Products". --}}
<div class="container-full">
    <div dir="ltr" class="swiper tf-swiper categories-grid-slider-icon"
        data-laptop="8" data-preview="6" data-tablet="4" data-mobile-sm="3" data-mobile="2"
        data-space-lg="20" data-space-md="15" data-space="10"
        data-pagination="2" data-pagination-sm="3" data-pagination-md="4" data-pagination-lg="8">
        <div class="swiper-wrapper">
            @forelse ($categories as $category)
                <div class="swiper-slide">
                    <a href="{{ $category->url ?: '#' }}" class="category-v02 style-3 hover-img wow fadeInUp">
                        <div class="cate-image img-style">
                            {!! RvMedia::image($category->image ?? null, $category->name, 'thumb', false, ['width' => 100, 'height' => 100, 'loading' => 'lazy']) !!}
                        </div>
                        <div class="cate-content text-center">
                            <h6 class="cate_name link">{!! BaseHelper::clean($category->name) !!}</h6>
                            @if ($showCount)
                                <p class="cate_quantity cl-text-2">
                                    {{ trans_choice(':count item|:count items', (int) ($category->products_count ?? 0), ['count' => (int) ($category->products_count ?? 0)]) }}
                                </p>
                            @endif
                        </div>
                    </a>
                </div>
            @empty
                <div class="swiper-slide text-center text-muted">{{ __('No categories selected.') }}</div>
            @endforelse
        </div>
        <div class="sw-line-default style-2 tf-sw-pagination"></div>
    </div>
</div>
