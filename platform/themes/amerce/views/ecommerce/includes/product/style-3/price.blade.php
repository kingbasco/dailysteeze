@php
    use Botble\Ecommerce\Facades\EcommerceHelper;
@endphp

<div class="price-wrap card-product__price card-product-style-3__price">
    @include(EcommerceHelper::viewPath('includes.product-price'), [
        'product' => $product,
        'class' => 'card-product__price-amount',
    ])
</div>
