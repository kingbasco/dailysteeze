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

<div class="tf-product-media-wrap">
    <div class="product-thumbs-slider product-stacked">
        <div class="flat-wrap-media-product flat-wrap-stacked">
            @foreach ($images as $index => $image)
                @php $imageUrl = RvMedia::getImageUrl($image); @endphp
                <div class="stacked-item mb-3" data-image-index="{{ $index }}">
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
                                 class="tf-image-zoom w-100"
                                 data-zoom="{{ $imageUrl }}"
                                 src="{{ $imageUrl }}"
                                 alt="{{ $product->name }}">
                        </a>
                    @endif
                </div>
            @endforeach
        </div>
    </div>

    @if ($zoomType === 'external' || $zoomType === 'lightbox')
        @include(Theme::getThemeNamespace('views.ecommerce.includes.product-zoom-external'))
    @endif
</div>
