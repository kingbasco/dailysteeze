@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    /**
     * Best-Sale composite (home-garden Section 2).
     * Mirrors html/home-garden.html lines 1688-2080:
     *   <section class="flat-spacing-7"><div class="container">
     *     <div class="sect-heading d-block d-md-flex type-2 has-col-right">
     *       <div><h3>Title</h3><p>Subtitle</p></div>
     *       <div class="col-right"><a class="tf-btn-line-2 py-4 style-primary">View All Products</a></div>
     *     </div>
     *     <div class="row">
     *       <div class="col-lg-6 mb-lg-0 mb-30">
     *         <div class="banner-image-text type-abs style-18">...</div>           <-- 1 banner
     *         <div class="tf-grid-layout tf-col-2 gap-15 gap-lg-30">...</div>      <-- 2 cards
     *       </div>
     *       <div class="col-lg-6">
     *         <div class="tf-grid-layout tf-col-2 gap-lg-30 gap-15">...</div>      <-- 4 cards
     *       </div>
     *     </div>
     *
     * Shortcode attrs:
     *   title, subtitle             — section heading (rendered here, NOT via section-title)
     *   view_all_text, view_all_url — col-right CTA link
     *   banner_image, banner_heading, banner_subheading, banner_button_text, banner_button_url
     *   source, limit (=6 expected) — passed through standard shortcode handler
     *
     * Note: The parent ecommerce-products/index.blade.php wraps this in
     *       `<section class="ecommerce-products flat-spacing"><div class="container">...`,
     *       and only renders its own centered heading if `title`/`subtitle` is set on the
     *       shortcode. We render our own custom heading + leave title/subtitle BLANK on the
     *       shortcode call to suppress the default centered version.
     */
    $heading      = (string) ($shortcode->custom_title ?? '');
    $subheading   = (string) ($shortcode->custom_subtitle ?? '');
    $viewAllText  = (string) ($shortcode->view_all_text ?? __('View All Products'));
    $viewAllUrl   = (string) ($shortcode->view_all_url ?? '#');

    $bannerImage = (string) ($shortcode->banner_image ?? '');
    $bannerHead  = (string) ($shortcode->banner_heading ?? '');
    $bannerSub   = (string) ($shortcode->banner_subheading ?? '');
    $bannerBtn   = (string) ($shortcode->banner_button_text ?? __('Shop Now'));
    $bannerUrl   = (string) ($shortcode->banner_button_url ?? '#');

    // Split products into the demo's left (2 cards) + right (4 cards) layout.
    $list   = collect($products);
    $leftCol  = $list->slice(0, 2)->values();
    $rightCol = $list->slice(2, 4)->values();
@endphp

@if ($heading !== '' || $subheading !== '')
    <div class="sect-heading d-block d-md-flex type-2 has-col-right wow fadeInUp">
        <div>
            @if ($heading !== '')
                <h3 class="s-title">{!! BaseHelper::clean($heading) !!}</h3>
            @endif
            @if ($subheading !== '')
                <p class="text-body-1 cl-text-2">{!! BaseHelper::clean($subheading) !!}</p>
            @endif
        </div>
        <div class="col-right">
            <a href="{{ $viewAllUrl ?: '#' }}" class="tf-btn-line-2 py-4 style-primary">
                <span class="fw-semibold">{!! BaseHelper::clean($viewAllText) !!}</span>
            </a>
        </div>
    </div>
@endif

<div class="row">
    <div class="col-lg-6 mb-lg-0 mb-30">
        @if ($bannerImage !== '')
            <div class="banner-image-text type-abs style-18">
                <a href="{{ $bannerUrl ?: '#' }}" class="bn-image img-style">
                    {!! RvMedia::image($bannerImage, $bannerHead, 'medium', false, ['width' => 450, 'height' => 608, 'loading' => 'lazy']) !!}
                </a>
                <div class="bn-content wow fadeInUp">
                    @if ($bannerHead !== '')
                        <a href="{{ $bannerUrl ?: '#' }}" class="title h2 fw-medium link-3 mb-8">
                            {!! nl2br(BaseHelper::clean($bannerHead)) !!}
                        </a>
                    @endif
                    @if ($bannerSub !== '')
                        <p class="desc cl-text-2 mb-24">
                            {!! nl2br(BaseHelper::clean($bannerSub)) !!}
                        </p>
                    @endif
                    <a href="{{ $bannerUrl ?: '#' }}" class="tf-btn animate-btn small-2">
                        <span class="text-caption-01">{!! BaseHelper::clean($bannerBtn) !!}</span>
                    </a>
                </div>
            </div>
        @endif
        @if ($leftCol->isNotEmpty())
            <div class="tf-grid-layout tf-col-2 gap-15 gap-lg-30">
                @foreach ($leftCol as $product)
                    @includeIf(Theme::getThemeNamespace('views.ecommerce.includes.product-item'), ['product' => $product])
                @endforeach
            </div>
        @endif
    </div>
    <div class="col-lg-6">
        @if ($rightCol->isNotEmpty())
            <div class="tf-grid-layout tf-col-2 gap-lg-30 gap-15">
                @foreach ($rightCol as $product)
                    @includeIf(Theme::getThemeNamespace('views.ecommerce.includes.product-item'), ['product' => $product])
                @endforeach
            </div>
        @endif
    </div>
</div>
