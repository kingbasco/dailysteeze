{{-- Paired-overlay hero — html/home-pod.html §1 (Slide Show).
     Mirrors `bare-section / swiper data-preview="2" / banner-image-text type-abs style-3`.
     Each tab item supports: image, link, title (h2 overlay), description, button_text. --}}
@php
    $count = count($items);
@endphp

<div class="bare-section">
    <div dir="ltr" class="swiper tf-swiper slider_effect_fade-md"
         data-preview="2" data-tablet="2" data-mobile-sm="1" data-mobile="1"
         data-space="0" data-pagination="1" data-pagination-sm="1" data-pagination-md="2" data-pagination-lg="2">
        <div class="swiper-wrapper">
            @foreach ($items as $i => $item)
                @php
                    $idx = $i + 1;
                    $image = $item['image'] ?? null;
                    $link  = $item['link']  ?? '#';
                    $title = $shortcode->{"title_$idx"} ?? '';
                    $desc  = $shortcode->{"description_$idx"} ?? '';
                    $btn   = $shortcode->{"button_text_$idx"} ?? '';
                @endphp
                <div class="swiper-slide">
                    <div class="banner-image-text type-abs style-3 hover-img overflow-hidden">
                        <a href="{{ $link }}" class="bn-image img-style">
                            <img loading="lazy" width="960" height="760"
                                 src="{{ $image ? \Botble\Media\Facades\RvMedia::getImageUrl($image) : \Botble\Media\Facades\RvMedia::getDefaultImage() }}"
                                 alt="{{ $title ?: 'Image' }}">
                        </a>
                        <div class="bn-content">
                            <div class="d-grid">
                                @if (! empty($title))
                                    <div class="fade-item fade-item-1">
                                        <a href="{{ $link }}" class="title h2 fw-medium text-white link">
                                            {!! BaseHelper::clean($title) !!}
                                        </a>
                                    </div>
                                @endif
                                @if (! empty($desc))
                                    <p class="desc text-white text-body-1 fade-item fade-item-2">
                                        {!! BaseHelper::clean($desc) !!}
                                    </p>
                                @endif
                            </div>
                            @if (! empty($btn))
                                <div class="fade-item fade-item-3">
                                    <a href="{{ $link }}" class="btn-action tf-btn btn-white">
                                        {!! BaseHelper::clean($btn) !!}
                                    </a>
                                </div>
                            @endif
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
        <div class="sw-line-default style-2 tf-sw-pagination d-md-none mt-10"></div>
    </div>
</div>
