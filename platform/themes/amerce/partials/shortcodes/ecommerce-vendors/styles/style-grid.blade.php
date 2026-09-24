@php
    /**
     * @var \Botble\Shortcode\Compilers\Shortcode $shortcode
     * @var \Illuminate\Support\Collection $vendors
     */
    $perRow = (int) ($shortcode->items_per_row ?: 4);
    $perRow = max(1, min(6, $perRow));
    $colClass = match ($perRow) {
        1 => 'col-12',
        2 => 'col-md-6 col-12',
        3 => 'col-lg-4 col-md-6 col-12',
        4 => 'col-xl-3 col-lg-4 col-md-6 col-12',
        5 => 'col-xl-2 col-lg-3 col-md-4 col-6',
        6 => 'col-xl-2 col-lg-3 col-md-4 col-6',
        default => 'col-xl-3 col-lg-4 col-md-6 col-12',
    };
@endphp

<div class="row gy-4 ecommerce-vendors__grid">
    @foreach ($vendors as $vendor)
        <div class="{{ $colClass }} ecommerce-vendors__item">
            <article class="marketplace-vendor-card card-store h-100" data-store-id="{{ $vendor->id }}">
                <a href="{{ $vendor->url }}" class="marketplace-vendor-card__cover store-image d-block">
                    {!! \Botble\Media\Facades\RvMedia::image(
                        $vendor->logo,
                        $vendor->name,
                        'medium',
                        true,
                        ['class' => 'img-fluid w-100']
                    ) !!}
                </a>
                <div class="marketplace-vendor-card__body store-infor p-3">
                    <a href="{{ $vendor->url }}" class="text-reset text-decoration-none">
                        <h5 class="marketplace-vendor-card__name info_name mb-2">
                            {{ $vendor->name }}
                            @if (! empty($vendor->badge))
                                {!! \Botble\Base\Facades\BaseHelper::clean($vendor->badge) !!}
                            @endif
                        </h5>
                    </a>

                    @if (! empty($vendor->full_address))
                        <p class="marketplace-vendor-card__address small text-muted mb-2 text-truncate">
                            <i class="icon icon-map-pin me-1" aria-hidden="true"></i>{{ $vendor->full_address }}
                        </p>
                    @endif

                    <a href="{{ $vendor->url }}" class="btn btn-outline-dark btn-sm marketplace-vendor-card__cta">
                        {{ __('Visit store') }}
                        <i class="icon icon-ArrowUpRight1 ms-1" aria-hidden="true"></i>
                    </a>
                </div>
            </article>
        </div>
    @endforeach
</div>
