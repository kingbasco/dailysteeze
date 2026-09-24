@php
    use Botble\Ecommerce\Facades\EcommerceHelper;
    use Botble\Media\Facades\RvMedia;
    use Botble\Theme\Facades\Theme;

    // $productImages is provided by plugins/ecommerce HandleFrontPages — it
    // resolves the active variation from URL params (?color=…&size=…) and
    // returns that variation's images. Fall back to the parent product's
    // images when no variation matches or the controller didn't pass it.
    $images = ($productImages ?? null) ?: ($product->images ?: [$product->image]);
    // Plugin's $product->video accessor returns array of {url, provider, thumbnail, video_id?}.
    // Filter to only entries with a usable URL so the loop never renders empty slides.
    $videos = collect($product->video ?? [])
        ->filter(fn ($v) => is_array($v) && ! empty($v['url'] ?? null))
        ->values()
        ->all();
    $hasVideo = ! empty($videos);
    $videoProviders = array_unique(array_map(fn ($v) => $v['provider'] ?? 'iframe', $videos));
    $zoomType = $product->zoom_type ?? theme_option('ecommerce_zoom_type', 'inner');

    // Lazy-load gallery libs only on product detail pages — keeps homepage/listing
    // payloads lean. Drift powers the side-pane hover zoom into .tf-zoom-main;
    // PhotoSwipe powers the click-to-fullscreen lightbox.
    Theme::asset()->usePath()->add('photoswipe-css', 'css/vendors/photoswipe.css');
    Theme::asset()->container('footer')->usePath()->add('drift', 'js/vendors/drift.min.js', attributes: ['defer']);
    Theme::asset()->container('footer')->usePath()->add('photoswipe', 'js/vendors/photoswipe.umd.min.js', attributes: ['defer']);
    Theme::asset()->container('footer')->usePath()->add('photoswipe-lightbox', 'js/vendors/photoswipe-lightbox.umd.min.js', attributes: ['defer']);
@endphp

<div class="tf-product-media-wrap sticky-top">
    <div class="product-thumbs-slider style-row row_left">
        <div class="flat-wrap-media-product">
            <div dir="ltr"
                 class="swiper tf-product-media-main"
                 id="gallery-swiper-started"
                 data-spacing="0">
                <div class="swiper-wrapper">
                    {{-- Video slides first (matches plugin gallery's default 'top' position). --}}
                    @foreach ($videos as $vIndex => $video)
                        <div class="swiper-slide" data-image-index="v{{ $vIndex }}" data-slide-type="video">
                            @include(Theme::getThemeNamespace('views.ecommerce.includes.product-video'), [
                                'video' => $video,
                                'product' => $product,
                            ])
                        </div>
                    @endforeach

                    @foreach ($images as $index => $image)
                        @php $imageUrl = RvMedia::getImageUrl($image); @endphp
                        <div class="swiper-slide" data-image-index="{{ $index }}">
                            <a href="{{ $imageUrl }}"
                               target="_blank"
                               rel="noopener noreferrer"
                               class="item"
                               data-pswp-width="576px"
                               data-pswp-height="768px">
                                <img loading="lazy"
                                     width="576"
                                     height="768"
                                     class="tf-image-zoom"
                                     data-zoom="{{ $imageUrl }}"
                                     src="{{ $imageUrl }}"
                                     alt="{{ $product->name }}">
                            </a>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>

        <div dir="ltr"
             class="swiper tf-product-media-thumbs other-image-zoom"
             data-direction="vertical"
             data-preview="7">
            <div class="swiper-wrapper stagger-wrap">
                {{-- Video thumbnails — show poster image with play overlay. Falls back to first
                     product image when a video has no thumbnail (e.g. uploaded MP4 with no poster). --}}
                @foreach ($videos as $vIndex => $video)
                    @php
                        $videoThumb = $video['thumbnail']
                            ?? (! empty($images) ? RvMedia::getImageUrl($images[0]) : null);
                    @endphp
                    <div class="swiper-slide stagger-item">
                        <div class="item tf-video-thumb-item" style="position: relative;">
                            @if ($videoThumb)
                                <img loading="lazy"
                                     src="{{ $videoThumb }}"
                                     alt="{{ __('Video') }}"
                                     class="w-100 h-100 object-fit-cover">
                            @endif
                            <span class="tf-video-thumb-play"
                                  style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 28px; height: 28px; background: rgba(0,0,0,0.55); border-radius: 50%; display: inline-flex; align-items: center; justify-content: center; pointer-events: none;">
                                <svg xmlns="http://www.w3.org/2000/svg" width="10" height="12" viewBox="0 0 10 12" fill="#fff" aria-hidden="true">
                                    <path d="M0 0L10 6L0 12Z"/>
                                </svg>
                            </span>
                        </div>
                    </div>
                @endforeach
 
                @foreach ($images as $index => $image)
                    <div class="swiper-slide stagger-item">
                        <div class="item">
                            <img loading="lazy"
                                 src="{{ RvMedia::getImageUrl($image) }}"
                                 alt="{{ __('Image') }}"
                                 class="w-100 h-100 object-fit-cover">
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>

    {{-- Play-overlay fade rules (.bb-product-video-playing) live in
         assets/sass/component/_inline-migrated.scss. --}}

    @if ($zoomType === 'inner')
        @include(Theme::getThemeNamespace('views.ecommerce.includes.product-zoom-inner'))
    @elseif ($zoomType === 'inner-circle')
        @include(Theme::getThemeNamespace('views.ecommerce.includes.product-zoom-inner-circle'))
    @elseif ($zoomType === 'external' || $zoomType === 'lightbox')
        @include(Theme::getThemeNamespace('views.ecommerce.includes.product-zoom-external'))
    @endif
</div>
