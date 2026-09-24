@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    // Featured product = first in the curated list. Drives the LEFT info card and
    // CENTER image when present. Static shortcode attributes override product data
    // for demo presets that need exact HTML-reference content (e.g. HomeJewelry's
    // "Diamond Floral Pendant" hero with 134 reviews / $399 / SKU 53453412 — none
    // of which exist on real seeded products).
    $featured = $products->first();

    $featuredCategory    = trim((string) ($shortcode->featured_category ?? '')) ?: (optional($featured?->categories?->first())->name ?? __('Featured'));
    $featuredName        = trim((string) ($shortcode->featured_name ?? '')) ?: ($featured->name ?? '');
    $featuredSku         = trim((string) ($shortcode->featured_sku ?? '')) ?: ($featured->sku ?? '');
    $featuredDescription = trim((string) ($shortcode->featured_description ?? '')) ?: ($featured?->description ?? '');
    $featuredUrl         = trim((string) ($shortcode->featured_url ?? '')) ?: ($featured->url ?? '#');
    $reviewsCount        = (int) ($shortcode->featured_reviews ?? $featured?->reviews_count ?? 134);
    $soldQuantity        = (int) ($shortcode->featured_sold ?? 18);
    $viewingQuantity     = (int) ($shortcode->featured_viewing ?? 28);

    $featuredPriceRaw    = $shortcode->featured_price ?? null;
    $featuredOldPriceRaw = $shortcode->featured_old_price ?? null;
    $hasOverridePrice    = $featuredPriceRaw !== null;

    if ($hasOverridePrice) {
        $featuredPrice    = is_numeric($featuredPriceRaw) ? format_price((float) $featuredPriceRaw) : $featuredPriceRaw;
        $featuredOldPrice = $featuredOldPriceRaw === null
            ? null
            : (is_numeric($featuredOldPriceRaw) ? format_price((float) $featuredOldPriceRaw) : $featuredOldPriceRaw);
        // Explicit sale-percent override wins so demo presets can match HTML's
        // displayed badge value when it differs from the price arithmetic.
        if (! empty($shortcode->featured_sale_percent ?? '')) {
            $salePercent = (int) $shortcode->featured_sale_percent;
        } elseif ($featuredOldPriceRaw && is_numeric($featuredPriceRaw) && is_numeric($featuredOldPriceRaw)) {
            $salePercent = (int) round(100 - ((float) $featuredPriceRaw / (float) $featuredOldPriceRaw * 100));
        } else {
            $salePercent = 0;
        }
    } else {
        $hasSale          = $featured && ! empty($featured->sale_price) && $featured->sale_price < $featured->price;
        $featuredPrice    = $featured ? format_price($featured->front_sale_price_with_taxes ?? $featured->price) : '';
        $featuredOldPrice = $hasSale ? format_price($featured->price) : null;
        $salePercent      = $hasSale ? round(100 - ($featured->sale_price / $featured->price * 100)) : null;
    }

    $soldText        = __(':n sold in last 32 hours', ['n' => $soldQuantity]);
    $viewingText     = __(':n people are viewing this right now', ['n' => $viewingQuantity]);
    $cartLabel       = $featuredPrice
        ? __('Add To Cart - :price', ['price' => $featuredPrice])
        : __('Add To Cart');

    // CENTER image: explicit `featured_image` attr OR product's main image.
    $centerImage = $shortcode->featured_image ?? ($featured->image ?? $shortcode->main_image ?? null);
    // RIGHT image: lifestyle photo from `main_image` (or fallback to center if missing).
    $rightImage  = $shortcode->main_image ?? $centerImage;
@endphp

{{-- 3-column featured-product hero. Mirrors html/home-jewelry.html banner-product-single
     style-5: full PDP info card LEFT, main product image CENTER, lifestyle image RIGHT
     (lifestyle hidden below xxl per demo). Three flex children share equal basis. --}}
<div class="container-full">
    @if (! empty($shortcode->heading ?? '') || ! empty($shortcode->subheading ?? ''))
        <div class="sect-heading type-2 text-center wow fadeInUp mb-30">
            @if (! empty($shortcode->heading ?? ''))
                <h3 class="s-title">{!! BaseHelper::clean($shortcode->heading) !!}</h3>
            @endif
            @if (! empty($shortcode->subheading ?? ''))
                <p class="s-desc text-body-1 cl-text-2">{!! BaseHelper::clean($shortcode->subheading) !!}</p>
            @endif
        </div>
    @endif
    <div class="banner-product-single style-5 section-image-zoom">
        <div class="d-flex wrap-shop gap-10 flex-column flex-xl-row">

            {{-- LEFT: Product info card (matches HTML PDP layout) --}}
            <div class="left" >
                <div class="tf-product-info-list">
                    @if ($featuredName !== '')
                        {{-- Category breadcrumb --}}
                        <p class="product-infor-cate text-caption-01 cl-text-2 mb-4">{{ $featuredCategory }}</p>

                        {{-- Product name --}}
                        <h3 class="product-infor-name mb-12">
                            <a href="{{ $featuredUrl }}" class="link">{!! BaseHelper::clean($featuredName) !!}</a>
                        </h3>

                        {{-- Rating + sold + SKU row --}}
                        <div class="product-infor-meta mb-20 d-flex align-items-center gap-12 flex-wrap">
                            <div class="meta_rate d-flex align-items-center gap-6">
                                <div class="star-wrap d-flex">
                                    @for ($i = 0; $i < 5; $i++)
                                        <i class="icon icon-Star text-warning"></i>
                                    @endfor
                                </div>
                                <span class="text-caption-01 cl-text-2">({{ $reviewsCount }} {{ __('reviews') }})</span>
                            </div>
                            <div class="br-line type-vertical d-none d-sm-block"></div>
                            <div class="meta_sold d-flex align-items-center gap-4">
                                <i class="icon icon-Lightning text-primary"></i>
                                <span class="text-caption-01 cl-text-1">{{ $soldText }}</span>
                            </div>
                            @if ($featuredSku !== '')
                                <div class="br-line type-vertical d-none d-sm-block"></div>
                                <div class="meta_prd_code text-caption-01">
                                    <span class="cl-text-2">{{ __('SKU:') }}</span>
                                    <span>{{ $featuredSku }}</span>
                                </div>
                            @endif
                        </div>

                        {{-- Price + sale --}}
                        <div class="product-infor-price mb-12 d-flex align-items-center gap-10">
                            <h4 class="price-on-sale mb-0">{!! BaseHelper::clean($featuredPrice) !!}</h4>
                            @if ($featuredOldPrice)
                                <p class="cl-text-3 text-decoration-line-through mb-0">{!! BaseHelper::clean($featuredOldPrice) !!}</p>
                                @if ($salePercent)
                                    <span class="badge-sale bg-primary text-white fw-semibold text-caption-02 px-2 py-1 radius-3">-{{ $salePercent }}%</span>
                                @endif
                            @endif
                        </div>

                        {{-- Description --}}
                        @if ($featuredDescription !== '')
                            <p class="product-infor-desc cl-text-2 mb-12 text-line-clamp-2">{!! BaseHelper::clean(strip_tags((string) $featuredDescription)) !!}</p>
                        @endif

                        {{-- Live-viewers indicator --}}
                        <div class="product-infor-reality d-flex align-items-center gap-8 mb-16">
                            <i class="icon icon-Eye"></i>
                            <span class="text-caption-01">{{ $viewingText }}</span>
                        </div>

                        <div class="br-line mb-16"></div>

                        {{-- Color swatches: secondary products as visual color-picker thumbs --}}
                        @if ($products->count() > 1)
                            <div class="variant-picker-item mb-16">
                                <div class="variant-picker-label mb-8">
                                    <span class="cl-text-2">{{ __('Colors:') }}</span>
                                    <span class="value-currentColor text-capitalize fw-medium">{{ optional($products->skip(1)->first())->name ?? __('Metal') }}</span>
                                </div>
                                <div class="variant-picker-values d-flex gap-8 flex-wrap">
                                    @foreach ($products->slice(1, 3) as $alt)
                                        <a href="{{ $alt->url ?: '#' }}" class="color-btn style-image hover-tooltip tooltip-bot d-block radius-3 overflow-hidden border" style="width:60px;height:60px;" aria-label="{{ $alt->name }}">
                                            {!! RvMedia::image($alt->image ?? null, $alt->name, 'thumb', false, ['class' => 'w-100 h-100', 'style' => 'object-fit:cover;', 'loading' => 'lazy']) !!}
                                        </a>
                                    @endforeach
                                </div>
                            </div>
                        @endif

                        {{-- Quantity + Add To Cart --}}
                        <div class="tf-product-total-quantity mb-12">
                            <p class="mb-8">{{ __('Quantity:') }}</p>
                            <div class="group-action d-flex align-items-center gap-12 flex-wrap">
                                <div class="wg-quantity d-inline-flex align-items-center border radius-3">
                                    <button type="button" class="btn-quantity btn-decrease flex-grow-0 px-3 py-2" aria-label="{{ __('Decrease') }}"><i class="icon icon-minus"></i></button>
                                    <input class="quantity-product flex-grow-1 text-center border-0" type="text" value="1" aria-label="{{ __('Quantity') }}">
                                    <button type="button" class="btn-quantity btn-increase flex-grow-0 px-3 py-2" aria-label="{{ __('Increase') }}"><i class="icon icon-plus"></i></button>
                                </div>
                                <a href="{{ $featuredUrl }}" class="btn-action-price tf-btn type-xl animate-btn flex-grow-1">
                                    {{ $cartLabel }}
                                </a>
                            </div>
                        </div>

                        {{-- Buy It Now (primary red) --}}
                        <a href="{{ $featuredUrl }}" class="tf-btn type-xl btn-primary animate-btn w-100 mb-16">
                            {{ __('Buy It Now') }}
                        </a>

                        {{-- Action icons row --}}
                        <div class="tf-product-extra-link d-flex align-items-center flex-wrap gap-15 mb-16">
                            <a href="#compare" data-bs-toggle="offcanvas" class="product-extra-icon link fw-medium d-flex align-items-center gap-4">
                                <i class="icon icon-ArrowsLeftRight"></i> {{ __('Compare') }}
                            </a>
                            <a href="#ask" data-bs-toggle="modal" class="product-extra-icon link fw-medium d-flex align-items-center gap-4">
                                <i class="icon icon-Question"></i> {{ __('Ask A Question') }}
                            </a>
                            @if (theme_option('enabled_product_size_guide', true))
                                <a href="#findSize" data-bs-toggle="modal" class="product-extra-icon link fw-medium d-flex align-items-center gap-4">
                                    <i class="icon icon-Ruler"></i> {{ __('Size Guide') }}
                                </a>
                            @endif
                            <a href="#share" data-bs-toggle="modal" class="product-extra-icon link fw-medium d-flex align-items-center gap-4">
                                <i class="icon icon-ShareNetwork"></i> {{ __('Share') }}
                            </a>
                        </div>

                        {{-- View All Details link --}}
                        <a href="{{ $featuredUrl }}" class="tf-btn-line-2 fw-semibold style-primary text-decoration-underline">
                            {{ __('View All Details') }}
                        </a>
                    @else
                        {{-- Heading/subheading now rendered at top-level above wrap-shop. --}}
                        @if (! empty($shortcode->button_text ?? ''))
                            <a href="{{ $shortcode->button_url ?: '#' }}" class="tf-btn btn-fill animate-hover-btn radius-3 w-100">
                                <span>{!! BaseHelper::clean($shortcode->button_text) !!}</span>
                            </a>
                        @endif
                    @endif
                </div>
            </div>

            {{-- CENTER: featured product image --}}
            <div class="center" >
                <div class="banner-product-image radius-10 overflow-hidden bg-main-2 h-100">
                    {!! RvMedia::image($centerImage, $featuredName, 'hero-banner', false, ['class' => 'w-100 h-100', 'style' => 'object-fit:cover;', 'loading' => 'lazy']) !!}
                </div>
            </div>

            {{-- RIGHT: lifestyle image (xxl+ only, matches HTML's d-none d-xxl-block) --}}
            <div class="right d-none d-xxl-block" >
                <div class="banner-lifestyle-image radius-10 overflow-hidden h-100">
                    {!! RvMedia::image($rightImage, $featuredName, 'hero-banner', false, ['class' => 'w-100 h-100', 'style' => 'object-fit:cover;', 'loading' => 'lazy']) !!}
                </div>
            </div>

        </div>
    </div>
</div>
