{{-- Circular category slider — mirrors home-organic.html demo (lines 1383-1463):
     `category-v02 hover-img` with `cate-image img-style rounded-circle` (image
     clipped to a perfect circle showing the colored background baked into the
     source asset) + `cate-content text-center` block with h6 name + "N items"
     count below. Card itself sits on a light grey wash. --}}
<div class="container mt-30">
    <div dir="ltr" class="swiper tf-swiper swiper-cate"
        data-preview="5" data-tablet="4" data-mobile-sm="3" data-mobile="2"
        data-space="10"
        data-pagination="2" data-pagination-sm="3" data-pagination-md="4" data-pagination-lg="5">
        <div class="swiper-wrapper">
            @forelse ($categories as $category)
                <div class="swiper-slide">
                    <a href="{{ $category->url ?: '#' }}" class="category-v02 hover-img wow fadeInUp">
                        <div class="cate-image img-style rounded-circle">
                            {!! RvMedia::image($category->image ?? null, $category->name, 'thumb', false, ['loading' => 'lazy', 'width' => 210, 'height' => 210]) !!}
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
