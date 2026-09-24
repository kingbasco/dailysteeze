@php
    $endDate = optional($flashSale->end_date)->endOfDay();
    $endIso = $endDate ? $endDate->toIso8601String() : null;
    $bgImage = $shortcode->background_image
        ? \Botble\Media\Facades\RvMedia::getImageUrl($shortcode->background_image)
        : null;
    $bgStyle = $bgImage ? 'background-image: url(' . e($bgImage) . ');' : '';
    $products = $flashSale->products ?? collect();
@endphp

<div class="ecommerce-flash-sale__banner p-4 p-md-5 rounded text-white"
     @if ($bgStyle) style="{{ $bgStyle }} background-size: cover; background-position: center;" @endif>
    <div class="row align-items-center gy-4">
        <div class="col-lg-5">
            @if ($shortcode->title)
                <h2 class="ecommerce-flash-sale__title mb-2">{{ $shortcode->title }}</h2>
            @endif
            @if ($shortcode->subtitle)
                <p class="ecommerce-flash-sale__subtitle mb-3">{{ $shortcode->subtitle }}</p>
            @endif
            @if ($shortcode->show_countdown && $endIso)
                <div class="ecommerce-flash-sale__countdown d-flex gap-2 flex-wrap"
                     data-countdown
                     data-target-date="{{ $endIso }}">
                    <div class="ecommerce-flash-sale__countdown-block text-center px-3 py-2 bg-dark rounded">
                        <span class="d-block h3 mb-0" data-countdown-days>00</span>
                        <span class="small text-uppercase">{{ __('Days') }}</span>
                    </div>
                    <div class="ecommerce-flash-sale__countdown-block text-center px-3 py-2 bg-dark rounded">
                        <span class="d-block h3 mb-0" data-countdown-hours>00</span>
                        <span class="small text-uppercase">{{ __('Hours') }}</span>
                    </div>
                    <div class="ecommerce-flash-sale__countdown-block text-center px-3 py-2 bg-dark rounded">
                        <span class="d-block h3 mb-0" data-countdown-minutes>00</span>
                        <span class="small text-uppercase">{{ __('Minutes') }}</span>
                    </div>
                    <div class="ecommerce-flash-sale__countdown-block text-center px-3 py-2 bg-dark rounded">
                        <span class="d-block h3 mb-0" data-countdown-seconds>00</span>
                        <span class="small text-uppercase">{{ __('Seconds') }}</span>
                    </div>
                </div>
            @endif
        </div>
        <div class="col-lg-7">
            <div class="row gy-3">
                @foreach ($products->take(4) as $product)
                    <div class="col-6 ecommerce-flash-sale__item">
                        @includeIf(Theme::getThemeNamespace('views.ecommerce.includes.product-item'), ['product' => $product])
                    </div>
                @endforeach
            </div>
        </div>
    </div>
</div>
