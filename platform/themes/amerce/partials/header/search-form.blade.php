@php
    // Shared search form partial used by header style variants and mobile offcanvas.
    // Live AJAX autocomplete uses the ecommerce plugin's bb-form-quick-search machinery
    // (debounced keyup → public.ajax.search-products → renders includes.ajax-search-results).
    // Falls back to a plain GET form when ecommerce is not active.
    //
    // Available variables (all optional):
    //   $formClasses  string  CSS classes applied to the <form>. Default: 'form-search-nav'.
    //   $placeholder  string  Input placeholder text. Default: 'Search Products'.
    //   $autoFocus    bool    Add autofocus attribute (used by modal/offcanvas). Default: false.

    $hasEcommerceSearch = is_plugin_active('ecommerce')
        && \Illuminate\Support\Facades\Route::has('public.products')
        && \Illuminate\Support\Facades\Route::has('public.ajax.search-products');

    $searchAction = $hasEcommerceSearch ? route('public.products') : url('/search');
    $ajaxSearchUrl = $hasEcommerceSearch ? route('public.ajax.search-products') : null;

    $formClasses = $formClasses ?? 'form-search-nav';
    $placeholder = $placeholder ?? __('Search Products');
    $autoFocus = $autoFocus ?? false;
@endphp

<form
    action="{{ $searchAction }}"
    method="GET"
    role="search"
    @class([$formClasses, 'bb-form-quick-search' => $hasEcommerceSearch])
    @if ($hasEcommerceSearch) data-ajax-url="{{ $ajaxSearchUrl }}" @endif
>
    <fieldset>
        <input
            type="text"
            name="q"
            placeholder="{{ $placeholder }}"
            value="{{ request('q') }}"
            autocomplete="off"
            @if ($autoFocus) autofocus @endif
            required
        >
    </fieldset>
    <button type="submit" class="btn-action" aria-label="{{ __('Search') }}">
        <i class="icon icon-MagnifyingGlass"></i>
    </button>

    @if ($hasEcommerceSearch)
        {{-- Result slot is populated by front-ecommerce.js on keyup. --}}
        <div class="bb-quick-search-results"></div>
    @endif
</form>
