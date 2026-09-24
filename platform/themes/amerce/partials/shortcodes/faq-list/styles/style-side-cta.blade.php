@php
    /**
     * Mirrors html/home-electronics.html §10 (lines 4588-4683): two-column FAQ.
     * LEFT col = sect-heading type-3 (h1 + desc + Shop Now CTA). RIGHT col =
     * `faq-accordion_item` custom accordion (5 items, first open by default).
     *
     * Heading + subheading + button_text/url come from shortcode attrs. Question
     * answers seeded via the FAQ plugin.
     */
    $heading    = trim((string) ($shortcode->title ?? ''));
    $subtitle   = trim((string) ($shortcode->subtitle ?? ''));
    $buttonText = trim((string) ($shortcode->button_text ?? ''));
    $buttonUrl  = trim((string) ($shortcode->button_url ?? '')) ?: '#';
@endphp

{{-- .faq-accordion_item padding/typography overrides live in
     assets/sass/component/_inline-migrated.scss. --}}
<div class="row gy-30">
    <div class="col-lg-6 col-xl-5">
        <div class="sect-heading type-3">
            @if ($heading !== '')
                <h2 class="font-red_hat fw-semibold letter-space-0">{!! BaseHelper::clean(nl2br($heading)) !!}</h2>
            @endif
            @if ($subtitle !== '')
                <p class="s-desc text-body-1 cl-text-2 mt-15">{!! BaseHelper::clean(nl2br($subtitle)) !!}</p>
            @endif
            @if ($buttonText !== '')
                <a href="{{ $buttonUrl }}" class="tf-btn animate-btn mt-30">
                    {!! BaseHelper::clean($buttonText) !!}
                </a>
            @endif
        </div>
    </div>
    <div class="col-lg-6 col-xl-6 offset-xl-1">
        <div class="d-grid gap-16" id="faq-accordion">
            @forelse ($faqs as $i => $faq)
                @php $itemId = $uid . '-item-' . $i; @endphp
                <div class="faq-accordion_item">
                    <div class="accordion-action h5 text-capitalize letter-space-05 cs-pointer d-flex align-items-center justify-content-between @if ($i !== 0) collapsed @endif"
                        data-bs-toggle="collapse"
                        data-bs-target="#{{ $itemId }}-collapse"
                        aria-expanded="{{ $i === 0 ? 'true' : 'false' }}"
                        aria-controls="{{ $itemId }}-collapse">
                        <span class="fw-semibold cl-text-1">{!! BaseHelper::clean($faq->question) !!}</span>
                        <span class="icon ic-accordion-custom cl-2"></span>
                    </div>
                    <div id="{{ $itemId }}-collapse"
                        class="collapse @if ($i === 0) show @endif"
                        data-bs-parent="#faq-accordion">
                        <div class="faq-content cl-text-2 text-body-1">
                            {!! BaseHelper::clean($faq->answer) !!}
                        </div>
                    </div>
                </div>
            @empty
                <p class="text-muted">{{ __('No FAQs found.') }}</p>
            @endforelse
        </div>
    </div>
</div>
