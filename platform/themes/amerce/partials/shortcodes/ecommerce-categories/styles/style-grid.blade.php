@php
    $perRow = (int) ($shortcode->items_per_row ?: 5);
    $perRow = max(2, min(6, $perRow));
    $colClass = match ($perRow) {
        2 => 'col-6',
        3 => 'col-md-4 col-6',
        4 => 'col-lg-3 col-md-4 col-6',
        5 => 'col-xl-2 col-lg-3 col-md-4 col-6',
        default => 'col-xl-2 col-lg-3 col-md-4 col-6',
    };
@endphp

<div class="row gy-4 ecommerce-categories__grid">
    @foreach ($categories as $category)
        <div class="{{ $colClass }} ecommerce-categories__item">
            <a href="{{ $category->url }}" class="ecommerce-categories__card d-block text-center text-decoration-none text-reset">
                <div class="ecommerce-categories__thumb mb-2 overflow-hidden rounded">
                    {!! \Botble\Media\Facades\RvMedia::image(
                        $category->image,
                        $category->name,
                        'thumb',
                        false,
                        ['class' => 'w-100 h-auto']
                    ) !!}
                </div>
                <h3 class="h6 ecommerce-categories__name mb-1">{{ $category->name }}</h3>
                @if ($shortcode->show_count)
                    <p class="ecommerce-categories__count small text-muted mb-0">
                        {{ trans_choice(':count product|:count products', (int) ($category->products_count ?? 0), ['count' => (int) ($category->products_count ?? 0)]) }}
                    </p>
                @endif
            </a>
        </div>
    @endforeach
</div>
