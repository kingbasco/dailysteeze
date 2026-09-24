@php
    /**
     * Style-1 grid card — shop card layout.
     * Image (with hover) → action overlay → single badge → quick-add → marquee → info block.
     * No flash-sale countdown overlay here — the demo only shows it inside
     * dedicated flash-sale sections, not on the standard shop card.
     *
     * Inputs:
     *   $product       \Botble\Ecommerce\Models\Product
     *   $showQuickView bool
     *   $showQuickShop bool
     */
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    $showQuickView = $showQuickView ?? true;
    $showQuickShop = $showQuickShop ?? true;

    $primaryImage = RvMedia::getImageUrl($product->image, 'product-grid', false, RvMedia::getDefaultImage());
    $hoverImage = null;
    if (! empty($product->images) && is_iterable($product->images)) {
        foreach ($product->images as $img) {
            if (! is_string($img) || trim($img) === '' || $img === $product->image) {
                continue;
            }
            $hoverImage = RvMedia::getImageUrl($img, 'product-grid', false, null);
            if ($hoverImage) {
                break;
            }
        }
    }

    $isOnSale = $product->front_sale_price !== null
        && $product->price > 0
        && (float) $product->front_sale_price < (float) $product->price;
    $salePercent = $isOnSale
        ? (int) round((1 - ((float) $product->front_sale_price / (float) $product->price)) * 100)
        : 0;

    $productWrapperClass = trim((string) ($productWrapperClass ?? ''));
    // Per-context decoration toggles (defaults preserve existing behavior).
    $showActions = $showActions ?? true;
    $showBadges = $showBadges ?? true;
    $showMarquee = $showMarquee ?? true;
@endphp

<div class="card-product_wrapper {{ $productWrapperClass }}">
    <a href="{{ $product->url }}" class="product-img" aria-label="{{ $product->name }}">
        <img
            class="img-product"
            loading="lazy"
            width="330"
            height="440"
            src="{{ $primaryImage }}"
            alt="{{ $product->name }}"
        >
        @if ($hoverImage)
            <img
                class="img-hover"
                loading="lazy"
                width="330"
                height="440"
                src="{{ $hoverImage }}"
                alt="{{ $product->name }}"
            >
        @endif
    </a>

    @if ($showActions)
        @include(EcommerceHelper::viewPath('includes.product.style-1.actions'), [
            'product' => $product,
            'showQuickView' => $showQuickView,
            'showQuickShop' => $showQuickShop,
        ])
    @endif

    @if ($showBadges)
        @include(EcommerceHelper::viewPath('includes.product.badges'), ['product' => $product])
    @endif

    @if ($showMarquee && $isOnSale && $salePercent > 0)
        <div class="product-marquee_sale">
            <div class="marquee-wrapper">
                <div class="initial-child-container">
                    @for ($m = 1; $m <= 5; $m++)
                        <div class="marquee-child-item">{{ __('HOT SALE :percent% OFF', ['percent' => $salePercent]) }}</div>
                        <i class="icon icon-Star2"></i>
                    @endfor
                </div>
            </div>
        </div>
    @endif

    @if ($showQuickShop && EcommerceHelper::isCartEnabled())
        @php($hasVariationsForQuickAdd = (bool) $product->hasVariations)
        <div class="product-action_bot">
            <a
                href="#"
                class="tf-btn btn-white small w-100"
                @if ($hasVariationsForQuickAdd)
                    data-bb-toggle="quick-shop"
                    data-url="{{ route('public.ajax.quick-shop', $product->slug) }}"
                    {!! BaseHelper::clean(\Botble\Ecommerce\Facades\EcommerceHelper::jsAttributes('quick-shop', $product)) !!}
                @else
                    data-bb-toggle="add-to-cart"
                    data-url="{{ route('public.cart.add-to-cart') }}"
                    data-id="{{ $product->original_product->id }}"
                    {!! BaseHelper::clean(\Botble\Ecommerce\Facades\EcommerceHelper::jsAttributes('add-to-cart', $product)) !!}
                @endif
            >
                {{ $hasVariationsForQuickAdd ? __('Select options') : __('Add to cart') }}
            </a>
        </div>
    @endif
</div>

<div class="card-product_info {{ $cardExtraClass ?? '' }}">
    @include(Theme::getThemeNamespace('views.ecommerce.includes.product.store-name'), ['product' => $product])
    <a href="{{ $product->url }}" class="name-product lh-24 fw-medium link-underline-text text-line-clamp-2 {{ $nameExtraClass ?? '' }}">
        {{ $product->name }}
    </a>

    @include(EcommerceHelper::viewPath('includes.product.style-1.rating'), ['product' => $product])
    @include(EcommerceHelper::viewPath('includes.product.style-1.price'), ['product' => $product])

    @if ((bool) theme_option('product_card_show_color_swatches', false))
        @include(Theme::getThemeNamespace('views.ecommerce.includes.product.color-swatches'), ['product' => $product])
    @endif
</div>
