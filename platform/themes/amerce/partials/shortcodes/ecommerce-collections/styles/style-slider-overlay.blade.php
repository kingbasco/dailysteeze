@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    /**
     * 3-card swiper with overlay-content cards — mirrors home-sport.html §4 Collection
     * (lines 2167-2241): `box-cls-v1 style-3 hover-img` cards inside a `px-20` swiper
     * (data-preview=3, data-pagination-md=3, data-pagination-lg=3). Each card has:
     *   - Image (banner-62/63/64.jpg, 620x455)
     *   - Title (.cls_title h4 white + link-underline-white) with optional <br>-broken copy
     *   - Desc (.cls_desc text-white)
     *   - Button (tf-btn small-2 btn-white)
     *
     * Renders its own outer wrapper (NOT the parent index.blade.php's `container`).
     * Registered as a bare style.
     *
     * @var \Botble\Shortcode\Compilers\Shortcode $shortcode
     * @var \Illuminate\Support\Collection $collections
     */
    $items = collect($collections);
@endphp

{{-- Card aspect-ratio backstop (.ecommerce-collections--style-slider-overlay
     .box-cls-v1.style-3) lives in assets/sass/component/_inline-migrated.scss. --}}
<div class="px-20">
    <div dir="ltr" class="swiper tf-swiper"
         data-preview="3" data-tablet="3" data-mobile-sm="2" data-mobile="1"
         data-space-lg="20" data-space-md="15" data-space="10"
         data-pagination="1" data-pagination-sm="2" data-pagination-md="3" data-pagination-lg="3">
        <div class="swiper-wrapper">
            @foreach ($items as $index => $collection)
                <div class="swiper-slide">
                    <div class="item2 box-cls-v1 style-3 hover-img">
                        <a href="{{ $collection->url ?: '#' }}" class="cls-image img-style">
                            {!! RvMedia::image($collection->image, $collection->name, null, false, ['width' => 620, 'height' => 455, 'loading' => 'lazy']) !!}
                        </a>
                        <div class="cls-content wow fadeInRight">
                            <a href="{{ $collection->url ?: '#' }}" class="cls_title h4 text-white link-underline-white mb-8">
                                {!! BaseHelper::clean($collection->name) !!}
                            </a>
                            @if (! empty($collection->description))
                                <p class="cls_desc text-white mb-24">
                                    {!! BaseHelper::clean($collection->description) !!}
                                </p>
                            @endif
                            <a href="{{ $collection->url ?: '#' }}" class="tf-btn small-2 btn-white">
                                {{ __('Shop Now') }}
                            </a>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
        <div class="sw-line-default style-2 tf-sw-pagination"></div>
    </div>
</div>
