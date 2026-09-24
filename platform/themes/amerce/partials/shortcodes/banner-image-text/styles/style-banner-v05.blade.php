@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    /**
     * Centered clip-text banner with a product PNG (`banner-v05`).
     * Mirrors html/home-headphone.html lines 2916-2945:
     *   `<div class="container flat-spacing"><div class="row"><div class="col-lg-10 mx-auto">
     *    <div class="banner-v05 text-center">` — `bn_image` (big clip-text headline +
     *   centered 454x331 product png) + `bn_content` (h3 title + desc + tf-btn animate-btn).
     *
     * This style emits its OWN `container flat-spacing` wrapper, so the parent
     * index must NOT add the default section wrapper (see $skipWrapper in index.blade.php).
     *
     * Knobs:
     *   heading      — h3 title
     *   subheading   — desc paragraph
     *   button_text  — CTA label
     *   button_url   — CTA href (default '#')
     *   image        — centered product png (454x331, non-square → RvMedia false)
     *   clip_text    — big clip-text-bg headline (default: empty)
     *
     * @var \Botble\Shortcode\Compilers\Shortcode $shortcode
     */
    $heading    = trim((string) ($shortcode->heading ?? ''));
    $subheading = trim((string) ($shortcode->subheading ?? ''));
    $buttonText = trim((string) ($shortcode->button_text ?? ''));
    $buttonUrl  = $shortcode->button_url ?: '#';
    $image      = trim((string) ($shortcode->image ?? ''));
    $clipText   = trim((string) ($shortcode->clip_text ?? ''));
@endphp

<div class="container flat-spacing">
    <div class="row">
        <div class="col-lg-10 mx-auto">
            <div class="banner-v05 text-center">
                <div class="bn_image">
                    @if ($clipText !== '')
                        <p class="text-color-image clip-text-bg-vertical">{!! BaseHelper::clean($clipText) !!}</p>
                    @endif
                    @if ($image !== '')
                        <div class="image">
                            {{-- Original image (454x331) — NOT `medium` (800x800 square), which
                                 makes the img render square (height:auto follows the file aspect). --}}
                            {!! RvMedia::image($image, $heading ?: ($clipText ?: __('Banner')), null, false, ['width' => 454, 'height' => 331, 'loading' => 'lazy']) !!}
                        </div>
                    @endif
                </div>
                <div class="bn_content">
                    @if ($heading !== '')
                        <h3 class="title">{!! nl2br(BaseHelper::clean($heading)) !!}</h3>
                    @endif
                    @if ($subheading !== '')
                        <p class="desc cl-text-2">{!! nl2br(BaseHelper::clean($subheading)) !!}</p>
                    @endif
                    @if ($buttonText !== '')
                        <a href="{{ $buttonUrl }}" class="tf-btn animate-btn">
                            {!! BaseHelper::clean($buttonText) !!}
                        </a>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>
