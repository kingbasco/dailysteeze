@php
    $autoplay   = ($shortcode->autoplay ?? 'yes') === 'yes';
    $interval   = (int) ($shortcode->interval ?? 3000);
    $showArrows = ($shortcode->show_arrows ?? 'yes') === 'yes';
@endphp

<div class="tf-slideshow style-2 tf-btn-swiper-main hover-sw-nav">
    <div dir="ltr" class="swiper tf-swiper sw-slide-show"
        data-loop="true"
        data-auto="{{ $autoplay ? 'true' : 'false' }}"
        data-delay="{{ $interval }}">
        <div class="swiper-wrapper">
            @foreach ($slides as $slide)
                <div class="swiper-slide">
                    <div class="slideshow-wrap fashion-slide">
                        <div class="sld_image">
                            {!! RvMedia::image($slide['image'] ?? null, $slide['title'] ?? '', 'hero-banner', false, ['class' => 'w-100', 'loading' => 'lazy']) !!}
                        </div>
                        <div class="sld_content pst-5">
                            <div class="container">
                                <div class="content-sld_wrap text-start">
                                    @if (! empty($slide['subtitle']))
                                        <p class="sub-text_sld text-body-1 mb-15">{!! BaseHelper::clean($slide['subtitle']) !!}</p>
                                    @endif
                                    @if (! empty($slide['title']))
                                        <h1 class="title_sld fw-semibold">{!! BaseHelper::clean($slide['title']) !!}</h1>
                                    @endif
                                    @if (! empty($slide['button_text']))
                                        <a href="{{ $slide['button_url'] ?? '#' }}" class="tf-btn btn-fill animate-hover-btn radius-3">
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
        @if ($showArrows)
            <div class="sw-button-prev sw-button-next-style-1"><i class="icon icon-arrow-left"></i></div>
            <div class="sw-button-next sw-button-next-style-1"><i class="icon icon-arrow-right"></i></div>
        @endif
    </div>
</div>
