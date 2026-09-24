@php
    /**
     * @var \Botble\Shortcode\Compilers\Shortcode $shortcode
     * @var \Illuminate\Support\Collection $vendors
     */
    $sliderId = 'ecommerce-vendors-slider-' . uniqid();
    $perView = (int) ($shortcode->items_per_row ?: 4);
    $perView = max(1, min(6, $perView));
@endphp

<div class="ecommerce-vendors__slider tf-btn-swiper-main hover-sw-nav">
    <div dir="ltr"
         id="{{ $sliderId }}"
         class="swiper tf-swiper"
         data-preview="{{ $perView }}"
         data-tablet="3"
         data-mobile="2"
         data-mobile-sm="1"
         data-space="20"
         data-space-md="16">
        <div class="swiper-wrapper">
            @foreach ($vendors as $vendor)
                <div class="swiper-slide">
                    <article class="marketplace-vendor-card card-store h-100" data-store-id="{{ $vendor->id }}">
                        <a href="{{ $vendor->url }}" class="marketplace-vendor-card__cover store-image d-block">
                            {!! \Botble\Media\Facades\RvMedia::image(
                                $vendor->logo,
                                $vendor->name,
                                'medium',
                                true,
                                ['class' => 'img-fluid w-100']
                            ) !!}
                        </a>
                        <div class="marketplace-vendor-card__body store-infor p-3">
                            <a href="{{ $vendor->url }}" class="text-reset text-decoration-none">
                                <h5 class="marketplace-vendor-card__name info_name mb-2">
                                    {{ $vendor->name }}
                                    @if (! empty($vendor->badge))
                                        {!! \Botble\Base\Facades\BaseHelper::clean($vendor->badge) !!}
                                    @endif
                                </h5>
                            </a>

                            @if (! empty($vendor->full_address))
                                <p class="marketplace-vendor-card__address small text-muted mb-2 text-truncate">
                                    <i class="icon icon-map-pin me-1" aria-hidden="true"></i>{{ $vendor->full_address }}
                                </p>
                            @endif

                            <a href="{{ $vendor->url }}" class="btn btn-outline-dark btn-sm marketplace-vendor-card__cta">
                                {{ __('Visit store') }}
                                <i class="icon icon-ArrowUpRight1 ms-1" aria-hidden="true"></i>
                            </a>
                        </div>
                    </article>
                </div>
            @endforeach
        </div>
    </div>
    <div class="tf-sw-nav nav-prev-{{ $sliderId }} nav-prev-swiper" aria-label="{{ __('Previous') }}">
        <i class="icon icon-arrLeft" aria-hidden="true"></i>
    </div>
    <div class="tf-sw-nav nav-next-{{ $sliderId }} nav-next-swiper" aria-label="{{ __('Next') }}">
        <i class="icon icon-arrRight" aria-hidden="true"></i>
    </div>
</div>
