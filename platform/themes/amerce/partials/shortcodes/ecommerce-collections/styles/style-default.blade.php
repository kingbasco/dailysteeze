@php
    $perRow = (int) ($shortcode->items_per_row ?: 4);
    $perRow = max(1, min(6, $perRow));
    $colClass = match ($perRow) {
        1 => 'col-12',
        2 => 'col-md-6',
        3 => 'col-lg-4 col-md-6',
        4 => 'col-lg-3 col-md-6',
        default => 'col-lg-2 col-md-4 col-6',
    };
@endphp

<div class="row gy-4 ecommerce-collections__grid">
    @foreach ($collections as $collection)
        <div class="{{ $colClass }} ecommerce-collections__item">
            <a href="{{ $collection->url }}"
               class="ecommerce-collections__card position-relative d-block overflow-hidden rounded text-decoration-none text-reset">
                <div class="ecommerce-collections__thumb">
                    {!! \Botble\Media\Facades\RvMedia::image(
                        $collection->image,
                        $collection->name,
                        'medium',
                        false,
                        ['class' => 'w-100 h-auto']
                    ) !!}
                </div>
                <div class="ecommerce-collections__overlay position-absolute bottom-0 start-0 w-100 p-3 text-white">
                    <h3 class="h5 mb-1">{{ $collection->name }}</h3>
                    @if (! empty($collection->description))
                        <p class="small mb-0">{{ \Illuminate\Support\Str::limit(strip_tags($collection->description), 80) }}</p>
                    @endif
                </div>
            </a>
        </div>
    @endforeach
</div>
