{{-- Style 4 — Full-bleed centered countdown banner. Mirrors html/home-organic.html banner-countdown-v04 layout. --}}
<div class="banner-countdown-v04">
    <div class="banner-image">
        {!! RvMedia::image($shortcode->background_image ?? null, $shortcode->heading ?? '', 'hero-banner', false, ['class' => 'w-100', 'loading' => 'lazy']) !!}
    </div>
    <div class="banner-content text-center">
        @if (! empty($shortcode->heading ?? ''))
            <h2 class="title text-white mb-8 wow fadeInUp">{!! BaseHelper::clean($shortcode->heading) !!}</h2>
        @endif
        @if (! empty($shortcode->subheading ?? ''))
            <p class="desc text-white mb-20 wow fadeInUp">{!! BaseHelper::clean($shortcode->subheading) !!}</p>
        @endif
        <div class="countdown-v01 text-white d-flex justify-content-center">
            <div class="js-countdown cd-has-zero cd-custom" data-timer="{{ $targetSeconds }}"
                data-labels="{{ __('Days') }},{{ __('Hours') }},{{ __('Mins') }},{{ __('Secs') }}">
            </div>
        </div>
        @if (! empty($shortcode->button_text ?? ''))
            <a href="{{ $shortcode->button_url ?: '#' }}" class="tf-btn btn-white">
                {!! BaseHelper::clean($shortcode->button_text) !!}
            </a>
        @endif
    </div>
</div>
