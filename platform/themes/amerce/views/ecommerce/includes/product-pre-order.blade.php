@php
    $preOrderEta = $product->pre_order_release_date ?? null;
@endphp

<div class="tf-product-pre-order mb-12">
    <span class="fw-semibold text-label">{{ __('PRE-ORDER') }}</span>

    @if ($preOrderEta)
        <p class="text-caption-01 cl-text-2 mt-4">
            {{ __('Estimated release:') }}
            <span class="fw-semibold">
                {{ \Illuminate\Support\Carbon::parse($preOrderEta)->translatedFormat('M d, Y') }}
            </span>
        </p>
    @endif
</div>
