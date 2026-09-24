@php
    use Botble\Ecommerce\Facades\EcommerceHelper;

    $productVariation = $productVariation ?? null;
@endphp

<div class="tf-product-availability text-caption-01 mb-12">
    @if ($product->stock_status == 'on_backorder')
        <span class="badge bg-warning text-warning-fg">
            <i class="icon icon-Timer"></i>
            {{ __('On backorder') }}
        </span>
    @elseif ($product->isOutOfStock())
        <span class="badge bg-danger text-danger-fg">
            <i class="icon icon-X2"></i>
            {{ __('Out of stock') }}
        </span>
    @else
        @if (! $productVariation)
            <span class="badge bg-success text-success-fg">
                <i class="icon icon-CheckCircle1"></i>
                {{ __('In stock') }}
            </span>
        @else
            @if ($productVariation->stock_status == 'on_backorder')
                <span class="badge bg-warning text-warning-fg">
                    <i class="icon icon-Timer"></i>
                    {{ __('On backorder') }}
                </span>
            @elseif ($productVariation->isOutOfStock())
                <span class="badge bg-danger text-danger-fg">
                    <i class="icon icon-X2"></i>
                    {{ __('Out of stock') }}
                </span>
            @elseif (! $productVariation->with_storehouse_management || $productVariation->quantity < 1)
                <span class="badge bg-success text-success-fg">
                    <i class="icon icon-CheckCircle1"></i>
                    {{ __('Available') }}
                </span>
            @elseif ($productVariation->quantity)
                <span class="badge bg-success text-success-fg">
                    <i class="icon icon-CheckCircle1"></i>
                    @if (EcommerceHelper::showNumberOfProductsInProductSingle())
                        {{ (int) $productVariation->quantity === 1
                            ? __(':number product available', ['number' => $productVariation->quantity])
                            : __(':number products available', ['number' => $productVariation->quantity]) }}
                    @else
                        {{ __('In stock') }}
                    @endif
                </span>
            @endif
        @endif
    @endif
</div>
