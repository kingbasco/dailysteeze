@php
    $autoplay = ($shortcode->autoplay ?? 'yes') === 'yes';
    $interval = (int) ($shortcode->interval ?? 4000);
@endphp

<div class="tf-slideshow tf-btn-swiper-main hover-sw-nav organic-slide">
    <div dir="ltr" class="swiper tf-swiper sw-slide-show slider_effect_fade"
        data-loop="true"
        data-effect="fade"
        data-auto="{{ $autoplay ? 'true' : 'false' }}"
        data-delay="{{ $interval }}">
        <div class="swiper-wrapper">
            @foreach ($slides as $slide)
                <div class="swiper-slide">
                    <div class="slideshow-wrap organic">
                        <div class="sld_image">
                            {!! RvMedia::image($slide['image'] ?? null, $slide['title'] ?? '', 'hero-banner', false, ['class' => 'w-100', 'loading' => 'lazy']) !!}
                        </div>
                        <div class="sld_content pst-5">
                            <div class="container">
                                <div class="content-sld_wrap text-center text-md-start">
                                    @if (! empty($slide['subtitle']))
                                        <p class="sub-text_sld text-body-1 cl-text-2 mb-10">{!! BaseHelper::clean($slide['subtitle']) !!}</p>
                                    @endif
                                    @if (! empty($slide['title']))
                                        <h1 class="title_sld fw-medium cl-text-1">{!! BaseHelper::clean($slide['title']) !!}</h1>
                                    @endif
                                    @if (! empty($slide['button_text']))
                                        <a href="{{ $slide['button_url'] ?? '#' }}" class="tf-btn btn-fill bg-success animate-hover-btn">
                                            <span>{!! BaseHelper::clean($slide['button_text']) !!}</span>
                                        </a>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</div>
