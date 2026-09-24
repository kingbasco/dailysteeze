@php
    /**
     * @var \Botble\Marketplace\Models\Store $store
     * @var \Illuminate\Pagination\LengthAwarePaginator $products
     * @var \Botble\Marketplace\Forms\ContactStoreForm|null $contactForm
     *
     * Farmart-style layout: left sidebar (categories filter + contact form),
     * right column (about content + search + product toolbar + product grid).
     */
    use Botble\Base\Facades\BaseHelper;

    $sendMessageAuth = auth('customer')->user();
    $sendMessageEnabled = \Botble\Marketplace\Facades\MarketplaceHelper::isEnabledMessagingSystem()
        && isset($contactForm) && $contactForm
        && (! $sendMessageAuth || $store->id != $sendMessageAuth->store?->id);

    $hasAbout = ! empty(trim((string) $store->description)) || ! empty(trim((string) $store->content));
    $searchTerm = (string) request()->input('q', '');

    Theme::set('renderingStore', true);
    Theme::layout('full-width');
@endphp

@if (is_plugin_active('marketplace'))

    <section class="marketplace-store">
        @include(Theme::getThemeNamespace('views.marketplace.includes.store-banner'), ['store' => $store])

        <div class="container marketplace-store__body">
            <div class="row g-4">
                {{-- Left sidebar: categories filter + contact form ----------- --}}
                <div class="col-xl-3 col-lg-4">
                    <div class="marketplace-store__sidebar">
                        @include(Theme::getThemeNamespace('views.marketplace.includes.store-products-filter'), ['store' => $store])

                        @if ($sendMessageEnabled)
                            @include(Theme::getThemeNamespace('views.marketplace.includes.store-send-message'), [
                                'store' => $store,
                                'contactForm' => $contactForm,
                            ])
                        @endif
                    </div>
                </div>

                {{-- Main column: about + search + toolbar + product grid ----- --}}
                <div class="col-xl-9 col-lg-8">
                    @if ($hasAbout)
                        @include(Theme::getThemeNamespace('views.marketplace.includes.store-about'), ['store' => $store])
                    @endif

                    <form class="marketplace-store__search" method="GET" action="{{ url()->current() }}">
                        @foreach (request()->except(['q', 'page']) as $key => $value)
                            @if (is_array($value))
                                @foreach ($value as $item)
                                    <input type="hidden" name="{{ $key }}[]" value="{{ $item }}">
                                @endforeach
                            @else
                                <input type="hidden" name="{{ $key }}" value="{{ BaseHelper::stringify($value) }}">
                            @endif
                        @endforeach

                        <div class="marketplace-store__search-group">
                            <label class="visually-hidden" for="store-search-input">{{ __('Search in this store...') }}</label>
                            <input
                                id="store-search-input"
                                type="search"
                                name="q"
                                value="{{ $searchTerm }}"
                                class="form-control marketplace-store__search-input"
                                placeholder="{{ __('Search in this store...') }}"
                                autocomplete="off"
                            >
                            <button type="submit" class="marketplace-store__search-btn" aria-label="{{ __('Search') }}">
                                <i class="icon icon-MagnifyingGlass" aria-hidden="true"></i>
                            </button>
                        </div>
                    </form>

                    @if (isset($products) && (is_countable($products) ? count($products) : 0) > 0)
                        <div class="marketplace-store__products-top">
                            @include(Theme::getThemeNamespace('views.ecommerce.includes.product-filters-top'), [
                                'filterPosition' => 'sidebar',
                            ])
                        </div>

                        <div class="wrapper-shop tf-grid-layout tf-col-1 md-col-2 xl-col-3 bb-product-items-wrapper">
                            @include(EcommerceHelper::viewPath('includes.product-items'), ['products' => $products])
                        </div>

                        @if ($products instanceof \Illuminate\Contracts\Pagination\LengthAwarePaginator && $products->hasPages())
                            <div class="marketplace-store__pagination mt-4">
                                {{ $products->withQueryString()->links() }}
                            </div>
                        @endif
                    @else
                        <div class="marketplace-store__empty py-5 text-center">
                            <p class="mb-0 text-muted">{{ __('This vendor has no products yet.') }}</p>
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </section>
@endif
