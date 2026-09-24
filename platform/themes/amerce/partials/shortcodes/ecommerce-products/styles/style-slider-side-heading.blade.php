@php
    use Botble\Base\Facades\BaseHelper;

    /**
     * Left heading column + right product slider.
     * Mirrors html/home-fashion-2.html §7 "Product Feature" (lines 4130-4185):
     *   <div class="container-full"><div class="row">
     *     <div class="col-lg-3"> sect-heading + tf-btn "View All Products" </div>
     *     <div class="col-lg-9"> swiper tf-swiper wrap-sw-over data-preview=3 </div>
     *
     * The parent index.blade.php renders the `container-full` wrapper and skips its
     * own heading for this style (see $selfHeadingStyles / $containerClass).
     *
     * Attrs: title, subtitle, view_all_url, view_all_text, items_per_row (default 3).
     */
    $list        = collect($products);
    $heading     = trim((string) ($shortcode->title ?? ''));
    $subheading  = trim((string) ($shortcode->subtitle ?? ''));
    $viewAllUrl  = trim((string) ($shortcode->view_all_url ?? '')) ?: '#';
    $viewAllText = trim((string) ($shortcode->view_all_text ?? '')) ?: __('View All Products');
    $perView     = max(1, min(6, (int) ($shortcode->items_per_row ?: 3)));
    $sliderId    = 'ecommerce-products-side-' . uniqid();
@endphp

@if ($list->isNotEmpty())
    <div class="row">
        <div class="col-lg-3">
            <div class="sect-heading wow fadeInUp">
                @if ($heading !== '')
                    <h3 class="s-title mb-8">{!! BaseHelper::clean($heading) !!}</h3>
                @endif
                @if ($subheading !== '')
                    <p class="text-body-1 cl-text-2">{!! BaseHelper::clean($subheading) !!}</p>
                @endif
            </div>
            <a href="{{ $viewAllUrl }}" class="tf-btn animate-btn wow fadeInUp mb-30">
                {!! BaseHelper::clean($viewAllText) !!}
            </a>
        </div>
        <div class="col-lg-9">
            <div dir="ltr" id="{{ $sliderId }}" class="swiper tf-swiper wrap-sw-over"
                 data-preview="{{ $perView }}" data-tablet="3" data-mobile-sm="2" data-mobile="2"
                 data-space-lg="30" data-space-md="20" data-space="10"
                 data-pagination="2" data-pagination-sm="2" data-pagination-md="3" data-pagination-lg="{{ $perView }}">
                <div class="swiper-wrapper">
                    @foreach ($list as $product)
                        <div class="swiper-slide wow fadeInUp">
                            @includeIf(Theme::getThemeNamespace('views.ecommerce.includes.product-item'), ['product' => $product])
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
@endif
