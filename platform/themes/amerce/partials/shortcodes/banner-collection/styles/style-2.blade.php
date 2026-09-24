<div class="container">
    <div class="banner-collect-v02">
        <div class="row align-items-center gy-30">
            <div class="col-lg-6">
                <div class="banner-image radius-10 overflow-hidden">
                    {!! RvMedia::image($shortcode->image ?? null, $shortcode->heading ?? '', 'medium', false, ['class' => 'w-100', 'loading' => 'lazy']) !!}
                </div>
            </div>
            <div class="col-lg-6">
                <div class="content">
                    @if (! empty($shortcode->badge_text ?? ''))
                        <span class="badge mb-15"
                            @if (! empty($shortcode->badge_color ?? '')) style="background-color: {{ $shortcode->badge_color }}; color:#fff;" @endif>
                            {!! BaseHelper::clean($shortcode->badge_text) !!}
                        </span>
                    @endif
                    @if (! empty($shortcode->heading ?? ''))
                        <h2 class="heading fw-medium">{!! BaseHelper::clean($shortcode->heading) !!}</h2>
                    @endif
                    @if (! empty($shortcode->subheading ?? ''))
                        <p class="sub-text text-body-1 cl-text-2 mt-15">{!! BaseHelper::clean($shortcode->subheading) !!}</p>
                    @endif
                    @if (! empty($shortcode->button_text ?? ''))
                        <a href="{{ $shortcode->button_url ?: '#' }}" class="tf-btn btn-fill animate-hover-btn radius-3 mt-30">
                            <span>{!! BaseHelper::clean($shortcode->button_text) !!}</span>
                        </a>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>
