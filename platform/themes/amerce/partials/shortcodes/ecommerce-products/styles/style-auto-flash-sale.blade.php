@php
    use Botble\Base\Facades\BaseHelper;

    $perView = (int) ($shortcode->items_per_row ?: 4);
    $perView = max(1, min(6, $perView));

    $title = trim((string) ($shortcode->custom_title ?? $shortcode->title ?? ''));
    $viewAllText = trim((string) ($shortcode->view_all_text ?? __('View All Products')));
    $viewAllUrl = trim((string) ($shortcode->view_all_url ?? ''));
    $timer = (int) ($shortcode->countdown_timer ?: 1093120);

    if ($timer <= 0) {
        $timer = 1093120;
    }
@endphp

<div class="sect-heading type-4 wow fadeInUp">
    @if ($title !== '')
        <h3 class="s-title mb-0">{!! BaseHelper::clean($title) !!}</h3>
    @endif

    <div class="flex-1">
        <div class="countdown-v04">
            <div class="js-countdown cd-has-zero cd-custom h4" data-timer="{{ $timer }}"></div>
        </div>
    </div>

    @if ($viewAllUrl !== '' && $viewAllText !== '')
        <a href="{{ $viewAllUrl }}" class="tf-btn-line-2 py-4 style-primary">
            <span class="fw-semibold">{{ $viewAllText }}</span>
        </a>
    @endif
</div>

<div class="box-swiper-product">
    <div
        dir="ltr"
        class="swiper tf-swiper"
        data-preview="{{ $perView }}"
        data-tablet="3"
        data-mobile-sm="2"
        data-mobile="2"
        data-space-lg="30"
        data-space-md="15"
        data-space="10"
        data-pagination="2"
        data-pagination-sm="2"
        data-pagination-md="3"
        data-pagination-lg="{{ $perView }}"
    >
        <div class="swiper-wrapper">
            @foreach ($products as $product)
                <div class="swiper-slide">
                    @includeIf(Theme::getThemeNamespace('views.ecommerce.includes.product-item'), [
                        'product' => $product,
                        'productWrapperClass' => 'square',
                    ])
                </div>
            @endforeach
        </div>
        <div class="sw-line-default style-2 tf-sw-pagination"></div>
    </div>
</div>
