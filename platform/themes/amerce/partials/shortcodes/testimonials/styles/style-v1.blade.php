@php
    $autoplay = ($shortcode->autoplay ?? 'yes') === 'yes';
@endphp

<div class="container mt-30">
    <div dir="ltr" class="swiper tf-swiper testimonials-v1"
        data-preview="3" data-tablet="2" data-mobile="1" data-space="20"
        data-loop="true"
        data-auto="{{ $autoplay ? 'true' : 'false' }}">
        <div class="swiper-wrapper">
            @foreach ($items as $item)
                @php $rating = (int) ($item['rating'] ?? 0); @endphp
                <div class="swiper-slide">
                    <div class="testimonial-item text-center radius-10 p-4 bg-main">
                        @if (! empty($item['avatar']))
                            <div class="avatar mx-auto mb-15">
                                {!! RvMedia::image($item['avatar'], $item['name'] ?? '', 'thumb', false, ['class' => 'rounded-circle', 'style' => 'width:64px;height:64px;object-fit:cover;', 'loading' => 'lazy']) !!}
                            </div>
                        @endif
                        @if ($rating > 0)
                            <div class="rating mb-15">
                                @for ($i = 1; $i <= 5; $i++)
                                    <i class="icon icon-Star {{ $i <= $rating ? 'text-warning' : 'cl-text-3' }}"></i>
                                @endfor
                            </div>
                        @endif
                        @if (! empty($item['content']))
                            <p class="content text-body-1 cl-text-1">{!! BaseHelper::clean($item['content']) !!}</p>
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
</div>
