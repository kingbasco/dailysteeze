@php
    $autoplay = ($shortcode->autoplay ?? 'yes') === 'yes';
@endphp

<div class="container mt-30">
    <div class="testimonials-thumbs-wrap">
        <div dir="ltr" class="swiper tf-swiper testimonials-main"
            data-preview="1"
            data-loop="true"
            data-auto="{{ $autoplay ? 'true' : 'false' }}">
            <div class="swiper-wrapper">
                @foreach ($items as $item)
                    @php $rating = (int) ($item['rating'] ?? 0); @endphp
                    <div class="swiper-slide">
                        <div class="testimonial-item text-center px-4">
                            @if ($rating > 0)
                                <div class="rating mb-15">
                                    @for ($i = 1; $i <= 5; $i++)
                                        <i class="icon icon-Star {{ $i <= $rating ? 'text-warning' : 'cl-text-3' }}"></i>
                                    @endfor
                                </div>
                            @endif
                            @if (! empty($item['content']))
                                <p class="content h5 fw-medium">{!! BaseHelper::clean($item['content']) !!}</p>
                            @endif
                            <div class="meta mt-15">
                                @if (! empty($item['name']))
                                    <p class="name fw-medium mb-0">{!! BaseHelper::clean($item['name']) !!}</p>
                                @endif
                                @if (! empty($item['role']))
                                    <p class="role text-caption-01 cl-text-3">{!! BaseHelper::clean($item['role']) !!}</p>
                                @endif
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
        <div dir="ltr" class="swiper tf-swiper testimonials-thumbs mt-30" data-preview="5" data-space="10">
            <div class="swiper-wrapper">
                @foreach ($items as $item)
                    <div class="swiper-slide">
                        <div class="thumb-item text-center">
                            @if (! empty($item['avatar']))
                                {!! RvMedia::image($item['avatar'], $item['name'] ?? '', 'thumb', false, ['class' => 'rounded-circle', 'style' => 'width:64px;height:64px;object-fit:cover;', 'loading' => 'lazy']) !!}
                            @endif
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
</div>
