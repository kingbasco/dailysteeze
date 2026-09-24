@php
    /**
     * Image-first testimonial card (home-garden pattern).
     * Mirrors html/home-garden.html lines 2727-2853 — `testimonial-v03 hover-img4`:
     * left/top photo with quick-view hover icon, then star-rating + author block
     * (with verified-buyer badge) + capitalized quote.
     *
     * Falls back to the testimonial plugin's seeded records via the parent
     * partials/shortcodes/testimonials/index.blade.php; uses each record's
     * `avatar` field as the photo. Add a `product_image` tab in the shortcode
     * config to override per-slide.
     */
    $autoplay = ($shortcode->autoplay ?? 'yes') === 'yes';
@endphp

<div class="container">
    <div dir="ltr" class="swiper tf-swiper"
        data-preview="3" data-tablet="2" data-mobile-sm="2" data-mobile="1"
        data-space-lg="30" data-space-md="20" data-space="10"
        data-pagination="1" data-pagination-sm="2" data-pagination-md="2" data-pagination-lg="3"
        data-auto="{{ $autoplay ? 'true' : 'false' }}">
        <div class="swiper-wrapper">
            @foreach ($items as $item)
                @php
                    $photo  = $item['product_image'] ?? $item['avatar'] ?? null;
                    $name   = $item['name'] ?? '';
                    $role   = $item['role'] ?? '';
                    $quote  = $item['content'] ?? '';
                    $rating = (int) ($item['rating'] ?? 5);
                    $rating = max(0, min(5, $rating));
                @endphp
                <div class="swiper-slide">
                    <div class="testimonial-v03 hover-img4">
                        @if ($photo)
                            <div class="img-style4">
                                {!! RvMedia::image($photo, $name, 'medium', false, ['width' => 450, 'height' => 312, 'loading' => 'lazy']) !!}
                                <ul class="tes-action_list">
                                    <li>
                                        <a href="{{ $item['product_url'] ?? '#' }}" class="box-icon" aria-label="{{ __('View product') }}">
                                            <i class="icon icon-Eye"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        @endif
                        <div class="content text-center">
                            <div class="star-wrap d-flex align-items-center justify-content-center mb-12">
                                @for ($s = 0; $s < $rating; $s++)
                                    <i class="icon icon-Star fs-24"></i>
                                @endfor
                            </div>
                            @if ($name)
                                <div class="tes_author mb-8">
                                    <div class="h6 author-name">{!! BaseHelper::clean($name) !!}</div>
                                    <div class="author-verified">
                                        <i class="icon icon-CheckCircle1"></i>
                                        <span class="cl-text-2">
                                            {{ $role ?: __('Verified Buyer') }}
                                        </span>
                                    </div>
                                </div>
                            @endif
                            @if ($quote)
                                <div class="h6 text-capitalize">
                                    &ldquo;{!! BaseHelper::clean($quote) !!}&rdquo;
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
