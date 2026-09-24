{{-- Mirrors html/home-pet-care.html §4 (lines 2031-2230): `tf-lookbook-hover
     lookbook-hover-v1` wrapper with hotspotted banner LEFT and a 2-card
     swiper of FULL product cards RIGHT (under the section heading). --}}
@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    $hotspots = $hotspots ?? collect();
    $showQuickView = (bool) theme_option('product_show_quick_view', true);
    $showQuickShop = (bool) theme_option('product_show_quick_shop', true);
@endphp

<div class="container-full">
    <div class="tf-lookbook-hover lookbook-hover-v1">
        <div class="col-left">
            <div class="banner-lookbook wrap-lookbook_hover position-relative">
                {{-- Use the original image (1770x1440 source); the theme's `medium`
                     size crops to 800x800 square which loses the wider aspect the
                     demo banner relies on (html line 2038 → original asset). --}}
                {!! RvMedia::image($shortcode->image ?? null, '', false, false, ['class' => 'img-banner w-100', 'loading' => 'lazy']) !!}

                @foreach ($hotspots as $i => $h)
                    @php $product = $h['product']; @endphp
                    <div class="lookbook-item position-absolute" style="left: {{ $h['x'] }}%; top: {{ $h['y'] }}%;">
                        <div class="dropdown dropup-center dropdown-custom dropend">
                            <button type="button" class="tf-pin-btn bundle-pin-item swiper-button"
                                data-slide="{{ $i }}" data-bs-toggle="dropdown" aria-expanded="false"
                                aria-label="{{ __('View product :name', ['name' => $product->name]) }}">
                                <span></span>
                            </button>
                            <div class="dropdown-menu">
                                <div class="lookbook-product">
                                    <a href="{{ $product->url ?: '#' }}" class="image">
                                        {!! RvMedia::image($product->image ?? null, $product->name, 'thumb', false, ['width' => 88, 'height' => 88]) !!}
                                    </a>
                                    <div class="content">
                                        <a href="{{ $product->url ?: '#' }}" class="name-prd link text-body-1 text-line-clamp-2">
                                            {!! BaseHelper::clean($product->name) !!}
                                        </a>
                                        <div class="price-wrap">
                                            <span class="price-new">{!! format_price($product->front_sale_price_with_taxes ?? $product->price) !!}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>

        <div class="col-right">
            <div class="bundle-hover-wrap">
                @if (! empty($shortcode->title ?? '') || ! empty($shortcode->subtitle ?? ''))
                    <div class="sect-heading type-2 text-center wow fadeInUp">
                        @if (! empty($shortcode->title ?? ''))
                            <h2 class="s-title text-white">{!! BaseHelper::clean($shortcode->title) !!}</h2>
                        @endif
                        @if (! empty($shortcode->subtitle ?? ''))
                            <p class="s-desc text-body-1 cl-text-3">{!! BaseHelper::clean($shortcode->subtitle) !!}</p>
                        @endif
                    </div>
                @endif
                <div dir="ltr" class="swiper tf-swiper swiper-lookbook"
                    data-preview="2" data-tablet="2" data-mobile-sm="2" data-mobile="2"
                    data-space-lg="30" data-space-md="20" data-space="10">
                    <div class="swiper-wrapper">
                        @foreach ($hotspots as $i => $h)
                            @php $product = $h['product']; @endphp
                            <div class="swiper-slide bundle-hover-item pin{{ $i + 1 }}">
                                {{-- Demo cards (html lines 2108-2163) are stripped of actions,
                                     badges, marquee, and quick-shop — only image + info. --}}
                                @include(Theme::getThemeNamespace('views.ecommerce.includes.product.style-1.grid'), [
                                    'product'             => $product,
                                    'showActions'         => false,
                                    'showBadges'          => false,
                                    'showMarquee'         => false,
                                    'showQuickShop'       => false,
                                    'showQuickView'       => false,
                                    'productWrapperClass' => 'square',
                                    'cardExtraClass'      => 'text-center align-items-center',
                                    'nameExtraClass'      => 'text-white',
                                ])
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
