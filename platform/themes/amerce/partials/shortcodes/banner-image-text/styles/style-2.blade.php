@php
    $textColor = $shortcode->text_color ?? '';
@endphp

<div class="container">
    <div class="banner-image-text style-text-left">
        <div class="row align-items-center gy-30">
            <div class="col-lg-6 order-lg-1 order-2">
                <div class="banner-content" @if ($textColor) style="color: {{ $textColor }};" @endif>
                    @if (! empty($shortcode->heading ?? ''))
                        <h2 class="heading fw-medium">{!! BaseHelper::clean($shortcode->heading) !!}</h2>
                    @endif
                    @if (! empty($shortcode->subheading ?? ''))
                        <p class="subheading text-body-1 mt-15">{!! BaseHelper::clean($shortcode->subheading) !!}</p>
                    @endif
                    @if (! empty($shortcode->button_text ?? ''))
                        <a href="{{ $shortcode->button_url ?: '#' }}" class="tf-btn btn-fill animate-hover-btn radius-3 mt-30">
                            <span>{!! BaseHelper::clean($shortcode->button_text) !!}</span>
                        </a>
                    @endif
                </div>
            </div>
            <div class="col-lg-6 order-lg-2 order-1">
                <div class="banner-image">
                    {!! RvMedia::image($shortcode->image, $shortcode->heading ?? '', 'medium', false, ['class' => 'w-100', 'loading' => 'lazy']) !!}
                </div>
            </div>
        </div>
    </div>
</div>
