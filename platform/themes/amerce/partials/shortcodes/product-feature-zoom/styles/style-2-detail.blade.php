@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Ecommerce\Facades\EcommerceHelper;
    use Botble\Media\Facades\RvMedia;

    /**
     * Mirrors html/home-pet-care.html §7 (lines 2522-2657): `banner-product-single
     * section-image-zoom` — single product detail panel with NO thumbnail strip,
     * NO color swatches, NO buy-it-now/wishlist/compare/payment icons. Slim layout:
     *   LEFT  single image + image-zoom
     *   RIGHT [PET CARE tag] [name] [stars + reviews + sold-urgency] [price + old + -%]
     *         [description] [Hurry Up countdown] [Sold-It progress bar]
     *         [Size buttons] [Quantity stepper + Add To Cart]
     *
     * Shortcode attributes (all optional, with safe fallbacks):
     *   product_id              required — fetched via the parent partial
     *   detail_tag              section breadcrumb tag (default first category, fallback "Shop")
     *   reviews_count           hardcoded badge count (default 0 = hide)
     *   urgency_text            "18 sold in last 32 hours" — empty = hide row
     *   countdown_seconds       0 = hide
     *   countdown_label         "Hurry Up! Offer ends In:" (\\n preserved)
     *   sold_percent            0-100, 0 = hide
     *   stock_text              "Only 24 item(s) left in stock!"
     *   size_options            CSV: "Label|price,Label|price,..." (e.g. "25 lbs|39.99,50 Lbs|59.99")
     *   default_size_index      0-based active index (default 0)
     *   show_view_full          yes/no link below
     */
    $detailTag = trim((string) ($shortcode->detail_tag ?? ''));
    if ($detailTag === '' && $product) {
        $firstCat = $product->categories?->first();
        $detailTag = strtoupper((string) ($firstCat?->name ?? __('Shop')));
    }
    $reviewsCount = (int) ($shortcode->reviews_count ?? 0);
    $urgencyText  = trim((string) ($shortcode->urgency_text ?? ''));
    $countdown    = (int) ($shortcode->countdown_seconds ?? 0);
    $countdownLbl = (string) ($shortcode->countdown_label ?? __('Hurry Up!') . "\n" . __('Offer ends In:'));
    $soldPercent  = max(0, min(100, (int) ($shortcode->sold_percent ?? 0)));
    $stockText    = trim((string) ($shortcode->stock_text ?? ''));
    $showViewFull = filter_var($shortcode->show_view_full ?? 'no', FILTER_VALIDATE_BOOLEAN);

    // wrapper_style: appended to `banner-product-single` for demo-specific modifiers.
    // Demo §6 of home-organic.html (L2342) uses `banner-product-single style-3 section-image-zoom`.
    $allowedWrapper = ['', 'style-3'];
    $rawWrapper = $shortcode->wrapper_style ?? '';
    $wrapperStyle = in_array($rawWrapper, $allowedWrapper, true) ? $rawWrapper : '';

    // container_class: switch the inner `.container` to `container-2` (wider) when the
    // demo asks for it. Default keeps back-compat (HomePetCare's slim panel uses container).
    $allowedContainers = ['container', 'container-2', 'container-full'];
    $rawContainer = $shortcode->container_class ?? 'container';
    $containerClass = in_array($rawContainer, $allowedContainers, true) ? $rawContainer : 'container';

    // badge_text: small "Best seller" / "Hot deal" pill rendered before the urgency
    // text (matches demo §6 L2442-2444 `text-sale text-label fw-semibold`).
    $badgeText = trim((string) ($shortcode->badge_text ?? ''));

    // show_thumb_slider='yes' — render vertical thumbs synced to a main image swiper
    // using $product->images (falls back to single main image). Matches demo §6
    // L2346-2416. Default 'no' preserves HomePetCare's single-image layout.
    $showThumbSlider = ($shortcode->show_thumb_slider ?? 'no') === 'yes';

    // show_buy_it_now='yes' adds a primary "Buy It Now" button under Add To Cart
    // (demo §6 L2489-2492).
    $showBuyItNow = ($shortcode->show_buy_it_now ?? 'no') === 'yes';

    // show_action_boxes='yes' renders the wishlist + compare icon boxes alongside
    // Add To Cart (demo §6 L2478-2487).
    $showActionBoxes = ($shortcode->show_action_boxes ?? 'no') === 'yes';

    // Gallery images for the thumb slider (when enabled).
    $galleryImages = [];
    if ($showThumbSlider && $product) {
        $galleryImages = collect($product->images ?? [])
            ->filter(fn ($img) => is_string($img) && trim($img) !== '')
            ->values()
            ->all();
        if (empty($galleryImages) && $product->image) {
            $galleryImages = [$product->image];
        }
    }

    // Parse size options CSV. Each entry "Label|price" or just "Label".
    $sizeOptions = [];
    $rawSizeOpts = $shortcode->size_options ?? null;
    if (! empty($rawSizeOpts)) {
        foreach (explode(',', (string) $rawSizeOpts) as $entry) {
            $entry = trim($entry);
            if ($entry === '') continue;
            [$label, $price] = array_pad(explode('|', $entry, 2), 2, null);
            $sizeOptions[] = ['label' => trim((string) $label), 'price' => trim((string) $price)];
        }
    }
    $defaultSizeIdx = max(0, min(count($sizeOptions) - 1, (int) ($shortcode->default_size_index ?? 0)));

    $isOnSale = $product && $product->front_sale_price !== null
        && $product->price > 0
        && (float) $product->front_sale_price < (float) $product->price;
    $salePercent = $isOnSale
        ? (int) round((1 - ((float) $product->front_sale_price / (float) $product->price)) * 100)
        : 0;

    $mainImage = $product ? RvMedia::getImageUrl($product->image, 'hero-banner', false, RvMedia::getDefaultImage()) : null;
@endphp

@if ($product)
    <div @class(['banner-product-single', $wrapperStyle => $wrapperStyle !== '', 'section-image-zoom'])>
        <div class="{{ $containerClass }}">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    @if ($showThumbSlider && count($galleryImages) > 0)
                        {{-- Vertical thumb slider — mirrors home-organic.html §6 L2346-2416 --}}
                        <div class="tf-product-media-wrap sticky-top">
                            <div class="product-thumbs-slider style-row row_left">
                                <div class="flat-wrap-media-product">
                                    <div dir="ltr" class="swiper tf-product-media-main" id="pfz-gallery-{{ $product->id }}" data-spacing="0">
                                        <div class="swiper-wrapper">
                                            @foreach ($galleryImages as $img)
                                                @php $imgUrl = RvMedia::getImageUrl($img, null, false, RvMedia::getDefaultImage()); @endphp
                                                <div class="swiper-slide">
                                                    <a href="{{ $imgUrl }}" target="_blank" rel="noopener noreferrer" class="item" data-pswp-width="490px" data-pswp-height="548px">
                                                        <img loading="lazy" width="490" height="548" class="tf-image-zoom"
                                                             data-zoom="{{ $imgUrl }}" src="{{ $imgUrl }}" alt="{{ $product->name }}">
                                                    </a>
                                                </div>
                                            @endforeach
                                        </div>
                                    </div>
                                </div>
                                @if (count($galleryImages) > 1)
                                    <div dir="ltr" class="swiper tf-product-media-thumbs other-image-zoom"
                                         data-direction="vertical" data-preview="3">
                                        <div class="swiper-wrapper stagger-wrap">
                                            @foreach ($galleryImages as $img)
                                                <div class="swiper-slide stagger-item">
                                                    <div class="item radius-8">
                                                        {!! RvMedia::image($img, $product->name, 'thumb', false, ['loading' => 'lazy', 'width' => 82, 'height' => 110]) !!}
                                                    </div>
                                                </div>
                                            @endforeach
                                        </div>
                                    </div>
                                @endif
                            </div>
                        </div>
                    @else
                        <div class="single-image radius-16 overflow-hidden">
                            <img class="tf-image-zoom" loading="lazy" width="690" height="645"
                                 src="{{ $mainImage }}"
                                 data-zoom="{{ $mainImage }}"
                                 alt="{{ $product->name }}">
                        </div>
                    @endif
                </div>
                <div class="col-lg-6">
                    <div class="tf-product-info-wrap position-relative mt-lg-0">
                        <div class="tf-zoom-main sticky-top"></div>
                        <div class="tf-product-info-list other-image-zoom">
                            <div class="single-heading">
                                @if ($detailTag !== '')
                                    <p class="detail-tag text-caption-01 cl-text-2 fw-semibold mb-4">{{ $detailTag }}</p>
                                @endif
                                <a href="{{ $product->url }}" class="detail-name h3 fw-medium link mb-12">
                                    {{ $product->name }}
                                </a>
                                <div class="detail-rate d-flex align-items-center flex-wrap gap-16 mb-16">
                                    @if ($reviewsCount > 0)
                                        <div class="d-flex align-items-center gap-4">
                                            <div class="star-wrap normal d-flex align-items-center">
                                                @for ($i = 0; $i < 5; $i++)
                                                    <i class="icon icon-Star"></i>
                                                @endfor
                                            </div>
                                            <span class="cl-text-2">({{ $reviewsCount }} {{ __('reviews') }})</span>
                                        </div>
                                    @endif
                                    @if ($badgeText !== '')
                                        <span class="text-sale text-label fw-semibold">{{ $badgeText }}</span>
                                    @endif
                                    @if ($urgencyText !== '')
                                        <div class="d-flex align-items-center gap-4">
                                            <i class="icon icon-Lightning fs-20 text-primary"></i>
                                            {{ $urgencyText }}
                                        </div>
                                    @endif
                                </div>
                                <div class="detail-price mb-8">
                                    <p class="price-on-sale h4 fw-semibold mb-0">{{ format_price($product->front_sale_price_with_taxes ?? $product->price_with_taxes ?? ($product->front_sale_price ?? $product->price)) }}</p>
                                    @if ($isOnSale)
                                        <div class="br-line type-vertical"></div>
                                        <p class="cl-text-3 text-decoration-line-through">{{ format_price($product->price_with_taxes ?? $product->price) }}</p>
                                        <span class="badge-sale text-white fw-semibold text-caption-02">-{{ $salePercent }}%</span>
                                    @endif
                                </div>
                                @if (! empty($product->description))
                                    <p class="detail-desc text-body-1 cl-text-2">
                                        {!! BaseHelper::clean($product->description) !!}
                                    </p>
                                @endif
                            </div>

                            @if ($countdown > 0 || $soldPercent > 0)
                                <div class="single-count">
                                    @if ($countdown > 0)
                                        <div class="detail-sale mb-16">
                                            <p class="mini-title fw-semibold">{!! nl2br(BaseHelper::clean($countdownLbl)) !!}</p>
                                            <div class="countdown-v03 h4">
                                                <div class="js-countdown cd-has-zero cd-custom" data-timer="{{ $countdown }}"
                                                     data-labels="{{ __('Days') }},{{ __('Hours') }},{{ __('Mins') }},{{ __('Secs') }}"></div>
                                            </div>
                                        </div>
                                    @endif
                                    @if ($soldPercent > 0)
                                        <div class="detail-sold">
                                            <p class="mini-title fw-semibold">{{ __('Sold It:') }}</p>
                                            <div class="sold-it">
                                                <div class="progress" role="progressbar" aria-valuenow="{{ $soldPercent }}" aria-valuemin="0" aria-valuemax="100">
                                                    <div class="progress-bar" style="width: {{ $soldPercent }}%;"></div>
                                                </div>
                                                <p class="text-caption-01">
                                                    {{ $soldPercent }}% {{ __('Sold') }}
                                                    @if ($stockText !== '')
                                                        - <span class="cl-text-2">{{ $stockText }}</span>
                                                    @endif
                                                </p>
                                            </div>
                                        </div>
                                    @endif
                                </div>
                            @endif

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
                                        <div class="group-action">
                                            <div class="wg-quantity">
                                                <button class="btn-quantity btn-decrease" type="button" aria-label="{{ __('Decrease') }}">
                                                    <i class="icon icon-minus"></i>
                                                </button>
                                                <input class="quantity-product" type="text" name="number" value="1" aria-label="{{ __('Quantity') }}">
                                                <button class="btn-quantity btn-increase" type="button" aria-label="{{ __('Increase') }}">
                                                    <i class="icon icon-plus"></i>
                                                </button>
                                            </div>
                                            <a href="#"
                                               class="btn-action-price tf-btn type-xl animate-btn w-100"
                                               data-bb-toggle="add-to-cart"
                                               data-url="{{ route('public.cart.add-to-cart') }}"
                                               data-id="{{ $product->id }}"
                                               {!! BaseHelper::clean(EcommerceHelper::jsAttributes('add-to-cart', $product)) !!}>
                                                {{ __('Add To Cart') }}
                                                <span class="price-add d-none">{{ format_price($product->front_sale_price ?? $product->price) }}</span>
                                            </a>
                                            @if ($showActionBoxes)
                                                <button type="button" class="hover-tooltip box-icon bg-white btn-add-wishlist" aria-label="{{ __('Add to Wishlist') }}">
                                                    <span class="icon icon-heart" aria-hidden="true"></span>
                                                    <span class="tooltip">{{ __('Add to Wishlist') }}</span>
                                                </button>
                                                <a href="#compare" data-bs-toggle="offcanvas"
                                                   class="hover-tooltip tooltip-top box-icon bg-white btn-add-compare" aria-label="{{ __('Compare') }}">
                                                    <span class="icon icon-GitDiff" aria-hidden="true"></span>
                                                    <span class="tooltip">{{ __('Compare') }}</span>
                                                </a>
                                            @endif
                                        </div>
                                        @if ($showBuyItNow)
                                            <a href="{{ $product->url }}"
                                               class="btn-action-buy type-xl tf-btn btn-primary animate-btn w-100">
                                                {{ __('Buy It Now') }}
                                            </a>
                                        @endif
                                    </div>
                                @endif

                                @if ($showViewFull)
                                    <div>
                                        <a href="{{ $product->url }}" class="tf-btn-line-2 fw-semibold style-primary pb-4">
                                            {{ __('View All Details') }}
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
