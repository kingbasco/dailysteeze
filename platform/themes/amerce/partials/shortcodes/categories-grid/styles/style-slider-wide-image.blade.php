{{-- Mirrors html/home-baby.html §3 (Category, lines 1624-1721) — `category-v04 hover-img`
     240x180 wide image cards in a 5-up swiper. Heading is rendered by index.blade.php
     (`sect-heading type-2 text-center`); this style file only emits the swiper. --}}
    <div class="container">
        <div dir="ltr" class="swiper tf-swiper swiper-cate"
            data-preview="5" data-tablet="4" data-mobile-sm="3" data-mobile="2"
            data-space-lg="30" data-space-md="20" data-space="10"
            data-pagination="2" data-pagination-sm="3" data-pagination-md="4" data-pagination-lg="5">
            <div class="swiper-wrapper">
                @forelse ($categories as $category)
                    <div class="swiper-slide">
                        <a href="{{ $category->url ?: '#' }}" class="category-v04 hover-img wow fadeInUp">
                            <div class="cate-image img-style">
                                @php
                                    $imgUrl = $category->image
                                        ? \Botble\Media\Facades\RvMedia::getImageUrl($category->image)
                                        : \Botble\Media\Facades\RvMedia::getDefaultImage();
                                @endphp
                                <img loading="lazy" width="240" height="180" src="{{ $imgUrl }}" alt="{{ $category->name }}">
                            </div>
                            <div class="cate-content text-center">
                                <h5 class="cate_name link-underline-text">{!! BaseHelper::clean($category->name) !!}</h5>
                                @if ($showCount)
                                    <p class="cate_quantity text-caption-01 cl-text-2">
                                        {{ trans_choice(':count Product|:count Products', (int) ($category->products_count ?? 0), ['count' => (int) ($category->products_count ?? 0)]) }}
                                    </p>
                                @endif
                            </div>
                        </a>
                    </div>
                @empty
                    <div class="swiper-slide text-center text-muted">{{ __('No categories selected.') }}</div>
                @endforelse
            </div>
            <div class="sw-dot-default tf-sw-pagination"></div>
        </div>
    </div>
