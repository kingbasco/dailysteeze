@php
    /**
     * Per-card flash-sale countdown.
     * Compact single-line pill: "02D : 16H : 32M : 57S".
     * Renders only when the product has at least one active flash sale.
     * The countdown widget is wired via [data-countdown] in ecommerce.js,
     * which writes into [data-countdown-{unit}] spans.
     *
     * Input: $product
     */
    $flashSale = null;
    if (method_exists($product, 'latestFlashSales')) {
        try {
            $flashSale = $product->latestFlashSales()->first();
        } catch (\Throwable $e) {
            $flashSale = null;
        }
    }

    if (! $flashSale || ! $flashSale->end_date) {
        return;
    }

    $targetDate = $flashSale->end_date->endOfDay()->toIso8601String();
@endphp

<div
    class="card-product__countdown product-countdown"
    data-countdown
    data-target-date="{{ $targetDate }}"
    data-flash-sale-id="{{ $flashSale->id }}"
    aria-label="{{ __('Flash sale ends in') }}"
>
    <span class="countdown__timer">
        <span data-countdown-days>00</span>{{ __('D') }} :
        <span data-countdown-hours>00</span>{{ __('H') }} :
        <span data-countdown-minutes>00</span>{{ __('M') }} :
        <span data-countdown-seconds>00</span>{{ __('S') }}
    </span>
</div>
