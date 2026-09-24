@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    /**
     * Mirrors html/home-organic.html lines 2510-2649 (`testimonial-v01 style-def style-4 type-2`).
     * 3-up swiper. Each slide: image TOP (410x273) + 5★ + quote + author with Verified
     * checkmark + 60x60 product mini-card with name + price.
     *
     * Item enrichment (avatar from testimonial.image; product fields from featured product
     * pool) is performed in `partials/shortcodes/testimonials/index.blade.php` for any style
     * matching this allowlist entry.
     */
    $autoplay = ($shortcode->autoplay ?? 'yes') === 'yes';
    // container_class: demo §7 (L2511) uses `container-2` (wider than default `container`).
    $allowedContainers = ['container', 'container-2', 'container-full'];
    $rawContainer = $shortcode->container_class ?? 'container';
    $containerClass = in_array($rawContainer, $allowedContainers, true) ? $rawContainer : 'container';
@endphp

<div class="{{ $containerClass }}">
    <div dir="ltr" class="swiper tf-swiper"
         data-preview="3" data-tablet="2" data-mobile-sm="2" data-mobile="1"
         data-space-lg="30" data-space-md="20" data-space="10"
         data-pagination="1" data-pagination-sm="2" data-pagination-md="2" data-pagination-lg="3"
         data-auto="{{ $autoplay ? 'true' : 'false' }}">
        <div class="swiper-wrapper">
            @foreach ($items as $i => $item)
                @php $rating = (int) ($item['rating'] ?? 5); @endphp
                <div class="swiper-slide">
                    <div class="testimonial-v01 style-def style-4 type-2 wow fadeInLeft" @if ($i > 0) data-wow-delay="0.{{ $i }}s" @endif>
                        @if (! empty($item['avatar']))
                            <div class="tes-image">
                                {!! RvMedia::image($item['avatar'], $item['name'] ?? '', 'medium', false, ['loading' => 'lazy', 'width' => 410, 'height' => 273]) !!}
                            </div>
                        @endif
                        <div class="tes-content">
                            @if ($rating > 0)
                                <div class="star-wrap d-flex align-items-center">
                                    @for ($s = 1; $s <= 5; $s++)
                                        <i class="icon icon-Star fs-16 {{ $s <= $rating ? '' : 'cl-text-3' }}"></i>
                                    @endfor
                                </div>
                            @endif
                            @if (! empty($item['content']))
                                <p class="tes_text cl-text-2">{!! BaseHelper::clean($item['content']) !!}</p>
                            @endif
                            <div class="tes_author">
                                <p class="author-name lh-24 fw-medium">{{ BaseHelper::clean($item['name'] ?? '') }}</p>
                                <div class="author-verified">
                                    <i class="icon icon-CheckCircle fs-20"></i>
                                </div>
                            </div>
                            @if (! empty($item['product_image']) || ! empty($item['product_name']))
                                <div class="tes_product">
                                    @if (! empty($item['product_image']))
                                        <div class="product-image">
                                            {!! RvMedia::image($item['product_image'], $item['product_name'] ?? '', 'thumb', false, ['loading' => 'lazy', 'width' => 60, 'height' => 60]) !!}
                                        </div>
                                    @endif
                                    <div class="product-infor">
                                        @if (! empty($item['product_name']))
                                            <a href="{{ $item['product_url'] ?? '#' }}" class="link fw-medium lh-24">
                                                {{ BaseHelper::clean($item['product_name']) }}
                                            </a>
                                        @endif
                                        @if (! empty($item['product_price']))
                                            <p class="prd_price fw-semibold">{!! BaseHelper::clean($item['product_price']) !!}</p>
                                        @endif
                                    </div>
                                </div>
                            @endif
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
        <div class="sw-dot-default tf-sw-pagination"></div>
    </div>
</div>
