@php
    /**
     * Mirrors html/home-electronics.html §8 (lines 4305-4501): two-column layout
     * with `sw-thumb` lifestyle image swiper LEFT (520x520) + `sw-main-thumb`
     * testimonial cards RIGHT (testimonial-v01 style-5 with stars, author block,
     * br-line, Verified Buyer badge, quote, product showcase). Bottom: line
     * pagination + nav prev/next arrows.
     *
     * Falls back to plugin Testimonial records when shortcode tabs missing.
     * Each item may carry: thumb (large lifestyle img), product_image, product_name,
     * product_price, product_url. When omitted, falls back to avatar.
     */
    $autoplay = ($shortcode->autoplay ?? 'yes') === 'yes';
@endphp

{{-- .section-testimonial-thumbs star color + spacing rules live in
     assets/sass/component/_inline-migrated.scss. --}}
@if (! empty($items))
    <div class="container">
        <div class="row align-items-center gy-30">
            <div class="col-lg-6 col-xl-5">
                <div dir="ltr" class="swiper sw-thumb"
                     data-preview="1"
                     data-loop="true"
                     data-auto="{{ $autoplay ? 'true' : 'false' }}">
                    <div class="swiper-wrapper">
                        @foreach ($items as $item)
                            @php
                                $thumb = $item['thumb'] ?? $item['avatar'] ?? null;
                            @endphp
                            <div class="swiper-slide">
                                <div class="sw-image radius-16 overflow-hidden">
                                    {!! RvMedia::image($thumb, $item['name'] ?? '', '', false, ['width' => 520, 'height' => 520, 'class' => 'w-100 h-100', 'style' => 'object-fit:cover;', 'loading' => 'lazy']) !!}
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-xl-6 offset-xl-1">
                <div class="col-right tes_thumb">
                    <div dir="ltr" class="swiper sw-main-thumb"
                         data-preview="1"
                         data-loop="true"
                         data-auto="{{ $autoplay ? 'true' : 'false' }}">
                        <div class="swiper-wrapper">
                            @foreach ($items as $item)
                                @php
                                    $rating = (int) ($item['rating'] ?? 5);
                                @endphp
                                <div class="swiper-slide">
                                    <div class="testimonial-v01 style-5">
                                        <div class="tes-content">
                                            @if ($rating > 0)
                                                <div class="star-wrap d-flex align-items-center">
                                                    @for ($i = 1; $i <= 5; $i++)
                                                        <i class="icon icon-Star fs-24 {{ $i <= $rating ? '' : 'cl-text-3' }}"></i>
                                                    @endfor
                                                </div>
                                            @endif
                                            <div class="tes_author">
                                                @if (! empty($item['name']))
                                                    <h5 class="author-name">{!! BaseHelper::clean($item['name']) !!}</h5>
                                                @endif
                                                <div class="br-line"></div>
                                                <div class="author-verified">
                                                    <i class="icon icon-CheckCircle1"></i>
                                                    <span class="cl-text-2">
                                                        {{ __('Verified Buyer') }}
                                                    </span>
                                                </div>
                                            </div>
                                            @if (! empty($item['content']))
                                                <p class="tes_text h4 text-capitalize">{!! BaseHelper::clean($item['content']) !!}</p>
                                            @endif
                                            @if (! empty($item['product_image']) || ! empty($item['product_name']))
                                                <div class="tes_product mt-24">
                                                    @if (! empty($item['product_image']))
                                                        <div class="product-image flex-shrink-0 radius-8 overflow-hidden" style="width: 60px; height: 60px;">
                                                            {!! RvMedia::image($item['product_image'], $item['product_name'] ?? '', 'thumb', false, ['width' => 60, 'height' => 60, 'class' => 'w-100 h-100', 'style' => 'object-fit:cover;', 'loading' => 'lazy']) !!}
                                                        </div>
                                                    @endif
                                                    <div class="product-infor">
                                                        @if (! empty($item['product_name']))
                                                            <a href="{{ $item['product_url'] ?? '#' }}" class="link fw-medium lh-20 text-line-clamp-1 fs-16">
                                                                {!! BaseHelper::clean($item['product_name']) !!}
                                                            </a>
                                                        @endif
                                                        @if (! empty($item['product_price']))
                                                            <p class="prd_price fw-semibold text-primary mt-4">{!! BaseHelper::clean($item['product_price']) !!}</p>
                                                        @endif
                                                    </div>
                                                </div>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                        <div class="sw-line-default style-2 sw-pg-thumb d-xxl-none mt-30"></div>
                    </div>
                    <div class="group-action-nav">
                        <div class="tf-sw-nav-2 nav-prev-swiper">
                            <i class="icon icon-ArrowLeft"></i>
                        </div>
                        <div class="tf-sw-nav-2 nav-next-swiper">
                            <i class="icon icon-ArrowRight"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endif
