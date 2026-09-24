@php
    /**
     * `testimonial-v04` layout.
     *
     * Base render mirrors html/home-furniture.html §10 (`section-testimonial-v2`):
     * 2-per-view swiper, no avatar, col-right nav arrows. Each card: stars +
     * author/verified inline + capitalized quote (h5) + br-line + product mini-card.
     *
     * html/home-fashion-2.html §8 "Testimonial" (lines 4425-4520) is the same card
     * with cosmetic modifiers — opt in via knobs:
     *   card_modifier   — extra classes on `.testimonial-v04` (fashion-2 `style-2`);
     *                     `style-2` also tightens card spacing + h6 quote per demo
     *   container_class — wrapper container (default `container`; fashion-2 `container-full`)
     *   preview         — desktop slides per view (default 2; fashion-2 3)
     *   view_all_url    — when set, the col-right shows a "Read All Reviews" link
     *   view_all_text   — link label (default "Read All Reviews")
     *   bg_main         — 'yes' wraps heading+swiper in `<div class="flat-spacing bg-main">`
     *
     * Per-slide product attrs come from shortcode tabs:
     *   product_image, product_name, product_price (sale), product_old_price (regular), product_url
     */
    $autoplay       = ($shortcode->autoplay ?? 'yes') === 'yes';
    $cardModifier   = trim((string) ($shortcode->card_modifier ?? ''));
    $isStyle2       = $cardModifier === 'style-2';
    $containerClass = trim((string) ($shortcode->container_class ?? '')) ?: 'container';
    $preview        = max(1, min(4, (int) ($shortcode->preview ?? 2)));
    $tablet         = $preview >= 3 ? 2 : 2;
    $viewAllUrl     = trim((string) ($shortcode->view_all_url ?? ''));
    $viewAllText    = trim((string) ($shortcode->view_all_text ?? '')) ?: __('Read All Reviews');
    $hasViewAll     = $viewAllUrl !== '';
    $useBgMain      = ($shortcode->bg_main ?? 'no') === 'yes';

    // style-2 uses the demo's tighter spacing scale + h6 quote; base keeps legacy values.
    $mbStar   = $isStyle2 ? 'mb-12' : 'mb-16';
    $mbAuthor = $isStyle2 ? 'mb-20' : 'mb-24';
    $mbQuote  = $isStyle2 ? 'mb-20' : 'mb-24';
    $mbLine   = $isStyle2 ? 'mb-20' : 'mb-24';
    $quoteClass = $isStyle2 ? 'h6' : 'h5';
@endphp

@if ($useBgMain)<div class="flat-spacing bg-main">@endif
<div class="{{ $containerClass }}">
    <div class="sect-heading type-2 has-col-right wow fadeInUp">
        <div>
            @if ($shortcode->title)
                <h3 class="s-title">{!! BaseHelper::clean($shortcode->title) !!}</h3>
            @endif
            @if ($shortcode->subtitle)
                <p class="s-desc text-body-1 cl-text-2">{!! BaseHelper::clean($shortcode->subtitle) !!}</p>
            @endif
        </div>
        <div class="col-right d-flex gap-12">
            @if ($hasViewAll)
                <a href="{{ $viewAllUrl }}" class="tf-btn-line-2 py-4 style-primary">
                    <span class="fw-semibold">{!! BaseHelper::clean($viewAllText) !!}</span>
                </a>
            @else
                <div class="tf-sw-nav-2 style-large nav-prev-swiper">
                    <i class="icon icon-ArrowLeft"></i>
                </div>
                <div class="tf-sw-nav-2 style-large nav-next-swiper">
                    <i class="icon icon-ArrowRight"></i>
                </div>
            @endif
        </div>
    </div>
    <div dir="ltr" class="swiper tf-swiper"
        data-preview="{{ $preview }}" data-tablet="{{ $tablet }}" data-mobile-sm="1" data-mobile="1"
        data-space-lg="40" data-space-md="20" data-space="15"
        data-pagination="1" data-pagination-sm="{{ $preview >= 3 ? 1 : 2 }}" data-pagination-md="2" data-pagination-lg="{{ $preview }}"
        data-auto="{{ $autoplay ? 'true' : 'false' }}">
        <div class="swiper-wrapper">
            @foreach ($items as $item)
                @php
                    $name      = $item['name'] ?? '';
                    $role      = $item['role'] ?? __('Verified Buyer');
                    $quote     = $item['content'] ?? '';
                    $rating    = max(0, min(5, (int) ($item['rating'] ?? 5)));
                    $prdImg    = $item['product_image'] ?? null;
                    $prdName   = $item['product_name'] ?? '';
                    $prdPrice  = $item['product_price'] ?? '';
                    $prdOld    = $item['product_old_price'] ?? '';
                    $prdUrl    = $item['product_url'] ?? '#';
                @endphp
                <div class="swiper-slide">
                    <div class="{{ trim('testimonial-v04 ' . $cardModifier) }} wow fadeInUp">
                        <div class="star-wrap d-flex align-items-center {{ $mbStar }}">
                            @for ($s = 0; $s < $rating; $s++)
                                <i class="icon icon-Star fs-24"></i>
                            @endfor
                        </div>
                        @if ($name)
                            <div class="tes_author d-flex align-items-center gap-8 {{ $mbAuthor }}">
                                <h6 class="author-name">{!! BaseHelper::clean($name) !!}</h6>
                                <div class="author-verified d-flex align-items-center gap-4">
                                    <i class="icon icon-CheckCircle1"></i>
                                    <span class="cl-text-2">{!! BaseHelper::clean($role) !!}</span>
                                </div>
                            </div>
                        @endif
                        @if ($quote)
                            <p class="tes_text {{ $quoteClass }} text-capitalize {{ $mbQuote }}">{!! BaseHelper::clean($quote) !!}</p>
                        @endif
                        <div class="br-line {{ $mbLine }}"></div>
                        @if ($prdImg || $prdName)
                            <div class="tes_product">
                                @if ($prdImg)
                                    <div class="product-image">
                                        {!! RvMedia::image($prdImg, $prdName ?: $name, 'thumb', false, ['width' => 80, 'height' => 80, 'loading' => 'lazy']) !!}
                                    </div>
                                @endif
                                <div class="product-infor">
                                    @if ($prdName)
                                        <a href="{{ $prdUrl }}" class="link fw-medium lh-24">{!! BaseHelper::clean($prdName) !!}</a>
                                    @endif
                                    @if ($prdPrice || $prdOld)
                                        <div class="price-wrap prd_price">
                                            @if ($prdPrice)
                                                <span class="price-new text-primary fw-semibold">{{ $prdPrice }}</span>
                                            @endif
                                            @if ($prdOld)
                                                <span class="price-old text-caption-01 cl-text-3">{{ $prdOld }}</span>
                                            @endif
                                        </div>
                                    @endif
                                </div>
                            </div>
                        @endif
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</div>
@if ($useBgMain)</div>@endif
