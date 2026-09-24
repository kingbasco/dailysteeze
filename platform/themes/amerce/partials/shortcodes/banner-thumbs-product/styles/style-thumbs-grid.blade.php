@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    /**
     * Mirrors html/home-electronics.html "Product Thumbs" section (lines 3552-3715):
     * LEFT col with heading + subtitle + 4 lifestyle thumb buttons + CTA;
     * RIGHT col with a swiper of 4 wg-thumb-v1 slides, each carrying a lifestyle
     * image and an overlay product card (image + name + prices + add-to-cart icon).
     *
     * Per-slide thumb image is read from `thumb_1..4` shortcode attrs; falls back
     * to the matching product's image. `button_text` + `button_url` configure the
     * left-column CTA. Up to 4 products are paired with their thumbs in order.
     */
    $items = [];
    foreach ($products->take(4) as $i => $product) {
        $idx = $i + 1;
        $thumb = trim((string) ($shortcode->{"thumb_$idx"} ?? '')) ?: $product->image;
        $items[] = [
            'thumb' => $thumb,
            'product' => $product,
        ];
    }

    $buttonText = trim((string) ($shortcode->button_text ?? '')) ?: __('View All Products');
    $buttonUrl  = trim((string) ($shortcode->button_url ?? '')) ?: '#';
@endphp

@if (! empty($items))
    {{-- .banner-thumbs-product.slider-thumb-wrap layout (split thumbs LEFT,
         lifestyle swiper RIGHT) lives in assets/sass/component/_inline-migrated.scss. --}}
    <section {!! $shortcode->htmlAttributes() !!} class="tf-section banner-thumbs-product-grid">
        <div class="container">
            <div class="banner-thumbs-product slider-thumb-wrap">
                <div class="col-left text-center flat-spacing">
                    <div class="sect-heading type-2 wow fadeInUp">
                        @if (! empty($shortcode->heading ?? ''))
                            <h3 class="s-title">{!! BaseHelper::clean($shortcode->heading) !!}</h3>
                        @endif
                        @if (! empty($shortcode->subheading ?? ''))
                            <p class="s-desc text-body-1 cl-text-2 mt-15">{!! BaseHelper::clean($shortcode->subheading) !!}</p>
                        @endif
                    </div>
                    <div class="img-list wow fadeInUp">
                        @foreach ($items as $i => $item)
                            <div class="img_item btn-thumbs @if ($i === 0) active @endif" data-slide="{{ $i }}">
                                {!! RvMedia::image($item['thumb'], '', 'thumb', false, ['width' => 120, 'height' => 120, 'loading' => 'lazy']) !!}
                            </div>
                        @endforeach
                    </div>
                    <div class="wow fadeInUp">
                        <a href="{{ $buttonUrl }}" class="tf-btn animate-btn">
                            {!! BaseHelper::clean($buttonText) !!}
                        </a>
                    </div>
                </div>
                <div class="col-right">
                    <div dir="ltr" class="swiper slider-content-thumb swiper-tesimonial">
                        <div class="swiper-wrapper">
                            @foreach ($items as $item)
                                @php
                                    $product = $item['product'];
                                    $hasSale = ! empty($product->sale_price) && $product->sale_price < $product->price;
                                @endphp
                                <div class="swiper-slide">
                                    <div class="wg-thumb-v1">
                                        <div class="thumb-image">
                                            {!! RvMedia::image($item['thumb'], $product->name, '', false, ['width' => 705, 'height' => 546, 'loading' => 'lazy']) !!}
                                        </div>
                                        <div class="thumb-prd">
                                            <div class="prd_image">
                                                {!! RvMedia::image($product->image, $product->name, 'thumb', false, ['width' => 88, 'height' => 88, 'loading' => 'lazy']) !!}
                                            </div>
                                            <div class="prd_info">
                                                <a href="{{ $product->url ?: '#' }}" class="name fw-medium link lh-24 text-line-clamp-2">
                                                    {{ $product->name }}
                                                </a>
                                                <div class="price-wrap">
                                                    <span class="price-new text-primary fw-semibold">
                                                        {!! format_price($product->front_sale_price_with_taxes ?? $product->sale_price ?? $product->price) !!}
                                                    </span>
                                                    @if ($hasSale)
                                                        <span class="price-old text-caption-01 cl-text-3 text-decoration-line-through">
                                                            {!! format_price($product->price) !!}
                                                        </span>
                                                    @endif
                                                </div>
                                            </div>
                                            <a href="{{ $product->url ?: '#' }}" class="btn-action hover-tooltip">
                                                <span class="tooltip">{{ __('Add to cart') }}</span>
                                                <i class="icon icon-Handbag"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endif
