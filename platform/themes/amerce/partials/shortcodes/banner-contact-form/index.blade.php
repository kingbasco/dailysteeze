@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;
    use Botble\Shortcode\Facades\Shortcode;

    $imageUrl = RvMedia::getImageUrl($shortcode->image);
    $bannerTitle = $shortcode->title;
    $bannerSubtitle = $shortcode->subtitle;
    $buttonText = $shortcode->button_text;
    $buttonUrl = $shortcode->button_url;

    $contactTitle = $shortcode->contact_title ?: __('Contact Us');
    $contactSubtitle = $shortcode->contact_subtitle;
@endphp

<section class="section-cta bare-section flat-spacing pt-0">
    <div class="container">
        <div class="row gy-4">
            <div class="col-lg-6">
                <div class="banner-image-text type-abs style-9 h-100">
                    <a href="{{ $buttonUrl ?: '#' }}" class="bn-image img-style">
                        <img loading="lazy" width="690" height="620" src="{{ $imageUrl }}" alt="{{ BaseHelper::clean($bannerTitle) }}">
                    </a>
                    <div class="bn-content wow fadeInUp">
                        <a href="{{ $buttonUrl ?: '#' }}" class="title h3 fw-medium text-white link">
                            {!! nl2br(BaseHelper::clean($bannerTitle)) !!}
                        </a>
                        @if ($bannerSubtitle)
                            <p class="desc text-white text-body-1">
                                {!! BaseHelper::clean($bannerSubtitle) !!}
                            </p>
                        @endif
                        @if ($buttonText)
                            <a href="{{ $buttonUrl ?: '#' }}" class="btn-action tf-btn btn-white">
                                {!! BaseHelper::clean($buttonText) !!}
                            </a>
                        @endif
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="form-cta">
                    <div class="heading">
                        <h3 class="">{!! BaseHelper::clean($contactTitle) !!}</h3>
                        @if ($contactSubtitle)
                            <p class="text-body-1 cl-text-2">{!! BaseHelper::clean($contactSubtitle) !!}</p>
                        @endif
                    </div>
                    <div class="form-content">
                        {!! Shortcode::compile('[contact-form][/contact-form]')->toHtml() !!}
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
