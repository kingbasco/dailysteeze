@php
    /**
     * Style-4 actions — flip card variant. Wired to Botble ecommerce JS via data-bb-toggle.
     */
    use Botble\Base\Facades\BaseHelper;
    use Botble\Ecommerce\Facades\EcommerceHelper;

    $showQuickView = $showQuickView ?? true;
    $showQuickShop = $showQuickShop ?? true;
    $hasVariations = (bool) $product->hasVariations;
@endphp

<ul class="product-action_list card-product__actions card-product-style-4__actions">
    @if (EcommerceHelper::isCartEnabled())
        <li class="action-add-to-cart">
            <a
                href="#"
                class="hover-tooltip tooltip-top box-icon"
                @if ($hasVariations)
                    data-bb-toggle="quick-shop"
                    data-url="{{ route('public.ajax.quick-shop', $product->slug) }}"
                    {!! BaseHelper::clean(EcommerceHelper::jsAttributes('quick-shop', $product)) !!}
                @else
                    data-bb-toggle="add-to-cart"
                    data-url="{{ route('public.cart.add-to-cart') }}"
                    data-id="{{ $product->original_product->id }}"
                    {!! BaseHelper::clean(EcommerceHelper::jsAttributes('add-to-cart', $product)) !!}
                @endif
                aria-label="{{ $hasVariations ? __('Select options') : __('Add to cart') }}"
            >
                <span class="icon icon-Handbag"></span>
                <span class="tooltip">{{ $hasVariations ? __('Select options') : __('Add to cart') }}</span>
            </a>
        </li>
    @endif

    @if (EcommerceHelper::isWishlistEnabled())
        @php($isInWishlist = \Botble\Ecommerce\Facades\Cart::instance("wishlist")->search(fn ($i) => (int) $i->id === (int) $product->original_product->id)->isNotEmpty())
        <li @class(['action-wishlist', 'wishlist', 'active' => $isInWishlist])>
            <a
                href="#"
                @class(['hover-tooltip tooltip-top box-icon', 'active' => $isInWishlist])
                data-bb-toggle="add-to-wishlist"
                data-url="{{ route('public.wishlist.add', $product->original_product->id) }}"
                data-add-text="{{ __('Add to wishlist') }}"
                data-remove-text="{{ __('Remove from wishlist') }}"
                aria-label="{{ $isInWishlist ? __('Remove from wishlist') : __('Add to wishlist') }}"
            >
                <span class="icon icon-heart"></span>
                <span class="tooltip">{{ $isInWishlist ? __('Remove from wishlist') : __('Add to wishlist') }}</span>
            </a>
        </li>
    @endif

    @if (EcommerceHelper::isCompareEnabled())
        @php($isInCompare = \Botble\Ecommerce\Facades\Cart::instance("compare")->search(fn ($i) => (int) $i->id === (int) $product->original_product->id)->isNotEmpty())
        <li @class(['action-compare', 'compare', 'active' => $isInCompare])>
            <a
                href="#"
                @class(['hover-tooltip tooltip-top box-icon', 'active' => $isInCompare])
                data-bb-toggle="add-to-compare"
                data-url="{{ route('public.compare.add', $product) }}"
                data-remove-url="{{ route('public.compare.remove', $product) }}"
                data-add-text="{{ __('Add to compare') }}"
                data-remove-text="{{ __('Remove from compare') }}"
                aria-label="{{ $isInCompare ? __('Remove from compare') : __('Compare') }}"
            >
                <span class="icon icon-ArrowsLeftRight"></span>
                <span class="tooltip">{{ $isInCompare ? __('Remove from compare') : __('Compare') }}</span>
            </a>
        </li>
    @endif

    @if ($showQuickView)
        <li class="action-quick-view">
            <a
                href="#"
                class="hover-tooltip tooltip-top box-icon"
                data-bs-toggle="modal"
                data-bs-target="#product-quick-view-modal"
                data-url="{{ route('public.ajax.quick-view', $product) }}"
                aria-label="{{ __('Quick view') }}"
            >
                <span class="icon icon-Eye"></span>
                <span class="tooltip">{{ __('Quick view') }}</span>
            </a>
        </li>
    @endif
    {{-- Quick-shop icon removed: bottom CTA swaps Add-to-cart / Select-options. --}}
</ul>
