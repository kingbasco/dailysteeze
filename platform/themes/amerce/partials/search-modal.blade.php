@php
    // Search popular keywords (CSV). Empty = hide the keywords block.
    $rawKeywords = (string) theme_option('search_popular_keywords');
    $keywords = array_values(array_filter(array_map('trim', explode(',', $rawKeywords))));

    // Live AJAX autocomplete uses the ecommerce plugin's bb-form-quick-search machinery
    // (debounced keyup → public.ajax.search-products → renders includes.ajax-search-results).
    // Falls back to a plain GET form when ecommerce is not active.
    $hasEcommerceSearch = is_plugin_active('ecommerce')
        && \Illuminate\Support\Facades\Route::has('public.products')
        && \Illuminate\Support\Facades\Route::has('public.ajax.search-products');

    $searchAction = $hasEcommerceSearch ? route('public.products') : url('/search');
    $ajaxSearchUrl = $hasEcommerceSearch ? route('public.ajax.search-products') : null;
@endphp

<div class="modal modalCentered fade modal-search" id="search" tabindex="-1" aria-labelledby="searchModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="d-flex align-items-center justify-content-between gap-10">
                <h3 id="searchModalLabel">{{ __('Search') }}</h3>
                <span class="icon-close-popup flex-shrink-0" data-bs-dismiss="modal" aria-label="{{ __('Close') }}">
                    <i class="icon-X2"></i>
                </span>
            </div>

            <form
                action="{{ $searchAction }}"
                method="GET"
                role="search"
                @class(['form-search-nav style-2', 'bb-form-quick-search' => $hasEcommerceSearch])
                @if ($hasEcommerceSearch) data-ajax-url="{{ $ajaxSearchUrl }}" @endif
            >
                <fieldset>
                    <input type="text" name="q" placeholder="{{ __('Searching...') }}" value="{{ request('q') }}" autocomplete="off" required>
                </fieldset>
                <button type="submit" class="btn-action" aria-label="{{ __('Search') }}">
                    <i class="icon icon-MagnifyingGlass"></i>
                </button>

                @if ($hasEcommerceSearch)
                    {{-- Result slot is populated by front-ecommerce.js on keyup. --}}
                    <div class="bb-quick-search-results"></div>
                @endif
            </form>

            @if (! empty($keywords))
                <div class="search-feature">
                    <p class="h5 mb-16">{{ __('Feature Keywords Today') }}</p>
                    <div class="tf-list-tag">
                        @foreach ($keywords as $kw)
                            <a href="{{ $searchAction }}?q={{ urlencode($kw) }}" class="link-tag">{{ $kw }}</a>
                        @endforeach
                    </div>
                </div>
            @endif

            {{-- Recently-viewed products slot. JS hydrates the swiper after slides
                 are populated; the empty wrapper omits swiper classes so an
                 unhydrated container doesn't crash Swiper.init(). --}}
            <div class="recently-view" data-recently-viewed hidden>
                <p class="h5 mb-16">{{ __('Recently Viewed Products') }}</p>
                <div dir="ltr" data-recently-viewed-slot></div>
            </div>
        </div>
    </div>
</div>
