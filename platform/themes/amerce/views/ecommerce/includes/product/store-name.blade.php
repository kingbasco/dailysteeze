@if (is_plugin_active('marketplace') && isset($product) && $product->store?->id)
    <div class="card-product_store {{ $storeExtraClass ?? '' }}">
        <span class="card-product_store-label">{{ __('By') }}</span>
        <a href="{{ $product->store->url }}" class="card-product_store-name link-underline-text">
            {{ $product->store->name }}
        </a>
        @if (! empty($product->store->badge))
            {!! \Botble\Base\Facades\BaseHelper::clean($product->store->badge) !!}
        @endif
    </div>
@endif
