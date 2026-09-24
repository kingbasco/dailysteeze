@php
    /**
     * 3-card slider used by the home-mental "Rest Better / Nourish / Find Your Calm"
     * Collection block. Mirrors html/home-mental.html lines 1688-1775
     * (`box-image_v02` cards inside a swiper).
     *
     * Renders inside the parent index.blade.php's `<div class="container">` already.
     */
    $items = collect($collections);
@endphp

<div dir="ltr" class="swiper tf-swiper"
     data-preview="3" data-tablet="2" data-mobile-sm="2" data-mobile="1"
     data-space-lg="30" data-space-md="20" data-space="10"
     data-pagination="1" data-pagination-sm="2" data-pagination-md="2" data-pagination-lg="3">
    <div class="swiper-wrapper">
        @foreach ($items as $index => $collection)
            @php
                // Middle card uses dark/text-white styling in the demo (slide 2).
                $isDark = $index === 1;
                $delay = $index === 0 ? null : ($index * 0.1) . 's';
            @endphp
            <div class="swiper-slide">
                <div class="box-image_v02 hover-img wow fadeInLeft" @if ($delay) data-wow-delay="{{ $delay }}" @endif>
                    <a href="{{ $collection->url }}" class="box-image_img img-style">
                        {!! \Botble\Media\Facades\RvMedia::image($collection->image, $collection->name, null, false, ['width' => 450, 'height' => 280, 'loading' => 'lazy']) !!}
                    </a>
                    <div class="box-image_content">
                        <a href="{{ $collection->url }}"
                           class="title h4 fw-medium {{ $isDark ? 'text-white link-underline-white' : 'link-underline-text' }}">
                            {!! BaseHelper::clean($collection->name) !!}
                        </a>
                        @if (! empty($collection->description))
                            <p class="desc {{ $isDark ? 'text-white' : 'cl-text-2' }}">
                                {!! BaseHelper::clean($collection->description) !!}
                            </p>
                        @endif
                        <a href="{{ $collection->url }}" class="btn-action tf-btn-icon {{ $isDark ? 'text-white' : '' }} link">
                            <span class="text-caption-01 fw-semibold">{{ __('View More') }}</span>
                            <i class="icon icon-ArrowRight fs-20"></i>
                        </a>
                    </div>
                </div>
            </div>
        @endforeach
    </div>
    <div class="sw-dot-default tf-sw-pagination"></div>
</div>
