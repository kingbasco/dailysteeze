@php
    $intl       = trim((string) ($config['estimated_intl'] ?? ''));
    $intlLabel  = trim((string) ($config['estimated_intl_label'] ?? ''));
    $local      = trim((string) ($config['estimated_local'] ?? ''));
    $localLabel = trim((string) ($config['estimated_local_label'] ?? ''));
    $returnIn   = trim((string) ($config['return_within'] ?? ''));
    $returnTxt  = trim((string) ($config['return_text'] ?? ''));

    $hasDelivery = $intl !== '' || $local !== '';
    $hasReturn   = $returnIn !== '';

    // Compose the delivery sentence server-side. Avoids fragile inline
    // @if/@endif chains in the markup that confuse Blade's line-based parser.
    $deliveryParts = [];
    if ($intl !== '') {
        $part = '<span class="fw-semibold">' . e($intl) . '</span>';
        if ($intlLabel !== '') {
            $part .= ' (' . e($intlLabel) . ')';
        }
        $deliveryParts[] = $part;
    }
    if ($local !== '') {
        $part = '<span class="fw-semibold">' . e($local) . '</span>';
        if ($localLabel !== '') {
            $part .= ' (' . e($localLabel) . ')';
        }
        $deliveryParts[] = $part;
    }
    $deliverySentence = implode(', ', $deliveryParts);
@endphp

@if ($hasDelivery || $hasReturn)
    <div class="tf-product-delivery-return widget-product-delivery-info">
        @if ($hasDelivery)
            <div class="product-delivery">
                <i class="icon icon-Timer"></i>
                <p>
                    {{ __('Estimated Delivery:') }} {!! $deliverySentence !!}
                </p>
            </div>
        @endif

        @if ($hasReturn)
            <div class="product-delivery return">
                <i class="icon icon-ArrowClockwise"></i>
                <p>
                    {{ __('Return within') }}
                    <span class="fw-semibold">{{ $returnIn }}</span>
                    @if ($returnTxt !== '')
                        {{ $returnTxt }}
                    @endif
                </p>
            </div>
        @endif
    </div>
@endif
