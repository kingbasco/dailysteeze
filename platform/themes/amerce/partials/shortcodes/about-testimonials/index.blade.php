@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;
    use Botble\Shortcode\Facades\Shortcode;

    $heading  = (string) ($shortcode->heading ?? '');
    $subtitle = (string) ($shortcode->subtitle ?? '');
    $verifiedLabel = (string) ($shortcode->verified_label ?? __('Verified Buyer'));
    $items    = Shortcode::fields()->getTabsData(['image', 'name', 'text'], $shortcode);

    $resolveImage = static fn (?string $path): string =>
        $path ? RvMedia::getImageUrl($path, null, false, RvMedia::getDefaultImage()) : RvMedia::getDefaultImage();
@endphp

{{-- .testimonial-v01 image sizing rules live in
     assets/sass/component/_inline-migrated.scss. --}}
<section {!! $shortcode->htmlAttributes() !!} class="flat-spacing">
    <div class="container">
        @if ($heading || $subtitle)
            <div class="sect-heading type-2 text-center">
                @if ($heading)<h3 class="s-title">{{ $heading }}</h3>@endif
                @if ($subtitle)<p class="s-desc text-body-1 cl-text-2">{!! BaseHelper::clean($subtitle) !!}</p>@endif
            </div>
        @endif
        <div dir="ltr" class="swiper tf-swiper"
             data-preview="2" data-tablet="2" data-mobile-sm="1" data-mobile="1"
             data-space-lg="60" data-space-md="30" data-space="15"
             data-pagination="1" data-pagination-sm="2" data-pagination-md="2" data-pagination-lg="2">
            <div class="swiper-wrapper">
                @foreach ($items as $tes)
                    <div class="swiper-slide">
                        <div class="testimonial-v01 style-1 style-def">
                            @if (! empty($tes['image']))
                                <div class="tes-image">
                                    <img loading="lazy" width="285" height="380" src="{{ $resolveImage($tes['image']) }}" alt="{{ $tes['name'] ?? '' }}">
                                </div>
                            @endif
                            <div class="tes-content">
                                <div class="star-wrap d-flex align-items-center">
                                    @for ($s = 0; $s < 5; $s++)
                                        <i class="icon icon-Star fs-24"></i>
                                    @endfor
                                </div>
                                <div class="tes_author">
                                    @if (! empty($tes['name']))
                                        <p class="author-name h5 fw-medium">{{ $tes['name'] }}</p>
                                    @endif
                                    <div class="br-line"></div>
                                    <div class="author-verified">
                                        <i class="icon icon-CheckCircle1"></i>
                                        <span class="cl-text-2">{{ $verifiedLabel }}</span>
                                    </div>
                                </div>
                                @if (! empty($tes['text']))
                                    <p class="tes_text h6">{!! BaseHelper::clean($tes['text']) !!}</p>
                                @endif
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
            <div class="sw-line-default style-2 tf-sw-pagination"></div>
        </div>
    </div>
</section>
