@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    /**
     * 4-card composite banner block (home-garden Indoor Plant Picks pattern).
     * Mirrors html/home-garden.html lines 2082-2167 (`section-banner-cls-v02`):
     *   left  : 1 tall card (banner-image-text style-top-left tl-2)  white-on-image
     *   right : 2-col grid of 2 small cards (style-20)               white-on-image
     *           + 1 wide bottom card (style-19)                       white-on-image
     *
     * Shortcode attrs (admin-driven):
     *   left_image,   left_heading,   left_subheading,   left_button_text,   left_button_url
     *   top1_image,   top1_heading,   top1_subheading,   top1_button_text,   top1_button_url
     *   top2_image,   top2_heading,   top2_subheading,   top2_button_text,   top2_button_url
     *   bottom_image, bottom_heading, bottom_subheading, bottom_button_text, bottom_button_url
     */
    $card = function (string $prefix) use ($shortcode) {
        return [
            'image'       => (string) ($shortcode->{"{$prefix}_image"} ?? ''),
            'heading'     => (string) ($shortcode->{"{$prefix}_heading"} ?? ''),
            'subheading'  => (string) ($shortcode->{"{$prefix}_subheading"} ?? ''),
            'button_text' => (string) ($shortcode->{"{$prefix}_button_text"} ?? __('Shop Now')),
            'button_url'  => (string) ($shortcode->{"{$prefix}_button_url"} ?? '#'),
        ];
    };

    $left   = $card('left');
    $top1   = $card('top1');
    $top2   = $card('top2');
    $bottom = $card('bottom');
@endphp

{{-- .section-banner-cls-v02 4-card composite layout lives in
     assets/sass/component/_inline-migrated.scss. --}}
<div class="section-banner-cls-v02">
    <div class="left">
        <div class="banner-image-text style-top-left tl-2">
            <a href="{{ $left['button_url'] ?: '#' }}" class="bn-image img-style rounded-0">
                {!! RvMedia::image($left['image'], $left['heading'], 'medium', false, ['width' => 640, 'height' => 954, 'loading' => 'lazy']) !!}
            </a>
            <div class="bn-content">
                @if ($left['heading'] !== '')
                    <a href="{{ $left['button_url'] ?: '#' }}" class="title h2 fw-medium link text-white mb-8">
                        {!! BaseHelper::clean($left['heading']) !!}
                    </a>
                @endif
                @if ($left['subheading'] !== '')
                    <p class="desc lh-26 text-white mb-24">
                        {!! BaseHelper::clean($left['subheading']) !!}
                    </p>
                @endif
                <a href="{{ $left['button_url'] ?: '#' }}" class="btn-action tf-btn small-2 btn-white">
                    <span class="text-caption-01">
                        {!! BaseHelper::clean($left['button_text']) !!}
                    </span>
                </a>
            </div>
        </div>
    </div>

    <div class="right tf-grid-layout gap-10">
        <div class="tf-grid-layout sm-col-2 gap-10">
            @foreach ([$top1, $top2] as $card)
                <div class="banner-image-text type-abs style-20">
                    <a href="{{ $card['button_url'] ?: '#' }}" class="bn-image img-style">
                        {!! RvMedia::image($card['image'], $card['heading'], 'medium', false, ['width' => 450, 'height' => 608, 'loading' => 'lazy']) !!}
                    </a>
                    <div class="bn-content wow fadeInUp">
                        @if ($card['heading'] !== '')
                            <a href="{{ $card['button_url'] ?: '#' }}" class="title h3 fw-medium link text-white mb-8">
                                {!! BaseHelper::clean($card['heading']) !!}
                            </a>
                        @endif
                        @if ($card['subheading'] !== '')
                            <p class="desc text-body-1 text-white mb-12">
                                {!! BaseHelper::clean($card['subheading']) !!}
                            </p>
                        @endif
                        <a href="{{ $card['button_url'] ?: '#' }}" class="btn-action tf-btn-line-2 style-white">
                            <span class="fw-semibold">
                                {!! BaseHelper::clean($card['button_text']) !!}
                            </span>
                        </a>
                    </div>
                </div>
            @endforeach
        </div>

        <div class="banner-image-text type-abs style-19">
            <a href="{{ $bottom['button_url'] ?: '#' }}" class="bn-image img-style">
                {!! RvMedia::image($bottom['image'], $bottom['heading'], 'medium', false, ['width' => 450, 'height' => 608, 'loading' => 'lazy']) !!}
            </a>
            <div class="bn-content wow fadeInUp">
                @if ($bottom['heading'] !== '')
                    <a href="{{ $bottom['button_url'] ?: '#' }}" class="title h3 fw-medium link text-white mb-8">
                        {!! BaseHelper::clean($bottom['heading']) !!}
                    </a>
                @endif
                @if ($bottom['subheading'] !== '')
                    <p class="desc text-body-1 text-white mb-12">
                        {!! BaseHelper::clean($bottom['subheading']) !!}
                    </p>
                @endif
                <a href="{{ $bottom['button_url'] ?: '#' }}" class="btn-action tf-btn-line-2 style-white">
                    <span class="fw-semibold">
                        {!! BaseHelper::clean($bottom['button_text']) !!}
                    </span>
                </a>
            </div>
        </div>
    </div>
</div>
