@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Ecommerce\Facades\EcommerceHelper;
    use Botble\Media\Facades\RvMedia;

    /**
     * Mirrors html/home-cosmetic.html §6 (lines 2090-2316): `banner-product-single
     * style-2 section-image-zoom` and html/home-headphone.html §8 (lines 2969-3276):
     * `banner-product-single style-4 section-image-zoom flat-spacing` — the layout
     * is identical, only the wrapper modifier class differs (`style-2` vs `style-4`),
     * controlled by the `banner_modifier` knob.
     *
     * LEFT vertical thumbnail strip (`product-thumbs-slider
     * style-row row_left`, main swiper + vertical thumbs) + RIGHT info panel:
     *   [category tag] [name] [stars + reviews] [Best-seller badge + urgency]
     *   [price + old + -%] [Size buttons] [Quantity + Add to cart/wishlist/compare]
     *   [Buy It Now] [View Full]
     *
     * Distinct from `style-2-detail` (slim HomePetCare, no thumb strip) and
     * `style-3-pdp` (HomeSport `-v2`, SKU/share/size-guide extras).
     *
     * Shortcode attributes (all optional, safe fallbacks to $product):
     *   product_id            required — resolved by the parent index partial
     *   featured_category     category tag (default: product's first category, else "Shop")
     *   featured_name         display name (default: $product->name)
     *   featured_price        sale price (default: $product front sale/price)
     *   featured_old_price    strikethrough price (default: $product->price when on sale)
     *   featured_sale_percent badge -% (default: computed from prices)
     *   reviews_count         rating badge count (0 = hide the rating row)
     *   urgency_text          "Selling fast! ..." — empty = hide
     *   badge_text            "Best seller" pre-order badge — empty = hide
     *   size_options          CSV "Label|price,Label|price" (e.g. "30ml|39.99,100ml|59.99")
     *   default_size_index    0-based active index (default 0)
     *   show_view_full        yes/no "View Full" link (default yes)
     *   banner_modifier       wrapper modifier class — 'style-2' (default) or
     *                         'style-4' (home-headphone §8). Anything else falls
     *                         back to 'style-2'.
     *
     * @var \Botble\Shortcode\Compilers\Shortcode $shortcode
     * @var \Botble\Ecommerce\Models\Product|null $product
     */
    $bannerModifier = trim((string) ($shortcode->banner_modifier ?? ''));
    $bannerModifier = in_array($bannerModifier, ['style-2', 'style-4'], true) ? $bannerModifier : 'style-2';
    $detailTag = trim((string) ($shortcode->featured_category ?? ''));
    if ($detailTag === '' && $product) {
        $detailTag = (string) ($product->categories?->first()?->name ?? __('Shop'));
    }
    $detailName = trim((string) ($shortcode->featured_name ?? '')) ?: ($product?->name ?? '');
    $reviewsCount = (int) ($shortcode->reviews_count ?? 0);
    $urgencyText  = trim((string) ($shortcode->urgency_text ?? ''));
    $badgeText    = trim((string) ($shortcode->badge_text ?? ''));
    $showViewFull = filter_var($shortcode->show_view_full ?? 'yes', FILTER_VALIDATE_BOOLEAN);

    // Price — explicit featured_* overrides win, else fall back to the product.
    $currentPrice = $shortcode->featured_price ?? null;
    $oldPrice     = $shortcode->featured_old_price ?? null;
    $salePercent  = (int) ($shortcode->featured_sale_percent ?? 0);
    if ($currentPrice === null && $product) {
        $currentPrice = $product->front_sale_price_with_taxes ?? $product->front_sale_price ?? $product->price;
        if ($product->front_sale_price !== null && $product->price > 0
            && (float) $product->front_sale_price < (float) $product->price) {
            $oldPrice    = $product->price;
            $salePercent = (int) round((1 - ((float) $product->front_sale_price / (float) $product->price)) * 100);
        }
    }
    $isOnSale = $oldPrice !== null && (float) $oldPrice > (float) $currentPrice;

    // Parse size options CSV — each entry "Label|price" or just "Label".
    $sizeOptions = [];
    foreach (explode(',', (string) ($shortcode->size_options ?? '')) as $entry) {
        $entry = trim($entry);
        if ($entry === '') continue;
        [$label, $price] = array_pad(explode('|', $entry, 2), 2, null);
        $sizeOptions[] = ['label' => trim((string) $label), 'price' => trim((string) $price)];
    }
    $defaultSizeIdx = $sizeOptions ? max(0, min(count($sizeOptions) - 1, (int) ($shortcode->default_size_index ?? 0))) : 0;

    // Gallery — product images, fall back to the single main image.
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
@endphp

@if ($product)
    <div class="banner-product-single {{ $bannerModifier }} section-image-zoom">
        <div class="container">
            <div class="row">
                {{-- LEFT — vertical thumbnail strip + main swiper --}}
                <div class="col-lg-6">
                    <div class="tf-product-media-wrap sticky-top">
                        <div class="product-thumbs-slider style-row row_left">
                            <div class="flat-wrap-media-product">
                                <div dir="ltr" class="swiper tf-product-media-main" id="gallery-swiper-started" data-spacing="0">
                                    <div class="swiper-wrapper">
                                        @foreach ($galleryImages as $img)
                                            @php $imgUrl = RvMedia::getImageUrl($img, null, false, RvMedia::getDefaultImage()); @endphp
                                            <div class="swiper-slide">
                                                <a href="{{ $imgUrl }}" target="_blank" rel="noopener noreferrer" class="item" data-pswp-width="565px" data-pswp-height="753px">
                                                    <img loading="lazy" width="565" height="753" class="tf-image-zoom"
                                                         data-zoom="{{ $imgUrl }}" src="{{ $imgUrl }}" alt="{{ $detailName }}">
                                                </a>
                                            </div>
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                            {{-- Thumbs swiper is a SIBLING of .flat-wrap-media-product —
                                 .product-thumbs-slider.style-row lays the two out as a flex row. --}}
                            @if (count($galleryImages) > 1)
                                <div dir="ltr" class="swiper tf-product-media-thumbs other-image-zoom"
                                     data-direction="vertical" data-preview="5">
                                    <div class="swiper-wrapper stagger-wrap">
                                        @foreach ($galleryImages as $img)
                                            <div class="swiper-slide stagger-item">
                                                <div class="item">
                                                    {!! RvMedia::image($img, $detailName, 'thumb', false, ['width' => 82, 'height' => 110, 'loading' => 'lazy']) !!}
                                                </div>
                                            </div>
                                        @endforeach
                                    </div>
                                </div>
                            @endif
                        </div>
                    </div>
                </div>

                {{-- RIGHT — product info panel --}}
                <div class="col-lg-6">
                    <div class="tf-product-info-wrap position-relative mt-lg-0">
                        <div class="tf-zoom-main sticky-top"></div>
                        <div class="tf-product-info-list other-image-zoom">
                            <div class="single-heading">
                                @if ($detailTag !== '')
                                    <p class="detail-tag text-body-1 cl-text-2 mb-4">{{ $detailTag }}</p>
                                @endif
                                <a href="{{ $product->url }}" class="detail-name h3 fw-medium link mb-12">{{ $detailName }}</a>
                                @if ($reviewsCount > 0)
                                    <div class="d-flex align-items-center gap-4 mb-12">
                                        <div class="star-wrap normal d-flex align-items-center">
                                            @for ($i = 0; $i < 5; $i++)
                                                <i class="icon icon-Star fs-12"></i>
                                            @endfor
                                        </div>
                                        <span class="cl-text-2 text-caption-02">({{ $reviewsCount }} {{ __('reviews') }})</span>
                                    </div>
                                @endif
                                @if ($badgeText !== '' || $urgencyText !== '')
                                    <div class="d-flex align-items-center gap-4 mb-20">
                                        @if ($badgeText !== '')
                                            <div class="tf-product-pre-order style-2">
                                                <span class="text-caption-01">{{ $badgeText }}</span>
                                            </div>
                                        @endif
                                        @if ($urgencyText !== '')
                                            <i class="icon icon-Lightning fs-20 text-primary"></i>
                                            <span class="text-caption-01 cl-text-2">{{ $urgencyText }}</span>
                                        @endif
                                    </div>
                                @endif
                                <div class="detail-price">
                                    <p class="price-on-sale h4 fw-semibold mb-0">{!! format_price($currentPrice) !!}</p>
                                    @if ($isOnSale)
                                        <div class="br-line type-vertical"></div>
                                        <p class="cl-text-3 text-decoration-line-through">{!! format_price($oldPrice) !!}</p>
                                        @if ($salePercent > 0)
                                            <span class="badge-sale text-white fw-semibold text-caption-02">-{{ $salePercent }}%</span>
                                        @endif
                                    @endif
                                </div>
                            </div>
                            <div class="single-choose-option d-grid gap-20">
                                @if (! empty($sizeOptions))
                                    @php $activeSize = $sizeOptions[$defaultSizeIdx] ?? $sizeOptions[0]; @endphp
                                    <div class="variant-picker-item variant-size-2 d-grid gap-12">
                                        <div class="variant-picker-label">
                                            <div>
                                                {{ __('Size:') }}
                                                <span class="variant-picker-label-value value-currentSize text-capitalize fw-medium">{{ $activeSize['label'] }}</span>
                                            </div>
                                        </div>
                                        <div class="variant-picker-values">
                                            @foreach ($sizeOptions as $i => $opt)
                                                <span class="size-btn @if ($i === $defaultSizeIdx) active @endif"
                                                      data-size="{{ $opt['label'] }}"
                                                      @if ($opt['price'] !== '' && $opt['price'] !== null) data-price="{{ $opt['price'] }}" @endif>
                                                    {{ $opt['label'] }}
                                                </span>
                                            @endforeach
                                        </div>
                                    </div>
                                @endif

                                @if (EcommerceHelper::isCartEnabled())
                                    <div class="tf-product-total-quantity">
                                        <p class="">{{ __('Quantity:') }}</p>
                                        <div class="wg-quantity">
                                            <button class="btn-quantity btn-decrease" type="button" aria-label="{{ __('Decrease') }}">
                                                <i class="icon icon-minus"></i>
                                            </button>
                                            <input class="quantity-product" type="text" name="number" value="1" aria-label="{{ __('Quantity') }}">
                                            <button class="btn-quantity btn-increase" type="button" aria-label="{{ __('Increase') }}">
                                                <i class="icon icon-plus"></i>
                                            </button>
                                        </div>
                                        <div class="group-action w-100">
                                            <a href="#"
                                               class="btn-action-price type-xl tf-btn animate-btn w-100"
                                               data-bb-toggle="add-to-cart"
                                               data-url="{{ route('public.cart.add-to-cart') }}"
                                               data-id="{{ $product->id }}"
                                               {!! BaseHelper::clean(EcommerceHelper::jsAttributes('add-to-cart', $product)) !!}>
                                                {{ __('Add to cart') }}
                                                <span class="price-add d-none">{!! format_price($currentPrice) !!}</span>
                                            </a>
                                            @if (EcommerceHelper::isWishlistEnabled())
                                                <a href="#compare" data-bs-toggle="offcanvas"
                                                   class="hover-tooltip box-icon btn-add-wishlist" aria-label="{{ __('Add to Wishlist') }}">
                                                    <span class="icon icon-heart" aria-hidden="true"></span>
                                                    <span class="tooltip">{{ __('Add to Wishlist') }}</span>
                                                </a>
                                            @endif
                                            @if (EcommerceHelper::isCompareEnabled())
                                                <a href="#compare" data-bs-toggle="offcanvas"
                                                   class="hover-tooltip tooltip-top box-icon btn-add-compare" aria-label="{{ __('Compare') }}">
                                                    <span class="icon icon-GitDiff" aria-hidden="true"></span>
                                                    <span class="tooltip">{{ __('Compare') }}</span>
                                                </a>
                                            @endif
                                        </div>
                                        <a href="{{ $product->url }}" class="btn-action-buy type-xl tf-btn btn-primary animate-btn w-100">
                                            {{ __('Buy It Now') }}
                                        </a>
                                    </div>
                                @endif

                                @if ($showViewFull)
                                    <div class="">
                                        <a href="{{ $product->url }}" class="tf-btn-line-2 fw-semibold style-primary pb-4">
                                            {{ __('View Full') }}
                                        </a>
                                    </div>
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endif
