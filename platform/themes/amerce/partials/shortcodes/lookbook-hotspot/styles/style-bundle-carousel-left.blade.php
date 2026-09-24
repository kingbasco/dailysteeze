@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    /**
     * Mirrors html/home-cosmetic.html `section-lookbook-hover` (line 1858):
     * - LEFT col-lg-6: heading + 2-up product carousel (one slide per hotspot) + CTA
     * - RIGHT col-lg-6: banner image with one pin overlay positioned via first hotspot
     *
     * Demo uses `flex-wrap-reverse` so on mobile the banner stacks above the carousel.
     */
    $bannerImage = $shortcode->image ?? null;
    $items       = array_values($hotspots);
    $title       = trim((string) ($shortcode->title ?? ''));
    $subtitle    = trim((string) ($shortcode->subtitle ?? ''));
    $btnText     = trim((string) ($shortcode->button_text ?? ''));
    $btnUrl      = trim((string) ($shortcode->button_url ?? ''));
    $pinX        = isset($items[0]) ? $items[0]['x'] : 50;
    $pinY        = isset($items[0]) ? $items[0]['y'] : 50;
@endphp

<div class="container">
    <div class="row gy-4 flex-wrap-reverse">
        <div class="col-lg-6">
            <div class="col-left">
                @if ($title !== '' || $subtitle !== '')
                    <div class="mb-32 wow fadeInUp">
                        @if ($title !== '')
                            <h3 class="mb-12">{!! BaseHelper::clean($title) !!}</h3>
                        @endif
                        @if ($subtitle !== '')
                            <p class="cl-text-2">{!! BaseHelper::clean($subtitle) !!}</p>
                        @endif
                    </div>
                @endif

                @if (! empty($items))
                    <div class="bundle-hover-wrap mb-32 lg-mx-auto">
                        <div dir="ltr" class="swiper tf-swiper swiper-lookbook"
                             data-preview="2" data-tablet="2" data-mobile-sm="2" data-mobile="2"
                             data-space-lg="30" data-space-md="20" data-space="10">
                            <div class="swiper-wrapper">
                                @foreach ($items as $i => $h)
                                    @php
                                        $product   = $h['product'];
                                        $pinNumber = $i + 1;
                                    @endphp
                                    <div class="swiper-slide bundle-hover-item pin{{ $pinNumber }}">
                                        <div class="card-product wow fadeInUp">
                                            <div class="card-product_wrapper">
                                                <a href="{{ $product->url ?: '#' }}" class="product-img">
                                                    {!! RvMedia::image($product->image ?? null, $product->name, 'product-grid', false, ['class' => 'img-product', 'loading' => 'lazy', 'width' => 330, 'height' => 440]) !!}
                                                    {!! RvMedia::image($product->image ?? null, $product->name, 'product-grid', false, ['class' => 'img-hover', 'loading' => 'lazy', 'width' => 330, 'height' => 440]) !!}
                                                </a>
                                                <div class="product-action_bot">
                                                    <a href="{{ $product->url ?: '#' }}" class="tf-btn btn-white small w-100">
                                                        {{ __('Add to Cart') }}
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="card-product_info">
                                                <a href="{{ $product->url ?: '#' }}" class="name-product lh-24 fw-medium link-underline-text">
                                                    {!! BaseHelper::clean($product->name) !!}
                                                </a>
                                                <div class="price-wrap">
                                                    <span class="price-new text-primary fw-semibold">{!! format_price($product->front_sale_price_with_taxes ?? $product->price) !!}</span>
                                                    @if ($product->front_sale_price && $product->front_sale_price < $product->price)
                                                        <span class="price-old text-caption-01 cl-text-3">{!! format_price($product->price) !!}</span>
                                                    @endif
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                @endif

                @if ($btnText !== '')
                    <div class="wow fadeInUp">
                        <a href="{{ $btnUrl !== '' ? $btnUrl : '#' }}" class="tf-btn animate-btn gap-8">
                            {{ $btnText }}
                            <i class="icon icon-ArrowUpRight fs-24"></i>
                        </a>
                    </div>
                @endif
            </div>
        </div>
        <div class="col-lg-6">
            <div class="col-right banner-lookbook wrap-lookbook_hover">
                {!! RvMedia::image($bannerImage, '', 'medium', false, ['class' => 'img-banner', 'loading' => 'lazy', 'width' => 700, 'height' => 700]) !!}

                @if (! empty($items))
                    <div class="lookbook-item position1" style="left: {{ $pinX }}%; top: {{ $pinY }}%;">
                        <div class="dropdown dropup-center dropdown-custom dropend">
                            <div role="dialog" class="tf-pin-btn bundle-pin-item swiper-button"
                                 data-slide="0" id="pin1"
                                 data-bs-toggle="dropdown" aria-expanded="false"
                                 aria-label="{{ __('View bundle') }}">
                                <span></span>
                            </div>
                        </div>
                    </div>
                @endif
            </div>
        </div>
    </div>
</div>
