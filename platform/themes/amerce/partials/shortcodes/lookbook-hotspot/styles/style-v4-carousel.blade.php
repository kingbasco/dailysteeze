@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    /**
     * Mirrors html/home-fashion.html `section-lookbook-hover-v02` (line 2453-2627):
     * LEFT — swipeable bundle-hover-item product carousel (one slide per hotspot)
     * RIGHT — banner image with numbered pin buttons that drive the carousel via
     *         `data-slide` on swiper-button class (handled by theme JS that's already
     *         shipped with the lookbook-hotspot family).
     *
     * Each hotspot drives BOTH a carousel slide AND a pinned dot, indexed by loop order.
     */
    $bannerImage = $shortcode->image ?? null;
    $items = array_values($hotspots);
@endphp

<div class="section-lookbook-hover-v02">
    <div class="wrap">
        <div class="box-left">
            <div class="bundle-hover-wrap lg-mx-auto">
                <div dir="ltr" class="swiper tf-swiper swiper-lookbook"
                     data-preview="1" data-tablet="1" data-mobile-sm="1" data-mobile="1"
                     data-space-lg="30" data-space-md="20" data-space="10">
                    <div class="swiper-wrapper">
                        @foreach ($items as $i => $h)
                            @php
                                $product = $h['product'];
                                $pinNumber = $i + 1;
                            @endphp
                            <div class="swiper-slide">
                                <div class="card-product bundle-hover-item pin{{ $pinNumber }} wow fadeInUp">
                                    <div class="card-product_wrapper">
                                        <a href="{{ $product->url ?: '#' }}" class="product-img">
                                            {!! RvMedia::image($product->image ?? null, $product->name, 'product-grid', false, ['class' => 'img-product', 'loading' => 'lazy', 'width' => 475, 'height' => 383]) !!}
                                            {!! RvMedia::image($product->image ?? null, $product->name, 'product-grid', false, ['class' => 'img-hover', 'loading' => 'lazy', 'width' => 475, 'height' => 383]) !!}
                                        </a>
                                    </div>
                                    <div class="card-product_info align-items-center gap-0 text-center">
                                        @php
                                            // Overline = explicit hotspot field (preferred for storytelling
                                            // sections where the label isn't a real category) → product's
                                            // first category name fallback.
                                            $overline = $h['overline'] ?? '';
                                            if ($overline === '') {
                                                $overline = optional($product->categories?->first())->name ?: '';
                                            }
                                        @endphp
                                        @if ($overline !== '')
                                            <p class="text-label fw-semibold cl-text-3 mb-8">{{ $overline }}</p>
                                        @endif
                                        <a href="{{ $product->url ?: '#' }}" class="h2 name-product fw-medium link link-underline mb-12">
                                            {!! BaseHelper::clean($product->name) !!}
                                        </a>
                                        @if (! empty($product->description))
                                            <p class="cl-text-2 mb-24">{{ \Illuminate\Support\Str::limit(strip_tags((string) $product->description), 80) }}</p>
                                        @endif
                                        <a href="{{ $product->url ?: '#' }}" class="tf-btn animate-btn">
                                            {{ __('Order Now') }}
                                        </a>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>

                    <div class="tf-sw-nav-2 nav-prev-swiper" aria-label="{{ __('Previous') }}">
                        <i class="icon icon-ArrowLeft"></i>
                    </div>
                    <div class="tf-sw-nav-2 nav-next-swiper" aria-label="{{ __('Next') }}">
                        <i class="icon icon-ArrowRight"></i>
                    </div>
                </div>
            </div>
        </div>

        <div class="box-right banner-lookbook wrap-lookbook_hover">
            <div>
                {!! RvMedia::image($bannerImage, '', 'hero-banner', false, ['class' => 'img-banner', 'loading' => 'lazy', 'width' => 960, 'height' => 801]) !!}

                @foreach ($items as $i => $h)
                    @php
                        $product = $h['product'];
                        $pinNumber = $i + 1;
                    @endphp
                    <div class="lookbook-item position{{ $pinNumber }}" style="left: {{ $h['x'] }}%; top: {{ $h['y'] }}%;">
                        <div class="dropdown dropup-center dropdown-custom dropstart">
                            <div role="dialog" class="tf-pin-btn number bundle-pin-item swiper-button"
                                 data-slide="{{ $i }}" id="pin{{ $pinNumber }}"
                                 data-bs-toggle="dropdown" aria-expanded="false"
                                 aria-label="{{ __('View product :name', ['name' => $product->name]) }}">
                                {{ $pinNumber }}
                            </div>
                            <div class="dropdown-menu">
                                <div class="lookbook-product">
                                    <a href="{{ $product->url ?: '#' }}" class="image">
                                        {!! RvMedia::image($product->image ?? null, $product->name, 'thumb', false, ['width' => 88, 'height' => 88]) !!}
                                    </a>
                                    <div class="content">
                                        <a href="{{ $product->url ?: '#' }}" class="name-prd link fw-medium lh-24 text-line-clamp-2">
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
    </div>
</div>
