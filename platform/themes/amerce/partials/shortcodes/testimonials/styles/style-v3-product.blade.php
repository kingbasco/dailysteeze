@php
    $autoplay = ($shortcode->autoplay ?? 'yes') === 'yes';
    // Pet-care demo wraps the swiper in a cream `flat-spacing bg-main radius-20`
    // box on a `bare-section container-full` outer section. Opt-in via `bg_main=yes`.
    $useBgMain = ($shortcode->bg_main ?? 'no') === 'yes';
@endphp

@if ($useBgMain)
<div class="container-full">
    <div class="flat-spacing bg-main radius-20 position-relative">
        <div class="container">
            @if (! empty($shortcode->title ?? '') || ! empty($shortcode->subtitle ?? ''))
                <div class="sect-heading type-2 text-center wow fadeInUp">
                    @if (! empty($shortcode->title ?? ''))
                        <h3 class="s-title">{!! \Botble\Base\Facades\BaseHelper::clean($shortcode->title) !!}</h3>
                    @endif
                    @if (! empty($shortcode->subtitle ?? ''))
                        <p class="s-desc text-body-1 cl-text-2">{!! \Botble\Base\Facades\BaseHelper::clean($shortcode->subtitle) !!}</p>
                    @endif
                </div>
            @endif
        </div>
@endif

<div class="container">
    <div dir="ltr" class="swiper tf-swiper testimonials-v3-product mb--20 pb-20"
        data-preview="2" data-tablet="2" data-mobile-sm="1" data-mobile="1"
        data-space-lg="30" data-space-md="15" data-space="10"
        data-pagination="1" data-pagination-sm="1" data-pagination-md="2" data-pagination-lg="2"
        data-loop="true"
        data-auto="{{ $autoplay ? 'true' : 'false' }}">
        <div class="swiper-wrapper">
            @foreach ($items as $index => $item)
                @php
                    $rating       = (int) ($item['rating'] ?? 5);
                    $rating       = max(0, min(5, $rating));
                    $name         = $item['name']          ?? '';
                    $content      = $item['content']       ?? '';
                    $role         = $item['role']          ?? '';
                    $avatar       = $item['avatar']        ?? null;
                    $productImage = $item['product_image'] ?? null;
                    $productName  = $item['product_name']  ?? '';
                    $productPrice = $item['product_price'] ?? '';
                    $productUrl   = $item['product_url']   ?? '#';
                    $delay        = $index === 0 ? '' : '0.1s';
                @endphp
                <div class="swiper-slide">
                    {{-- testimonial-v01.style-3 = pet-care demo (image LEFT split, product mini-card RIGHT inside .tes-content).
                         CSS lives in theme.css ~ html/styles.css line 9123. --}}
                    <div class="testimonial-v01 style-3 wow fadeInLeft" @if ($delay) data-wow-delay="{{ $delay }}" @endif>
                        @if (! empty($avatar))
                            <div class="tes-image">
                                {!! RvMedia::image($avatar, $name, 'medium', false, ['width' => 285, 'height' => 380, 'loading' => 'lazy']) !!}
                            </div>
                        @endif
                        <div class="tes-content">
                            @if ($rating > 0)
                                <div class="star-wrap d-flex align-items-center">
                                    @for ($i = 1; $i <= $rating; $i++)
                                        <i class="icon icon-Star-thin fs-24"></i>
                                    @endfor
                                </div>
                            @endif
                            @if (! empty($name))
                                <div class="tes_author">
                                    <p class="author-name h5">{!! BaseHelper::clean($name) !!}</p>
                                    <div class="br-line"></div>
                                    <div class="author-verified">
                                        <i class="icon icon-CheckCircle1"></i>
                                        <span class="cl-text-2">
                                            {{ ! empty($role) ? $role : __('Verified Buyer') }}
                                        </span>
                                    </div>
                                </div>
                            @endif
                            @if (! empty($content))
                                <p class="tes_text h6">{!! BaseHelper::clean($content) !!}</p>
                            @endif
                            @if (! empty($productImage) || ! empty($productName))
                                <div class="tes_product">
                                    @if (! empty($productImage))
                                        <div class="product-image">
                                            {!! RvMedia::image($productImage, $productName, 'thumb', false, ['width' => 60, 'height' => 60, 'class' => 'aspect-ratio-1 object-fit-cover', 'loading' => 'lazy']) !!}
                                        </div>
                                    @endif
                                    <div class="product-infor">
                                        @if (! empty($productName))
                                            <a href="{{ $productUrl ?: '#' }}" class="link fw-medium lh-24">
                                                {!! BaseHelper::clean($productName) !!}
                                            </a>
                                        @endif
                                        @if (! empty($productPrice))
                                            <p class="prd_price fw-semibold text-primary">{!! BaseHelper::clean($productPrice) !!}</p>
                                        @endif
                                    </div>
                                </div>
                            @endif
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
        <div class="sw-line-default style-2 tf-sw-pagination"></div>
    </div>
</div>

@if ($useBgMain)
    </div>
</div>
@endif
