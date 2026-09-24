<div class="container">
    <div class="banner-product-single style-3 section-image-zoom">
        <div class="row align-items-center gy-30">
            <div class="col-lg-7">
                <div class="banner-image-zoom-wrap position-relative radius-10 overflow-hidden">
                    {!! RvMedia::image($shortcode->image ?? null, $shortcode->heading ?? '', 'hero-banner', false, ['class' => 'w-100 image-zoom', 'loading' => 'lazy']) !!}
                    @foreach ($hotspots as $h)
                        <div class="hotspot-pin position-absolute" style="left: {{ $h['x'] }}%; top: {{ $h['y'] }}%;">
                            <div role="button" class="tf-pin-btn" tabindex="0" aria-label="{{ $h['label'] }}">
                                <span></span>
                            </div>
                            @if (! empty($h['label']))
                                <span class="hotspot-label badge bg-dark text-light-fg ms-10">{!! BaseHelper::clean($h['label']) !!}</span>
                            @endif
                        </div>
                    @endforeach
                </div>
            </div>
            <div class="col-lg-5">
                <div class="content">
                    @if (! empty($shortcode->subheading ?? ''))
                        <p class="sub-text text-body-1 cl-text-2 mb-15">{!! BaseHelper::clean($shortcode->subheading) !!}</p>
                    @endif
                    @if (! empty($shortcode->heading ?? ''))
                        <h2 class="heading fw-medium">{!! BaseHelper::clean($shortcode->heading) !!}</h2>
                    @endif

                    @if ($product)
                        <div class="product-mini mt-20 d-flex align-items-center gap-15">
                            <a href="{{ $product->url ?: '#' }}" class="d-block">
                                {!! RvMedia::image($product->image ?? null, $product->name, 'thumb', false, ['width' => 80, 'height' => 80]) !!}
                            </a>
                            <div>
                                <a href="{{ $product->url ?: '#' }}" class="name fw-medium d-block">{!! BaseHelper::clean($product->name) !!}</a>
                                <span class="price-new text-primary fw-semibold">{!! format_price($product->front_sale_price_with_taxes ?? $product->price) !!}</span>
                            </div>
                        </div>
                        <a href="{{ $product->url ?: '#' }}" class="tf-btn btn-fill animate-hover-btn radius-3 mt-20">
                            <span>{{ __('Shop the look') }}</span>
                        </a>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>
