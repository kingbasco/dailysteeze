@php
    use Botble\Base\Facades\BaseHelper;

    $heading   = (string) ($shortcode->heading ?? '');
    $subtitle  = (string) ($shortcode->subtitle ?? '');
    $homeLabel = (string) ($shortcode->home_label ?? __('Home'));
@endphp

<section {!! $shortcode->htmlAttributes() !!} class="section-page-title text-center flat-spacing-2 pb-0">
    <div class="container">
        <div class="main-page-title">
            <div class="breadcrumbs">
                <a href="{{ url('/') }}" class="text-caption-01 cl-text-3 link">{{ $homeLabel }}</a>
                <i class="icon icon-CaretRightThin cl-text-3"></i>
                <p class="text-caption-01">{{ $heading }}</p>
            </div>
            @if ($heading)
                <h3>{{ $heading }}</h3>
            @endif
            @if ($subtitle)
                <p class="text-body-1 cl-text-2">{!! BaseHelper::clean($subtitle) !!}</p>
            @endif
        </div>
    </div>
</section>
