@php
    $cartItem    = $cartItem    ?? null;
    $key         = $key         ?? null;
    $isOutOfStock = $isOutOfStock ?? (method_exists($product, 'isOutOfStock') ? $product->isOutOfStock() : false);
    $minQty      = (int) ($product->min_cart_quantity ?? 1);
    $maxQty      = (int) ($product->max_cart_quantity ?? 9999);

    // In cart-row context, optionally enforce single-quantity rule via plugin helper.
    $allowControls = true;
    if ($cartItem && function_exists('should_show_cart_quantity_controls')) {
        $allowControls = should_show_cart_quantity_controls($cartItem);
    }

    $currentQty = $cartItem ? (int) $cartItem->qty : $minQty;
    $inputName  = $cartItem && $key !== null ? "items[{$key}][values][qty]" : 'qty';
@endphp

<div class="wg-quantity">
    @if ($allowControls)
        <button type="button"
                class="btn-quantity btn-decrease"
                data-bb-toggle="decrease-qty"
                aria-label="{{ __('Decrease quantity') }}"
                @disabled($isOutOfStock)>
            <i class="icon icon-minus"></i>
        </button>

        <input class="quantity-product"
               type="number"
               name="{{ $inputName }}"
               value="{{ $currentQty }}"
               min="{{ $minQty }}"
               max="{{ $maxQty }}"
               @if ($cartItem) data-bb-toggle="update-cart" @endif
               @readonly($isOutOfStock)>

        <button type="button"
                class="btn-quantity btn-increase"
                data-bb-toggle="increase-qty"
                aria-label="{{ __('Increase quantity') }}"
                @disabled($isOutOfStock)>
            <i class="icon icon-plus"></i>
        </button>
    @else
        <input class="quantity-product quantity-product--readonly"
               type="number"
               name="{{ $inputName }}"
               value="1"
               min="1"
               max="1"
               readonly>
    @endif
</div>
