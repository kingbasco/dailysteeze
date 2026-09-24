@php
    $first = $slides[0] ?? null;
@endphp

<div class="tf-slideshow furniture-parallax">
    @if ($first)
        <div class="banner-image-parallax parallaxie"
            data-bg="{{ RvMedia::getImageUrl($first['image'] ?? null, 'hero-banner') }}">
            <div class="container">
                <div class="content text-center">
                    @if (! empty($first['subtitle']))
                        <p class="sub-text_sld text-body-1 text-white mb-15">
                            {!! BaseHelper::clean($first['subtitle']) !!}
                        </p>
                    @endif
                    @if (! empty($first['title']))
                        <h1 class="title_sld fw-medium text-white">
                            {!! BaseHelper::clean($first['title']) !!}
                        </h1>
                    @endif
                    @if (! empty($first['button_text']))
                        <a href="{{ $first['button_url'] ?? '#' }}" class="tf-btn btn-white animate-hover-btn radius-3 mt-30">
                            <span>{!! BaseHelper::clean($first['button_text']) !!}</span>
                        </a>
                    @endif
                </div>
            </div>
        </div>
    @endif
</div>
