{{-- HomeAuto banner sale — mirrors html/home-auto.html "Banner Sale". --}}
@php
    $bgImage = $shortcode->bg_image ?: 'section/bg-percent.png';
    $itemImage = $shortcode->item_image ?: 'item/graphic-item-2.png';
    $discount = trim((string) ($shortcode->discount ?? '35%'));
    $heading = trim((string) ($shortcode->heading ?? ''));
    $subheading = trim((string) ($shortcode->subheading ?? ''));
    $code = trim((string) ($shortcode->coupon_code ?? 'Amerce'));
@endphp

<section class="bare-section">
    <div class="container">
        <div class="banner-sale">
            <div class="bn-bg">
                {!! RvMedia::image($bgImage, 'Image', null, false, ['width' => 1410, 'height' => 144, 'loading' => 'lazy']) !!}
            </div>
            <div class="wrap-1">
                <p class="text-display fw-7 text-primary">
                    {!! BaseHelper::clean($discount) !!}
                </p>
            </div>
            <div class="wrap-2">
                @if ($heading !== '')
                    <h4 class="fw-7 text-primary">
                        {!! BaseHelper::clean($heading) !!}
                    </h4>
                @endif

                @if ($subheading !== '')
                    <p class="text-body-1 cl-text-2">
                        {!! BaseHelper::clean($subheading) !!}
                    </p>
                @endif
            </div>
            @if ($code !== '')
                <p class="coupon-copy-wrap h6 fw-medium cs-pointer">
                    {{ __('Code:') }}
                    <span class="coupon-code">
                        {!! BaseHelper::clean($code) !!}
                    </span>
                    <i class="icon icon-CopySimple fs-24"></i>
                </p>
            @endif
            <div class="img-item">
                {!! RvMedia::image($itemImage, 'Image', null, false, ['class' => 'wow fadeZoom', 'width' => 390, 'height' => 390, 'loading' => 'lazy']) !!}
            </div>
        </div>
    </div>
</section>
