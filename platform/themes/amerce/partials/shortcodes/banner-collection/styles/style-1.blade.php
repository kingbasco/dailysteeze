<div class="container">
    <div class="banner-collect-v01 position-relative radius-10 overflow-hidden">
        <div class="banner-image">
            {!! RvMedia::image($shortcode->image ?? null, $shortcode->heading ?? '', 'hero-banner', false, ['class' => 'w-100', 'loading' => 'lazy']) !!}
        </div>
        <div class="banner-content position-absolute top-50 start-50 translate-middle text-center">
            @if (! empty($shortcode->badge_text ?? ''))
                <span class="badge mb-15"
                    @if (! empty($shortcode->badge_color ?? '')) style="background-color: {{ $shortcode->badge_color }}; color:#fff;" @endif>
                    {!! BaseHelper::clean($shortcode->badge_text) !!}
                </span>
            @endif
            @if (! empty($shortcode->subheading ?? ''))
                <p class="sub-text text-body-1 text-white mb-10">{!! BaseHelper::clean($shortcode->subheading) !!}</p>
            @endif
            @if (! empty($shortcode->heading ?? ''))
                <h2 class="heading fw-medium text-white">{!! BaseHelper::clean($shortcode->heading) !!}</h2>
            @endif
            @if (! empty($shortcode->button_text ?? ''))
                <a href="{{ $shortcode->button_url ?: '#' }}" class="tf-btn btn-white animate-hover-btn radius-3 mt-30">
                    <span>{!! BaseHelper::clean($shortcode->button_text) !!}</span>
                </a>
            @endif
        </div>
    </div>
</div>
