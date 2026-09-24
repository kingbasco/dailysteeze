@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    /**
     * Mirrors html/home-cosmetic.html §4 (line 1813-1855):
     * `flat-spacing pt-0 > container > tf-grid-layout md-col-2 gap-10` wrapping 2
     * `banner-image-text type-abs style-11 hover-img` cards, each rendering a
     * square 700x700 image with bottom-left text overlay (title + desc + CTA, white text).
     *
     * Demo class `banner-image-text.type-abs.style-11` lacks theme.css coverage —
     * inline CSS handles square aspect + bottom-left absolute overlay positioning.
     */
    $style = $shortcode->style ?? 'style-11';
    $banners = [
        [
            'image'       => $shortcode->image_1 ?? null,
            'title'       => $shortcode->title_1 ?? '',
            'subtitle'    => $shortcode->subtitle_1 ?? '',
            'button_text' => $shortcode->button_text_1 ?? '',
            'button_url'  => $shortcode->button_url_1 ?? '',
        ],
        [
            'image'       => $shortcode->image_2 ?? null,
            'title'       => $shortcode->title_2 ?? '',
            'subtitle'    => $shortcode->subtitle_2 ?? '',
            'button_text' => $shortcode->button_text_2 ?? '',
            'button_url'  => $shortcode->button_url_2 ?? '',
        ],
    ];
    $sectionClass = trim((string) ($shortcode->section_class ?? 'flat-spacing pt-0'));
@endphp

{{-- .banner-duo-section .banner-image-text.type-abs.style-11 layout
     lives in assets/sass/component/_inline-migrated.scss. --}}

<section {!! $shortcode->htmlAttributes() !!} @class(['tf-section', 'banner-duo-section', $sectionClass])>
    <div class="container">
        <div class="tf-grid-layout md-col-2 gap-10">
            @foreach ($banners as $banner)
                @php
                    $url = $banner['button_url'] !== '' ? $banner['button_url'] : '#';
                @endphp
                <div class="banner-image-text type-abs {{ $style }} hover-img">
                    <a href="{{ $url }}" class="bn-image img-style">
                        {!! RvMedia::image($banner['image'], $banner['title'], 'medium', false, ['width' => 700, 'height' => 700, 'loading' => 'lazy']) !!}
                    </a>
                    <div class="bn-content wow fadeInUp">
                        @if ($banner['title'] !== '')
                            <a href="{{ $url }}" class="title h3 fw-medium text-white link">
                                {!! BaseHelper::clean($banner['title']) !!}
                            </a>
                        @endif
                        @if ($banner['subtitle'] !== '')
                            <p class="desc text-white text-body-1">
                                {!! BaseHelper::clean($banner['subtitle']) !!}
                            </p>
                        @endif
                        @if ($banner['button_text'] !== '')
                            <a href="{{ $url }}" class="btn-action tf-btn btn-white">
                                {!! BaseHelper::clean($banner['button_text']) !!}
                            </a>
                        @endif
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</section>
