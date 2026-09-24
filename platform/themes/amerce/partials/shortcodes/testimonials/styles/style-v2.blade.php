@php
    $autoplay = ($shortcode->autoplay ?? 'yes') === 'yes';
@endphp

<div class="container mt-30">
    <div dir="ltr" class="swiper tf-swiper testimonials-v2"
        data-preview="2" data-tablet="2" data-mobile="1" data-space="30"
        data-loop="true"
        data-auto="{{ $autoplay ? 'true' : 'false' }}">
        <div class="swiper-wrapper">
            @foreach ($items as $item)
                @php $rating = (int) ($item['rating'] ?? 0); @endphp
                <div class="swiper-slide">
                    <div class="testimonial-item style-card d-flex gap-20 align-items-start radius-10 p-4 bg-main">
                        @if (! empty($item['avatar']))
                            <div class="avatar flex-shrink-0">
                                {!! RvMedia::image($item['avatar'], $item['name'] ?? '', 'thumb', false, ['class' => 'rounded-circle', 'style' => 'width:80px;height:80px;object-fit:cover;', 'loading' => 'lazy']) !!}
                            </div>
                        @endif
                        <div class="content flex-grow-1">
                            @if ($rating > 0)
                                <div class="rating mb-10">
                                    @for ($i = 1; $i <= 5; $i++)
                                        <i class="icon icon-Star {{ $i <= $rating ? 'text-warning' : 'cl-text-3' }}"></i>
                                    @endfor
                                </div>
                            @endif
                            @if (! empty($item['content']))
                                <p class="text-body-1 cl-text-1">{!! BaseHelper::clean($item['content']) !!}</p>
                            @endif
                            <div class="meta mt-10">
                                @if (! empty($item['name']))
                                    <p class="name fw-medium mb-0">{!! BaseHelper::clean($item['name']) !!}</p>
                                @endif
                                @if (! empty($item['role']))
                                    <p class="role text-caption-01 cl-text-3">{!! BaseHelper::clean($item['role']) !!}</p>
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</div>
