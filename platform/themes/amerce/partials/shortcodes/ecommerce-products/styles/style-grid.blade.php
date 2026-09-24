@php
    $perRow = (int) ($shortcode->items_per_row ?: 4);
    $perRow = max(1, min(6, $perRow));
    $colClass = match ($perRow) {
        1 => 'col-12',
        2 => 'col-6',
        3 => 'col-md-4 col-6',
        4 => 'col-lg-3 col-md-4 col-6',
        5 => 'col-xl-2 col-lg-3 col-md-4 col-6',
        default => 'col-xl-2 col-lg-3 col-md-4 col-6',
    };
@endphp

<div class="row gy-4 ecommerce-products__grid">
    @foreach ($products as $product)
        <div class="{{ $colClass }} ecommerce-products__item">
            @includeIf(Theme::getThemeNamespace('views.ecommerce.includes.product-item'), ['product' => $product])
        </div>
    @endforeach
</div>
