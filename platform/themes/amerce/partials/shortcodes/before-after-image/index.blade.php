@php
    /**
     * Before/after image-compare shortcode.
     *
     * Styles:
     *   style-default — single centered heading + draggable compare slider with
     *                   Before/After labels (original behavior, unchanged).
     *   style-2       — full-bleed dual-caption layout, NO draggable handle, NO
     *                   Before/After labels. Mirrors html/home-headphone.html
     *                   lines 2947-2966: `container-full > banner-image-compare
     *                   style-2 > img-viewer-compare-wrap image-compare` (two
     *                   img-comp) + `wrap-content` (LEFT + RIGHT captions).
     *
     * @var \Botble\Shortcode\Compilers\Shortcode $shortcode
     */
    $allowed = ['style-default', 'style-2'];
    $style = in_array($shortcode->style ?? '', $allowed, true) ? $shortcode->style : 'style-default';

    $beforeImage  = $shortcode->before_image ?? '';
    $afterImage   = $shortcode->after_image ?? '';
    $heading      = $shortcode->heading ?? '';
    $subheading   = $shortcode->subheading ?? '';
    $beforeLabel  = $shortcode->before_label ?: __('Before');
    $afterLabel   = $shortcode->after_label  ?: __('After');
    $orientation  = in_array($shortcode->orientation ?? '', ['horizontal', 'vertical'], true)
        ? $shortcode->orientation
        : 'horizontal';
    $sliderColor  = $shortcode->slider_color ?: '#ffffff';
    $position     = (int) ($shortcode->slider_position_percent ?? 50);
    $position     = max(0, min(100, $position));

    // style-2 dual-caption knobs.
    $leftHeading  = trim((string) ($shortcode->left_heading ?? ''));
    $leftDesc     = trim((string) ($shortcode->left_desc ?? ''));
    $rightHeading = trim((string) ($shortcode->right_heading ?? ''));
    $rightDesc    = trim((string) ($shortcode->right_desc ?? ''));

    // Bail-out: without both images the slider has nothing to compare. Render
    // an admin-only hint so editors notice the misconfiguration in the page builder.
    $missingImages = empty($beforeImage) || empty($afterImage);
@endphp

@if ($missingImages)
    @if (function_exists('is_in_admin') && is_in_admin())
        <div class="container">
            <div class="alert alert-warning text-center">
                {{ __('Please choose both a before and an after image.') }}
            </div>
        </div>
    @endif
@elseif ($style === 'style-2')
    {{-- home-headphone §7: full-bleed dual-caption compare. The image-compare-viewer
         JS sizes the wrapper to the first image's natural dimensions — no forced
         aspect-ratio (matches the demo, which only constrains .img-comp on mobile
         via the shared theme CSS). --}}
    <div class="container-full">
        <div {!! $shortcode->htmlAttributes() !!} class="banner-image-compare style-2">
            <div class="img-viewer-compare-wrap image-compare wow fadeIn" id="image-compare">
                {{-- Original images — NOT a cropped RvMedia size; the compare art is a
                     wide banner and must render at its natural aspect. --}}
                {!! RvMedia::image($beforeImage, $leftHeading ?: __('Before'), null, false, ['class' => 'img-comp', 'loading' => 'lazy', 'width' => 1920, 'height' => 720]) !!}
                {!! RvMedia::image($afterImage, $rightHeading ?: __('After'), null, false, ['class' => 'img-comp', 'loading' => 'lazy', 'width' => 1920, 'height' => 720]) !!}
            </div>
            <div class="wrap-content d-flex justify-content-between">
                <div class="content text-start">
                    @if ($leftHeading !== '')
                        <h3 class="text-white mb-10">{!! BaseHelper::clean($leftHeading) !!}</h3>
                    @endif
                    @if ($leftDesc !== '')
                        <p class="text-white">{!! BaseHelper::clean($leftDesc) !!}</p>
                    @endif
                </div>
                <div class="content text-end">
                    @if ($rightHeading !== '')
                        <h3 class="text-white mb-10">{!! BaseHelper::clean($rightHeading) !!}</h3>
                    @endif
                    @if ($rightDesc !== '')
                        <p class="text-white">{!! BaseHelper::clean($rightDesc) !!}</p>
                    @endif
                </div>
            </div>
        </div>
    </div>
@else
    @if (! empty($heading) || ! empty($subheading))
        <div class="container">
            <div class="before-after-heading text-center">
                @if (! empty($heading))
                    <h2 class="heading fw-medium">{!! BaseHelper::clean($heading) !!}</h2>
                @endif
                @if (! empty($subheading))
                    <p class="subheading text-body-1 mt-10">{!! BaseHelper::clean($subheading) !!}</p>
                @endif
            </div>
        </div>
    @endif

    {{-- .banner-image-compare aspect-ratio clamp (1920 / 720) lives in
         assets/sass/component/_inline-migrated.scss. Init handled by
         image-compare-viewer.js (class-based). --}}
    <div
        {!! $shortcode->htmlAttributes() !!}
        class="banner-image-compare img-viewer-compare-wrap image-compare wow fadeIn"
        data-orientation="{{ $orientation }}"
        data-control-color="{{ $sliderColor }}"
        data-start-position="{{ $position }}"
        data-label-before="{{ $beforeLabel }}"
        data-label-after="{{ $afterLabel }}"
    >
        {!! RvMedia::image($beforeImage, $beforeLabel, 'hero-banner', false, ['class' => 'img-comp', 'loading' => 'lazy', 'width' => 1920, 'height' => 720]) !!}
        {!! RvMedia::image($afterImage, $afterLabel, 'hero-banner', false, ['class' => 'img-comp', 'loading' => 'lazy', 'width' => 1920, 'height' => 720]) !!}
    </div>
@endif
