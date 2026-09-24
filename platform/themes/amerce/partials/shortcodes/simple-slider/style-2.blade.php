@php
    $autoplay      = ($shortcode->is_autoplay ?? 'yes') === 'yes';
    $autoplaySpeed = (int) ($shortcode->autoplay_speed ?? 5000);
    $showArrows    = ($shortcode->show_arrows ?? 'yes') === 'yes';
    $showDots      = ($shortcode->show_dots ?? 'yes') === 'yes';
@endphp

<section {!! $shortcode->htmlAttributes() !!} class="tf-section simple-slider-section style-split">
    <div class="tf-slideshow style-2 tf-btn-swiper-main hover-sw-nav">
        <div dir="ltr" class="swiper tf-swiper sw-slide-show"
            data-loop="true"
            data-auto="{{ $autoplay ? 'true' : 'false' }}"
            data-delay="{{ $autoplaySpeed }}">
            <div class="swiper-wrapper">
                @foreach ($sliders as $sliderItem)
                    @php
                        $title       = $sliderItem->title;
                        $description = $sliderItem->description;
                        $subtitle    = method_exists($sliderItem, 'getMetaData')
                            ? ($sliderItem->getMetaData('subtitle', true) ?: null)
                            : null;
                        $buttonLabel = method_exists($sliderItem, 'getMetaData')
                            ? ($sliderItem->getMetaData('button_label', true) ?: null)
                            : null;
                    @endphp
                    <div class="swiper-slide">
                        <div class="slideshow-wrap fashion-slide">
                            <div class="sld_image">
                                {{-- Raw <img> so first slide can opt out of lazy + claim
                                     fetchpriority=high (LCP candidate). Other slides stay lazy. --}}
                                @php
                                    $isFirstSlide = $loop->first;
                                    $imgSrc       = RvMedia::getImageUrl($sliderItem->image);
                                    $imgSrcset    = collect([
                                        RvMedia::getImageUrl($sliderItem->image, 'hero-sm') . ' 400w',
                                        RvMedia::getImageUrl($sliderItem->image, 'hero-md') . ' 768w',
                                        $imgSrc . ' 1920w',
                                    ])->implode(', ');
                                @endphp
                                <img src="{{ $imgSrc }}"
                                     srcset="{{ $imgSrcset }}"
                                     sizes="(max-width: 768px) 100vw, 50vw"
                                     class="w-100"
                                     alt="{{ $title ?: '' }}"
                                     decoding="async"
                                     @if ($isFirstSlide) fetchpriority="high" loading="eager" @else loading="lazy" fetchpriority="low" @endif>
                            </div>
                            <div class="sld_content pst-5">
                                <div class="container">
                                    <div class="content-sld_wrap text-start">
                                        @if (! empty($subtitle))
                                            <p class="sub-text_sld text-body-1 mb-15 text-uppercase">
                                                {!! BaseHelper::clean($subtitle) !!}
                                            </p>
                                        @elseif (! empty($description))
                                            <p class="sub-text_sld text-body-1 mb-15">
                                                {!! BaseHelper::clean($description) !!}
                                            </p>
                                        @endif
                                        @if (! empty($title))
                                            <h1 class="title_sld fw-semibold">{!! BaseHelper::clean($title) !!}</h1>
                                        @endif
                                        @if (! empty($buttonLabel))
                                            <a href="{{ $sliderItem->link ?: '#' }}" class="tf-btn btn-fill animate-hover-btn radius-3">
                                                <span>{!! BaseHelper::clean($buttonLabel) !!}</span>
                                            </a>
                                        @elseif ($sliderItem->link)
                                            <a href="{{ $sliderItem->link }}" class="tf-btn btn-fill animate-hover-btn radius-3">
                                                <span>{{ __('Shop Now') }}</span>
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
</section>
