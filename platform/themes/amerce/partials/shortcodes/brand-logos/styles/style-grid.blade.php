@php
    $colClass = match (true) {
        $itemsPerRow >= 6 => 'col-lg-2 col-md-3 col-4',
        $itemsPerRow == 5 => 'col-lg-2 col-md-3 col-4',
        $itemsPerRow == 4 => 'col-md-3 col-6',
        default            => 'col-md-' . max(2, (int) (12 / $itemsPerRow)) . ' col-6',
    };
@endphp

<div class="container mt-30">
    <div class="row gy-30 align-items-center justify-content-center">
        @forelse ($brands as $brand)
            <div class="{{ $colClass }} text-center">
                <a href="{{ $brand->url ?: '#' }}" class="brand-logo d-block">
                    {!! RvMedia::image($brand->logo ?? null, $brand->name, 'thumb', false, ['class' => 'mx-auto', 'style' => 'max-height:64px;width:auto;', 'loading' => 'lazy']) !!}
                </a>
            </div>
        @empty
            <div class="col-12 text-center text-muted">{{ __('No brands selected.') }}</div>
        @endforelse
    </div>
</div>
