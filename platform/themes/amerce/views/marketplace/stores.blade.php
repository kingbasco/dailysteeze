@php
    /**
     * @var \Illuminate\Pagination\LengthAwarePaginator $stores
     */
    $searchTerm = (string) request()->input('q', '');
    $sort = (string) request()->input('sort', 'latest');
    $sortChoices = [
        'latest' => __('Latest'),
        'oldest' => __('Oldest'),
        'name_asc' => __('Name (A-Z)'),
        'name_desc' => __('Name (Z-A)'),
    ];
    $totalLabel = '';
    if ($stores instanceof \Illuminate\Contracts\Pagination\LengthAwarePaginator) {
        $total = $stores->total();
        $totalLabel = $total === 1
            ? __('Found 1 vendor')
            : __('Found :count vendors', ['count' => number_format($total)]);
    }

    // The amerce default page-title section already prints the SEO title centered.
    // Keep it — it acts as our hero. Suppress only the redundant "All Vendors"
    // subtitle to avoid double headings.
@endphp

@if (is_plugin_active('marketplace'))
    <section class="marketplace-stores flat-spacing">
        <div class="container">
            <div class="marketplace-stores__toolbar mb-4 p-3 p-md-4">
                <form
                    action="{{ route('public.stores') }}"
                    method="GET"
                    class="marketplace-stores__filters row g-2 align-items-center"
                    role="search"
                >
                    @if ($totalLabel)
                        <div class="col-12 col-lg-auto me-lg-auto">
                            <p class="marketplace-stores__count mb-0">{{ $totalLabel }}</p>
                        </div>
                    @endif

                    <div class="col-12 col-md">
                        <label class="visually-hidden" for="marketplace-stores-search">
                            {{ __('Search vendors') }}
                        </label>
                        <input
                            type="search"
                            id="marketplace-stores-search"
                            name="q"
                            value="{{ $searchTerm }}"
                            class="form-control marketplace-stores__search"
                            placeholder="{{ __('Search vendors...') }}"
                            autocomplete="off"
                        >
                    </div>

                    <div class="col-12 col-md-auto">
                        <label class="visually-hidden" for="marketplace-stores-sort">
                            {{ __('Sort vendors') }}
                        </label>
                        <select
                            id="marketplace-stores-sort"
                            name="sort"
                            class="form-select marketplace-stores__sort"
                        >
                            @foreach ($sortChoices as $value => $label)
                                <option value="{{ $value }}" @selected($sort === $value)>{{ $label }}</option>
                            @endforeach
                        </select>
                    </div>

                    <div class="col-12 col-md-auto">
                        <button type="submit" class="btn btn-dark w-100 w-md-auto">
                            <i class="icon icon-MagnifyingGlass me-1" aria-hidden="true"></i>
                            {{ __('Search') }}
                        </button>
                    </div>
                </form>
            </div>

            <div id="vendor-list" class="marketplace-stores__list" data-ajax-url="{{ route('public.stores') }}">
                @include(Theme::getThemeNamespace('views.marketplace.stores.items'), ['stores' => $stores])
            </div>

            @if ($stores instanceof \Illuminate\Contracts\Pagination\LengthAwarePaginator && $stores->hasPages())
                <div class="marketplace-stores__pagination mt-4">
                    {{ $stores->withQueryString()->links() }}
                </div>
            @endif
        </div>
    </section>
@endif
