{{-- Style 3 — banner-countdown-v03. Mirrors HomeCosmetic "Glow On Sale" demo.
     Full-bleed image with overlay text panel (heading + desc + countdown + CTA). --}}
<div class="banner-countdown-v03 flat-spacing">
    <div class="banner-image">
        {!! RvMedia::image($shortcode->background_image ?? null, $shortcode->heading ?? '', 'hero-banner', false, ['class' => 'w-100', 'loading' => 'lazy']) !!}
    </div>
    <div class="container position-relative z-3">
        <div class="banner-content wow fadeInUp">
            @if (! empty($shortcode->heading ?? ''))
                <h1 class="title text-white">{!! BaseHelper::clean($shortcode->heading) !!}</h1>
            @endif
            @if (! empty($shortcode->subheading ?? ''))
                <p class="desc text-white text-body-1">{!! BaseHelper::clean($shortcode->subheading) !!}</p>
            @endif
            <div class="countdown-v02 full-white">
                <div class="js-countdown cd-has-zero cd-custom" data-timer="{{ $targetSeconds }}"
                    data-labels="{{ __('Days') }},{{ __('Hours') }},{{ __('Mins') }},{{ __('Secs') }}">
                </div>
            </div>
            @if (! empty($shortcode->button_text ?? ''))
                <a href="{{ $shortcode->button_url ?: '#' }}" class="btn-action tf-btn btn-white">
                    <span>{!! BaseHelper::clean($shortcode->button_text) !!}</span>
                </a>
            @endif
        </div>
    </div>
</div>
