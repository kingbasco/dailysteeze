@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Ecommerce\Facades\EcommerceHelper;
    use Botble\Media\Facades\RvMedia;

    // Mirrors html/home-organic.html "Customer Favorites" (lines 1469-1932):
    // section-heading `type-2 has-col-right` (title LEFT + "View All Products" CTA RIGHT) +
    // 2-col `row`: portrait banner-image-text type-abs style-12 LEFT (col-lg-4) +
    // swiper with 6 products in 3-col × 2-row grid RIGHT (col-lg-8, data-grid="2").

    // Demo banner is 420x776 PORTRAIT — `medium` is square 800x800 (memory
    // `feedback-rvmedia-medium-is-square`). Pass `null` size to serve the original
    // (HomeOrganic-only consumer; back-compat preserved by null fallback).
    $imageUrl   = RvMedia::getImageUrl($shortcode->image ?? null, null);
    $bannerDesc = trim((string) ($shortcode->banner_subtitle ?? ''));
    $bannerHead = trim((string) ($shortcode->banner_heading ?? ''));
    $btnText    = trim((string) ($shortcode->banner_button_text ?? ''));
    $btnUrl     = $shortcode->banner_button_url ?: '#';

    $viewAllUrl  = trim((string) ($shortcode->view_all_url ?? '/products'));
    $viewAllText = trim((string) ($shortcode->view_all_text ?? __('View All Products')));
    $hasViewAll  = $viewAllUrl !== '';
@endphp

<section {!! $shortcode->htmlAttributes() !!} class="section-banner-favorite flat-spacing pt-0">
    <div class="container">
        @if (! empty($shortcode->title ?? '') || ! empty($shortcode->subtitle ?? '') || $hasViewAll)
            <div class="sect-heading type-2 has-col-right wow fadeInUp">
                <div>
                    @if (! empty($shortcode->subtitle ?? ''))
                        <p class="s-desc cl-text-3 fw-semibold mb-8">{!! BaseHelper::clean($shortcode->subtitle) !!}</p>
                    @endif
                    @if (! empty($shortcode->title ?? ''))
                        <h2 class="s-title font-outfit mb-0 letter-space-0">{!! BaseHelper::clean($shortcode->title) !!}</h2>
                    @endif
                </div>
                @if ($hasViewAll)
                    <div class="col-right">
                        <a href="{{ $viewAllUrl }}" class="tf-btn-line-2 py-4 style-primary">
                            <span class="fw-semibold">{!! BaseHelper::clean($viewAllText) !!}</span>
                        </a>
                    </div>
                @endif
            </div>
        @endif

        <div class="row">
            {{-- LEFT — portrait banner with centered text overlay --}}
            <div class="col-lg-4 d-none d-lg-block">
                <div class="col-left">
                    <div class="banner-image-text type-abs style-12">
                        <a href="{{ $btnUrl }}" class="bn-image img-style">
                            <img loading="lazy" width="420" height="776" src="{{ $imageUrl }}" alt="{{ BaseHelper::clean($bannerHead ?: ($shortcode->title ?? '')) }}">
                        </a>
                        <div class="bn-content align-items-center text-center wow fadeInUp">
                            @if ($bannerDesc !== '')
                                <p class="desc cl-text-2 fw-semibold text-capitalize">{!! BaseHelper::clean($bannerDesc) !!}</p>
                            @endif
                            @if ($bannerHead !== '')
                                <a href="{{ $btnUrl }}" class="title h3 fw-medium link">{!! BaseHelper::clean($bannerHead) !!}</a>
                            @endif
                            @if ($btnText !== '')
                                <a href="{{ $btnUrl }}" class="btn-action tf-btn btn-white">{!! BaseHelper::clean($btnText) !!}</a>
                            @endif
                        </div>
                    </div>
                </div>
            </div>

            {{-- RIGHT — 3-col × 2-row product grid in a swiper --}}
            <div class="col-lg-8">
                <div class="col-right">
                    <div dir="ltr" class="swiper tf-swiper"
                         data-preview="3" data-tablet="3" data-mobile-sm="2" data-mobile="2"
                         data-space-lg="30" data-space-md="15" data-space="10"
                         data-pagination="2" data-pagination-sm="2" data-pagination-md="3" data-pagination-lg="3"
                         data-grid="2">
                        <div class="swiper-wrapper">
                            @forelse ($products as $product)
                                <div class="swiper-slide">
                                    <div class="card-product wow fadeInUp">
                                        @include(EcommerceHelper::viewPath('includes.product.style-1.grid'), [
                                            'product'       => $product,
                                            'showQuickView' => false,
                                            'showQuickShop' => true,
                                        ])
                                    </div>
                                </div>
                            @empty
                                <div class="swiper-slide"><p class="text-muted">{{ __('No products to show.') }}</p></div>
                            @endforelse
                        </div>
                        <div class="sw-dot-default tf-sw-pagination"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
