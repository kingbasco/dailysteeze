@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    /**
     * Mirrors html/home-fashion-2.html "Product Thumbs" section (lines 3803-3953).
     *
     * theme.css already ships full `.section-thumbs-v2` styling for the demo's exact
     * markup hierarchy:
     *   <section class="section-thumbs-v2 tf-sw-thumbs">
     *     <div class="col-right"><div class="swiper sw-thumb">         <-- big square images
     *       <div class="swiper-slide"><div class="sw-image"><img/>
     *     <div class="col-left">
     *       <div class="sect-heading type-2">                            <-- heading + subhead
     *       <div class="swiper sw-main-thumb">                           <-- per-product card
     *         <div class="swiper-slide"><div class="thumbs-prd">
     *           <div class="prd-image"><img/>                            <-- big centered image
     *           <div class="prd-mini">                                   <-- white overlay card
     *             <div class="mini-image"><img/>                         <-- 88px thumb
     *             <div class="mini-infor">name + price-wrap
     *             <div class="mini-action"><a class="btn-action">
     *       <div class="tes_thumb">prev/next nav
     *
     * Both swipers are auto-initialized by `assets/js/carousel.js` lines 160-191
     * (the `.tf-sw-thumbs && .sw-thumb && .sw-main-thumb` block). They become
     * controller-paired so swiping one syncs the other.
     *
     * `square_image_1..3` overrides the per-slide square hero image; falls back to the
     * matching product's main image. Up to 3 products supported.
     */
    $items = [];
    foreach ($products->take(3) as $i => $product) {
        $idx = $i + 1;
        $square = trim((string) ($shortcode->{"square_image_$idx"} ?? '')) ?: $product->image;
        $items[] = [
            'product' => $product,
            'square'  => $square,
        ];
    }

    $heading    = trim((string) ($shortcode->heading ?? ''));
    $subheading = trim((string) ($shortcode->subheading ?? ''));
@endphp

@if (! empty($items))
    {{-- .section-thumbs-v2 { position: relative } anchor rule lives in
         assets/sass/component/_inline-migrated.scss. --}}
    <section class="section-thumbs-v2 tf-sw-thumbs">
        <div class="col-right">
            <div dir="ltr" class="swiper sw-thumb" data-effect="fade">
                <div class="swiper-wrapper">
                    @foreach ($items as $item)
                        <div class="swiper-slide">
                            <div class="sw-image">
                                {!! RvMedia::image($item['square'], $item['product']->name, '', false, ['width' => 960, 'height' => 960, 'loading' => 'lazy']) !!}
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>

        <div class="col-left">
            @if ($heading !== '' || $subheading !== '')
                <div class="sect-heading type-2 wow fadeInUp">
                    @if ($heading !== '')
                        <h3 class="s-title">{!! BaseHelper::clean($heading) !!}</h3>
                    @endif
                    @if ($subheading !== '')
                        <p class="cl-text-2">{!! BaseHelper::clean($subheading) !!}</p>
                    @endif
                </div>
            @endif

            <div dir="ltr" class="swiper sw-main-thumb">
                <div class="swiper-wrapper">
                    @foreach ($items as $i => $item)
                        @php
                            $product = $item['product'];
                            $hasSale = ! empty($product->sale_price) && $product->sale_price < $product->price;
                        @endphp
                        <div class="swiper-slide">
                            <div class="thumbs-prd{{ $i === 0 ? ' wow fadeInUp' : '' }}">
                                <div class="prd-image">
                                    {!! RvMedia::image($product->image, $product->name, 'medium', false, ['width' => 330, 'height' => 440, 'loading' => 'lazy']) !!}
                                </div>
                                <div class="prd-mini">
                                    <div class="mini-image">
                                        {!! RvMedia::image($product->image, $product->name, 'thumb', false, ['width' => 88, 'height' => 100, 'loading' => 'lazy']) !!}
                                    </div>
                                    <div class="mini-infor">
                                        <a href="{{ $product->url ?: '#' }}"
                                           class="info_name text-body-1 fw-medium link-underline-primary text-line-clamp-2">
                                            {{ $product->name }}
                                        </a>
                                        <div class="info_price price-wrap">
                                            <span class="price-new text-primary fw-semibold">
                                                {!! format_price($product->front_sale_price_with_taxes ?? $product->price) !!}
                                            </span>
                                            @if ($hasSale)
                                                <span class="price-old text-caption-01 cl-text-3 text-decoration-line-through">
                                                    {!! format_price($product->price) !!}
                                                </span>
                                            @endif
                                        </div>
                                    </div>
                                    <div class="mini-action">
                                        <a href="#shoppingCart" data-bs-toggle="offcanvas"
                                           class="btn-action hover-tooltip tooltip-left box-icon"
                                           aria-label="{{ __('Add to Cart') }}">
                                            <i class="icon icon-Handbag"></i>
                                            <span class="tooltip">{{ __('Add to Cart') }}</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>

            <div class="tes_thumb">
                <div class="tf-sw-nav-circle nav-prev-swiper" aria-label="{{ __('Previous') }}">
                    <i class="icon icon-CaretLeft"></i>
                </div>
                <div class="tf-sw-nav-circle nav-next-swiper" aria-label="{{ __('Next') }}">
                    <i class="icon icon-CaretRightThin"></i>
                </div>
            </div>
        </div>
    </section>
@endif
