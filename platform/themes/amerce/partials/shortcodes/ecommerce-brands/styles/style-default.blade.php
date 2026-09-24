@php
    $perRow = (int) ($shortcode->items_per_row ?: 6);
    $perRow = max(2, min(8, $perRow));
    $colClass = match ($perRow) {
        2 => 'col-6',
        3 => 'col-md-4 col-6',
        4 => 'col-lg-3 col-md-4 col-6',
        5 => 'col-xl-2 col-lg-3 col-md-4 col-6',
        6 => 'col-xl-2 col-lg-3 col-md-4 col-6',
        default => 'col-xl-2 col-lg-3 col-md-4 col-6',
    };
@endphp

<div class="row gy-4 align-items-center ecommerce-brands__grid">
    @foreach ($brands as $brand)
        <div class="{{ $colClass }} ecommerce-brands__item text-center">
            <a href="{{ $brand->url }}" class="ecommerce-brands__logo d-block text-reset">
                {!! \Botble\Media\Facades\RvMedia::image(
                    $brand->logo,
                    $brand->name,
                    'thumb',
                    false,
                    ['class' => 'img-fluid', 'style' => 'max-height: 80px;']
                ) !!}
            </a>
        </div>
    @endforeach
</div>
