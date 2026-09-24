@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    /**
     * Full product-detail panel — mirrors html/home-sport.html §8 "Banner Product
     * Single" (lines 2498-2713): `banner-product-single-v2` with a LEFT thumbnail
     * gallery (`product-thumbs-slider style-row row_left`, vertical thumbs synced
     * to a main swiper) + RIGHT info column (category tag, name, rating + sold +
     * SKU meta row, price + old + sale badge, description, live-viewing line,
     * quantity stepper, Add To Cart + Buy It Now, Compare/Ask/Size-Guide/Share
     * extra links, View All Details).
     *
     * Distinct from `style-2-detail` (the slim HomePetCare panel) — registered as
     * a separate style so neither variant regresses the other.
     *
     * Shortcode attributes (all optional, safe fallbacks):
     *   product_id      required — resolved by the parent index partial
     *   detail_tag      category tag (default: product's first category, else "Shop")
     *   reviews_count   rating badge count (0 = hide the rating block)
     *   urgency_text    "18 sold in last 32 hours" — empty = hide
     *   viewing_count   live-viewing count (0 = hide the row)
     *
     * @var \Botble\Shortcode\Compilers\Shortcode $shortcode
     * @var \Botble\Ecommerce\Models\Product|null $product
     */
    $detailTag = trim((string) ($shortcode->detail_tag ?? ''));
    if ($detailTag === '' && $product) {
        $detailTag = (string) ($product->categories?->first()?->name ?? __('Shop'));
    }
    $reviewsCount = (int) ($shortcode->reviews_count ?? 0);
    $urgencyText  = trim((string) ($shortcode->urgency_text ?? ''));
    $viewingCount = (int) ($shortcode->viewing_count ?? 0);

    // Gallery images — fall back to the single main image when no gallery is set.
    $galleryImages = [];
    if ($product) {
        $galleryImages = collect($product->images ?? [])
            ->filter(fn ($img) => is_string($img) && trim($img) !== '')
            ->values()
            ->all();
        if (empty($galleryImages) && $product->image) {
            $galleryImages = [$product->image];
        }
    }

    $isOnSale = $product && $product->front_sale_price !== null
        && $product->price > 0
        && (float) $product->front_sale_price < (float) $product->price;
    $salePercent = $isOnSale
        ? (int) round((1 - ((float) $product->front_sale_price / (float) $product->price)) * 100)
        : 0;
    $currentPrice = $product ? ($product->front_sale_price_with_taxes ?? $product->front_sale_price ?? $product->price) : 0;
@endphp

@if ($product)
    <div class="banner-product-single-v2 section-image-zoom">
        <div class="container">
            <div class="row align-items-center">
                {{-- LEFT — thumbnail gallery --}}
                <div class="col-lg-6">
                    <div class="tf-product-media-wrap sticky-top">
                        <div class="product-thumbs-slider style-row row_left">
                            <div class="flat-wrap-media-product">
                                <div dir="ltr" class="swiper tf-product-media-main" id="gallery-swiper-{{ $product->id }}" data-spacing="0">
                                    <div class="swiper-wrapper">
                                        @foreach ($galleryImages as $img)
                                            @php $imgUrl = RvMedia::getImageUrl($img, null, false, RvMedia::getDefaultImage()); @endphp
                                            <div class="swiper-slide" data-color="">
                                                <a href="{{ $imgUrl }}" target="_blank" rel="noopener noreferrer" class="item" data-pswp-width="1000px" data-pswp-height="1000px">
                                                    <img loading="lazy" width="1000" height="1000" class="tf-image-zoom"
                                                         data-zoom="{{ $imgUrl }}" src="{{ $imgUrl }}" alt="{{ $product->name }}">
                                                </a>
                                            </div>
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                            @if (count($galleryImages) > 1)
                                <div dir="ltr" class="swiper tf-product-media-thumbs other-image-zoom thumbs-position"
                                     data-direction="vertical" data-preview="4">
                                    <div class="swiper-wrapper stagger-wrap">
                                        @foreach ($galleryImages as $img)
                                            <div class="swiper-slide stagger-item">
                                                <div class="item radius-8">
                                                    {!! RvMedia::image($img, $product->name, 'thumb', false, ['width' => 100, 'height' => 100, 'loading' => 'lazy']) !!}
                                                </div>
                                            </div>
                                        @endforeach
                                    </div>
                                </div>
                            @endif
                        </div>
                    </div>
                </div>

                {{-- RIGHT — product info --}}
                <div class="col-lg-6">
                    <div class="tf-product-info-wrap position-relative mt-md-0">
                        <div class="tf-zoom-main sticky-top"></div>
                        <div class="tf-product-info-list other-image-zoom">
                            <div class="tf-product-info-heading">
                                @if ($detailTag !== '')
                                    <p class="product-infor-cate text-caption-01 mb-4">{{ $detailTag }}</p>
                                @endif
                                <h3 class="product-infor-name mb-12">
                                    <a href="{{ $product->url }}" class="link">{{ $product->name }}</a>
                                </h3>
                                <div class="product-infor-meta mb-20">
                                    @if ($reviewsCount > 0)
                                        <div class="meta_rate">
                                            <div class="star-wrap normal d-flex align-items-center">
                                                @for ($i = 0; $i < 5; $i++)
                                                    <i class="icon icon-Star"></i>
                                                @endfor
                                            </div>
                                            <span class="text-caption-01 cl-text-2">({{ $reviewsCount }} {{ __('reviews') }})</span>
                                        </div>
                                    @endif
                                    @if ($urgencyText !== '')
                                        <div class="br-line type-vertical"></div>
                                        <div class="meta_sold">
                                            <i class="icon icon-Lightning text-primary"></i>
                                            <span class="text-caption-01 cl-text-1">{{ $urgencyText }}</span>
                                        </div>
                                    @endif
                                    @if (! empty($product->sku))
                                        <div class="br-line type-vertical"></div>
                                        <div class="meta_prd_code text-caption-01">
                                            <span class="cl-text-2">{{ __('SKU:') }}</span>
                                            <span>{{ $product->sku }}</span>
                                        </div>
                                    @endif
                                </div>
                                <div class="product-infor-price mb-12">
                                    <p class="price-on-sale h4 fw-semibold mb-0">{!! format_price($currentPrice) !!}</p>
                                    @if ($isOnSale)
                                        <div class="br-line type-vertical"></div>
                                        <p class="cl-text-3 text-decoration-line-through">{!! format_price($product->price) !!}</p>
                                        <span class="badge-sale text-white fw-semibold text-caption-02">-{{ $salePercent }}%</span>
                                    @endif
                                </div>
                                @if (! empty($product->description))
                                    <p class="product-infor-desc cl-text-2 mb-12">{!! BaseHelper::clean($product->description) !!}</p>
                                @endif
                                @if ($viewingCount > 0)
                                    <div class="product-infor-reality lh-24">
                                        <div class="ic d-flex">
                                            <i class="icon icon-Eye fs-20"></i>
                                        </div>
                                        <span class="text-caption-01">
                                            {{ __(':count people are viewing this right now', ['count' => $viewingCount]) }}
                                        </span>
                                    </div>
                                @endif
                            </div>
                            <div class="br-line"></div>
                            <div class="tf-product-variant">
                                <div class="tf-product-total-quantity">
                                    <p>{{ __('Quantity:') }}</p>
                                    <div class="group-action">
                                        <div class="wg-quantity">
                                            <button type="button" class="btn-quantity btn-decrease" aria-label="{{ __('Decrease quantity') }}">
                                                <i class="icon icon-minus"></i>
                                            </button>
                                            <input class="quantity-product" type="text" name="number" value="1" aria-label="{{ __('Quantity') }}">
                                            <button type="button" class="btn-quantity btn-increase" aria-label="{{ __('Increase quantity') }}">
                                                <i class="icon icon-plus"></i>
                                            </button>
                                        </div>
                                        <a href="{{ $product->url }}" class="btn-action-price tf-btn type-xl animate-btn w-100">
                                            {{ __('Add To Cart') }}
                                            <span class="d-none d-sm-block d-md-none d-lg-block">&nbsp;-&nbsp;</span>
                                            <span class="price-add d-none d-sm-block d-md-none d-lg-block">{!! format_price($currentPrice) !!}</span>
                                        </a>
                                    </div>
                                    <a href="{{ $product->url }}" class="tf-btn type-xl btn-primary animate-btn w-100">
                                        {{ __('Buy It Now') }}
                                    </a>
                                </div>
                            </div>
                            <div class="tf-product-extra-link">
                                <a href="#compare" data-bs-toggle="offcanvas" class="product-extra-icon link fw-medium">
                                    <i class="icon icon-ArrowsLeftRight"></i>
                                    {{ __('Compare') }}
                                </a>
                                <a href="#ask" data-bs-toggle="modal" class="product-extra-icon link fw-medium">
                                    <i class="icon icon-Question"></i>
                                    {{ __('Ask A Question') }}
                                </a>
                                <a href="#findSize" data-bs-toggle="modal" class="product-extra-icon link fw-medium">
                                    <i class="icon icon-Ruler"></i>
                                    {{ __('Size Guide') }}
                                </a>
                                <a href="#share" data-bs-toggle="modal" class="product-extra-icon link fw-medium">
                                    <i class="icon icon-ShareNetwork"></i>
                                    {{ __('Share') }}
                                </a>
                            </div>
                            <div>
                                <a href="{{ $product->url }}" class="tf-btn-line-2 fw-semibold style-primary py-4">
                                    {{ __('View All Details') }}
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endif
