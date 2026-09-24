{{-- HomeAuto category slider — mirrors html/home-auto.html:
     category-v01 style-2 hover-img, image tile + centered underlined name, no count. --}}
<div class="container">
    <div dir="ltr" class="swiper tf-swiper"
        data-laptop="6" data-preview="5" data-tablet="4"
        data-mobile-sm="3" data-mobile="2"
        data-space-lg="30" data-space-md="20" data-space="10"
        data-pagination="2" data-pagination-sm="3" data-pagination-md="4" data-pagination-lg="5">
        <div class="swiper-wrapper">
            @forelse ($categories as $category)
                <div class="swiper-slide">
                    <a href="{{ $category->url ?: '#' }}" class="category-v01 style-2 hover-img wow fadeInUp">
                        <div class="cate-image img-style">
                            @php
                                $imgUrl = $category->image
                                    ? \Botble\Media\Facades\RvMedia::getImageUrl($category->image)
                                    : \Botble\Media\Facades\RvMedia::getDefaultImage();
                            @endphp
                            <img loading="lazy" width="210" height="210" src="{{ $imgUrl }}" alt="{{ $category->name }}">
                        </div>
                        <p class="cate-name text-center link link-underline fw-semibold">
                            {!! BaseHelper::clean($category->name) !!}
                        </p>
                    </a>
                </div>
            @empty
                <div class="swiper-slide text-center text-muted">{{ __('No categories selected.') }}</div>
            @endforelse
        </div>
        <div class="sw-dot-default tf-sw-pagination"></div>
    </div>
</div>
