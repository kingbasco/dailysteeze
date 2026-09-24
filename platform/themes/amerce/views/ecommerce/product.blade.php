@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Ecommerce\Facades\EcommerceHelper;
    use Botble\Ecommerce\Facades\FlashSale;
    use Botble\Ecommerce\Models\Product;
    use Botble\Theme\Facades\Theme;

    Theme::layout('default');
    Theme::set('pageTitle', $product->name);
    // Tell the default breadcrumb partial to skip — we render our own
    // section-page-title-single (breadcrumb + prev/grid/next nav) below.
    Theme::set('renderingProduct', true);

    $flashSale = null;

    if (FlashSale::isEnabled()) {
        $flashSale = FlashSale::getFlashSaleForProduct($product);
    }

    // Per-product feature flags (theme options + product flags). Defaults are safe.
    $is3d              = (bool) ($product->is_3d ?? false);
    $hasVideo          = (bool) ($product->video_url ?? false);
    $isPreOrder        = (bool) ($product->is_pre_order ?? false);
    $isOutOfStock      = method_exists($product, 'isOutOfStock') ? $product->isOutOfStock() : false;
    $hasCustomerNote   = (bool) ($product->customer_note_enabled ?? false);
    $hasVolumeDiscount = (bool) ($product->enable_volume_discount ?? false);
    $hasBuyXGetY       = (bool) ($product->enable_buy_x_get_y ?? false);
    $hasBundleTogether = (bool) ($product->frequently_bought_together ?? false);

    // Sibling navigation — scoped to the product's primary category so prev/next
    // walks within "Bottoms" rather than the entire catalog. Falls back to the
    // shop index for the grid icon. Composite (created_at, id) ordering keeps
    // seeded products with shared timestamps navigable.
    $primaryCategory = $product->categories->first();

    $siblingScope = fn ($query) => $query
        ->wherePublished()
        ->where('is_variation', 0)
        ->when($primaryCategory, fn ($q) => $q->whereHas(
            'categories',
            fn ($qq) => $qq->where('ec_product_categories.id', $primaryCategory->getKey())
        ));

    $prevProduct = Product::query()
        ->tap($siblingScope)
        ->where(fn ($q) => $q
            ->where('created_at', '<', $product->created_at)
            ->orWhere(fn ($qq) => $qq->where('created_at', $product->created_at)->where('id', '<', $product->getKey())))
        ->orderByDesc('created_at')->orderByDesc('id')
        ->first();

    $nextProduct = Product::query()
        ->tap($siblingScope)
        ->where(fn ($q) => $q
            ->where('created_at', '>', $product->created_at)
            ->orWhere(fn ($qq) => $qq->where('created_at', $product->created_at)->where('id', '>', $product->getKey())))
        ->orderBy('created_at')->orderBy('id')
        ->first();

    $shopUrl = $primaryCategory?->url ?: (Route::has('public.products') ? route('public.products') : url('/'));

    // Resolution: ?layout= URL override → Theme::get programmatic override → per-product
    // attribute → admin theme option. The single `?layout=` query overloads gallery and
    // description style so the seeded demo menu can showcase each variant from one stable
    // /product-demo route. `description-accordion` is the only value that targets the
    // description style; everything else maps to a gallery layout.
    $requestLayout = request()->query('layout');
    $allowedLayouts = ['default', 'bottom-thumbnail', 'right-thumbnail', 'stacked', 'grid', 'grid-2'];

    $galleryLayout = (in_array($requestLayout, $allowedLayouts, true) ? $requestLayout : null)
        ?: Theme::get('galleryLayout')
        ?: ($product->gallery_layout ?? theme_option('ecommerce_gallery_layout', 'default'));
    $galleryLayout = in_array($galleryLayout, $allowedLayouts, true) ? $galleryLayout : 'default';

    $descriptionStyle = ($requestLayout === 'description-accordion' ? 'accordion' : null)
        ?: Theme::get('descriptionStyle')
        ?: theme_option('ecommerce_product_description_style', 'tabs');
    $descriptionStyle = in_array($descriptionStyle, ['tabs', 'accordion'], true) ? $descriptionStyle : 'tabs';

    $hasSpecificationTab = EcommerceHelper::isProductSpecificationEnabled()
        && $product->specificationAttributes->where('pivot.hidden', false)->isNotEmpty();
    $hasReviewTab = EcommerceHelper::isReviewEnabled();
    $hasVendorTab = is_plugin_active('marketplace') && $product->store?->id;
    $hasFaqTab = is_plugin_active('faq') && ! empty($product->faq_items);
@endphp

{!! BaseHelper::clean(apply_filters('ads_render', '', 'detail_page_before')) !!}

<div class="section-page-title-single flat-spacing-3">
    <div class="container">
        <div class="main-page-title">
            <div class="breadcrumbs">
                {!! Theme::breadcrumb()->render(Theme::getThemeNamespace('partials.breadcrumb-list')) !!}
            </div>
            <div class="nav-post-list">
                @if ($prevProduct)
                    <a href="{{ $prevProduct->url }}" class="link nav-post-item nav-post-prev" aria-label="{{ __('Previous product') }}">
                        <i class="icon icon-CaretLeft"></i>
                    </a>
                @else
                    <span class="link nav-post-item nav-post-prev disabled" aria-disabled="true">
                        <i class="icon icon-CaretLeft"></i>
                    </span>
                @endif
                <a href="{{ $shopUrl }}" class="link nav-all-post nav-post-link" aria-label="{{ __('All products') }}">
                    <i class="icon icon-SquaresFour"></i>
                </a>
                @if ($nextProduct)
                    <a href="{{ $nextProduct->url }}" class="link nav-post-item nav-post-next" aria-label="{{ __('Next product') }}">
                        <i class="icon icon-CaretRightThin"></i>
                    </a>
                @else
                    <span class="link nav-post-item nav-post-next disabled" aria-disabled="true">
                        <i class="icon icon-CaretRightThin"></i>
                    </span>
                @endif
            </div>
        </div>
    </div>
</div>

<section class="section-product-single tf-main-product section-image-zoom bb-product-detail">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                {!! BaseHelper::clean(apply_filters('ecommerce_product_detail_before_gallery', '', $product)) !!}

                @if ($is3d)
                    @include(Theme::getThemeNamespace('views.ecommerce.includes.product-3d-viewer'), compact('product'))
                @else
                    @include(Theme::getThemeNamespace('views.ecommerce.includes.product-gallery-' . $galleryLayout), compact('product'))
                @endif

                {!! BaseHelper::clean(apply_filters('ecommerce_product_detail_after_gallery', '', $product)) !!}
            </div>

            <div class="col-md-6">
                @include(Theme::getThemeNamespace('views.ecommerce.includes.product-detail'), [
                    'product' => $product,
                    'flashSale' => $flashSale,
                    'isOutOfStock' => $isOutOfStock,
                    'isPreOrder' => $isPreOrder,
                    'hasCustomerNote' => $hasCustomerNote,
                    'hasVolumeDiscount' => $hasVolumeDiscount,
                    'hasBuyXGetY' => $hasBuyXGetY,
                    'hasBundleTogether' => $hasBundleTogether,
                ])
                {{-- Sidebar widgets (delivery/return, safe checkout, categories)
                     render INSIDE includes.product-detail so the scoped
                     .tf-product-info-wrap CSS (flex layout, trust-seal box)
                     applies. --}}
            </div>
        </div>
    </div>
</section>

{!! BaseHelper::clean(apply_filters('ecommerce_product_detail_before_tabs', '', $product)) !!}

@include(Theme::getThemeNamespace('views.ecommerce.includes.product-description-' . $descriptionStyle), [
    'product' => $product,
    'hasSpecificationTab' => $hasSpecificationTab,
    'hasReviewTab' => $hasReviewTab,
    'hasVendorTab' => $hasVendorTab,
    'hasFaqTab' => $hasFaqTab,
])

{!! BaseHelper::clean(apply_filters('ecommerce_product_detail_after_tabs', '', $product)) !!}

{{-- Sticky bottom Add-to-Cart bar — toggled via global scroll handler in main.js
     when .btn-action-price scrolls out of view. SCSS lives in component/elements/_product.scss. --}}
<div class="tf-sticky-btn-atc">
    <div class="container">
        <div class="tf-height-observer w-100 d-flex align-items-center">
            <div class="tf-sticky-atc-product d-flex align-items-center">
                <div class="atc-product-side">
                    <div class="prd_img">
                        {!! \Botble\Media\Facades\RvMedia::image($product->image, $product->name, 'thumb', false, ['width' => 60, 'height' => 80, 'loading' => 'lazy']) !!}
                    </div>
                    <div class="prd_info d-none d-lg-grid">
                        <p class="name__prd fw-medium lh-24 text-line-clamp-1 mb-0">{{ $product->name }}</p>
                        @if ($product->sku)
                            <p class="distribute__prd text-caption-01 cl-text-3 mb-0">{{ __('SKU') }}: {{ $product->sku }}</p>
                        @endif
                        <div class="price__prd fw-semibold">
                            @include(EcommerceHelper::viewPath('includes.product-price'), [
                                'product' => $product,
                                'priceWrapperClassName' => '',
                                'priceClassName' => 'price-on-sale fw-semibold',
                                'priceOriginalWrapperClassName' => '',
                                'priceOriginalClassName' => 'cl-text-3 text-decoration-line-through',
                            ])
                        </div>
                    </div>
                </div>
            </div>

            <div class="tf-sticky-atc-infos">
                <div class="tf-sticky-atc-actions d-flex align-items-center gap-2">
                    <button
                        type="button"
                        @class(['tf-btn btn-add-to-cart animate-btn', 'btn-disabled' => $isOutOfStock])
                        @disabled($isOutOfStock)
                        data-action="add-to-cart"
                        data-product-id="{{ $product->id }}"
                        data-bb-toggle="scroll-to-add-to-cart"
                    >
                        <span class="text">{{ $isPreOrder ? __('Pre-order Now') : __('Add To Cart') }}</span>
                        <span class="d-none d-sm-inline">&nbsp;-&nbsp;</span>
                        <span class="price-add d-none d-sm-inline" data-bb-value="product-price">{{ format_price($product->front_sale_price ?? $product->price) }}</span>
                    </button>
                    @if (EcommerceHelper::isQuickBuyButtonEnabled())
                        {{-- data-bb-toggle="scroll-to-buy-now" relays the click to the
                             in-form button[name="checkout"], which the ecommerce plugin
                             posts with checkout=1 → server returns next_url=/checkout. --}}
                        <button
                            type="button"
                            @class(['tf-btn btn-buy-now btn-outline animate-btn', 'btn-disabled' => $isOutOfStock])
                            @disabled($isOutOfStock)
                            data-bb-toggle="scroll-to-buy-now"
                        >
                            <span class="text">{{ __('Buy now') }}</span>
                        </button>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>

@if (EcommerceHelper::isEnabledUpSaleProducts())
    @include(EcommerceHelper::viewPath('includes.up-sale-products'), ['parentProduct' => $product])
@endif

@if (EcommerceHelper::isEnabledCrossSaleProducts())
    @include(EcommerceHelper::viewPath('includes.cross-sale-products'), ['parentProduct' => $product])
@endif

@if (EcommerceHelper::isEnabledRelatedProducts())
    @include(Theme::getThemeNamespace('views.ecommerce.includes.related-products'), compact('product'))
@endif

{!! BaseHelper::clean(apply_filters('ads_render', '', 'detail_page_after')) !!}
