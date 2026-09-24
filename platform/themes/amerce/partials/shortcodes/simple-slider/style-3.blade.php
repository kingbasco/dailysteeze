@php
    /**
     * Simple-slider style-3 — split-panel hero (Garden / Mental wellness pattern).
     * Mirrors html/home-garden.html lines 1572-1687: tf-slideshow.slideshow-3 with
     * slider-wrap_4 — solid colored panel left (text) + image right.
     *
     * Mobile (<768px): right .sld-image is hidden via CSS; the .sld-image-abs inside
     * the left panel becomes the full-width background (image dimmed by an overlay).
     *
     * Per-shortcode attrs (all optional):
     *   panel_bg_class   : extra class on .sld-content (e.g. "panel-bg-cream")
     *   panel_color      : 'white' (default) | 'dark' — drives text-white toggle
     *   button_style     : 'pill-white' (default) | 'pill-dark' | 'outline-white' | 'outline-dark'
     *   show_arrows      : 'yes' | 'no' (default 'no' — demo uses dots only)
     *   show_dots        : 'yes' (default) | 'no'
     */
    $autoplay      = ($shortcode->is_autoplay ?? 'yes') === 'yes';
    $autoplaySpeed = (int) ($shortcode->autoplay_speed ?? 5000);
    $showArrows    = ($shortcode->show_arrows ?? 'no') === 'yes';
    $showDots      = ($shortcode->show_dots ?? 'yes') === 'yes';

    $panelBgClass  = trim((string) ($shortcode->panel_bg_class ?? ''));
    $panelColor    = ($shortcode->panel_color ?? 'white') === 'dark' ? 'dark' : 'white';
    $textColorCls  = $panelColor === 'dark' ? '' : 'text-white';

    $btnStyleRaw   = $shortcode->button_style ?? 'pill-white';
    $btnClassMap   = [
        'pill-white'    => 'tf-btn btn-white',
        'pill-dark'     => 'tf-btn animate-btn',
        'outline-white' => 'tf-btn btn-line style-white',
        'outline-dark'  => 'tf-btn btn-line',
    ];
    $btnClass      = $btnClassMap[$btnStyleRaw] ?? 'tf-btn btn-white';
@endphp

<section {!! $shortcode->htmlAttributes() !!} class="tf-slideshow slideshow-3">
    <div dir="ltr" class="swiper tf-swiper sw-slide-show slideshow-2 slider_effect_fade"
        data-loop="true"
        data-effect="fade"
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
                    $decorImage  = method_exists($sliderItem, 'getMetaData')
                        ? ($sliderItem->getMetaData('decor_image', true) ?: null)
                        : null;
                    $imageUrl    = RvMedia::getImageUrl($sliderItem->image);
                    $decorUrl    = $decorImage ? RvMedia::getImageUrl($decorImage) : null;
                @endphp
                <div class="swiper-slide">
                    <div class="slider-wrap_4">
                        <div class="sld-content {{ $panelBgClass }}">
                            {{-- Mobile (<md): slider-N.jpg as background. Desktop (≥md): optional decorative graphic overlay. --}}
                            <div class="sld-image-abs">
                                <img class="d-md-none scale-item" loading="lazy" width="900" height="600"
                                    src="{{ $imageUrl }}" alt="{{ $title ?: '' }}">
                                @if ($decorUrl)
                                    <img class="d-none d-md-block" loading="lazy" width="900" height="600"
                                        src="{{ $decorUrl }}" alt="">
                                @endif
                            </div>
                            <div class="content-sld_wrap text-center mx-auto">
                                @if (! empty($subtitle))
                                    <h6 class="{{ $textColorCls }} mb-16 fade-item fade-item-1">
                                        {!! BaseHelper::clean($subtitle) !!}
                                    </h6>
                                @endif
                                @if (! empty($title))
                                    <div class="title_sld text-display {{ $textColorCls }} fade-item fade-item-2">
                                        {!! nl2br(BaseHelper::clean($title)) !!}
                                    </div>
                                @endif
                                @if (! empty($description))
                                    <p class="decs_sld text-body-1 {{ $textColorCls }} fade-item fade-item-3">
                                        {!! BaseHelper::clean($description) !!}
                                    </p>
                                @endif
                                @if (! empty($buttonLabel))
                                    <div class="fade-item fade-item-4">
                                        <a href="{{ $sliderItem->link ?: '#' }}" class="{{ $btnClass }}">
                                            {!! BaseHelper::clean($buttonLabel) !!}
                                        </a>
                                    </div>
                                @endif
                            </div>
                        </div>
                        <div class="sld-image overflow-hidden">
                            <img class="scale-item" loading="lazy" width="900" height="600"
                                src="{{ $imageUrl }}" alt="{{ $title ?: '' }}">
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
        @if ($showDots)
            <div class="wrap-sw-line">
                <div class="sw-line-default pst-2 tf-sw-pagination justify-content-center"></div>
            </div>
        @endif
    </div>
    @if ($showArrows)
        <div class="group-nav-action">
            <div class="container-full">
                <div class="d-flex align-items-center justify-content-between">
                    <div class="tf-sw-nav {{ $textColorCls }} link nav-prev-swiper">
                        <i class="icon icon-ArrowLongLeft"></i>
                    </div>
                    <div class="tf-sw-nav {{ $textColorCls }} link nav-next-swiper">
                        <i class="icon icon-ArrowLongRight"></i>
                    </div>
                </div>
            </div>
        </div>
    @endif
</section>
