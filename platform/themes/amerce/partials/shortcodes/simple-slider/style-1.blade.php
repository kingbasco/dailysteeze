@php
    // Shortcode-level attrs
    $autoplay      = ($shortcode->is_autoplay ?? 'yes') === 'yes';
    $autoplaySpeed = (int) ($shortcode->autoplay_speed ?? 5000);
    $showArrows    = ($shortcode->show_arrows ?? 'yes') === 'yes';
    $showDots      = ($shortcode->show_dots ?? 'yes') === 'yes';

    // ---- Per-preset layout knobs (all backward-compatible defaults) ----
    // wrapper_class : extra classes appended to the outer .tf-slideshow div
    //                 (e.g. "flat-spacing-3 pb-0", "slideshow-2 pt-30 p-xl-0").
    // inner_class   : extra classes appended to the inner .swiper div
    //                 (e.g. "radius-12").
    // use_container : "yes" wraps the swiper in <div class="container">
    //                 (auto preset's hero is container-bound).
    // container_class : wrapper class used when use_container=yes.
    // pagination_class : extra classes on the pagination div
    //                    (e.g. "style-2 pst-3").
    // content_position : extra class on .sld_content (e.g. "type-2", "pst-2").
    // slideshow_extra  : extra class on .slideshow-wrap (e.g. "sm-has-ov").
    $wrapperClass     = trim((string) ($shortcode->wrapper_class ?? 'simple-slider-section'));
    $innerClass       = trim((string) ($shortcode->inner_class ?? ''));
    $useContainer     = ($shortcode->use_container ?? 'no') === 'yes';
    $containerClass    = trim((string) ($shortcode->container_class ?? 'container')) ?: 'container';
    $paginationClass  = trim((string) ($shortcode->pagination_class ?? ''));
    $contentPosition  = trim((string) ($shortcode->content_position ?? 'pst-5'));
    $slideshowExtra   = trim((string) ($shortcode->slideshow_extra ?? ''));

    // Nav arrow style:
    //   default → tf-sw-nav + icon-ArrowLong* (large monoline arrows on dark imagery)
    //   fashion-2 demo → tf-sw-nav-2 d-lg-flex d-none + icon-Arrow* (44×44 boxed)
    //   nav_action_class : extra class on the `.group-nav-action` wrapper
    //                      (home-office-equipment §1 demo uses `pst-2`).
    //   nav_wrap_class   : class on the inner flex row (demo uses `gr-nav_wrap`
    //                      d-flex align-items-center justify-content-between).
    $navArrowClass     = trim((string) ($shortcode->nav_arrow_class ?? '')) ?: 'tf-sw-nav';
    $navArrowIconPrev  = trim((string) ($shortcode->nav_arrow_icon_prev ?? '')) ?: 'icon-ArrowLongLeft';
    $navArrowIconNext  = trim((string) ($shortcode->nav_arrow_icon_next ?? '')) ?: 'icon-ArrowLongRight';
    $navActionClass    = trim((string) ($shortcode->nav_action_class ?? ''));
    $navWrapClass      = trim((string) ($shortcode->nav_wrap_class ?? '')) ?: 'd-flex align-items-center justify-content-between';

    // ---- Center/peek mode (home-office-equipment §1) ----
    // center_mode='yes' switches the swiper from a full-bleed fade slider to a
    // centered coverflow with a peek of the adjacent slides (data-center=true,
    // fractional data-preview, inter-slide spacing). Drops `data-effect="fade"`.
    //   swiper_preview / _tablet / _mobile_sm / _mobile : data-preview values.
    //   swiper_space_lg / _md / _sm                     : inter-slide gaps.
    //   image_radius_class : class on `.sld_image` (demo uses `radius-16`).
    //   image_class        : class on the slide <img> (demo: `scale-item scale-item-1`).
    //   hide_hover_nav='yes' : drop `hover-sw-nav` (demo §1 wrapper has none).
    $centerMode        = ($shortcode->center_mode ?? 'no') === 'yes';
    $swiperPreview     = trim((string) ($shortcode->swiper_preview ?? '')) ?: '1.08379';
    $swiperTablet      = trim((string) ($shortcode->swiper_preview_tablet ?? '')) ?: '1.1';
    $swiperMobileSm    = trim((string) ($shortcode->swiper_preview_mobile_sm ?? '')) ?: '1.1';
    $swiperMobile      = trim((string) ($shortcode->swiper_preview_mobile ?? '')) ?: '1.15';
    $swiperSpaceLg     = trim((string) ($shortcode->swiper_space_lg ?? '')) ?: '20';
    $swiperSpaceMd     = trim((string) ($shortcode->swiper_space_md ?? '')) ?: '15';
    $swiperSpace       = trim((string) ($shortcode->swiper_space ?? '')) ?: '10';
    $imageRadiusClass  = trim((string) ($shortcode->image_radius_class ?? ''));
    $shortcodeImageClass = trim((string) ($shortcode->image_class ?? ''));
    if ($shortcodeImageClass === '' && $centerMode) {
        $shortcodeImageClass = 'scale-item scale-item-1';
    }
    $hideHoverNav      = ($shortcode->hide_hover_nav ?? 'no') === 'yes';
@endphp

<div {!! $shortcode->htmlAttributes() !!} class="tf-slideshow tf-btn-swiper-main {{ $hideHoverNav ? '' : 'hover-sw-nav' }} {{ $wrapperClass }}">
    @if ($useContainer) <div class="{{ $containerClass }}"> @endif
    <div dir="ltr" class="swiper tf-swiper sw-slide-show slider_effect_fade {{ $innerClass }}"
        data-loop="true"
        @if ($centerMode)
            data-preview="{{ $swiperPreview }}"
            data-tablet="{{ $swiperTablet }}"
            data-mobile-sm="{{ $swiperMobileSm }}"
            data-mobile="{{ $swiperMobile }}"
            data-center="true"
            data-space-lg="{{ $swiperSpaceLg }}"
            data-space-md="{{ $swiperSpaceMd }}"
            data-space="{{ $swiperSpace }}"
        @else
            data-effect="fade"
        @endif
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
                    $alignment   = method_exists($sliderItem, 'getMetaData')
                        ? ($sliderItem->getMetaData('alignment', true) ?: 'center')
                        : 'center';
                    $alignClass  = 'text-' . (in_array($alignment, ['left', 'center', 'right'], true) ? $alignment : 'center');

                    // ---- Per-slide design knobs (set by SimpleSliderSeeder) ----
                    // text_color: 'white' (default) or 'dark'. Drives the text-white class
                    // on subtitle/title. Use 'dark' for sliders with light backgrounds
                    // (auto, cosmetic, fashion light, jewelry, organic-light, etc.).
                    $textColorRaw  = method_exists($sliderItem, 'getMetaData')
                        ? ($sliderItem->getMetaData('text_color', true) ?: 'white')
                        : 'white';
                    $textColor     = $textColorRaw === 'dark' ? 'dark' : 'white';
                    $textColorCls  = $textColor === 'dark' ? '' : 'text-white';

                    // button_style: 'pill-white' (default) | 'pill-dark' | 'outline-white' | 'outline-dark' | 'animate-btn'
                    // Maps to actual button class names used by the demo HTML.
                    $btnStyleRaw   = method_exists($sliderItem, 'getMetaData')
                        ? ($sliderItem->getMetaData('button_style', true) ?: 'pill-white')
                        : 'pill-white';
                    $btnClassMap   = [
                        'pill-white'    => 'tf-btn btn-white',
                        'pill-dark'     => 'tf-btn animate-btn',
                        'animate-btn'   => 'tf-btn animate-btn',
                        'animate-dark'  => 'tf-btn btn-white animate-btn animate-dark',
                        'outline-white' => 'tf-btn btn-line style-white',
                        'outline-dark'  => 'tf-btn btn-line',
                    ];
                    $btnClass      = $btnClassMap[$btnStyleRaw] ?? 'tf-btn btn-white';

                    // title_tag: 'h1' (semantic primary heading) | 'p' (default, matches
                    // most demo variants where heading uses <p class="title_sld h1 ...">).
                    $titleTag      = method_exists($sliderItem, 'getMetaData')
                        ? ($sliderItem->getMetaData('title_tag', true) ?: 'p')
                        : 'p';
                    $titleTag      = in_array($titleTag, ['h1', 'h2', 'div', 'p'], true) ? $titleTag : 'p';

                    $subtitleTag   = method_exists($sliderItem, 'getMetaData')
                        ? ($sliderItem->getMetaData('subtitle_tag', true) ?: 'p')
                        : 'p';
                    $subtitleTag   = in_array($subtitleTag, ['h6', 'p'], true) ? $subtitleTag : 'p';

                    // subtitle_class: full utility class set for the .sub-text_sld
                    // span. Defaults preserve legacy style-1 behavior.
                    $subtitleExtra = method_exists($sliderItem, 'getMetaData')
                        ? ($sliderItem->getMetaData('subtitle_class', true) ?: 'text-body-1 mb-15')
                        : 'text-body-1 mb-15';

                    // heading_class_extra: appended to the .heading wrapper
                    // (e.g. "mb-xl-32" for auto demo).
                    $headingExtra  = method_exists($sliderItem, 'getMetaData')
                        ? ($sliderItem->getMetaData('heading_class', true) ?: '')
                        : '';

                    // title_class: full utility class set for .title_sld. Defaults
                    // preserve legacy display sizing; HomeAuto overrides to match
                    // html/home-auto.html exactly.
                    $titleExtraRaw = method_exists($sliderItem, 'getMetaData')
                        ? $sliderItem->getMetaData('title_class', true)
                        : null;
                    $titleExtra    = $titleExtraRaw === 'none' ? '' : ($titleExtraRaw ?: 'text-display fw-medium');
                    $titleBaseClass = $titleTag === 'div' ? '' : 'title_sld';

                    $descriptionExtra = method_exists($sliderItem, 'getMetaData')
                        ? ($sliderItem->getMetaData('description_class', true) ?: 'text-body-1 mb-32')
                        : 'text-body-1 mb-32';

                    $imageClass = method_exists($sliderItem, 'getMetaData')
                        ? ($sliderItem->getMetaData('image_class', true) ?: ($shortcodeImageClass ?: 'w-100'))
                        : ($shortcodeImageClass ?: 'w-100');
                    $imageWidth = method_exists($sliderItem, 'getMetaData')
                        ? ((int) ($sliderItem->getMetaData('image_width', true) ?: 1920))
                        : 1920;
                    $imageHeight = method_exists($sliderItem, 'getMetaData')
                        ? ((int) ($sliderItem->getMetaData('image_height', true) ?: 730))
                        : 730;
                    $useContentContainer = ! method_exists($sliderItem, 'getMetaData')
                        || ($sliderItem->getMetaData('content_container', true) ?: 'yes') !== 'no';

                    // slide_wrapper_class: extra classes on the inner slide wrapper div
                    // (e.g. "slider-wrap rounded-20 overflow-hidden" for construction demo).
                    $slideWrapExtra = method_exists($sliderItem, 'getMetaData')
                        ? trim((string) ($sliderItem->getMetaData('slide_wrapper_class', true) ?: ''))
                        : '';

                    // Whether to show description below the title (when both subtitle
                    // AND description exist). fade-item numbering shifts accordingly.
                    $hasDescBelow  = ! empty($subtitle) && ! empty($description);
                    $btnFadeItem   = $hasDescBelow ? 'fade-item-4' : 'fade-item-3';

                    // title_first: when true, render title ABOVE subtitle/description
                    // (matches html/home-mental.html where h1 is fade-item-1 and
                    // sub-text is fade-item-2).
                    $titleFirst    = method_exists($sliderItem, 'getMetaData')
                        ? (($sliderItem->getMetaData('title_first', true) ?: 'no') === 'yes')
                        : false;
                @endphp
                <div class="swiper-slide">
                    <div class="slideshow-wrap {{ $slideshowExtra }} {{ $slideWrapExtra }}">
                        <div class="sld_image {{ $imageRadiusClass }}">
                            {{-- Hero source aspect varies per customer upload; hero-sm/hero-md
                                 are width-only registered (proportional scale) so they preserve
                                 whatever aspect the user uploaded. Desktop keeps the original
                                 image — using hero-banner (1920x1080 cover) would crop. --}}
                            @php
                                $heroOriginal = RvMedia::getImageUrl($sliderItem->image);
                                $heroSrcset   = collect([
                                    RvMedia::getImageUrl($sliderItem->image, 'hero-sm') . ' 400w',
                                    RvMedia::getImageUrl($sliderItem->image, 'hero-md') . ' 768w',
                                    $heroOriginal . ' 1920w',
                                ])->implode(', ');
                            @endphp
                            {{-- First slide is the LCP candidate; eager-load + high fetchpriority. --}}
                            <img src="{{ $heroOriginal }}"
                                 srcset="{{ $heroSrcset }}"
                                 sizes="100vw"
                                 class="{{ $imageClass }}"
                                 alt="{{ $title ?: '' }}"
                                 width="{{ $imageWidth }}"
                                 height="{{ $imageHeight }}"
                                 decoding="async"
                                 @if ($loop->first) fetchpriority="high" loading="eager" @else loading="lazy" fetchpriority="low" @endif>
                        </div>
                        <div class="sld_content {{ $contentPosition }}">
                            @if ($useContentContainer)
                                <div class="container">
                            @endif
                                <div class="content-sld_wrap {{ $alignClass }}">
                                    <div class="heading {{ $headingExtra }}">
                                        @if ($titleFirst)
                                            {{-- Title-first layout (home-mental pattern): h1 → sub-text → btn --}}
                                            @if (! empty($title))
                                                <{{ $titleTag }} class="{{ $titleBaseClass }} {{ $titleExtra }} {{ $textColorCls }} fade-item fade-item-1">
                                                    {!! nl2br(BaseHelper::clean($title)) !!}
                                                </{{ $titleTag }}>
                                            @endif
                                            @if (! empty($subtitle))
                                                <{{ $subtitleTag }} class="{{ $subtitleTag === 'p' ? 'sub-text_sld' : '' }} {{ $subtitleExtra }} {{ $textColorCls }} fade-item fade-item-2">
                                                    {!! BaseHelper::clean($subtitle) !!}
                                                </{{ $subtitleTag }}>
                                            @elseif (! empty($description))
                                                <{{ $subtitleTag }} class="{{ $subtitleTag === 'p' ? 'sub-text_sld' : '' }} {{ $subtitleExtra }} {{ $textColorCls }} fade-item fade-item-2">
                                                    {!! BaseHelper::clean($description) !!}
                                                </{{ $subtitleTag }}>
                                            @endif
                                        @else
                                            {{-- Default layout: sub-text → title → btn --}}
                                            @if (! empty($subtitle))
                                                <{{ $subtitleTag }} class="{{ $subtitleTag === 'p' ? 'sub-text_sld' : '' }} {{ $subtitleExtra }} {{ $textColorCls }} fade-item fade-item-1">
                                                    {!! BaseHelper::clean($subtitle) !!}
                                                </{{ $subtitleTag }}>
                                            @elseif (! empty($description))
                                                <{{ $subtitleTag }} class="{{ $subtitleTag === 'p' ? 'sub-text_sld' : '' }} {{ $subtitleExtra }} {{ $textColorCls }} fade-item fade-item-1">
                                                    {!! BaseHelper::clean($description) !!}
                                                </{{ $subtitleTag }}>
                                            @endif
                                            @if (! empty($title))
                                                <{{ $titleTag }} class="{{ $titleBaseClass }} {{ $titleExtra }} {{ $textColorCls }} fade-item fade-item-2">
                                                    {!! nl2br(BaseHelper::clean($title)) !!}
                                                </{{ $titleTag }}>
                                            @endif
                                        @endif
                                    </div>
                                    @if ($hasDescBelow)
                                        <p class="{{ $descriptionExtra }} {{ $textColorCls }} fade-item fade-item-3">
                                            {!! BaseHelper::clean($description) !!}
                                        </p>
                                    @endif
                                    @if (! empty($buttonLabel))
                                        <div class="fade-item {{ $btnFadeItem }}">
                                            <a href="{{ $sliderItem->link ?: '#' }}" class="{{ $btnClass }}">
                                                {!! BaseHelper::clean($buttonLabel) !!}
                                            </a>
                                        </div>
                                    @elseif ($sliderItem->link)
                                        <div class="fade-item {{ $btnFadeItem }}">
                                            <a href="{{ $sliderItem->link }}" class="{{ $btnClass }}">
                                                {{ __('Shop Now') }}
                                            </a>
                                        </div>
                                    @endif
                                </div>
                            @if ($useContentContainer)
                                </div>
                            @endif
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
        @if ($showDots)
            <div class="sw-line-default {{ $paginationClass }} tf-sw-pagination"></div>
        @endif
    </div>
    @if ($useContainer) </div> @endif
    @if ($showArrows)
        <div class="group-nav-action {{ $navActionClass }}">
            <div class="container-full">
                <div class="{{ $navWrapClass }}">
                    <div class="{{ $navArrowClass }} {{ $textColorCls ?? '' }} nav-prev-swiper" aria-label="{{ __('Previous') }}">
                        <i class="icon {{ $navArrowIconPrev }}"></i>
                    </div>
                    <div class="{{ $navArrowClass }} {{ $textColorCls ?? '' }} nav-next-swiper" aria-label="{{ __('Next') }}">
                        <i class="icon {{ $navArrowIconNext }}"></i>
                    </div>
                </div>
            </div>
        </div>
    @endif
</div>
