@php
    use Botble\Theme\Facades\Theme;
    use Botble\Media\Facades\RvMedia;

    $modelUrl = $product->model_3d_url ?? null;
    $posterImage = $product->image ? RvMedia::getImageUrl($product->image) : null;
    $images = $product->images ?: [];

    // Lazy-load model-viewer (~1.5 MB) only on pages that render the 3D viewer.
    Theme::asset()
        ->container('footer')
        ->usePath()
        ->add('model-viewer', 'js/vendors/model-viewer.min.js', attributes: ['type' => 'module', 'async']);
@endphp

<div class="tf-product-media-wrap sticky-top">
    <div class="product-thumbs-slider style-row row_left">
        <div class="flat-wrap-media-product">
            <div dir="ltr"
                 class="swiper tf-product-media-main"
                 id="gallery-swiper-started"
                 data-spacing="0">
                <div class="swiper-wrapper">
                    <div class="swiper-slide slide-3d">
                        <div class="item">
                            <div class="tf-model-viewer">
                                @if ($modelUrl)
                                    <model-viewer reveal="auto"
                                                  toggleable="true"
                                                  data-model-id="{{ $product->id }}"
                                                  src="{{ $modelUrl }}"
                                                  camera-controls="true"
                                                  alt="{{ $product->name }}"
                                                  @if ($posterImage) poster="{{ $posterImage }}" @endif
                                                  class="tf-model-viewer-ui"
                                                  tabindex="1"
                                                  ar-status="not-presenting">
                                    </model-viewer>
                                @endif
                                <div class="tf-model-viewer-ui-button">
                                    <div class="wrap-btn-viewer large">
                                        <i class="icon icon-btn3d"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

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
                <div class="swiper-slide stagger-item">
                    <div class="item btn-abs">
                        @if ($posterImage)
                            <img loading="lazy"
                                 width="82"
                                 height="110"
                                 src="{{ $posterImage }}"
                                 alt="{{ __('3D Model') }}">
                        @endif
                        <i class="icon icon-btn3d"></i>
                    </div>
                </div>
                @foreach ($images as $image)
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
</div>

