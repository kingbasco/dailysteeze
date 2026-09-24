@php
    /**
     * Section heading partial — emits the theme's native `sect-heading type-2`
     * markup (h3 `.s-title` + p `.s-desc`), matching the demo design
     * system. The previous `tf-section-title` markup rendered an oversized bold
     * <h2> (`.tf-section-title__title{font-weight:700}`); every demo uses the
     * lighter <h3 class="s-title">.
     *
     * Params: title, subtitle, align (left|center|right).
     */
    $title    = $title    ?? '';
    $subtitle = $subtitle ?? '';
    $align    = in_array($align ?? 'center', ['left', 'center', 'right'], true) ? $align : 'center';
@endphp

@if ($title || $subtitle)
    <div class="sect-heading type-2 text-{{ $align }} wow fadeInUp">
        @if ($title)
            {{-- BaseHelper::clean keeps demo `<br>` line breaks in headings. --}}
            <h3 class="s-title">{!! \Botble\Base\Facades\BaseHelper::clean($title) !!}</h3>
        @endif
        @if ($subtitle)
            <p class="s-desc text-body-1 cl-text-2">{!! \Botble\Base\Facades\BaseHelper::clean($subtitle) !!}</p>
        @endif
    </div>
@endif
