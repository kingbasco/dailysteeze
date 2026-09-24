@php
    /**
     * Section-highlight pattern from home-jewelry.html (lines 3601-3653):
     * single hero image with a swiper of multiple text-only slides
     * (heading + description) overlaid via flex layout. Reads tabbed
     * fields named feature_1..feature_4 (heading) + content_1..content_4.
     */
    $count = max(1, min(8, (int) ($shortcode->quantity ?? 4)));
    $slides = [];
    for ($i = 1; $i <= $count; $i++) {
        $heading = trim((string) ($shortcode->{"heading_$i"} ?? ''));
        $content = trim((string) ($shortcode->{"content_$i"} ?? ''));
        if ($heading !== '' || $content !== '') {
            $slides[] = ['heading' => $heading, 'content' => $content];
        }
    }
@endphp

@if (! empty($slides))
    <div class="container-full">
        <div class="section-highlight">
            @if (! empty($shortcode->image ?? ''))
                {!! RvMedia::image($shortcode->image, $shortcode->heading_1 ?? '', 'hero-banner', false, ['class' => 'img-cover', 'width' => 1770, 'height' => 720, 'loading' => 'lazy']) !!}
            @endif

            <div dir="ltr" class="swiper tf-swiper wrap-content"
                 data-preview="{{ count($slides) >= 4 ? 4 : count($slides) }}"
                 data-tablet="3" data-mobile-sm="2" data-mobile="1"
                 data-space-lg="0" data-space-md="0" data-space="0"
                 data-pagination="1" data-pagination-sm="1" data-pagination-md="1" data-pagination-lg="1">
                <div class="swiper-wrapper">
                    @foreach ($slides as $i => $slide)
                        <div class="swiper-slide wow fadeInUp" @if ($i > 0) data-wow-delay="0.{{ $i }}s" @endif>
                            <div class="item">
                                @if (! empty($slide['heading']))
                                    <h4 class="text-white mb-8 title">{!! BaseHelper::clean($slide['heading']) !!}</h4>
                                @endif
                                @if (! empty($slide['content']))
                                    <p class="text-body-1 text-white">{!! BaseHelper::clean($slide['content']) !!}</p>
                                @endif
                            </div>
                        </div>
                    @endforeach
                </div>
                <div class="sw-line-default tf-sw-pagination d-flex d-lg-none mb-24"></div>
            </div>
        </div>
    </div>
@endif
