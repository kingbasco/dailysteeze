@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    /**
     * Simple-slider style-headphone — `tf-slideshow style-2 v2` center-mode hero
     * with optional `infiniteSlide-policy-v2` USP strip rendered as sibling below.
     *
     * Mirrors html/home-headphone.html lines 1281-1455:
     *   <div class="tf-slideshow style-2 v2 tf-btn-swiper-main">
     *     <div class="swiper tf-swiper sw-slide-show slider_effect_fade"
     *          data-laptop=1.082 data-preview=1 data-tablet=1 data-mobile=1
     *          data-auto data-delay=3000 data-loop=true data-center=true
     *          data-space-lg=30 data-space-md=20 data-space=15>
     *       <div class="swiper-wrapper">
     *         <div class="swiper-slide">
     *           <div class="slider-wrap slideshow-wrap">
     *             <div class="sld_image"><img src=…/></div>
     *             <div class="sld_content type-3">
     *               <div class="content-sld_wrap">
     *                 <div class="h1 text-white mb-12 fade-item fade-item-1">{title}</div>
     *                 <p class="text-body-1 text-white fade-item fade-item-2 mb-40">{description}</p>
     *                 <a class="tf-btn btn-white fade-item fade-item-3">{button_label}</a>
     *               </div>
     *             </div>
     *           </div>
     *         </div>
     *         …
     *       </div>
     *       <div class="tf-sw-nav-2 d-lg-flex d-none nav-prev-swiper"><i class="icon icon-ArrowLeft"></i></div>
     *       <div class="tf-sw-nav-2 d-lg-flex d-none nav-next-swiper"><i class="icon icon-ArrowRight"></i></div>
     *       <div class="sw-line-default tf-sw-pagination d-lg-none"></div>
     *     </div>
     *     <div class="infiniteSlide-policy-v2 wow fadeInUp">
     *       <div class="infiniteSlide infiniteSlide-wrapper" data-clone="5">
     *         <div class="policy-image"><img …/></div>
     *         <p class="h2 fw-semibold policy-text">{usp_text_N}</p>
     *         …
     *       </div>
     *     </div>
     *   </div>
     *
     * Per-slide attrs (via slider metadata):
     *   button_label  — CTA label (.tf-btn btn-white)
     *
     * Per-shortcode attrs:
     *   show_arrows      — 'yes' (default) | 'no'  (drives tf-sw-nav-2 visibility)
     *   show_dots        — 'yes' (default) | 'no'  (mobile-only pagination dots)
     *   usp_quantity     — number of USP policy items (0 = no strip; default 0)
     *   usp_text_1..N    — policy text strings
     *   usp_image_1..N   — policy image paths
     */
    $autoplay      = ($shortcode->is_autoplay ?? 'yes') === 'yes';
    $autoplaySpeed = (int) ($shortcode->autoplay_speed ?? 3000);
    $showArrows    = ($shortcode->show_arrows ?? 'yes') === 'yes';
    $showDots      = ($shortcode->show_dots ?? 'yes') === 'yes';

    $uspQuantity   = max(0, (int) ($shortcode->usp_quantity ?? 0));
    $uspItems      = [];
    for ($i = 1; $i <= $uspQuantity; $i++) {
        $text  = trim((string) ($shortcode->{"usp_text_{$i}"} ?? ''));
        $image = trim((string) ($shortcode->{"usp_image_{$i}"} ?? ''));
        if ($text === '' && $image === '') {
            continue;
        }
        $uspItems[] = ['text' => $text, 'image' => $image];
    }
@endphp

<section {!! $shortcode->htmlAttributes() !!} class="tf-section simple-slider-section style-headphone">
    <div class="tf-slideshow style-2 v2 tf-btn-swiper-main">
        <div dir="ltr" class="swiper tf-swiper sw-slide-show slider_effect_fade"
            data-laptop="1.082"
            data-preview="1"
            data-tablet="1"
            data-mobile="1"
            data-auto="{{ $autoplay ? 'true' : '' }}"
            data-delay="{{ $autoplaySpeed }}"
            data-loop="true"
            data-center="true"
            data-space-lg="30"
            data-space-md="20"
            data-space="15">
            <div class="swiper-wrapper">
                @foreach ($sliders as $sliderItem)
                    @php
                        $title       = $sliderItem->title;
                        $description = $sliderItem->description;
                        $buttonLabel = method_exists($sliderItem, 'getMetaData')
                            ? ($sliderItem->getMetaData('button_label', true) ?: null)
                            : null;
                    @endphp
                    <div class="swiper-slide">
                        <div class="slider-wrap slideshow-wrap">
                            <div class="sld_image">
                                {{-- Original image (1770x680) — NOT the `hero-banner` 1920x1080 size,
                                     which 16:9-crops the slide ~256px taller than the demo. --}}
                                {!! RvMedia::image($sliderItem->image, $title ?: '', null, false, ['class' => 'lazyload scale-item scale-item-1', 'loading' => 'eager', 'decoding' => 'async', 'width' => '1770', 'height' => '680']) !!}
                            </div>
                            <div class="sld_content type-3">
                                <div class="content-sld_wrap">
                                    @if (! empty($title))
                                        <div class="h1 text-white mb-12 fade-item fade-item-1">
                                            {!! BaseHelper::clean($title) !!}
                                        </div>
                                    @endif
                                    @if (! empty($description))
                                        <p class="text-body-1 text-white fade-item fade-item-2 mb-40">
                                            {!! BaseHelper::clean($description) !!}
                                        </p>
                                    @endif
                                    @if (! empty($buttonLabel))
                                        <a href="{{ $sliderItem->link ?: '#' }}" class="tf-btn btn-white fade-item fade-item-3">
                                            {!! BaseHelper::clean($buttonLabel) !!}
                                        </a>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
            @if ($showArrows)
                <div class="tf-sw-nav-2 d-lg-flex d-none nav-prev-swiper">
                    <i class="icon icon-ArrowLeft"></i>
                </div>
                <div class="tf-sw-nav-2 d-lg-flex d-none nav-next-swiper">
                    <i class="icon icon-ArrowRight"></i>
                </div>
            @endif
            @if ($showDots)
                <div class="sw-line-default tf-sw-pagination d-lg-none"></div>
            @endif
        </div>
        @if (! empty($uspItems))
            <div class="infiniteSlide-policy-v2 wow fadeInUp">
                <div class="infiniteSlide infiniteSlide-wrapper" data-clone="5">
                    @foreach ($uspItems as $usp)
                        @if (! empty($usp['image']))
                            <div class="policy-image">
                                <img loading="lazy" width="160" height="80"
                                    src="{{ RvMedia::getImageUrl($usp['image']) }}" alt="">
                            </div>
                        @endif
                        @if (! empty($usp['text']))
                            <p class="h2 fw-semibold policy-text">{!! BaseHelper::clean($usp['text']) !!}</p>
                        @endif
                    @endforeach
                </div>
            </div>
        @endif
    </div>
</section>
