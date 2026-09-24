@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    /**
     * Mirrors home-sneaker.html §8 `testimonial-v05` (lines 2750-2820): 2-up swiper
     * with cards split LEFT (345×380 lifestyle image) + RIGHT (5★ + quote + name).
     * White card bg on cream section wrap.
     */
    $autoplay = ($shortcode->autoplay ?? 'yes') === 'yes';
@endphp

{{-- .testimonials-style-card-image-left + .testimonial-v05 split-card layout
     lives in assets/sass/component/_inline-migrated.scss. --}}
<div class="container">
    <div dir="ltr" class="swiper tf-swiper"
         data-preview="2" data-tablet="2" data-mobile-sm="1" data-mobile="1"
         data-space-lg="30" data-space-md="20" data-space="15"
         data-pagination="1" data-pagination-sm="2" data-pagination-md="2" data-pagination-lg="2"
         data-auto="{{ $autoplay ? 'true' : 'false' }}">
        <div class="swiper-wrapper">
            @foreach ($items as $i => $item)
                @php $rating = (int) ($item['rating'] ?? 5); @endphp
                <div class="swiper-slide">
                    <div class="testimonial-v05 wow fadeInLeft" @if ($i > 0) data-wow-delay="0.{{ $i }}s" @endif>
                        @if (! empty($item['avatar']))
                            <div class="tes-image">
                                {!! RvMedia::image($item['avatar'], $item['name'] ?? '', 'medium', false, ['loading' => 'lazy', 'width' => 345, 'height' => 380]) !!}
                            </div>
                        @endif
                        <div class="tes-content">
                            @if ($rating > 0)
                                <div class="star-wrap d-flex align-items-center mb-16">
                                    @for ($s = 1; $s <= 5; $s++)
                                        <i class="icon icon-Star fs-24 {{ $s <= $rating ? '' : 'cl-text-3' }}"></i>
                                    @endfor
                                </div>
                            @endif
                            @if (! empty($item['content']))
                                <p class="tes_text text-body-1 mb-16">{!! BaseHelper::clean($item['content']) !!}</p>
                            @endif
                            <h5 class="tes_name mt-auto">{{ BaseHelper::clean($item['name'] ?? '') }}</h5>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
        <div class="sw-dot-default tf-sw-pagination"></div>
    </div>
</div>
