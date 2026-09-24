@php
    $sliderId = 'ecommerce-categories-slider-' . uniqid();
    $perView = (int) ($shortcode->items_per_row ?: 5);
    $perView = max(2, min(6, $perView));
@endphp

<div class="ecommerce-categories__slider tf-btn-swiper-main hover-sw-nav">
    <div dir="ltr"
         id="{{ $sliderId }}"
         class="swiper tf-swiper"
         data-preview="{{ $perView }}"
         data-tablet="3"
         data-mobile="2"
         data-mobile-sm="2"
         data-space="20"
         data-space-md="16">
        <div class="swiper-wrapper">
            @foreach ($categories as $category)
                <div class="swiper-slide">
                    <a href="{{ $category->url }}" class="ecommerce-categories__card d-block text-center text-decoration-none text-reset">
                        <div class="ecommerce-categories__thumb mb-2 overflow-hidden rounded">
                            {!! \Botble\Media\Facades\RvMedia::image(
                                $category->image,
                                $category->name,
                                'thumb',
                                false,
                                ['class' => 'w-100 h-auto']
                            ) !!}
                        </div>
                        <h3 class="h6 ecommerce-categories__name mb-0">{{ $category->name }}</h3>
                        @if ($shortcode->show_count)
                            <p class="ecommerce-categories__count small text-muted mb-0">
                                {{ trans_choice(':count product|:count products', (int) ($category->products_count ?? 0), ['count' => (int) ($category->products_count ?? 0)]) }}
                            </p>
                        @endif
                    </a>
                </div>
            @endforeach
        </div>
    </div>
    <div class="tf-sw-nav nav-prev-{{ $sliderId }} nav-prev-swiper" aria-label="{{ __('Previous') }}">
        <i class="icon icon-arrLeft"></i>
    </div>
    <div class="tf-sw-nav nav-next-{{ $sliderId }} nav-next-swiper" aria-label="{{ __('Next') }}">
        <i class="icon icon-arrRight"></i>
    </div>
</div>
