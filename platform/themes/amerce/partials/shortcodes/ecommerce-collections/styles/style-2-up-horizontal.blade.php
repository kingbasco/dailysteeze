@php
    /**
     * Mirrors html/home-electronics.html §3 (lines 1655-1700): two horizontal
     * `box-image_v04` cards in a `tf-grid-layout sm-col-2`.
     * Each card has a 690x388 landscape image LEFT and overlay text TOP-RIGHT
     * (h3 title + p desc + tf-btn-line-2 CTA). Second card uses dark image with
     * white text overlay.
     */
    $collections = collect($collections);
    $isDark = fn (int $i): bool => $i % 2 === 1;
@endphp

<div class="container">
    <div class="tf-grid-layout sm-col-2 section-banner-collection">
        @foreach ($collections as $i => $collection)
            <div class="box-image_v04">
                <a href="{{ $collection->url }}" class="box-image_img img-style">
                    {!! \Botble\Media\Facades\RvMedia::image($collection->image, $collection->name, '', false, ['width' => 690, 'height' => 388, 'class' => 'w-100', 'loading' => 'lazy']) !!}
                </a>
                <div class="box-image_content wow fadeInUp">
                    <a href="{{ $collection->url }}" class="title h3 fw-medium link {{ $isDark($i) ? 'text-white' : '' }}">
                        {{ $collection->name }}
                    </a>
                    @if (! empty($collection->description))
                        <p class="desc text-body-1 {{ $isDark($i) ? 'cl-text-line' : 'cl-text-2' }}">
                            {{ $collection->description }}
                        </p>
                    @endif
                    <a href="{{ $collection->url }}" class="btn-action tf-btn-line-2 {{ $isDark($i) ? 'style-white' : 'style-primary' }}">
                        <span class="fw-semibold">{{ __('Shop Now') }}</span>
                    </a>
                </div>
            </div>
        @endforeach
    </div>
</div>
