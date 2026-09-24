@php
    use Botble\Media\Facades\RvMedia;

    // $productImages is provided by plugins/ecommerce HandleFrontPages — it
    // resolves the active variation from URL params (?color=…&size=…) and
    // returns that variation's images. Fall back to the parent product's
    // images when no variation matches or the controller didn't pass it.
    $images = ($productImages ?? null) ?: ($product->images ?: [$product->image]);
    $hasVideo = (bool) ($product->video_url ?? false);
    $videoUrl = $product->video_url ?? null;
    $zoomType = $product->zoom_type ?? theme_option('ecommerce_zoom_type', 'inner');
@endphp

<div class="tf-product-media-wrap sticky-top">
    <div class="product-thumbs-slider style-row">
        <div class="flat-wrap-media-product">
            <div dir="ltr"
                 class="swiper tf-product-media-main"
                 id="gallery-swiper-started"
                 data-spacing="0">
                <div class="swiper-wrapper">
                    @foreach ($images as $index => $image)
                        @php $imageUrl = RvMedia::getImageUrl($image); @endphp
                        <div class="swiper-slide" data-image-index="{{ $index }}">
                            @if ($hasVideo && $index === 0 && $videoUrl)
                                @include(Theme::getThemeNamespace('views.ecommerce.includes.product-video'), ['videoUrl' => $videoUrl])
                            @else
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
                            @endif
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
                @foreach ($images as $index => $image)
                    <div class="swiper-slide stagger-item">
                        <div @class(['item', 'tf-btn-video btn-abs' => $hasVideo && $index === 0])>
                            <img loading="lazy"
                                 src="{{ RvMedia::getImageUrl($image) }}"
                                 alt="{{ __('Image') }}"
                                 class="w-100 h-100 object-fit-cover">
                            @if ($hasVideo && $index === 0)
                                <i class="icon icon-video"></i>
                            @endif
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>

    @if ($zoomType === 'inner')
        @include(Theme::getThemeNamespace('views.ecommerce.includes.product-zoom-inner'))
    @elseif ($zoomType === 'inner-circle')
        @include(Theme::getThemeNamespace('views.ecommerce.includes.product-zoom-inner-circle'))
    @elseif ($zoomType === 'external' || $zoomType === 'lightbox')
        @include(Theme::getThemeNamespace('views.ecommerce.includes.product-zoom-external'))
    @endif
</div>
