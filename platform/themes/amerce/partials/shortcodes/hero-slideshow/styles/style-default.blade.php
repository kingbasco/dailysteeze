@php
    $autoplay    = ($shortcode->autoplay ?? 'yes') === 'yes';
    $interval    = (int) ($shortcode->interval ?? 3000);
    $showArrows  = ($shortcode->show_arrows ?? 'yes') === 'yes';
    $showDots    = ($shortcode->show_dots ?? 'no') === 'yes';
@endphp

<div class="tf-slideshow tf-btn-swiper-main hover-sw-nav">
    <div dir="ltr" class="swiper tf-swiper sw-slide-show slider_effect_fade"
        data-loop="true"
        data-effect="fade"
        data-auto="{{ $autoplay ? 'true' : 'false' }}"
        data-delay="{{ $interval }}">
        <div class="swiper-wrapper">
            @foreach ($slides as $slide)
                @php
                    $alignment = $slide['alignment'] ?? 'center';
                    $alignClass = 'text-' . (in_array($alignment, ['left', 'center', 'right'], true) ? $alignment : 'center');
                @endphp
                <div class="swiper-slide">
                    <div class="slideshow-wrap">
                        <div class="sld_image">
                            {!! RvMedia::image($slide['image'] ?? null, $slide['title'] ?? '', 'hero-banner', false, ['class' => 'w-100', 'loading' => 'lazy']) !!}
                        </div>
                        <div class="sld_content pst-5">
                            <div class="container">
                                <div class="content-sld_wrap {{ $alignClass }}">
                                    @if (! empty($slide['subtitle']))
                                        <p class="sub-text_sld text-body-1 text-white mb-15">
                                            {!! BaseHelper::clean($slide['subtitle']) !!}
                                        </p>
                                    @endif
                                    @if (! empty($slide['title']))
                                        <p class="title_sld text-display fw-medium text-white">
                                            {!! BaseHelper::clean($slide['title']) !!}
                                        </p>
                                    @endif
                                    @if (! empty($slide['button_text']))
                                        <a href="{{ $slide['button_url'] ?? '#' }}" class="tf-btn btn-white">
                                            {!! BaseHelper::clean($slide['button_text']) !!}
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
        @if ($showDots)
            <div class="sw-dots sw-pagination-slider"></div>
        @endif
    </div>
</div>
