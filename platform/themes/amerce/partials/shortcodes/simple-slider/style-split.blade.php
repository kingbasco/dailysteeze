@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    /**
     * simple-slider style-split — `slider-wrap_3` 2-col hero.
     *
     * Mirrors html/home-decor.html §1 (lines 1308-1411): `<div class="tf-slideshow">
     * <div class="container-full-3"><swiper sw-slide-show slider_effect_fade>`
     * with each slide rendering a `slider-wrap_3` containing
     *   .sld-content  (LEFT panel: blurred .sld-image_left bg + .content-sld_wrap text)
     *   .sld-image_right.overflow-hidden  (RIGHT main hero image)
     *
     * Slide content (from SimpleSliderSeeder metadata):
     *   subtitle  → `<p class="text-sub_sld text-body-1 text-white fade-item fade-item-1">`
     *   title     → `<p class="title_sld text-display fw-medium text-white fade-item fade-item-2">`
     *               nl2br → demo's `<br class="d-none d-xxl-block">` in the title
     *   button_label/link → `<a class="tf-btn btn-white style-2">`
     *
     * Knobs (shortcode attrs):
     *   wrapper_class — extra classes on `.tf-slideshow` (default empty).
     *   inner_class   — wrapper class around the swiper (default `container-full-3`).
     *   autoplay_speed — data-delay ms (default 3000 to match demo).
     */
    $autoplay      = ($shortcode->is_autoplay ?? 'yes') === 'yes';
    $autoplaySpeed = (int) ($shortcode->autoplay_speed ?? 3000);
    $showDots      = ($shortcode->show_dots ?? 'yes') === 'yes';
    $wrapperClass  = trim((string) ($shortcode->wrapper_class ?? ''));
    $innerClass    = trim((string) ($shortcode->inner_class ?? 'container-full-3'));
@endphp

<div {!! $shortcode->htmlAttributes() !!} class="tf-slideshow {{ $wrapperClass }}">
    <div class="{{ $innerClass }}">
        <div dir="ltr" class="swiper tf-swiper sw-slide-show slider_effect_fade"
             data-effect="fade"
             data-auto="{{ $autoplay ? 'true' : 'false' }}"
             data-loop="true"
             data-delay="{{ $autoplaySpeed }}">
            <div class="swiper-wrapper">
                @foreach ($sliders as $sliderItem)
                    @php
                        $title       = $sliderItem->title;
                        $subtitle    = method_exists($sliderItem, 'getMetaData')
                            ? ($sliderItem->getMetaData('subtitle', true) ?: null)
                            : null;
                        $buttonLabel = method_exists($sliderItem, 'getMetaData')
                            ? ($sliderItem->getMetaData('button_label', true) ?: null)
                            : null;
                        $btnStyleRaw = method_exists($sliderItem, 'getMetaData')
                            ? ($sliderItem->getMetaData('button_style', true) ?: 'pill-white')
                            : 'pill-white';
                        // Default button = demo's `tf-btn btn-white style-2`.
                        $btnClass = match ($btnStyleRaw) {
                            'outline-white' => 'tf-btn btn-line style-white',
                            'outline-dark'  => 'tf-btn btn-line',
                            'pill-dark'     => 'tf-btn animate-btn',
                            default         => 'tf-btn btn-white style-2',
                        };
                        $imageUrl = RvMedia::getImageUrl($sliderItem->image);
                    @endphp
                    <div class="swiper-slide">
                        <div class="slider-wrap_3">
                            <div class="sld-content">
                                <div class="sld-image_left">
                                    <img class="scale-item" loading="lazy" width="920" height="730"
                                         src="{{ $imageUrl }}" alt="{{ $title ?: '' }}">
                                </div>
                                <div class="content-sld_wrap">
                                    @if (! empty($subtitle))
                                        <p class="text-sub_sld text-body-1 text-white fade-item fade-item-1">
                                            {!! BaseHelper::clean($subtitle) !!}
                                        </p>
                                    @endif
                                    @if (! empty($title))
                                        <p class="title_sld text-display fw-medium text-white fade-item fade-item-2">
                                            {!! nl2br(BaseHelper::clean($title)) !!}
                                        </p>
                                    @endif
                                    @if (! empty($buttonLabel))
                                        <div class="group-action">
                                            <div class="fade-item fade-item-3">
                                                <a href="{{ $sliderItem->link ?: '#' }}" class="{{ $btnClass }}">
                                                    {!! BaseHelper::clean($buttonLabel) !!}
                                                </a>
                                            </div>
                                        </div>
                                    @endif
                                </div>
                            </div>
                            <div class="sld-image_right overflow-hidden">
                                <img class="scale-item" loading="lazy" width="920" height="730"
                                     src="{{ $imageUrl }}" alt="{{ $title ?: '' }}">
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
            @if ($showDots)
                <div class="sw-line-default tf-sw-pagination d-lg-none"></div>
            @endif
        </div>
    </div>
</div>
