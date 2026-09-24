{{-- Style 2 — banner-countdown-v02. Mirrors HomePod #8 "Up To 50% Off Christmas" demo.
     Image-LEFT + text-CENTER + (optional) image-RIGHT three-column layout. --}}
<div class="banner-countdown-v02">
    <div class="banner-image">
        {!! RvMedia::image($shortcode->background_image ?? null, $shortcode->heading ?? '', 'hero-banner', false, ['class' => 'w-100', 'loading' => 'lazy']) !!}
    </div>
    <div class="banner-content text-center flat-spacing">
        @if (! empty($shortcode->subheading ?? ''))
            <h5 class="sub text-white wow fadeInUp">{!! BaseHelper::clean($shortcode->subheading) !!}</h5>
        @endif
        @if (! empty($shortcode->heading ?? ''))
            <h2 class="title text-white letter-space-4 wow fadeInUp">{!! BaseHelper::clean($shortcode->heading) !!}</h2>
        @endif
        <div class="countdown-v02 text-white wow fadeInUp">
            <div class="js-countdown cd-has-zero cd-custom" data-timer="{{ $targetSeconds }}"
                data-labels="{{ __('Days') }},{{ __('Hours') }},{{ __('Mins') }},{{ __('Secs') }}">
            </div>
        </div>
        @if (! empty($shortcode->button_text ?? ''))
            <div class="wow fadeInUp">
                <a href="{{ $shortcode->button_url ?: '#' }}" class="tf-btn btn-white">
                    {!! BaseHelper::clean($shortcode->button_text) !!}
                </a>
            </div>
        @endif
    </div>
    @if (! empty($shortcode->background_image_2 ?? ''))
        <div class="banner-image">
            {!! RvMedia::image($shortcode->background_image_2, $shortcode->heading ?? '', 'hero-banner', false, ['class' => 'w-100', 'loading' => 'lazy']) !!}
        </div>
    @endif
</div>
