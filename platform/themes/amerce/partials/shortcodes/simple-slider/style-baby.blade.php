@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    /**
     * Simple-slider style-baby — slideshow-2 single-column hero w/ decorative
     * graphic overlay (home-baby pattern).
     *
     * Mirrors html/home-baby.html lines 1477-1593:
     *   <section class="tf-slideshow slideshow-2 pt-30 p-xl-0">
     *     <div class="container">
     *       <div class="swiper tf-swiper sw-slide-show slideshow-2 slider_effect_fade">
     *         <div class="swiper-wrapper">
     *           <div class="swiper-slide">
     *             <div class="slider-wrap_2">
     *               <div class="sld-content">
     *                 <div class="sld-image-abs">
     *                   <img class="d-md-none" src="slider-N.jpg"/>          <!-- mobile bg -->
     *                   <img class="d-none d-md-block" src="graphic-item.png"/> <!-- desktop graphic overlay -->
     *                 </div>
     *                 <div class="content-sld_wrap">
     *                   <div class="h6 text-white">{subtitle}</div>
     *                   <h1 class="title_sld text-white">{title}</h1>
     *                   <a class="tf-btn btn-white">{button_label}</a>
     *                 </div>
     *               </div>
     *             </div>
     *           </div>
     *           ...
     *         </div>
     *         <div class="sw-line-default pst-2 tf-sw-pagination"></div>
     *       </div>
     *     </div>
     *   </section>
     *
     * Per-slide attrs (via metadata):
     *   subtitle      — eyebrow text (.h6)
     *   button_label  — CTA label (.tf-btn btn-white)
     *   decor_image   — desktop decorative graphic image path (e.g. item/graphic-item.png)
     *
     * Per-shortcode attrs:
     *   wrapper_class    — extra outer classes (default 'pt-30 p-xl-0')
     *   text_color       — 'white' (default) | 'dark'
     *   button_style     — 'pill-white' (default) | 'pill-dark' | 'outline-white' | 'outline-dark'
     *   show_dots        — 'yes' (default) | 'no'
     */
    $autoplay      = ($shortcode->is_autoplay ?? 'yes') === 'yes';
    $autoplaySpeed = (int) ($shortcode->autoplay_speed ?? 3000);
    $showDots      = ($shortcode->show_dots ?? 'yes') === 'yes';

    $wrapperExtra  = trim((string) ($shortcode->wrapper_class ?? 'pt-30 p-xl-0'));
    $textColor     = ($shortcode->text_color ?? 'white') === 'dark' ? '' : 'text-white';

    $btnStyleRaw   = $shortcode->button_style ?? 'pill-white';
    $btnClassMap   = [
        'pill-white'    => 'tf-btn btn-white',
        'pill-dark'     => 'tf-btn animate-btn',
        'outline-white' => 'tf-btn btn-line style-white',
        'outline-dark'  => 'tf-btn btn-line',
    ];
    $btnClass      = $btnClassMap[$btnStyleRaw] ?? 'tf-btn btn-white';
@endphp

<section {!! $shortcode->htmlAttributes() !!} class="tf-slideshow slideshow-2 {{ $wrapperExtra }}">
    <div class="container">
        <div dir="ltr" class="swiper tf-swiper sw-slide-show slideshow-2 slider_effect_fade"
             data-auto="{{ $autoplay ? 'true' : 'false' }}"
             data-loop="true"
             data-effect="fade"
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
                        <div class="slider-wrap_2">
                            <div class="sld-content">
                                <div class="sld-image-abs">
                                    {{-- Mobile (<md): slider-N.jpg as background. --}}
                                    <img class="d-md-none scale-item" loading="lazy" width="900" height="600"
                                        src="{{ $imageUrl }}" alt="{{ $title ?: '' }}">
                                    {{-- Desktop (≥md): decorative graphic overlay (transparent PNG). --}}
                                    @if ($decorUrl)
                                        <img class="d-none d-md-block" loading="lazy" width="900" height="600"
                                            src="{{ $decorUrl }}" alt="">
                                    @endif
                                </div>
                                <div class="content-sld_wrap">
                                    @if (! empty($subtitle))
                                        <div class="h6 {{ $textColor }} mb-16 fade-item fade-item-1">
                                            {!! BaseHelper::clean($subtitle) !!}
                                        </div>
                                    @endif
                                    @if (! empty($title))
                                        <h1 class="title_sld {{ $textColor }} fade-item fade-item-2">
                                            {!! nl2br(BaseHelper::clean($title)) !!}
                                        </h1>
                                    @endif
                                    @if (! empty($description))
                                        <p class="decs_sld text-body-1 {{ $textColor }} fade-item fade-item-3">
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
                            {{-- Desktop background: same slider image rendered behind overlay graphic. --}}
                            <div class="sld-image overflow-hidden">
                                <img class="scale-item" loading="lazy" width="900" height="600"
                                    src="{{ $imageUrl }}" alt="{{ $title ?: '' }}">
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
            @if ($showDots)
                <div class="sw-line-default pst-2 tf-sw-pagination"></div>
            @endif
        </div>
    </div>
</section>
