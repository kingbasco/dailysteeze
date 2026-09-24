@php
    /**
     * Mirrors html/home-pod.html §6 (lines 2158-2233): 1+2+2 grid composite.
     * Col 1 (full height): banner-image-text type-abs style-4 (450x608 portrait
     * hero with overlay text + CTA).
     * Col 2: 2 stacked box-image_v03 cards (450x294 with title + ArrowUpRight icon).
     * Col 3: 2 stacked box-image_v03 cards (same pattern).
     *
     * Reads first 5 collections — index 0 = hero, indices 1-2 = col2, 3-4 = col3.
     */
    $collections = collect($collections);
    $hero = $collections->first();
    $col2 = $collections->slice(1, 2)->values();
    $col3 = $collections->slice(3, 2)->values();
@endphp

@if ($hero)
    <div class="container">
        <div class="tf-grid-layout md-col-2 xl-col-3 xl-gap-20">
            {{-- Col 1: Hero banner-image-text type-abs style-4 --}}
            <div class="banner-image-text type-abs style-4">
                <a href="{{ $hero->url ?: '#' }}" class="bn-image img-style">
                    {!! \Botble\Media\Facades\RvMedia::image($hero->image, $hero->name, false, false, ['width' => 450, 'height' => 608, 'class' => 'w-100', 'loading' => 'lazy']) !!}
                </a>
                <div class="bn-content wow fadeInUp">
                    <a href="{{ $hero->url ?: '#' }}" class="title h3 fw-medium text-white link">
                        {!! \Botble\Base\Facades\BaseHelper::clean($hero->name) !!}
                    </a>
                    @if (! empty($hero->description))
                        <p class="desc cl-text-3 mb-28">{{ $hero->description }}</p>
                    @endif
                    <a href="{{ $hero->url ?: '#' }}" class="btn-action tf-btn btn-white small">
                        {{ __('View More') }}
                    </a>
                </div>
            </div>

            {{-- Col 2: 2 stacked box-image_v03 --}}
            @if ($col2->isNotEmpty())
                <div class="tf-grid-layout gap-20">
                    @foreach ($col2 as $item)
                        <div class="box-image_v03 hover-img4">
                            <a href="{{ $item->url ?: '#' }}" class="box-image_img img-style4">
                                {!! \Botble\Media\Facades\RvMedia::image($item->image, $item->name, false, false, ['width' => 450, 'height' => 294, 'class' => 'w-100', 'loading' => 'lazy']) !!}
                            </a>
                            <div class="box-image_content">
                                <a href="{{ $item->url ?: '#' }}" class="title h6 fw-medium link">
                                    {!! \Botble\Base\Facades\BaseHelper::clean($item->name) !!}
                                    <i class="icon icon-ArrowUpRight"></i>
                                </a>
                            </div>
                        </div>
                    @endforeach
                </div>
            @endif

            {{-- Col 3: 2 stacked box-image_v03 (collapses to md-col-2 grid on mid screens) --}}
            @if ($col3->isNotEmpty())
                <div class="tf-grid-layout gap-20 md-col-2 xl-col-1 xl-wd-full">
                    @foreach ($col3 as $item)
                        <div class="box-image_v03 hover-img4">
                            <a href="{{ $item->url ?: '#' }}" class="box-image_img img-style4">
                                {!! \Botble\Media\Facades\RvMedia::image($item->image, $item->name, false, false, ['width' => 450, 'height' => 294, 'class' => 'w-100', 'loading' => 'lazy']) !!}
                            </a>
                            <div class="box-image_content">
                                <a href="{{ $item->url ?: '#' }}" class="title h6 fw-medium link">
                                    {!! \Botble\Base\Facades\BaseHelper::clean($item->name) !!}
                                    <i class="icon icon-ArrowUpRight"></i>
                                </a>
                            </div>
                        </div>
                    @endforeach
                </div>
            @endif
        </div>
    </div>
@endif
