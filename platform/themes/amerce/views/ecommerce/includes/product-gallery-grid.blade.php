@php
    use Botble\Media\Facades\RvMedia;
    use Botble\Theme\Facades\Theme;

    // $productImages is provided by plugins/ecommerce HandleFrontPages — it
    // resolves the active variation from URL params (?color=…&size=…) and
    // returns that variation's images. Fall back to the parent product's
    // images when no variation matches or the controller didn't pass it.
    $images = ($productImages ?? null) ?: ($product->images ?: [$product->image]);
    $videos = collect($product->video ?? [])
        ->filter(fn ($v) => is_array($v) && ! empty($v['url'] ?? null))
        ->values()
        ->all();
    $hasVideo = ! empty($videos);
    $videoProviders = array_unique(array_map(fn ($v) => $v['provider'] ?? 'iframe', $videos));
    $zoomType = $product->zoom_type ?? theme_option('ecommerce_zoom_type', 'inner');

    Theme::asset()->usePath()->add('photoswipe-css', 'css/vendors/photoswipe.css');
    Theme::asset()->container('footer')->usePath()->add('photoswipe', 'js/vendors/photoswipe.umd.min.js', attributes: ['defer']);
    Theme::asset()->container('footer')->usePath()->add('photoswipe-lightbox', 'js/vendors/photoswipe-lightbox.umd.min.js', attributes: ['defer']);

    // grid-2 adds an extra modifier class controlling aspect-ratio / second-image
    // span; grid default keeps a uniform 2-col grid.
    $gridVariant = $gridVariant ?? 'grid';
    $gridClass = $gridVariant === 'grid-2' ? 'product-grid-img grid-img_2' : 'product-grid-img';
@endphp

<div class="tf-product-media-wrap wrapper-gallery-scroll sticky-top">
    <div class="product-thumbs-slider">
        <div class="flat-wrap-media-product {{ $gridClass }}">
            <div dir="ltr"
                 class="swiper tf-product-media-main"
                 id="gallery-swiper-started"
                 data-spacing="0">
                <div class="swiper-wrapper">
                    @foreach ($videos as $vIndex => $video)
                        <div class="swiper-slide item-scroll-target" data-image-index="v{{ $vIndex }}" data-slide-type="video">
                            @include(Theme::getThemeNamespace('views.ecommerce.includes.product-video'), [
                                'video' => $video,
                                'product' => $product,
                            ])
                        </div>
                    @endforeach

                    @foreach ($images as $index => $image)
                        @php $imageUrl = RvMedia::getImageUrl($image); @endphp
                        <div class="swiper-slide item-scroll-target" data-image-index="{{ $index }}">
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

        {{-- Mobile-only thumbnail strip — desktop uses the grid layout itself for navigation. --}}
        <div dir="ltr"
             class="swiper tf-product-media-thumbs other-image-zoom d-md-none"
             data-direction="vertical"
             data-preview="5">
            <div class="swiper-wrapper stagger-wrap">
                @foreach ($videos as $vIndex => $video)
                    @php
                        $videoThumb = $video['thumbnail']
                            ?? (! empty($images) ? RvMedia::getImageUrl($images[0]) : null);
                    @endphp
                    <div class="swiper-slide stagger-item">
                        <div class="item">
                            @if ($videoThumb)
                                <img loading="lazy"
                                     width="82"
                                     height="110"
                                     src="{{ $videoThumb }}"
                                     alt="{{ __('Video') }}">
                            @endif
                        </div>
                    </div>
                @endforeach

                @foreach ($images as $index => $image)
                    <div class="swiper-slide stagger-item">
                        <div class="item">
                            <img loading="lazy"
                                 width="82"
                                 height="110"
                                 src="{{ RvMedia::getImageUrl($image) }}"
                                 alt="{{ __('Image') }}">
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>

    @if ($zoomType === 'external' || $zoomType === 'lightbox')
        @include(Theme::getThemeNamespace('views.ecommerce.includes.product-zoom-external'))
    @endif
</div>
