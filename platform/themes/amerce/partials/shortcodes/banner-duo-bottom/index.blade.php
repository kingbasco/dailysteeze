@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    /**
     * Banner duo with text BELOW image (centered) — mirrors home-sneaker.html §4
     * (lines 2015-2080): `tf-grid-layout md-col-2 gap-10` wrapping 2 cards each
     * with `banner-image-text style-bottom bt-center` structure: image LEFT/centered
     * + content BELOW (title + desc + button). Each card can have its own bg color
     * (e.g. one white, one red) and text color (dark/light).
     *
     * Different from preset 4 cosmetic `banner-duo`: that one had bottom-LEFT abs
     * overlay text ON the image. This one has content BELOW the image as a separate
     * stacked element with bg color wrapping both.
     */

    $cards = [];
    foreach ([1, 2] as $i) {
        $img = $shortcode->{"image_$i"} ?? null;
        if (! $img) continue;
        $cards[] = [
            'image'       => $img,
            'title'       => trim((string) ($shortcode->{"title_$i"} ?? '')),
            'desc'        => trim((string) ($shortcode->{"desc_$i"} ?? '')),
            'button_text' => trim((string) ($shortcode->{"button_text_$i"} ?? '')),
            'button_url'  => $shortcode->{"button_url_$i"} ?: '#',
            'bg_class'    => trim((string) ($shortcode->{"bg_class_$i"} ?? '')),
            'text_class'  => trim((string) ($shortcode->{"text_class_$i"} ?? '')),
        ];
    }
@endphp

{{-- Banner card layout (.banner-duo-bottom .banner-image-text) lives in
     assets/sass/component/_inline-migrated.scss. --}}
<section {!! $shortcode->htmlAttributes() !!} class="tf-section banner-duo-bottom flat-spacing">
    <div class="container-full">
        <div class="tf-grid-layout md-col-2 gap-10">
            @foreach ($cards as $card)
                <div class="banner-image-text style-bottom bt-center {{ $card['bg_class'] }}">
                    <a href="{{ $card['button_url'] }}" class="bn-image img-style radius-20">
                        {!! RvMedia::image($card['image'], $card['title'] ?: '', 'hero-banner', false, ['width' => 880, 'height' => 800, 'loading' => 'lazy']) !!}
                    </a>
                    <div class="bn-content wow fadeInUp">
                        @if ($card['title'] !== '')
                            <a href="{{ $card['button_url'] }}" class="title h2 link-underline-text mb-12 {{ $card['text_class'] }}">
                                {!! BaseHelper::clean($card['title']) !!}
                            </a>
                        @endif
                        @if ($card['desc'] !== '')
                            <p class="desc text-body-1 mb-24 {{ $card['text_class'] }}">{!! BaseHelper::clean($card['desc']) !!}</p>
                        @endif
                        @if ($card['button_text'] !== '')
                            <a href="{{ $card['button_url'] }}" class="btn-action tf-btn btn-white">
                                {!! BaseHelper::clean($card['button_text']) !!}
                            </a>
                        @endif
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</section>
