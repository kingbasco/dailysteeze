@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Ecommerce\Facades\EcommerceHelper;
    use Botble\Theme\Facades\Theme;

    $isOutOfStock      = $isOutOfStock      ?? (method_exists($product, 'isOutOfStock') ? $product->isOutOfStock() : false);
    $isPreOrder        = $isPreOrder        ?? (bool) ($product->is_pre_order ?? false);
    $hasCustomerNote   = $hasCustomerNote   ?? (bool) ($product->customer_note_enabled ?? false);
    $hasVolumeDiscount = $hasVolumeDiscount ?? (bool) ($product->enable_volume_discount ?? false);
    $hasBuyXGetY       = $hasBuyXGetY       ?? (bool) ($product->enable_buy_x_get_y ?? false);
    $hasBundleTogether = $hasBundleTogether ?? (bool) ($product->frequently_bought_together ?? false);
    $flashSale         = $flashSale         ?? null;
    $selectedAttrs     = $selectedAttrs     ?? [];
    // Quick-view variant: inline social share row replaces the modal-trigger,
    // and the nested #share modal isn't rendered (Bootstrap doesn't stack modals reliably).
    $isQuickView       = $isQuickView       ?? false;
    $isAffiliate       = (bool) ($product->is_affiliate ?? false);
    $affiliateUrl      = $product->external_url ?? null;
    $stockProgress     = (int) ($product->stock_progress ?? 0);
@endphp

<div class="tf-product-info-wrap position-relative mt-md-0">
    <div class="tf-zoom-main sticky-top"></div>
    <div class="tf-product-info-list other-image-zoom">
        <div class="tf-product-info-heading">
            @if ($product->categories->isNotEmpty())
                <p class="product-infor-cate text-caption-01 mb-4">
                    @foreach ($product->categories as $category)
                        <a href="{{ $category->url }}" class="link">{{ $category->name }}</a>{{ ! $loop->last ? ', ' : '' }}
                    @endforeach
                </p>
            @endif

            <h3 class="product-infor-name mb-12">{{ $product->name }}</h3>

            <div class="product-infor-meta mb-20">
                @if (EcommerceHelper::isReviewEnabled() && (! EcommerceHelper::hideRatingWhenNoReviews() || $product->reviews_count > 0))
                    <div class="meta_rate">
                        <a href="{{ $product->url }}#product-review" data-bb-toggle="scroll-to-review">
                            @include(EcommerceHelper::viewPath('includes.rating-star'), ['avg' => $product->reviews_avg])
                        </a>
                        <span class="text-caption-01 cl-text-2">
                            ({{ (int) $product->reviews_count === 1
                                ? __(':count review', ['count' => number_format($product->reviews_count)])
                                : __(':count reviews', ['count' => number_format($product->reviews_count)]) }})
                        </span>
                    </div>
                    <div class="br-line type-vertical"></div>
                @endif

                @php
                    $soldCount = (int) ($product->sold_count ?? 0);
                    $soldHours = (int) theme_option('product_sold_window_hours', 32);
                @endphp
                @if ($soldCount > 0)
                    <div class="meta_sold">
                        <i class="icon icon-Lightning text-primary"></i>
                        <span class="text-caption-01 cl-text-2">{{ __(':count sold in last :hours hours', ['count' => number_format($soldCount), 'hours' => $soldHours]) }}</span>
                    </div>
                    <div class="br-line type-vertical"></div>
                @endif

                @if (! empty($product->sku))
                    <div class="meta_prd_code text-caption-01">
                        <span class="cl-text-2">{{ __('SKU:') }}</span>
                        <span data-bb-value="product-sku">{{ $product->sku }}</span>
                    </div>
                @endif
            </div>

            @if ($isPreOrder)
                @include(Theme::getThemeNamespace('views.ecommerce.includes.product-pre-order'), compact('product'))
            @endif

            <div class="product-infor-price mb-12">
                @include(EcommerceHelper::viewPath('includes.product-price'), [
                    'product' => $product,
                    'priceWrapperClassName' => '',
                    'priceClassName' => 'price-on-sale h4 fw-semibold',
                    'priceOriginalWrapperClassName' => '',
                    'priceOriginalClassName' => 'cl-text-3 text-decoration-line-through',
                ])
            </div>

            @if (is_plugin_active('marketplace'))
                <div class="product-infor-vendor mb-12">
                    @include(Theme::getThemeNamespace('views.marketplace.includes.vendor-info'), ['store' => $product->store ?? null])
                </div>
            @endif

            @if ($product->description)
                <div class="product-infor-desc cl-text-2 mb-12">
                    {!! BaseHelper::clean($product->description) !!}
                </div>
            @endif

            {{-- Standard Botble hook: plugins (e.g. Loyalty Points) inject after the
                 product description here. Amerce overrides the default product-detail
                 view, so this must be re-declared or the injected content is lost. --}}
            {!! apply_filters('ecommerce_after_product_description', null, $product) !!}

            @php
                $viewersCount = (int) theme_option('product_live_viewers_count', 0);
                if ($viewersCount <= 0) {
                    $viewersCount = ((int) $product->id * 7) % 50 + 10;
                }
            @endphp
            <div class="product-infor-reality lh-24">
                <div class="ic d-flex">
                    <i class="icon icon-Eye"></i>
                </div>
                <span class="text-caption-01">{{ __(':count people are viewing this right now', ['count' => $viewersCount]) }}</span>
            </div>
        </div>

        <div class="br-line"></div>

        @if ($stockProgress > 0)
            <div class="tf-product-progress-sale">
                <div class="title">
                    <div class="available text">
                        {{ __('Available:') }} <span class="number fw-7">{{ (int) ($product->quantity ?? 0) }}</span>
                    </div>
                    <div class="sold text">
                        {{ __('Sold:') }} <span class="number fw-7 text-primary">{{ (int) ($product->sold_count ?? 0) }}</span>
                    </div>
                </div>
                <div class="progress-cart">
                    <div class="value" style="width: 0%;" data-progress="{{ $stockProgress }}"></div>
                </div>
            </div>
        @endif

        @if ($isOutOfStock)
            {{-- Back-in-stock subscription only matters on out-of-stock products, but the
                 plugin's ECOMMERCE_PRODUCT_DETAIL_EXTRA_HTML hook (below) lives in the
                 in-stock branch. When the Back in Stock plugin is active, hand off to it
                 here so its Display Mode (Modal/Inline) setting is honoured; otherwise fall
                 back to the theme's own notify form. --}}
            @if (is_plugin_active('ecommerce-back-in-stock'))
                {!! BaseHelper::clean(apply_filters(ECOMMERCE_PRODUCT_DETAIL_EXTRA_HTML, '', $product)) !!}
            @else
                @include(Theme::getThemeNamespace('views.ecommerce.includes.product-out-of-stock'), compact('product'))
            @endif
        @else
            @if ($hasCustomerNote)
                @include(Theme::getThemeNamespace('views.ecommerce.includes.product-customer-note'), compact('product'))
            @endif

            <x-core::form
                :url="route('public.cart.add-to-cart')"
                method="POST"
                class="tf-product-variant add-to-cart-form"
                data-bb-toggle="product-form"
            >
                <input type="hidden" name="id" value="{{ $product->getIdForCart() }}" />

                @if ($product->variations->isNotEmpty())
                    {{-- Helper output is trusted server-rendered markup; do NOT wrap in
                         BaseHelper::clean(), it strips data-target / data-bb-* attrs that
                         change-product-swatches.js relies on to wire the variation AJAX. --}}
                    {!! render_product_swatches($product, ['selected' => $selectedAttrs]) !!}
                @endif

                {!! render_product_options($product) !!}

                @include(Theme::getThemeNamespace('views.ecommerce.includes.product-availability'), compact('product'))

                @if ($flashSale)
                    @php
                        // Vendor count-down.js (loaded globally as 'countdown')
                        // expects data-timer in seconds and renders the
                        // .countdown__timer > .countdown__item children itself.
                        $countdownSeconds = max(0, $flashSale->end_date->endOfDay()->timestamp - now()->timestamp);
                    @endphp
                    <div class="tf-product-info-countdown type-box mt-12 mb-12">
                        <div class="countdown-title">
                            {{-- Alarm clock SVG (matches html/product-countdown-timer.html demo).
                                 .tf-ani-tada triggers the existing tada keyframe. --}}
                            <svg class="tf-ani-tada" width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                                <path d="M5.78104 3.53104L2.78104 6.53104C2.64031 6.67177 2.44944 6.75083 2.25042 6.75083C2.05139 6.75083 1.86052 6.67177 1.71979 6.53104C1.57906 6.39031 1.5 6.19944 1.5 6.00042C1.5 5.80139 1.57906 5.61052 1.71979 5.46979L4.71979 2.46979C4.86052 2.32906 5.05139 2.25 5.25042 2.25C5.44944 2.25 5.64031 2.32906 5.78104 2.46979C5.92177 2.61052 6.00083 2.80139 6.00083 3.00042C6.00083 3.19944 5.92177 3.39031 5.78104 3.53104ZM22.281 5.46979L19.281 2.46979C19.1403 2.32906 18.9494 2.25 18.7504 2.25C18.5514 2.25 18.3605 2.32906 18.2198 2.46979C18.0791 2.61052 18 2.80139 18 3.00042C18 3.19944 18.0791 3.39031 18.2198 3.53104L21.2198 6.53104C21.2895 6.60072 21.3722 6.656 21.4632 6.69371C21.5543 6.73142 21.6519 6.75083 21.7504 6.75083C21.849 6.75083 21.9465 6.73142 22.0376 6.69371C22.1286 6.656 22.2114 6.60072 22.281 6.53104C22.3507 6.46136 22.406 6.37863 22.4437 6.28759C22.4814 6.19654 22.5008 6.09896 22.5008 6.00042C22.5008 5.90187 22.4814 5.80429 22.4437 5.71324C22.406 5.6222 22.3507 5.53947 22.281 5.46979ZM21.0004 12.7504C21.0004 14.5304 20.4726 16.2705 19.4836 17.7505C18.4947 19.2306 17.0891 20.3841 15.4446 21.0653C13.8 21.7465 11.9904 21.9247 10.2446 21.5775C8.49878 21.2302 6.89513 20.373 5.63646 19.1144C4.37778 17.8557 3.52062 16.2521 3.17335 14.5062C2.82608 12.7604 3.00431 10.9508 3.6855 9.30627C4.36669 7.66173 5.52024 6.25612 7.00029 5.26719C8.48033 4.27826 10.2204 3.75042 12.0004 3.75042C14.3865 3.75315 16.6741 4.70223 18.3614 6.38947C20.0486 8.07671 20.9977 10.3643 21.0004 12.7504ZM18.0004 12.7504C18.0004 12.5515 17.9214 12.3607 17.7807 12.2201C17.6401 12.0794 17.4493 12.0004 17.2504 12.0004H12.7504V7.50042C12.7504 7.3015 12.6714 7.11074 12.5307 6.97009C12.3901 6.82943 12.1993 6.75042 12.0004 6.75042C11.8015 6.75042 11.6107 6.82943 11.4701 6.97009C11.3294 7.11074 11.2504 7.3015 11.2504 7.50042V12.7504C11.2504 12.9493 11.3294 13.1401 11.4701 13.2807C11.6107 13.4214 11.8015 13.5004 12.0004 13.5004H17.2504C17.4493 13.5004 17.6401 13.4214 17.7807 13.2807C17.9214 13.1401 18.0004 12.9493 18.0004 12.7504Z" fill="currentColor" />
                            </svg>
                            <div class="h6 mb-0">{{ __('Hurry up offer ends in:') }}</div>
                        </div>
                        <div class="countdown-v05">
                            <div class="js-countdown"
                                 data-timer="{{ $countdownSeconds }}"
                                 data-labels="{{ __('Days') }},{{ __('Hours') }},{{ __('Mins') }},{{ __('Secs') }}"></div>
                        </div>
                    </div>
                @endif

                {!! BaseHelper::clean(apply_filters(ECOMMERCE_PRODUCT_DETAIL_EXTRA_HTML, '', $product)) !!}

                @if (EcommerceHelper::isCartEnabled() && ! $isAffiliate)
                    <div class="tf-product-total-quantity">
                        <p class="title">{{ __('Quantity:') }}</p>
                        <div class="group-action">
                            @include(Theme::getThemeNamespace('views.ecommerce.includes.cart-quantity'), [
                                'product' => $product,
                                'isOutOfStock' => $isOutOfStock,
                            ])
                            <button
                                type="submit"
                                name="add-to-cart"
                                @class(['btn-action-price tf-btn type-xl animate-btn w-100', 'btn-disabled' => $isOutOfStock])
                                @disabled($isOutOfStock)
                                data-action="add-to-cart"
                                {!! EcommerceHelper::jsAttributes('add-to-cart-in-form', $product) !!}
                            >
                                {{ $isPreOrder ? __('Pre-order Now') : __('Add To Cart') }}
                                <span class="d-none d-sm-inline d-md-none d-lg-inline">&nbsp;-&nbsp;</span>
                                <span class="price-add d-none d-sm-inline d-md-none d-lg-inline" data-bb-value="product-price">{{ format_price($product->front_sale_price ?? $product->price) }}</span>
                            </button>
                        </div>

                        @if (EcommerceHelper::isQuickBuyButtonEnabled())
                            <button
                                type="submit"
                                name="checkout"
                                value="1"
                                @class(['tf-btn type-xl btn-primary animate-btn w-100', 'btn-disabled' => $isOutOfStock])
                                @disabled($isOutOfStock)
                            >
                                {{ __('Buy It Now') }}
                            </button>
                        @endif
                    </div>
                @endif

                @if ($isAffiliate && $affiliateUrl)
                    <a href="{{ $affiliateUrl }}"
                       target="_blank"
                       rel="nofollow noopener noreferrer"
                       class="tf-btn type-xl btn-primary animate-btn w-100">
                        {{ __('Buy on External Store') }}
                        <i class="icon icon-ArrowUpRight"></i>
                    </a>
                @endif
            </x-core::form>
        @endif

        <div class="tf-product-extra-link">
            @php
                use Botble\Ecommerce\Facades\Cart;

                $productIdForLists = $product->original_product->id;
                $inCompare = Cart::instance('compare')->search(fn ($item) => (int) $item->id === (int) $productIdForLists)->isNotEmpty();
                $inWishlist = Cart::instance('wishlist')->search(fn ($item) => (int) $item->id === (int) $productIdForLists)->isNotEmpty();

                $rawAdminEmail = setting('admin_email');
                $rawAdminEmail = is_array($rawAdminEmail) ? ($rawAdminEmail[0] ?? '') : $rawAdminEmail;
                $contactEmail = (string) ($rawAdminEmail ?: theme_option('contact_email'));
                $askMailto = $contactEmail
                    ? 'mailto:' . $contactEmail . '?subject=' . rawurlencode(__('Question about :name', ['name' => $product->name]))
                    : null;
                $sizeGuideUrl = (string) theme_option('size_guide_url');

                // Resolve the active size guide for this product (plugin chain:
                // product → category → brand). When present, the plugin renders
                // <div id="sizeGuideModal"> via THEME_FRONT_FOOTER, so we just
                // need to surface the trigger here.
                $hasSizeGuide = false;
                if (is_plugin_active('fob-product-size-guide') && class_exists(\FriendsOfBotble\ProductSizeGuide\Services\SizeGuideService::class)) {
                    $hasSizeGuide = (bool) app(\FriendsOfBotble\ProductSizeGuide\Services\SizeGuideService::class)
                        ->getSizeGuideForProduct($product);
                }

                // The Size-attribute inline trigger (in swatches-renderer.blade.php)
                // only fires when the product actually has a Size attribute set.
                // For products without a Size variant we still want an entry
                // point to the modal, so render it in the extras row instead.
                $productHasSizeAttribute = $product->productAttributeSets
                    ->pluck('slug')
                    ->contains('size');
                $sizeGuideModalMode = setting('product_size_guide_display_mode', 'inline') === 'popup';
                $showExtrasSizeGuideTrigger = $hasSizeGuide
                    && $sizeGuideModalMode
                    && ! $productHasSizeAttribute
                    && theme_option('enabled_product_size_guide', true);
            @endphp

            @if (EcommerceHelper::isCompareEnabled())
                <button type="button"
                        @class(['product-extra-icon link', 'active' => $inCompare])
                        data-bb-toggle="add-to-compare"
                        data-url="{{ route('public.compare.add', $product) }}"
                        data-remove-url="{{ route('public.compare.remove', $product) }}"
                        title="{{ __('Compare') }}">
                    <i class="icon icon-ArrowsLeftRight"></i>
                    {{ __('Compare') }}
                </button>
            @endif

            @if (EcommerceHelper::isWishlistEnabled())
                <button type="button"
                        @class(['product-extra-icon link', 'active' => $inWishlist])
                        data-bb-toggle="add-to-wishlist"
                        data-url="{{ route('public.wishlist.add', $product) }}"
                        title="{{ __('Add To Wishlist') }}">
                    <i class="icon icon-heart"></i>
                    {{ __('Add To Wishlist') }}
                </button>
            @endif

            @if ($askMailto)
                <a href="{{ $askMailto }}" class="product-extra-icon link" title="{{ __('Ask A Question') }}">
                    <i class="icon icon-Question"></i>
                    {{ __('Ask A Question') }}
                </a>
            @endif

            {{-- Size Guide trigger in extras row. Two paths:
                  1. Plugin-driven modal: when display_mode='popup' and product
                     has NO Size attribute (so the inline-above-Size trigger in
                     swatches-renderer.blade.php never fires).
                  2. Legacy fallback: when no plugin guide is assigned but the
                     theme_option('size_guide_url') is set. --}}
            @if ($showExtrasSizeGuideTrigger)
                <a href="#sizeGuideModal" data-bs-toggle="modal" class="product-extra-icon link" title="{{ __('Size Guide') }}">
                    <i class="icon icon-Ruler"></i>
                    {{ __('Size Guide') }}
                </a>
            @elseif (! $hasSizeGuide && $sizeGuideUrl && theme_option('enabled_product_size_guide', true))
                <a href="{{ $sizeGuideUrl }}" class="product-extra-icon link" title="{{ __('Size Guide') }}">
                    <i class="icon icon-Ruler"></i>
                    {{ __('Size Guide') }}
                </a>
            @endif

            @if (! $isQuickView)
                <a href="#share" data-bs-toggle="modal" class="product-extra-icon link">
                    <i class="icon icon-ShareNetwork"></i>
                    {{ __('Share') }}
                </a>
            @endif
        </div>

        @if ($isQuickView)
            {{-- Inline share row for the quick-view modal — avoids nested modals.
                 Theme::renderSocialSharing returns the brand-styled share buttons
                 that the share modal also uses, so the visual language stays consistent. --}}
            <div class="quick-view-share mt-3">
                <span class="quick-view-share__label">{{ __('Share:') }}</span>
                <div class="quick-view-share__buttons">
                    {!! Theme::renderSocialSharing($product->url, \Botble\SeoHelper\Facades\SeoHelper::getDescription(), $product->image) !!}
                </div>
            </div>
        @endif

        @if ($hasVolumeDiscount)
            <div class="br-line"></div>
            @include(Theme::getThemeNamespace('views.ecommerce.includes.product-volume-discount'), compact('product'))
        @endif

        @if ($hasBuyXGetY)
            <div class="br-line"></div>
            @include(Theme::getThemeNamespace('views.ecommerce.includes.product-buy-x-get-y'), compact('product'))
        @endif

        @if ($hasBundleTogether)
            <div class="br-line"></div>
            @include(Theme::getThemeNamespace('views.ecommerce.includes.product-bundle-together'), compact('product'))
        @endif

        <div class="br-line"></div>

        {{-- Delivery & Return info, Safe-Checkout payment cards, and
             Product Categories are widget-driven. Rendered INSIDE this
             .tf-product-info-list so the scoped .tf-product-info-wrap CSS
             (flex layout, trust-seal box) applies. Admins compose the
             blocks via Admin → Appearance → Widgets → Product Details. --}}
        {!! dynamic_sidebar('product_details_sidebar') !!}

        {{-- Specification block intentionally not rendered here.
             It's already shown as a dedicated tab in product.blade.php
             (see "Product Specification" tab in the tabs section). --}}

        @if (! $isQuickView)
            @include(Theme::getThemeNamespace('views.ecommerce.includes.product-sharing'), compact('product'))
        @endif
    </div>
</div>
