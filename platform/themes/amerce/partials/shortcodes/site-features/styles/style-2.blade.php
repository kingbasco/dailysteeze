@php
    // Adaptive column width: 3-up grid for 3 items, 4-up for 4, 6-up for 6.
    // Without this, 4 items rendered with `col-md-4` (Bootstrap 12/4 = 3-cols)
    // wrap to a 3+1 layout — see html/home-pet-care.html where the demo uses
    // a 4-up swiper (data-preview="4") for the same content.
    $count = count($items);
    $colClass = match (true) {
        $count <= 2 => 'col-md-6 col-sm-6',
        $count === 3 => 'col-md-4 col-sm-6',
        $count === 4 => 'col-md-3 col-sm-6',
        $count === 6 => 'col-md-2 col-sm-6',
        default => 'col-md-3 col-sm-6',
    };
@endphp
<div class="container">
    <div class="tf-features-bar style-bg radius-10 px-4 py-4 bg-main">
        <div class="row gy-30">
            @foreach ($items as $item)
                <div class="{{ $colClass }}">
                    <div class="features-item text-center">
                        @if (! empty($item['icon_class']))
                            <i class="icon {{ $item['icon_class'] }} fs-40 d-block mb-15"></i>
                        @endif
                        @if (! empty($item['title']))
                            <p class="title h6 mb-5">{!! BaseHelper::clean($item['title']) !!}</p>
                        @endif
                        @if (! empty($item['description']))
                            <p class="text-caption-01 cl-text-3">{!! BaseHelper::clean($item['description']) !!}</p>
                        @endif
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</div>
