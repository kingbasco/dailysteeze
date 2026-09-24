@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    /**
     * Mirrors html/home-fashion.html `testimonial-v01 style-6 hover-img4`
     * (line 2643-2735). Each slide is a card with a 330x330 square image on top
     * (img-style4 hover effect) and beneath it: 5 stars, quote, then a
     * "name / role" line in caption text. 4-up swiper at xl, 3 at md, 2 at sm.
     */
    $autoplay = ($shortcode->autoplay ?? 'yes') === 'yes';
@endphp

<div class="mt-30">
    <div dir="ltr" class="swiper tf-swiper wrap-sw-over"
         data-preview="4" data-tablet="3" data-mobile-sm="2" data-mobile="2"
         data-space-lg="30" data-space-md="20" data-space="10"
         data-pagination="2" data-pagination-sm="2" data-pagination-md="3" data-pagination-lg="4"
         data-loop="true"
         data-auto="{{ $autoplay ? 'true' : 'false' }}">
        <div class="swiper-wrapper">
            @foreach ($items as $i => $item)
                @php $rating = (int) ($item['rating'] ?? 0); @endphp
                <div class="swiper-slide wow fadeInUp" @if ($i > 0) data-wow-delay="0.{{ $i }}s" @endif>
                    <div class="testimonial-v01 hover-img4 style-6">
                        @if (! empty($item['avatar']))
                            <div class="img-style4">
                                {!! RvMedia::image($item['avatar'], $item['name'] ?? '', 'thumb', false, ['loading' => 'lazy', 'width' => 330, 'height' => 330, 'decoding' => 'async']) !!}
                            </div>
                        @endif
                        <div>
                            @if ($rating > 0)
                                <div class="star-wrap d-flex align-items-center mb-12">
                                    @for ($s = 1; $s <= 5; $s++)
                                        <i class="icon icon-Star fs-20 {{ $s <= $rating ? '' : 'cl-text-3' }}"></i>
                                    @endfor
                                </div>
                            @endif
                            @if (! empty($item['content']))
                                <p class="text-body-1 mb-12">{!! BaseHelper::clean($item['content']) !!}</p>
                            @endif
                            <div class="text-caption-01 d-flex gap-4">
                                {{ BaseHelper::clean($item['name'] ?? '') }}
                                @if (! empty($item['role']))
                                    <span class="cl-text-3">/</span><span class="cl-text-3">{{ BaseHelper::clean($item['role']) }}</span>
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
        <div class="sw-dot-default tf-sw-pagination"></div>
    </div>
</div>
