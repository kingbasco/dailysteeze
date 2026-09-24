@php
    /**
     * Mirrors html/home-electronics.html §6 (lines 3716-4279) `section-gear-bundle`:
     * heading-with-CTA on top, then 2-col body — LEFT col (col-lg-7 col-xl-8) with a
     * swiper of paired products (2 stacked per slide using tf-list vertical), RIGHT
     * col (col-lg-5 col-xl-4) with a sticky `box-bundle-save` widget (progress bar,
     * caption, 3-product bundle list with quantity controls, subtotal, Add To Cart).
     *
     * Bundle widget content is static for the demo (matches HTML reference). Quantity
     * inputs are display-only — the storefront cart drives real bundle behavior.
     *
     * @var \Botble\Shortcode\Compilers\Shortcode $shortcode
     * @var \Illuminate\Support\Collection $products       (paired in 2s for the slider)
     * @var \Illuminate\Support\Collection $bundleProducts (first 3 used in widget)
     */
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    $title         = trim((string) ($shortcode->title ?? ''));
    $subtitle      = trim((string) ($shortcode->subtitle ?? ''));
    $viewAllUrl    = trim((string) ($shortcode->view_all_url ?? ''));
    $viewAllText   = trim((string) ($shortcode->view_all_text ?? '')) ?: __('View All Products');

    $bundleCaption    = trim((string) ($shortcode->bundle_caption ?? '')) ?: __('Buy 3 products and save up to 30%');
    $bundleProgress   = max(0, min(100, (int) ($shortcode->bundle_progress ?? 50)));
    $bundleButtonText = trim((string) ($shortcode->bundle_button_text ?? '')) ?: __('Add To Cart');
    $bundleButtonUrl  = trim((string) ($shortcode->bundle_button_url ?? '')) ?: '#';

    // Pair products 2 per slide (vertical pair like the demo).
    $pairs = $products->chunk(2)->values();

    $bundleItems = $bundleProducts->take(3);
    $subtotal = $bundleItems->sum(fn ($p) => (float) ($p->front_sale_price_with_taxes ?? $p->sale_price ?? $p->price ?? 0));
@endphp

@if ($products->isEmpty() && $bundleItems->isEmpty())
    @return
@endif

<section class="section-gear-bundle flat-spacing">
    <div class="container">
        @if ($title !== '' || $subtitle !== '' || $viewAllUrl !== '')
            <div class="sect-heading type-2 has-col-right wow fadeInUp">
                <div>
                    @if ($title !== '')
                        <h3 class="s-title">{!! BaseHelper::clean($title) !!}</h3>
                    @endif
                    @if ($subtitle !== '')
                        <p class="s-desc cl-text-2 text-body-1">{!! BaseHelper::clean($subtitle) !!}</p>
                    @endif
                </div>
                @if ($viewAllUrl !== '')
                    <a href="{{ $viewAllUrl }}" class="tf-btn-line-2 py-4 style-primary">
                        <span class="fw-semibold">{!! BaseHelper::clean($viewAllText) !!}</span>
                    </a>
                @endif
            </div>
        @endif

        <div class="main-section">
            <div class="row gy-30">
                <div class="col-lg-7 col-xl-8">
                    <div dir="ltr" class="swiper tf-swiper"
                         data-preview="3" data-tablet="2" data-mobile-sm="1" data-mobile="1"
                         data-space-lg="20" data-space-md="15" data-space="10"
                         data-pagination="1" data-pagination-sm="2" data-pagination-md="2" data-pagination-lg="3">
                        <div class="swiper-wrapper">
                            @foreach ($pairs as $pair)
                                <div class="swiper-slide">
                                    <div class="tf-list vertical wow fadeInUp gap-lg-30 gap-15">
                                        @foreach ($pair as $product)
                                            @includeIf(Theme::getThemeNamespace('views.ecommerce.includes.product-item'), ['product' => $product])
                                        @endforeach
                                    </div>
                                </div>
                            @endforeach
                        </div>
                        <div class="sw-line-default style-2 tf-sw-pagination mt-30"></div>
                    </div>
                </div>

                <div class="col-lg-5 col-xl-4">
                    <div class="box-bundle-save">
                        <div class="bundle-header mb-20">
                            <h3 class="bundle-title mb-8">{{ __('Bundle Save') }}</h3>
                            <p class="bundle-subhead cl-text-2 text-body-1 mb-0">{{ __('Save more when you shop in bundles.') }}</p>
                        </div>
                        <div class="bundle-progress mb-15">
                            <div class="progress">
                                <div class="progress-bar bg-primary" role="progressbar"
                                    style="width: {{ $bundleProgress }}%"
                                    aria-valuenow="{{ $bundleProgress }}" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>
                        <p class="bundle-caption fw-medium mb-20">{!! BaseHelper::clean($bundleCaption) !!}</p>

                        <ul class="bundle-list list-unstyled mb-20">
                            @foreach ($bundleItems as $product)
                                @php
                                    $hasSale = ! empty($product->sale_price) && $product->sale_price < $product->price;
                                    $unitPrice = format_price($product->front_sale_price_with_taxes ?? $product->sale_price ?? $product->price);
                                    $oldPrice  = $hasSale ? format_price($product->price) : null;
                                @endphp
                                <li class="bundle-prd d-flex align-items-start gap-12 py-12 border-bottom">
                                    <div class="prd_image radius-3 overflow-hidden bg-main-2">
                                        {!! RvMedia::image($product->image ?? null, $product->name, 'thumb', false, ['width' => 72, 'height' => 72, 'class' => 'w-100 h-100', 'loading' => 'lazy']) !!}
                                    </div>
                                    <div class="prd_info flex-grow-1 min-w-0">
                                        <a href="{{ $product->url ?: '#' }}" class="name fw-medium link text-line-clamp-2 mb-4">{{ $product->name }}</a>
                                        <p class="prd_variant text-caption-01 cl-text-3 mb-4">XL/Blue</p>
                                        <div class="d-flex align-items-center justify-content-between gap-8 flex-wrap">
                                            <div class="price-wrap d-flex align-items-center gap-6">
                                                <span class="price-new text-primary fw-semibold">{!! $unitPrice !!}</span>
                                                @if ($oldPrice)
                                                    <span class="price-old text-caption-01 cl-text-3 text-decoration-line-through">{!! $oldPrice !!}</span>
                                                @endif
                                            </div>
                                            <button type="button" class="bundle-remove text-caption-01 cl-text-3 link btn p-0 border-0 bg-transparent" aria-label="{{ __('Remove') }}">
                                                <i class="icon icon-Trash"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="wg-quantity-v2 d-inline-flex flex-column align-items-center">
                                        <button type="button" class="btn-quantity btn-increase" aria-label="{{ __('Increase') }}">
                                            <i class="icon icon-CaretUp"></i>
                                        </button>
                                        <input class="quantity-product text-center border-0 fw-medium" type="text" value="1" aria-label="{{ __('Quantity') }}">
                                        <button type="button" class="btn-quantity btn-decrease" aria-label="{{ __('Decrease') }}">
                                            <i class="icon icon-CaretDown"></i>
                                        </button>
                                    </div>
                                </li>
                            @endforeach
                        </ul>

                        <div class="bundle-subtotal d-flex align-items-center justify-content-between mb-15">
                            <span class="fw-medium">{{ __('Subtotal') }}</span>
                            <span class="fw-semibold h6 mb-0">{!! format_price($subtotal) !!}</span>
                        </div>

                        <a href="{{ $bundleButtonUrl }}" class="tf-btn animate-btn w-100">
                            {!! BaseHelper::clean($bundleButtonText) !!}
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
