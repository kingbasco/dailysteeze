@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    $products = $products ?? collect();
    $prdList  = collect($products);
    $leftCol  = $prdList->slice(0, 2)->values();
    $rightCol = $prdList->slice(2)->values();
    $bannerImage      = $bannerImage ?? '';
    $bannerHeading    = $bannerHeading ?? '';
    $bannerSubheading = $bannerSubheading ?? '';
    $bannerBtnText    = $bannerBtnText ?? __('Shop Now');
    $bannerBtnUrl     = $bannerBtnUrl ?? '#';
@endphp

@if ($prdList->isNotEmpty())
    <div class="wrap-prd">
        <div class="col-prd-1">
            @if ($bannerImage !== '')
                <div class="banner-image-text type-abs style-18 v2 mb-20">
                    <a href="{{ $bannerBtnUrl ?: '#' }}" class="bn-image img-style">
                        {!! RvMedia::image($bannerImage, $bannerHeading ?: 'Banner', 'medium', false, ['width' => 450, 'height' => 608, 'loading' => 'lazy']) !!}
                    </a>
                    <div class="bn-content wow fadeInUp">
                        @if ($bannerHeading !== '')
                            <a href="{{ $bannerBtnUrl ?: '#' }}" class="title text-white h3 fw-medium link mb-8">
                                {!! nl2br(BaseHelper::clean($bannerHeading)) !!}
                            </a>
                        @endif
                        @if ($bannerSubheading !== '')
                            <p class="desc text-body-1 text-white mb-28">
                                {!! nl2br(BaseHelper::clean($bannerSubheading)) !!}
                            </p>
                        @endif
                        <a href="{{ $bannerBtnUrl ?: '#' }}" class="tf-btn btn-white hv-primary">
                            {!! BaseHelper::clean($bannerBtnText) !!}
                        </a>
                    </div>
                </div>
            @endif
            @if ($leftCol->isNotEmpty())
                <div class="tf-grid-layout tf-col-2 gap-20">
                    @foreach ($leftCol as $product)
                        @includeIf(Theme::getThemeNamespace('views.ecommerce.includes.product-item'), ['product' => $product])
                    @endforeach
                </div>
            @endif
        </div>
        <div class="col-prd-2">
            @if ($rightCol->isNotEmpty())
                <div class="tf-grid-layout tf-col-2 lg-col-3 gap-20">
                    @foreach ($rightCol as $product)
                        @includeIf(Theme::getThemeNamespace('views.ecommerce.includes.product-item'), ['product' => $product])
                    @endforeach
                </div>
            @endif
        </div>
    </div>
@else
    <p class="text-center text-muted py-4">{{ __('No products available in this tab.') }}</p>
@endif
