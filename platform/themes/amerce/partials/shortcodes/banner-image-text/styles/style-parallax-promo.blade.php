@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    /**
     * banner-image-text style-parallax-promo — wide promo banner with parallax
     * background and CENTERED white content overlay.
     *
     * Mirrors html/home-decor.html §8 (lines 2244-2270): `<div class="flat-spacing">
     * <div class="container"><div class="banner-image-text type-abs style-10
     * parallaxie" style="background-image: url(...)">` with an opacity-0 img
     * (height anchor) + `<div class="bn-content align-items-center text-center
     * wow fadeInUp">` containing mini-title → heading link → desc → button.
     *
     * All copy is text-white. Button is `tf-btn btn-white style-2`.
     *
     * Shortcode attrs:
     *   image       — background image (required)
     *   mini_title  — small uppercase eyebrow (e.g. "Summer 2025 Sale Event")
     *   heading     — large h2 link (e.g. "Enjoy Up To 50% Off")
     *   subheading  — desc paragraph
     *   button_text — CTA label
     *   button_url  — link target
     */
    $imageUrl  = $shortcode->image ? RvMedia::getImageUrl($shortcode->image) : null;
    $miniTitle = trim((string) ($shortcode->mini_title ?? ''));
    $heading   = (string) ($shortcode->heading ?? '');
    $subheading = (string) ($shortcode->subheading ?? '');
    $buttonText = (string) ($shortcode->button_text ?? '');
    $buttonUrl  = $shortcode->button_url ?: '#';
@endphp

<div class="flat-spacing">
    <div class="container">
        <div class="banner-image-text type-abs style-10 parallaxie"
             @if ($imageUrl) style='background-image: url("{{ $imageUrl }}")' @endif>
            <a href="{{ $buttonUrl }}" class="bn-image img-style">
                @if ($imageUrl)
                    <img class="opacity-0" loading="lazy" width="1410" height="480"
                         src="{{ $imageUrl }}" alt="{{ $heading ?: '' }}">
                @endif
            </a>
            <div class="bn-content align-items-center text-center wow fadeInUp">
                @if ($miniTitle !== '')
                    <p class="mini-title fw-semibold text-white">
                        {!! BaseHelper::clean($miniTitle) !!}
                    </p>
                @endif
                @if ($heading !== '')
                    <a href="{{ $buttonUrl }}" class="title h2 fw-medium text-white link">
                        {!! BaseHelper::clean($heading) !!}
                    </a>
                @endif
                @if ($subheading !== '')
                    <p class="desc text-white text-body-1">
                        {!! BaseHelper::clean($subheading) !!}
                    </p>
                @endif
                @if ($buttonText !== '')
                    <a href="{{ $buttonUrl }}" class="btn-action tf-btn btn-white style-2">
                        {!! BaseHelper::clean($buttonText) !!}
                    </a>
                @endif
            </div>
        </div>
    </div>
</div>
