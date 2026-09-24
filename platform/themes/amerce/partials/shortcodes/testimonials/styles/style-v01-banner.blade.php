@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    /**
     * Full-bleed testimonials banner (`section-testimonials` + `testimonial-v01 style-7`).
     * Mirrors html/home-headphone.html lines 3277-3435:
     *   `<div class="container-full"><div class="section-testimonials position-relative">
     *    <div class="banner"><img 1770x600></div><div class="wrap-tes">` swiper of
     *   `testimonial-v01 style-7 style-def` slides — centered stars, `tes_author`
     *   (h5 name + br-line + Verified Buyer), `tes_text h4` quote, `tes_product`
     *   mini-card (80x80 product image + name + price-new/price-old).
     *
     * This style emits its OWN `container-full` + `section-testimonials` wrapper,
     * so the parent index must NOT double-wrap it (see $bareStyles in index.blade.php).
     *
     * Knobs:
     *   banner_image — full-bleed banner (1770x600, non-square → RvMedia false).
     *   autoplay     — yes/no (default yes).
     *   testimonial_product_ids — CSV product IDs paired per-testimonial (resolved
     *                  by the parent index, surfaces as $item['product_*']).
     *
     * @var \Botble\Shortcode\Compilers\Shortcode $shortcode
     * @var array $items
     */
    $autoplay    = ($shortcode->autoplay ?? 'yes') === 'yes';
    $bannerImage = trim((string) ($shortcode->banner_image ?? ''));
@endphp

<div class="container-full">
    <div class="section-testimonials position-relative">
        @if ($bannerImage !== '')
            <div class="banner">
                {{-- Original image (1770x600) — NOT `hero-banner` (1920x1080), which
                     16:9-crops the wide testimonial banner. --}}
                {!! RvMedia::image($bannerImage, $shortcode->title ?? __('Testimonials'), null, false, ['width' => 1770, 'height' => 600, 'loading' => 'lazy']) !!}
            </div>
        @endif
        <div class="wrap-tes">
            <div dir="ltr" class="swiper tf-swiper" data-auto="{{ $autoplay ? 'true' : 'false' }}"
                 data-loop="true" data-delay="3000" data-space="15">
                <div class="swiper-wrapper">
                    @foreach ($items as $index => $item)
                        @php
                            $rating       = max(0, min(5, (int) ($item['rating'] ?? 5)));
                            $name         = $item['name']          ?? '';
                            $role         = $item['role']          ?? '';
                            $content      = $item['content']       ?? '';
                            $productImage = $item['product_image'] ?? null;
                            $productName  = $item['product_name']  ?? '';
                            $productPrice = $item['product_price'] ?? '';
                            $productOldPrice = $item['product_old_price'] ?? '';
                            $productUrl   = $item['product_url']   ?? '#';
                        @endphp
                        <div class="swiper-slide">
                            <div class="testimonial-v01 style-7 style-def wow fadeInLeft" @if ($index > 0) data-wow-delay="0.1s" @endif>
                                <div class="tes-content">
                                    @if ($rating > 0)
                                        <div class="star-wrap d-flex align-items-center justify-content-center">
                                            @for ($i = 1; $i <= $rating; $i++)
                                                <i class="icon icon-Star fs-24"></i>
                                            @endfor
                                        </div>
                                    @endif
                                    @if (! empty($name))
                                        <div class="tes_author justify-content-center">
                                            <h5 class="author-name text-white">{!! BaseHelper::clean($name) !!}</h5>
                                            <div class="br-line"></div>
                                            <div class="author-verified">
                                                <i class="icon icon-CheckCircle1"></i>
                                                <span class="text-white">
                                                    {{ ! empty($role) ? $role : __('Verified Buyer') }}
                                                </span>
                                            </div>
                                        </div>
                                    @endif
                                    @if (! empty($content))
                                        <p class="tes_text h4 text-white text-capitalize fw-normal">{!! BaseHelper::clean($content) !!}</p>
                                    @endif
                                    @if (! empty($productImage) || ! empty($productName))
                                        <div class="tes_product text-start">
                                            @if (! empty($productImage))
                                                <div class="product-image">
                                                    {!! RvMedia::image($productImage, $productName, 'thumb', false, ['width' => 80, 'height' => 80, 'class' => 'aspect-ratio-1 object-fit-cover', 'loading' => 'lazy']) !!}
                                                </div>
                                            @endif
                                            <div class="product-infor">
                                                @if (! empty($productName))
                                                    <a href="{{ $productUrl ?: '#' }}" class="link fw-medium lh-24">
                                                        {!! BaseHelper::clean($productName) !!}
                                                    </a>
                                                @endif
                                                @if (! empty($productPrice))
                                                    <div class="price-wrap">
                                                        <span class="price-new text-primary fw-semibold">{!! BaseHelper::clean($productPrice) !!}</span>
                                                        @if (! empty($productOldPrice))
                                                            <span class="price-old cl-text-3">{!! BaseHelper::clean($productOldPrice) !!}</span>
                                                        @endif
                                                    </div>
                                                @endif
                                            </div>
                                        </div>
                                    @endif
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
                <div class="sw-line-default tf-sw-pagination"></div>
            </div>
        </div>
    </div>
</div>
