@php
    // banner-countdown-v01 — single-row banner with countdown timer.
    // Variations from HTML demos (passed via shortcode attributes):
    //   - background_class : 'bg-primary' (HomePod) | 'bg-dark' (Jewelry) | '' (default)
    //   - style_modifier   : 'style-2' (Jewelry) | 'style-3' (Furniture) | 'style-4' (Construct) | ''
    //   - container_class  : 'container-2' (HomePod) | 'container-full' (Jewelry) | 'container' (default)
    //   - show_image       : 'yes' if HTML uses banner-img inside (Construct style-4)
    //   - outer_spacing_class : optional outer wrapper class. HomeJewelry §2 demo
    //                        (html/home-jewelry.html L1712) wraps the banner in
    //                        `<div class="flat-spacing">`. Allowlist: 'flat-spacing',
    //                        'flat-spacing-2', '' (default — no wrapper, back-compat).
    $bgClass = trim((string) ($shortcode->background_class ?? ''));
    $styleModifier = trim((string) ($shortcode->style_modifier ?? ''));
    $containerClass = trim((string) ($shortcode->container_class ?? 'container'));
    $showImage = ($shortcode->show_image ?? '') === 'yes';
    $isInlineImageStyle = $showImage && $styleModifier === 'style-4';
    $isDark = $bgClass !== '' || $styleModifier !== '' || $showImage;
    $textColorClass = $isDark ? 'text-white' : '';
    $btnClass = $isDark ? 'tf-btn btn-white' : 'tf-btn btn-fill animate-hover-btn radius-3';
    $outerClass = trim('banner-countdown-v01 ' . $styleModifier . ' ' . $bgClass . ($isInlineImageStyle ? '' : ' wow fadeInUp'));
    $backgroundImage = $inlineBackgroundImage ?? ($shortcode->background_image ?? null);

    $outerSpacingAllowed = ['flat-spacing', 'flat-spacing-2', ''];
    $outerSpacingClass = trim((string) ($shortcode->outer_spacing_class ?? ''));
    $outerSpacingClass = in_array($outerSpacingClass, $outerSpacingAllowed, true) ? $outerSpacingClass : '';
    // Skip the extra wrapper for style-4 (inline-image), which already emits its
    // own `flat-spacing` wrap via $isInlineImageStyle below.
    $emitOuterSpacing = $outerSpacingClass !== '' && ! $isInlineImageStyle;
@endphp

@if ($emitOuterSpacing)
<div class="{{ $outerSpacingClass }}">
@endif
@if ($isInlineImageStyle)
<div class="{{ trim($containerClass . ' flat-spacing') }}">
@endif
<div class="{{ $outerClass }}">
    @if ($showImage && ! empty($backgroundImage))
        <div class="banner-img">
            {!! RvMedia::image($backgroundImage, $shortcode->heading ?? '', $isInlineImageStyle ? null : 'hero-banner', false, ['class' => 'img-cover', 'loading' => 'lazy']) !!}
        </div>
    @endif
    @if (! $isInlineImageStyle)
    <div class="{{ $containerClass }}">
    @endif
        <div class="content">
            <div class="col-left">
                @if (! empty($shortcode->heading ?? ''))
                    <h2 class="{{ $textColorClass }} mb-8">{!! BaseHelper::clean($shortcode->heading) !!}</h2>
                @endif
                @if (! empty($shortcode->subheading ?? ''))
                    <p class="text-body-1 {{ $isDark ? 'text-white' : 'cl-text-2' }}">{!! BaseHelper::clean($shortcode->subheading) !!}</p>
                @endif
            </div>
            <div class="countdown-v01 {{ $textColorClass }}">
                <div class="js-countdown cd-has-zero cd-custom" data-timer="{{ $targetSeconds }}"
                    data-labels="{{ __('Days') }},{{ __('Hours') }},{{ __('Mins') }},{{ __('Secs') }}">
                </div>
            </div>
            @if (! empty($shortcode->button_text ?? ''))
                <a href="{{ $shortcode->button_url ?: '#' }}" class="{{ $btnClass }}">
                    {!! BaseHelper::clean($shortcode->button_text) !!}
                </a>
            @endif
        </div>
    @if (! $isInlineImageStyle)
    </div>
    @endif
</div>
@if ($isInlineImageStyle)
</div>
@endif
@if ($emitOuterSpacing)
</div>
@endif
