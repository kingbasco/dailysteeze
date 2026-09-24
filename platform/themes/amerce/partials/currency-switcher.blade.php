@php
    // Use the cached helper instead of the repository — same data, plus the 1-hour cache
    // built into CurrencySupport::currencies(), and matches the convention shofy uses.
    $currencies = is_plugin_active('ecommerce') ? get_all_currencies() : collect();
    $currentCurrency = $currencies->isNotEmpty() ? get_application_currency() : null;
    $hasDynamic = $currencies->count() > 1 && $currentCurrency;
    // Dark-header variants (style-6, etc.) pass colorMode='dark' so the select
    // text renders white. Mirrors html/home-office-equipment.html: `color-white`.
    $colorMode = $colorMode ?? 'light';
    $selectClasses = 'tf-dropdown-select style-default type-currencies' . ($colorMode === 'dark' ? ' color-white' : '');
@endphp

@if ($hasDynamic)
    <div class="tf-currencies">
        <select class="{{ $selectClasses }}">
            @foreach ($currencies as $currency)
                <option
                    value="{{ $currency->title }}"
                    data-action-url="{{ route('public.change-currency', $currency->title) }}"
                    @if ($currentCurrency->getKey() === $currency->getKey()) selected @endif
                >{{ $currency->title }} ({{ $currency->symbol }})</option>
            @endforeach
        </select>
    </div>
@endif
