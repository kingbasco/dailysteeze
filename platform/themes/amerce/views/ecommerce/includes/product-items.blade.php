@php
    /**
     * Loop wrapper for a collection of product cards.
     *
     * Inputs:
     *   $products  iterable<\Botble\Ecommerce\Models\Product>  (required)
     *   $cardStyle string  (optional, forwarded to dispatcher)
     *   $viewMode  string  (optional, forwarded as grid|list|small)
     */
    $cardStyleParam = $cardStyle ?? null;
    $viewModeParam = $viewMode ?? ($view_mode ?? null);
@endphp

@foreach ($products as $product)
    @include(EcommerceHelper::viewPath('includes.product-item'), [
        'product' => $product,
        'cardStyle' => $cardStyleParam,
        'viewMode' => $viewModeParam,
    ])
@endforeach
