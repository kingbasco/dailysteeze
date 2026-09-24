@if (is_plugin_active('marketplace') && isset($store) && $store && ! empty($store->name))
    @php
        /**
         * Small "Sold by [vendor name]" badge included from product-detail.blade.php.
         *
         * Inputs:
         *   $store  \Botble\Marketplace\Models\Store  (required)
         */
    @endphp

    <div class="marketplace-vendor-info d-inline-flex align-items-center gap-2 p-2 rounded-pill bg-light">
        <span class="marketplace-vendor-info__avatar">
            {!! \Botble\Media\Facades\RvMedia::image(
                $store->logo,
                $store->name,
                'thumb',
                true,
                ['class' => 'rounded-circle', 'width' => 32, 'height' => 32, 'style' => 'object-fit: cover;']
            ) !!}
        </span>
        <span class="marketplace-vendor-info__label small text-muted">{{ __('Sold by') }}</span>
        <a href="{{ $store->url }}" class="marketplace-vendor-info__name fw-medium text-reset text-decoration-none">
            {{ $store->name }}
            @if (! empty($store->badge))
                {!! \Botble\Base\Facades\BaseHelper::clean($store->badge) !!}
            @endif
        </a>
    </div>
@endif
