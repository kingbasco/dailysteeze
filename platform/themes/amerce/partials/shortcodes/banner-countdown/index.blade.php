@php
    $allowed = ['style-1', 'style-2', 'style-3', 'style-4'];
    $style = in_array($shortcode->style ?? '', $allowed, true) ? $shortcode->style : 'style-1';
    // Compute seconds-to-target server-side; JS just decrements.
    $targetSeconds = 0;
    if (! empty($shortcode->target_date ?? '')) {
        try {
            $target = \Carbon\Carbon::parse($shortcode->target_date);
            // Carbon 3 returns signed diffs; clamp to >= 0 (past dates count as expired).
            $targetSeconds = (int) max(0, now()->diffInSeconds($target));
        } catch (\Throwable $e) {
            $targetSeconds = 0;
        }
    }

    $inlineBackgroundImage = null;
    if (
        $style === 'style-1'
        && ($shortcode->show_image ?? '') === 'yes'
        && ! empty($shortcode->background_image ?? '')
    ) {
        $inlineBackgroundImage = $shortcode->background_image;
        $shortcode->background_image = null;
    }
@endphp

<section {!! $shortcode->htmlAttributes() !!} class="tf-section banner-countdown banner-countdown-{{ $style }}">
    @include(Theme::getThemeNamespace("partials.shortcodes.banner-countdown.styles.$style"), [
        'shortcode'     => $shortcode,
        'targetSeconds' => $targetSeconds,
        'inlineBackgroundImage' => $inlineBackgroundImage,
    ])
</section>
