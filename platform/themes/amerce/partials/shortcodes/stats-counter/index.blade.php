@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;
    use Botble\Shortcode\Facades\Shortcode;

    $heroImage   = (string) ($shortcode->hero_image ?? '');
    $heading     = (string) ($shortcode->heading ?? '');
    $description = (string) ($shortcode->description ?? '');

    // Tabs: value (static text), animate_to (number for count-up; 0 = no animation),
    // suffix, label, desc.
    $items = Shortcode::fields()->getTabsData(['value', 'animate_to', 'suffix', 'label', 'desc'], $shortcode);

    $heroSrc = $heroImage
        ? RvMedia::getImageUrl($heroImage, null, false, RvMedia::getDefaultImage())
        : null;
@endphp

{{-- .section-main-about hero-image + box-why rules live in
     assets/sass/component/_inline-migrated.scss. --}}
<section {!! $shortcode->htmlAttributes() !!} class="section-main-about flat-spacing pt-0">
    <div class="container">
        @if ($heroSrc)
            <div class="flat-spacing-2">
                <div class="hero-image">
                    <img loading="lazy" width="1410" height="600" src="{{ $heroSrc }}" alt="{{ $heading }}">
                </div>
            </div>
        @endif

        @if ($heading || $description)
            <div class="row align-items-center gy-4">
                @if ($heading)
                    <div class="col-md-6"><h2 class="text-capitalize">{{ $heading }}</h2></div>
                @endif
                @if ($description)
                    <div class="col-md-6"><p class="text-body-1">{!! BaseHelper::clean($description) !!}</p></div>
                @endif
            </div>
        @endif

        @if (! empty($items))
            <div class="flat-spacing pb-0">
                <div class="position-relative flat-spacing pb-0">
                    <div class="br-line fake-class top-0"></div>
                    <div dir="ltr" class="swiper tf-swiper"
                         data-preview="4" data-tablet="3" data-mobile-sm="2" data-mobile="1"
                         data-space-lg="40" data-space-md="20" data-space="10"
                         data-pagination="1" data-pagination-sm="2" data-pagination-md="3" data-pagination-lg="4">
                        <div class="swiper-wrapper">
                            @foreach ($items as $stat)
                                @php($animateTo = (int) ($stat['animate_to'] ?? 0))
                                <div class="swiper-slide">
                                    <div class="box-why {{ $animateTo > 0 ? 'view-counter' : 'couter-side' }}">
                                        <p class="h1 fw-medium">
                                            @if ($animateTo > 0)
                                                <span class="number" data-speed="1000" data-to="{{ $animateTo }}">0</span>@if (! empty($stat['suffix']))<span>{{ $stat['suffix'] }}</span>@endif
                                            @else
                                                {{ $stat['value'] ?? '' }}
                                            @endif
                                        </p>
                                        @if (! empty($stat['label']))
                                            <p class="title h5 fw-medium">{{ $stat['label'] }}</p>
                                        @endif
                                        @if (! empty($stat['desc']))
                                            <p class="sub cl-text-2">{{ $stat['desc'] }}</p>
                                        @endif
                                    </div>
                                </div>
                            @endforeach
                        </div>
                        <div class="sw-dot-default tf-sw-pagination"></div>
                    </div>
                </div>
            </div>
        @endif
    </div>
</section>
