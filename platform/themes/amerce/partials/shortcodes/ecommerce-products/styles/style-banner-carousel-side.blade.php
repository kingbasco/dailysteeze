@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    /**
     * Banner-side carousel composite (home-baby.html §6 "Favorite", lines 4696-5184):
     *   <section class="flat-spacing"><div class="container">
     *     <div class="sect-heading type-2 has-col-right">title + col-right View All</div>
     *     <div class="row">
     *       <div class="col-lg-4 d-none d-lg-block">
     *         <div class="banner-image-text type-abs style-6 h-100">...</div>      <-- tall banner
     *       </div>
     *       <div class="col-lg-8">
     *         <div class="swiper tf-swiper" data-preview="3" data-grid="2">...</div> <-- 6 cards, 3x2
     *       </div>
     *     </div>
     *
     * Shortcode attrs (mirrors style-grid-with-banner):
     *   custom_title, custom_subtitle  — section heading (rendered here)
     *   view_all_text, view_all_url    — col-right CTA link
     *   banner_image, banner_heading, banner_subheading, banner_button_text, banner_button_url
     *   source, limit (=6 expected)    — passed through standard shortcode handler
     *
     * The parent index.blade.php only renders its own centered heading when the
     * shortcode `title`/`subtitle` is set — leave those blank and use custom_* here.
     */
    $heading     = (string) ($shortcode->custom_title ?? '');
    $subheading  = (string) ($shortcode->custom_subtitle ?? '');
    $viewAllText = (string) ($shortcode->view_all_text ?? __('View All Products'));
    $viewAllUrl  = (string) ($shortcode->view_all_url ?? '#');

    $bannerImage = (string) ($shortcode->banner_image ?? '');
    $bannerHead  = (string) ($shortcode->banner_heading ?? '');
    $bannerSub   = (string) ($shortcode->banner_subheading ?? '');
    $bannerBtn   = (string) ($shortcode->banner_button_text ?? __('View All Products'));
    $bannerUrl   = (string) ($shortcode->banner_button_url ?? '#');

    $list = collect($products);
@endphp

@if ($heading !== '' || $subheading !== '')
    <div class="sect-heading type-2 has-col-right wow fadeInUp">
        <div>
            @if ($heading !== '')
                <h3 class="s-title">{!! BaseHelper::clean($heading) !!}</h3>
            @endif
            @if ($subheading !== '')
                <p class="s-desc cl-text-2 text-body-1">{!! BaseHelper::clean($subheading) !!}</p>
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
    @if ($bannerImage !== '')
        <div class="col-lg-4 d-none d-lg-block">
            <div class="banner-image-text type-abs style-6 h-100">
                <a href="{{ $bannerUrl ?: '#' }}" class="bn-image img-style">
                    {!! RvMedia::image($bannerImage, $bannerHead, false, false, ['width' => 450, 'height' => 830, 'loading' => 'lazy']) !!}
                </a>
                <div class="bn-content wow fadeInUp">
                    @if ($bannerSub !== '')
                        <p class="desc fw-semibold">{!! nl2br(BaseHelper::clean($bannerSub)) !!}</p>
                    @endif
                    @if ($bannerHead !== '')
                        <a href="{{ $bannerUrl ?: '#' }}" class="title h3 fw-medium link">
                            {!! nl2br(BaseHelper::clean($bannerHead)) !!}
                        </a>
                    @endif
                    <a href="{{ $bannerUrl ?: '#' }}" class="btn-action tf-btn btn-white">
                        {!! BaseHelper::clean($bannerBtn) !!}
                    </a>
                </div>
            </div>
        </div>
    @endif
    <div class="{{ $bannerImage !== '' ? 'col-lg-8' : 'col-12' }}">
        @if ($list->isNotEmpty())
            <div dir="ltr" class="swiper tf-swiper"
                data-preview="3" data-tablet="3" data-mobile-sm="2" data-mobile="2"
                data-space-lg="30" data-space-md="15" data-space="10"
                data-pagination="2" data-pagination-sm="2" data-pagination-md="3" data-pagination-lg="3"
                data-grid="2">
                <div class="swiper-wrapper">
                    @foreach ($list as $product)
                        <div class="swiper-slide">
                            @includeIf(Theme::getThemeNamespace('views.ecommerce.includes.product-item'), [
                                'product' => $product,
                                'productWrapperClass' => 'square',
                            ])
                        </div>
                    @endforeach
                </div>
                <div class="sw-dot-default tf-sw-pagination"></div>
            </div>
        @endif
    </div>
</div>
