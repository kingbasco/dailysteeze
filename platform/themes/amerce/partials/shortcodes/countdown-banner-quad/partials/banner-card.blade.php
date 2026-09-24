@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;
@endphp

<div class="banner-image-text type-abs style-13">
    <a href="{{ $b['button_url'] }}" class="bn-image img-style">
        {!! RvMedia::image($b['image'], $b['title'] ?: '', 'medium', false, ['width' => 654, 'height' => 436, 'loading' => 'lazy']) !!}
    </a>
    <div class="bn-content wow fadeInUp">
        @if ($b['overline'] !== '')
            <h6 class="desc text-primary mb-0">{!! BaseHelper::clean($b['overline']) !!}</h6>
        @endif
        @if ($b['title'] !== '')
            <a href="{{ $b['button_url'] }}" class="title h3 fw-medium link">{!! BaseHelper::clean($b['title']) !!}</a>
        @endif
        @if ($b['button_text'] !== '')
            <a href="{{ $b['button_url'] }}" class="btn-action tf-btn btn-white">
                {!! BaseHelper::clean($b['button_text']) !!}
            </a>
        @endif
    </div>
</div>
