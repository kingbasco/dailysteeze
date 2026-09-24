{{-- HomeAuto banner trio — mirrors html/home-auto.html:
     bare-section / swiper data-preview="3" / banner-image-text type-abs style-7 hover-img. --}}
<div class="bare-section">
    <div class="container">
        <div
            dir="ltr"
            class="swiper tf-swiper"
            data-preview="3"
            data-tablet="3"
            data-mobile-sm="2"
            data-mobile="1"
            data-space-lg="30"
            data-space-md="15"
            data-space="10"
            data-pagination="1"
            data-pagination-sm="2"
            data-pagination-md="3"
            data-pagination-lg="3"
        >
            <div class="swiper-wrapper">
                @foreach ($items as $i => $item)
                    @php
                        $idx = $i + 1;
                        $image = $item['image'] ?? null;
                        $link = $item['link'] ?? '#';
                        $title = (string) ($shortcode->{"title_$idx"} ?? '');
                        $desc = (string) ($shortcode->{"description_$idx"} ?? '');
                        $btn = (string) ($shortcode->{"button_text_$idx"} ?? __('View More'));
                        $buttonClass = $idx === 3 ? 'tf-btn btn-white hv-primary small' : 'tf-btn btn-white small';
                    @endphp

                    <div class="swiper-slide">
                        <div class="banner-image-text type-abs style-7 hover-img">
                            <a href="{{ $link }}" class="bn-image img-style">
                                <img
                                    loading="lazy"
                                    width="450"
                                    height="520"
                                    src="{{ $image ? \Botble\Media\Facades\RvMedia::getImageUrl($image) : \Botble\Media\Facades\RvMedia::getDefaultImage() }}"
                                    alt="{{ $title ?: 'Image' }}"
                                >
                            </a>
                            <div class="bn-content wow fadeInUp">
                                @if ($title !== '')
                                    <a href="{{ $link }}" class="title h3 fw-medium text-white link">
                                        {!! nl2br(BaseHelper::clean($title)) !!}
                                    </a>
                                @endif

                                @if ($desc !== '')
                                    <p class="desc cl-text-line text-body-1">
                                        {!! BaseHelper::clean($desc) !!}
                                    </p>
                                @endif

                                @if ($btn !== '')
                                    <a href="{{ $link }}" class="btn-action {{ $buttonClass }}">
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
