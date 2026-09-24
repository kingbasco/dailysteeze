@php
    /**
     * 3-card layout from demo template: tall hero card on the left,
     * two stacked cards on the right. Falls back to a flat row when more
     * or fewer than 3 collections are supplied.
     */
    $collections = collect($collections);
    $first = $collections->first();
    $rest = $collections->slice(1, 2)->values();
@endphp

<div class="tf-grid-layout sm-col-2 gap-10 section-banner-collection">
    @if ($first)
        <div class="box-image_v01">
            <a href="{{ $first->url }}" class="box-image_img img-style">
                {!! \Botble\Media\Facades\RvMedia::image($first->image, $first->name, '', false, ['class' => 'w-100', 'loading' => 'lazy']) !!}
            </a>
            <div class="box-image_content">
                <a href="{{ $first->url }}" class="title h3 fw-medium text-white link-underline-white text-decoration-thickness">
                    {{ $first->name }}
                </a>
            </div>
        </div>
    @endif

    <div class="d-flex flex-column gap-10">
        @foreach ($rest as $collection)
            <div class="box-image_v01 h-100">
                <a href="{{ $collection->url }}" class="box-image_img img-style">
                    {!! \Botble\Media\Facades\RvMedia::image($collection->image, $collection->name, '', false, ['class' => 'w-100', 'loading' => 'lazy']) !!}
                </a>
                <div class="box-image_content">
                    <a href="{{ $collection->url }}" class="title h3 fw-medium text-white link-underline-white text-decoration-thickness">
                        {{ $collection->name }}
                    </a>
                </div>
            </div>
        @endforeach
    </div>
</div>
