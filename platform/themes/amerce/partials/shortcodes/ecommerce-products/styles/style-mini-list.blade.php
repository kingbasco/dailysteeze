@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    /**
     * Mini-list slider used by home-mental "Featured Products". Each slide
     * is a vertical column of compact horizontal product cards. Mirrors
     * html/home-mental.html lines 3144-3418 (`card-product product-style_mini_list`).
     *
     * Number of products per column comes from `items_per_row` (default 3),
     * number of visible slides from `slides_per_view` (default 3).
     */
    $sliderId = 'ecommerce-products-mini-list-' . uniqid();
    $perColumn = max(1, min(6, (int) ($shortcode->items_per_row ?: 3)));
    $perView = max(1, min(6, (int) ($shortcode->slides_per_view ?: 3)));

    $showBanners = ($shortcode->show_banners ?? 'no') === 'yes';
    if ($showBanners) {
        // For home-mental, we want 3 slides total:
        // Slide 1: products chunk 1 (perColumn items)
        // Slide 2: banners
        // Slide 3: products chunk 2 (perColumn items)
        $columns = collect($products)->chunk($perColumn)->take(2);
    } else {
        $columns = collect($products)->chunk($perColumn);
    }

    $banner1 = [
        'image' => $shortcode->banner_image_1 ?? null,
        'title' => $shortcode->banner_title_1 ?? '',
        'desc'  => $shortcode->banner_desc_1 ?? '',
        'url'   => $shortcode->banner_url_1 ?? '/products',
    ];
    $banner2 = [
        'image' => $shortcode->banner_image_2 ?? null,
        'title' => $shortcode->banner_title_2 ?? '',
        'desc'  => $shortcode->banner_desc_2 ?? '',
        'url'   => $shortcode->banner_url_2 ?? '/products',
    ];
@endphp

<div dir="ltr"
     id="{{ $sliderId }}"
     class="swiper tf-swiper"
     data-preview="{{ $perView }}"
     data-tablet="2" data-mobile-sm="2" data-mobile="2"
     data-space-lg="30" data-space-md="20" data-space="10"
     data-pagination="1" data-pagination-sm="1" data-pagination-md="2" data-pagination-lg="{{ $perView }}">
    <div class="swiper-wrapper">
        @foreach ($columns as $index => $columnProducts)
            @if ($showBanners && $index === 1)
                {{-- Inject Slide 2 with Banners --}}
                <div class="swiper-slide d-none d-xl-block">
                    <div class="tf-list vertical gap-16">
                        @foreach ([$banner1, $banner2] as $b)
                            <div class="box-image_v02 hover-img wow fadeInUp">
                                <a href="{{ $b['url'] }}" class="box-image_img img-style">
                                    {!! RvMedia::image($b['image'], $b['title'], 'medium', false, ['width' => 450, 'height' => 294, 'loading' => 'lazy']) !!}
                                </a>
                                <div class="box-image_content">
                                    @if ($b['title'])
                                        <a href="{{ $b['url'] }}" class="title h4 fw-medium link">
                                            {!! BaseHelper::clean($b['title']) !!}
                                        </a>
                                    @endif
                                    @if ($b['desc'])
                                        <p class="desc">
                                            {!! BaseHelper::clean($b['desc']) !!}
                                        </p>
                                    @endif
                                    <a href="{{ $b['url'] }}" class="btn-action tf-btn-icon link">
                                        <span class="text-caption-01 fw-semibold">
                                            {{ __('View More') }}
                                        </span>
                                        <i class="icon icon-ArrowRight fs-20"></i>
                                    </a>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            @endif

            <div class="swiper-slide">
                <div class="tf-list vertical gap-16">
                    @foreach ($columnProducts as $product)
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
        @endforeach
    </div>
    <div class="sw-line-default style-2 tf-sw-pagination"></div>
</div>
