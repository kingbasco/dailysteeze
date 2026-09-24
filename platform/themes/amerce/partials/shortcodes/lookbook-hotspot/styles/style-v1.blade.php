<div class="container">
    <div class="banner-lookbook wrap-lookbook_hover position-relative">
        <div class="img-banner-wrap">
            {!! RvMedia::image($shortcode->image ?? null, '', 'hero-banner', false, ['class' => 'img-banner w-100', 'loading' => 'lazy']) !!}
        </div>

        @foreach ($hotspots as $h)
            @php $product = $h['product']; @endphp
            <div class="lookbook-item position-absolute" style="left: {{ $h['x'] }}%; top: {{ $h['y'] }}%;">
                <div class="dropdown dropup-center dropdown-custom">
                    <button type="button" class="tf-pin-btn bundle-pin-item swiper-button"
                        data-bs-toggle="dropdown" aria-expanded="false"
                        aria-label="{{ __('View product :name', ['name' => $product->name]) }}">
                        <span></span>
                    </button>
                    <div class="dropdown-menu">
                        <div class="lookbook-product">
                            <a href="{{ $product->url ?: '#' }}" class="image">
                                {!! RvMedia::image($product->image ?? null, $product->name, 'thumb', false, ['width' => 88, 'height' => 88]) !!}
                            </a>
                            <div class="content">
                                <a href="{{ $product->url ?: '#' }}"
                                    class="name-prd text-body-1 fw-medium link-underline-primary text-line-clamp-2">
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
                </div>
            </div>
        @endforeach
    </div>
</div>
