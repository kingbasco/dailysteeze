{{-- Paired-banner side-by-side — html/home-baby.html §4 (Banner).
     Mirrors `bare-section / swiper data-preview="2" / banner-image-text style-5 hover-img`.
     Each tab item supports: image (380x380 LEFT), link, title (h4), description, button_text. --}}
<div class="bare-section">
    <div class="container">
        <div dir="ltr" class="swiper tf-swiper"
             data-preview="2" data-tablet="2" data-mobile-sm="2" data-mobile="1"
             data-space-lg="30" data-space-md="20" data-space="10"
             data-pagination="1" data-pagination-sm="2" data-pagination-md="2" data-pagination-lg="2">
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
                        <div class="banner-image-text style-5 hover-img">
                            <a href="{{ $link }}" class="bn-image img-style">
                                <img loading="lazy" width="380" height="380"
                                     src="{{ $image ? \Botble\Media\Facades\RvMedia::getImageUrl($image) : \Botble\Media\Facades\RvMedia::getDefaultImage() }}"
                                     alt="{{ $title ?: 'Image' }}">
                            </a>
                            <div class="bn-content flex-1">
                                @if (! empty($title))
                                    <a href="{{ $link }}" class="title h4 fw-medium link">
                                        {!! BaseHelper::clean($title) !!}
                                    </a>
                                @endif
                                @if (! empty($desc))
                                    <p class="desc cl-text-2 text-body-1">
                                        {!! BaseHelper::clean($desc) !!}
                                    </p>
                                @endif
                                @if (! empty($btn))
                                    <a href="{{ $link }}" class="btn-action tf-btn animate-btn">
                                        {!! BaseHelper::clean($btn) !!}
                                    </a>
                                @endif
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
            <div class="sw-line-default style-2 tf-sw-pagination"></div>
        </div>
    </div>
</div>
