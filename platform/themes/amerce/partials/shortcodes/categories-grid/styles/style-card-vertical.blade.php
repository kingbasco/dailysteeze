{{-- Mirrors html/home-fashion.html line 1916 — `category-v03 style-3 hover-img4`
     tall (372x623) cards in a 5-up swiper with a bottom-anchored cate-content
     box that shows the category name + ArrowUpRight icon.

     Backward-compatible per-preset knobs (defaults reproduce the fashion demo):
       wrapper_class : outer wrapper class (default 'px-10 mt-30';
                       html/home-pod.html §2 line 1368 uses 'mt-10 px-10').
       card_modifier : modifier(s) on `.category-v03` (default 'style-3 hover-img4';
                       home-pod §2 uses plain 'hover-img4' — no style-3).
       name_class    : class on the `.cate_name` anchor (default 'h5 fw-medium
                       rounded-0 link'; home-pod §2 uses 'h6 fw-medium link').
       data_laptop   : swiper `data-laptop` count for the ≥1600px breakpoint
                       (home-pod §2 uses data-laptop="5"). Unset = omit.
       data_preview  : swiper `data-preview` count (default 5; home-pod §2 = 4).
       image_height  : intrinsic <img> height (default 623; home-pod §2 = 490). --}}
@php
    $wrapperClass = trim((string) ($shortcode->wrapper_class ?? '')) ?: 'px-10 mt-30';
    $cardModifier = trim((string) ($shortcode->card_modifier ?? '')) ?: 'style-3 hover-img4';
    $nameClass = trim((string) ($shortcode->name_class ?? '')) ?: 'h5 fw-medium rounded-0 link';
    $dataLaptop = (int) ($shortcode->data_laptop ?? 0);
    $dataLaptop = ($dataLaptop >= 1 && $dataLaptop <= 8) ? $dataLaptop : 0;
    $dataPreview = (int) ($shortcode->data_preview ?? 5);
    $dataPreview = ($dataPreview >= 1 && $dataPreview <= 8) ? $dataPreview : 5;
    $imageHeight = (int) ($shortcode->image_height ?? 623);
    $imageHeight = ($imageHeight >= 100 && $imageHeight <= 2000) ? $imageHeight : 623;
@endphp
<div class="{{ $wrapperClass }}">
    <div dir="ltr" class="swiper tf-swiper categories-grid-slider"
         data-preview="{{ $dataPreview }}"@if ($dataLaptop > 0) data-laptop="{{ $dataLaptop }}"@endif data-tablet="4" data-mobile-sm="3" data-mobile="2" data-space="10"
         data-pagination="2" data-pagination-sm="3" data-pagination-md="4" data-pagination-lg="5">
        <div class="swiper-wrapper">
            @forelse ($categories as $category)
                <div class="swiper-slide">
                    <div class="category-v03 {{ $cardModifier }} wow fadeInUp">
                        <a href="{{ $category->url ?: '#' }}" class="cate-image img-style4">
                            @php
                                // Render the original (full-size) image — cate-* sources are already
                                // optimized at the demo's portrait aspect, so no thumbnail
                                // size variant is registered for this card.
                                $imgUrl = $category->image ? RvMedia::getImageUrl($category->image) : RvMedia::getDefaultImage();
                            @endphp
                            <img loading="lazy" src="{{ $imgUrl }}" width="372" height="{{ $imageHeight }}" alt="{{ $category->name }}">
                        </a>
                        <div class="cate-content">
                            <a href="{{ $category->url ?: '#' }}" class="cate_name {{ $nameClass }}">
                                {!! BaseHelper::clean($category->name) !!}
                                <i class="icon icon-ArrowUpRight1"></i>
                            </a>
                        </div>
                    </div>
                </div>
            @empty
                <div class="swiper-slide text-center text-muted">{{ __('No categories selected.') }}</div>
            @endforelse
        </div>
        <div class="sw-dots sw-pagination-categories"></div>
    </div>
</div>
