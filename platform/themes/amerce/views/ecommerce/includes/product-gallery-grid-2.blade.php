@php
    use Botble\Theme\Facades\Theme;
@endphp

@include(Theme::getThemeNamespace('views.ecommerce.includes.product-gallery-grid'), [
    'product' => $product,
    'productImages' => $productImages ?? null,
    'gridVariant' => 'grid-2',
])
