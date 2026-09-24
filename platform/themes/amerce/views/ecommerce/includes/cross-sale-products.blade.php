{{--
    Theme override of plugins/ecommerce::themes.includes.cross-sale-products.
    The plugin ships a Slick-based carousel, but Slick isn't bundled in this
    theme — leaving the cross-sale "Frequently Bought Together" block as a
    static row with overflow:hidden, no arrows, no mobile scroll.
    This override swaps to the theme's existing Swiper infrastructure
    (.tf-swiper auto-init via amerceInitSwipers) which is already loaded
    via assets/js/carousel.js, then re-initialises Swiper after the AJAX
    replaceWith() since the plugin's initSlickCarousel() can't.
    Keeps the plugin's class names (.ec-cross-sale-*) so the rebrand SCSS
    in _ecommerce-upsale-crosssale.scss continues to win specificity.
--}}
@php
    use Botble\Ecommerce\Facades\EcommerceHelper;
    use Botble\Media\Facades\RvMedia;
@endphp

@if(request()->ajax() && isset($products) && isset($parentProduct))
    @if($products->isNotEmpty())
        <section class="ec-cross-sale-section">
            <div class="container">
                <div class="ec-cross-sale-wrapper">
                    <div class="ec-cross-sale-header">
                        <div class="ec-cross-sale-icon">
                            <i class="icon icon-shopping-cart-simple"></i>
                        </div>
                        <div class="ec-cross-sale-title">
                            <h4>{{ __('Frequently Bought Together') }}</h4>
                            <p>{{ __('Customers who viewed this item also bought') }}</p>
                        </div>
                    </div>

                    <div class="ec-cross-sale-slider box-swiper position-relative">
                        <div
                            dir="ltr"
                            class="swiper tf-swiper ec-cross-sale-swiper"
                            data-preview="5"
                            data-tablet="3"
                            data-mobile-sm="2"
                            data-mobile="1.5"
                            data-space="16"
                            data-space-md="16"
                            data-space-lg="16"
                        >
                            <div class="swiper-wrapper">
                                @foreach ($products as $index => $product)
                                    @php
                                        $productPrice = $product->price();
                                        $salePrice = $productPrice->getPrice();
                                        $originalPrice = $productPrice->getPriceOriginal();
                                        $hasDiscount = $salePrice < $originalPrice;
                                        $shouldShowPrice =
                                            (! EcommerceHelper::hideProductPrice() || EcommerceHelper::isCartEnabled())
                                            && (! EcommerceHelper::hideProductPriceWhenZero() || $salePrice > 0);
                                        $hasVariations = $product->hasVariations;
                                    @endphp
                                    <div class="swiper-slide ec-cross-sale-slide">
                                        <div class="ec-cross-sale-card">
                                            @if($index > 0)
                                                <div class="ec-cross-sale-plus">
                                                    <i class="icon icon-plus"></i>
                                                </div>
                                            @endif
                                            <div class="ec-cross-sale-card-inner">
                                                <div class="ec-cross-sale-thumb">
                                                    <a href="{{ $product->url }}">
                                                        {{ RvMedia::image($product->image, $product->name, 'medium', true) }}
                                                    </a>
                                                </div>
                                                <div class="ec-cross-sale-content">
                                                    <h3 class="ec-cross-sale-name">
                                                        <a href="{{ $product->url }}" title="{{ $product->name }}">
                                                            {{ $product->name }}
                                                        </a>
                                                    </h3>
                                                    @if ($shouldShowPrice)
                                                        <div class="ec-cross-sale-price">
                                                            <span class="ec-cross-sale-price-current">{{ format_price($salePrice) }}</span>
                                                            @if($hasDiscount)
                                                                <span class="ec-cross-sale-price-old">{{ format_price($originalPrice) }}</span>
                                                            @endif
                                                        </div>
                                                    @endif
                                                    @if(EcommerceHelper::isCartEnabled())
                                                        <button
                                                            type="button"
                                                            @if($hasVariations)
                                                                data-bb-toggle="quick-shop"
                                                                data-url="{{ route('public.ajax.quick-shop', ['slug' => $product->slug, 'reference_product' => $parentProduct->slug]) }}"
                                                            @else
                                                                data-bb-toggle="add-to-cart"
                                                                data-show-toast-on-success="false"
                                                                data-url="{{ route('public.cart.add-to-cart') }}"
                                                                data-id="{{ $product->id }}"
                                                                {!! EcommerceHelper::jsAttributes('add-to-cart', $product) !!}
                                                            @endif
                                                            class="ec-cross-sale-add-btn {{ $hasVariations ? 'has-options' : '' }}"
                                                            @disabled($product->isOutOfStock())
                                                        >
                                                            <i class="icon icon-shopping-cart-simple"></i>
                                                            @if ($hasVariations)
                                                                {{ __('Select Options') }}
                                                            @else
                                                                {{ __('Add to Cart') }}
                                                            @endif
                                                        </button>
                                                    @endif
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                        <div class="ec-cross-sale-arrows">
                            {{-- Theme icomoon set has icon-CaretLeft but no icon-CaretRight
                                 (only CaretRightThin); ArrowLeft/ArrowRight are the only
                                 symmetric pair that's both available and tonally similar. --}}
                            <button type="button" class="nav-prev-swiper slick-arrow" aria-label="{{ __('Previous') }}">
                                <i class="icon icon-ArrowLeft"></i>
                            </button>
                            <button type="button" class="nav-next-swiper slick-arrow" aria-label="{{ __('Next') }}">
                                <i class="icon icon-ArrowRight"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        {{-- A MutationObserver in assets/js/carousel.js detects the AJAX-injected
             .ec-cross-sale-section and calls amerceInitSwipers() on its swiper —
             no inline <script> needed (Envato rule #4). --}}
    @endif
@elseif(isset($parentProduct))
    <div data-bb-toggle="block-lazy-loading" data-url="{{ route('public.ajax.cross-sale-products', $parentProduct) }}">
        <section class="ec-cross-sale-skeleton">
            <div class="container">
                <div class="ec-cross-sale-skeleton-wrapper">
                    <div class="ec-cross-sale-skeleton-header">
                        <div class="skeleton skeleton-icon"></div>
                        <div class="skeleton-title-group">
                            <div class="skeleton skeleton-title"></div>
                            <div class="skeleton skeleton-subtitle"></div>
                        </div>
                    </div>
                    <div class="ec-cross-sale-skeleton-slider">
                        @for ($i = 0; $i < 5; $i++)
                            <div class="ec-cross-sale-skeleton-card">
                                <div class="skeleton skeleton-thumb"></div>
                                <div class="skeleton-content">
                                    <div class="skeleton skeleton-name"></div>
                                    <div class="skeleton skeleton-price"></div>
                                    <div class="skeleton skeleton-btn"></div>
                                </div>
                            </div>
                        @endfor
                    </div>
                </div>
            </div>
        </section>
    </div>
@endif
