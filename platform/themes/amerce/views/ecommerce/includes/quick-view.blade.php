@php
    use Botble\Theme\Facades\Theme;
    use Botble\Media\Facades\RvMedia;

    $productImages = $productImages ?? ($product->images ?: [$product->image]);
    $productImages = array_values(array_filter((array) $productImages));
    $mainImage = $productImages[0] ?? $product->image;
    $thumbnailImages = array_slice($productImages, 0, 6);
@endphp

{{-- Close button is a SIBLING of the scrollable panel — placed first inside
     .modal-content so it anchors to Bootstrap's position:relative on the
     modal-content and stays pinned to its top-right while the scrollable
     `.tf-product-modal-content` below scrolls beneath it on mobile. --}}
<button type="button"
        class="tf-product-modal-close-btn btn-close"
        data-bs-dismiss="modal"
        aria-label="{{ __('Close') }}"></button>

<div class="bb-product-detail tf-product-modal-content">
    <div class="row g-0">
        {{-- LEFT: gallery (image on the left at md+, full width on mobile) --}}
        <div class="col-md-6">
            <div class="quick-view-gallery">
                <div class="quick-view-gallery__main">
                    {!! RvMedia::image($mainImage, $product->name, 'medium', false, ['class' => 'w-100 h-auto', 'data-quick-view-main' => '1', 'loading' => 'lazy']) !!}
                </div>

                @if (count($thumbnailImages) > 1)
                    <div class="quick-view-gallery__thumbs d-flex flex-wrap gap-2 p-3 pt-2">
                        @foreach ($thumbnailImages as $i => $image)
                            <button type="button"
                                    @class(['quick-view-gallery__thumb', 'is-active' => $i === 0])
                                    data-quick-view-thumb="{{ RvMedia::getImageUrl($image, 'medium') }}"
                                    aria-label="{{ __('View image :n', ['n' => $i + 1]) }}">
                                {!! RvMedia::image($image, $product->name, 'thumb', false, ['loading' => 'lazy']) !!}
                            </button>
                        @endforeach
                    </div>
                @endif
            </div>
        </div>

        {{-- RIGHT: scrollable content --}}
        <div class="col-md-6">
            <div class="quick-view-content p-3 p-md-4">
                {{-- $isQuickView swaps the Share modal-trigger for an inline social share row
                     and skips the nested #share modal — Bootstrap 5 doesn't reliably
                     stack modals, so the original "Share" button never opened. --}}
                @include(Theme::getThemeNamespace('views.ecommerce.includes.product-detail'), [
                    'product' => $product,
                    'isQuickView' => true,
                ])
            </div>
        </div>
    </div>
</div>
