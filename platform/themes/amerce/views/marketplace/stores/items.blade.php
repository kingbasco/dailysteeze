@if (is_plugin_active('marketplace'))
    @php
        /**
         * Vendor list partial.
         * Used as both server-render in views/marketplace/stores.blade.php AND as
         * AJAX fragment for infinite scroll / load-more.
         *
         * Inputs:
         *   $stores  iterable<\Botble\Marketplace\Models\Store>  (required)
         */
        $reviewsEnabled = class_exists(\Botble\Ecommerce\Facades\EcommerceHelper::class)
            && \Botble\Ecommerce\Facades\EcommerceHelper::isReviewEnabled();
        $hideAddress = class_exists(\Botble\Marketplace\Facades\MarketplaceHelper::class)
            && \Botble\Marketplace\Facades\MarketplaceHelper::hideStoreAddress();

        // Batch-resolve product counts in a single query — plugin's PublicStoreController
        // doesn't withCount('products'), so we attach it theme-side without N+1.
        $storeItems = method_exists($stores, 'items') ? $stores->items() : (is_iterable($stores) ? $stores : []);
        $storeIds = collect($storeItems)->pluck('id')->filter()->all();
        $countsByStore = $storeIds
            ? \Botble\Ecommerce\Models\Product::query()
                ->whereIn('store_id', $storeIds)
                ->where('is_variation', 0)
                ->wherePublished()
                ->selectRaw('store_id, COUNT(*) as c')
                ->groupBy('store_id')
                ->pluck('c', 'store_id')
            : collect();
    @endphp

    @if ((is_countable($stores) ? count($stores) : 0) > 0)
        <div class="row g-3 g-md-4 marketplace-stores__grid">
            @foreach ($stores as $store)
                @php($productsCount = (int) ($countsByStore[$store->id] ?? 0))

                <div class="col-xl-3 col-lg-4 col-md-6 col-12">
                    <article class="marketplace-vendor-card h-100 d-flex flex-column text-center p-4" data-store-id="{{ $store->id }}">
                        <a href="{{ $store->url }}" class="marketplace-vendor-card__avatar mx-auto mb-3">
                            {!! \Botble\Media\Facades\RvMedia::image(
                                $store->logo,
                                $store->name,
                                'thumb',
                                true,
                                ['class' => 'marketplace-vendor-card__avatar-img']
                            ) !!}
                        </a>

                        <h5 class="marketplace-vendor-card__name mb-1">
                            <a href="{{ $store->url }}" class="text-reset text-decoration-none">
                                {{ $store->name }}
                            </a>
                            @if (! empty($store->badge))
                                {!! \Botble\Base\Facades\BaseHelper::clean($store->badge) !!}
                            @endif
                        </h5>

                        @if ($reviewsEnabled && method_exists($store, 'reviews'))
                            <div class="marketplace-vendor-card__rating d-flex justify-content-center align-items-center gap-1 mb-2">
                                @includeIf(\Botble\Ecommerce\Facades\EcommerceHelper::viewPath('includes.rating-star'), ['avg' => (float) ($store->reviews()->avg('star') ?? 0)])
                            </div>
                        @endif

                        <p class="marketplace-vendor-card__count mb-3">
                            <i class="icon icon-package" aria-hidden="true"></i>
                            <span>{{ $productsCount === 1 ? __('1 product') : __(':count products', ['count' => number_format($productsCount)]) }}</span>
                        </p>

                        @if (! $hideAddress && ! empty($store->full_address))
                            <p class="marketplace-vendor-card__address text-truncate mb-3" title="{{ $store->full_address }}">
                                <i class="icon icon-map-pin" aria-hidden="true"></i>
                                <span>{{ $store->full_address }}</span>
                            </p>
                        @endif

                        <a href="{{ $store->url }}" class="btn btn-dark marketplace-vendor-card__cta mt-auto">
                            {{ __('Visit store') }}
                            <i class="icon icon-ArrowUpRight1 ms-2" aria-hidden="true"></i>
                        </a>
                    </article>
                </div>
            @endforeach
        </div>
    @else
        <div class="marketplace-stores__empty py-5 text-center">
            <p class="mb-0 text-muted">{{ __('No vendors found.') }}</p>
        </div>
    @endif
@endif
