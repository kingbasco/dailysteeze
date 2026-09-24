@php
    use Botble\Base\Facades\BaseHelper;

    /**
     * Centered text-only callout — no image. Mirrors home-headphone.html §2
     * `section-about flat-spacing-6` (lines 1458-1474): small red overline
     * (`h6 text-primary`) + large h3 quote + black pill CTA (tf-btn animate-btn).
     */
    $overline = trim((string) ($shortcode->heading ?? ''));   // e.g. "TRUE SOUND" red label
    $quote    = trim((string) ($shortcode->subheading ?? '')); // large h3 centered text
    $btnText  = trim((string) ($shortcode->button_text ?? ''));
    $btnUrl   = $shortcode->button_url ?: '#';
@endphp

<div class="section-about flat-spacing-6">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-10 text-center">
                @if ($overline !== '')
                    <p class="h6 text-primary fw-semibold mb-16">{!! BaseHelper::clean($overline) !!}</p>
                @endif
                @if ($quote !== '')
                    <p class="h3 fw-medium mb-40 text-capitalize">{!! BaseHelper::clean($quote) !!}</p>
                @endif
                @if ($btnText !== '')
                    <a href="{{ $btnUrl }}" class="tf-btn animate-btn mx-auto">
                        {!! BaseHelper::clean($btnText) !!}
                    </a>
                @endif
            </div>
        </div>
    </div>
</div>
