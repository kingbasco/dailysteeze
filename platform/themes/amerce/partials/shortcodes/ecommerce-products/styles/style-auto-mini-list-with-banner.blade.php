@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    /**
     * Mini-list slider with center banner slide.
     * Mirrors html/home-auto.html lines 3550-3744
     */
    $sliderId = 'ecommerce-products-mini-list-banner-' . uniqid();
    $perView = max(1, min(6, (int) ($shortcode->slides_per_view ?: 3)));
    
    $bannerImage = (string) ($shortcode->banner_image ?? '');
    $bannerHead  = (string) ($shortcode->banner_heading ?? '');
    $bannerSub   = (string) ($shortcode->banner_subheading ?? '');
    $bannerBtn   = (string) ($shortcode->banner_button_text ?? __('Shop Now'));
    $bannerUrl   = (string) ($shortcode->banner_button_url ?? '#');
    // Banner layout variant. `style-6` = original home-auto (dark bg, white text, button).
    // `style-8` = pet-care variant (light bg, dark text with primary-color subtitle, countdown, no button).
    $bannerStyle = in_array(($shortcode->banner_style ?? ''), ['style-6', 'style-7', 'style-8'], true)
        ? $shortcode->banner_style
        : 'style-6';
    $isLightBanner = $bannerStyle === 'style-8';
    // Countdown seconds (e.g. 1093120 ≈ 12d). 0 disables.
    $bannerCountdown = (int) ($shortcode->banner_countdown_seconds ?? 0);
    $showBannerButton = ($shortcode->banner_show_button ?? 'yes') !== 'no';
    // Per-banner text colors. Defaults flip for light vs dark banner.
    $bannerSubClass   = trim((string) ($shortcode->banner_subtitle_class ?? '')) ?: ($isLightBanner ? 'text-primary fw-semibold' : 'text-white fw-semibold');
    $bannerTitleClass = trim((string) ($shortcode->banner_title_class ?? '')) ?: ($isLightBanner ? 'title h3 fw-medium link mb-24' : 'title h3 fw-medium text-white link mb-24');

    $list = collect($products);
    $leftCol = $list->slice(0, 3)->values();
    $rightCol = $list->slice(3, 3)->values();
@endphp

<div dir="ltr"
     id="{{ $sliderId }}"
     class="swiper tf-swiper"
     data-preview="{{ $perView }}"
     data-tablet="2" data-mobile-sm="2" data-mobile="2"
     data-space-lg="30" data-space-md="20" data-space="10"
     data-pagination="1" data-pagination-sm="1" data-pagination-md="2" data-pagination-lg="{{ $perView }}">
    <div class="swiper-wrapper">
        @if ($leftCol->isNotEmpty())
            <div class="swiper-slide">
                <div class="tf-list vertical gap-16">
                    @foreach ($leftCol as $product)
                        @php
                            $primaryImage = RvMedia::getImageUrl($product->image, 'thumb', false, RvMedia::getDefaultImage());
                            $hoverImage = $primaryImage;
                            if (! empty($product->images) && is_iterable($product->images)) {
                                foreach ($product->images as $img) {
                                    if ($img !== $product->image) {
                                        $hoverImage = RvMedia::getImageUrl($img, 'thumb', false, RvMedia::getDefaultImage());
                                        break;
                                    }
                                }
                            }
                            $isOnSale = $product->front_sale_price !== null
                                && $product->price > 0
                                && (float) $product->front_sale_price < (float) $product->price;
                        @endphp
                        <div class="card-product product-style_mini_list wow fadeInUp" data-product-id="{{ $product->id }}">
                            <div class="card-product_wrapper">
                                <a href="{{ $product->url }}" class="product-img" aria-label="{{ $product->name }}">
                                    <img class="img-product" loading="lazy" width="160" height="160"
                                         src="{{ $primaryImage }}" alt="{{ $product->name }}">
                                    <img class="img-hover" loading="lazy" width="160" height="160"
                                         src="{{ $hoverImage }}" alt="{{ $product->name }}">
                                </a>
                            </div>
                            <div class="card-product_info">
                                <a href="{{ $product->url }}" class="name-product lh-24 fw-medium link-underline-text">
                                    {{ $product->name }}
                                </a>
                                <div class="price-wrap">
                                    <span class="price-new text-primary fw-semibold">{{ format_price($product->front_sale_price ?? $product->price) }}</span>
                                    @if ($isOnSale)
                                        <span class="price-old text-caption-01 cl-text-3">{{ format_price($product->price) }}</span>
                                    @endif
                                </div>
                                @if (\Botble\Ecommerce\Facades\EcommerceHelper::isCartEnabled())
                                    <a href="#"
                                       class="btn-action"
                                       data-bb-toggle="add-to-cart"
                                       data-url="{{ route('public.cart.add-to-cart') }}"
                                       data-id="{{ $product->original_product->id }}"
                                       {!! BaseHelper::clean(\Botble\Ecommerce\Facades\EcommerceHelper::jsAttributes('add-to-cart', $product)) !!}>
                                        <i class="icon icon-Handbag"></i>
                                        <span class="text fw-semibold">{{ __('Add to cart') }}</span>
                                    </a>
                                @endif
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        @endif

        @if ($bannerImage !== '')
            <div class="swiper-slide d-none d-xl-block">
                <div class="banner-image-text type-abs {{ $bannerStyle }}">
                    <a href="{{ $bannerUrl ?: '#' }}" class="bn-image img-style">
                        {!! RvMedia::image($bannerImage, $bannerHead, 'medium', false, ['width' => 450, 'height' => 608, 'loading' => 'lazy']) !!}
                    </a>
                    <div class="bn-content {{ $isLightBanner ? 'align-items-center' : 'text-center align-items-center' }} wow fadeInUp">
                        @if ($bannerSub !== '')
                            <p class="desc {{ $bannerSubClass }}">
                                {!! nl2br(BaseHelper::clean($bannerSub)) !!}
                            </p>
                        @endif
                        @if ($bannerHead !== '')
                            <a href="{{ $bannerUrl ?: '#' }}" class="{{ $bannerTitleClass }}">
                                {!! nl2br(BaseHelper::clean($bannerHead)) !!}
                            </a>
                        @endif
                        @if ($bannerCountdown > 0)
                            <div class="countdown-v01 style-2">
                                <div class="js-countdown cd-has-zero cd-custom" data-timer="{{ $bannerCountdown }}"
                                     data-labels="{{ __('Days') }},{{ __('Hours') }},{{ __('Mins') }},{{ __('Secs') }}">
                                </div>
                            </div>
                        @endif
                        @if ($showBannerButton)
                            <a href="{{ $bannerUrl ?: '#' }}" class="btn-action tf-btn btn-white hv-primary">
                                {!! BaseHelper::clean($bannerBtn) !!}
                            </a>
                        @endif
                    </div>
                </div>
            </div>
        @endif

        @if ($rightCol->isNotEmpty())
            <div class="swiper-slide">
                <div class="tf-list vertical gap-16">
                    @foreach ($rightCol as $product)
                        @php
                            $primaryImage = RvMedia::getImageUrl($product->image, 'thumb', false, RvMedia::getDefaultImage());
                            $hoverImage = $primaryImage;
                            if (! empty($product->images) && is_iterable($product->images)) {
                                foreach ($product->images as $img) {
                                    if ($img !== $product->image) {
                                        $hoverImage = RvMedia::getImageUrl($img, 'thumb', false, RvMedia::getDefaultImage());
                                        break;
                                    }
                                }
                            }
                            $isOnSale = $product->front_sale_price !== null
                                && $product->price > 0
                                && (float) $product->front_sale_price < (float) $product->price;
                        @endphp
                        <div class="card-product product-style_mini_list wow fadeInUp" data-product-id="{{ $product->id }}">
                            <div class="card-product_wrapper">
                                <a href="{{ $product->url }}" class="product-img" aria-label="{{ $product->name }}">
                                    <img class="img-product" loading="lazy" width="160" height="160"
                                         src="{{ $primaryImage }}" alt="{{ $product->name }}">
                                    <img class="img-hover" loading="lazy" width="160" height="160"
                                         src="{{ $hoverImage }}" alt="{{ $product->name }}">
                                </a>
                            </div>
                            <div class="card-product_info">
                                <a href="{{ $product->url }}" class="name-product lh-24 fw-medium link-underline-text">
                                    {{ $product->name }}
                                </a>
                                <div class="price-wrap">
                                    <span class="price-new text-primary fw-semibold">{{ format_price($product->front_sale_price ?? $product->price) }}</span>
                                    @if ($isOnSale)
                                        <span class="price-old text-caption-01 cl-text-3">{{ format_price($product->price) }}</span>
                                    @endif
                                </div>
                                @if (\Botble\Ecommerce\Facades\EcommerceHelper::isCartEnabled())
                                    <a href="#"
                                       class="btn-action"
                                       data-bb-toggle="add-to-cart"
                                       data-url="{{ route('public.cart.add-to-cart') }}"
                                       data-id="{{ $product->original_product->id }}"
                                       {!! BaseHelper::clean(\Botble\Ecommerce\Facades\EcommerceHelper::jsAttributes('add-to-cart', $product)) !!}>
                                        <i class="icon icon-Handbag"></i>
                                        <span class="text fw-semibold">{{ __('Add to cart') }}</span>
                                    </a>
                                @endif
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        @endif
    </div>
    <div class="sw-line-default style-2 tf-sw-pagination"></div>
</div>
