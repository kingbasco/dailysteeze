@php
    /**
     * Style-2 price facet — slide-up reveal card variant.
     * Same data contract as style-1; style-2 prefix lets CSS target the variant.
     */
    use Botble\Ecommerce\Facades\EcommerceHelper;
@endphp

<div class="price-wrap card-product__price card-product-style-2__price">
    @include(EcommerceHelper::viewPath('includes.product-price'), [
        'product' => $product,
        'class' => 'card-product__price-amount',
    ])
</div>
