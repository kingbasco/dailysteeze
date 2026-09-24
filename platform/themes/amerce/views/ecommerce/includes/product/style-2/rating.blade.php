@php
    use Botble\Ecommerce\Facades\EcommerceHelper;

    if (! EcommerceHelper::isReviewEnabled()) {
        return;
    }

    $avg = (float) ($product->reviews_avg ?? $product->average_rating ?? 0);

    if (EcommerceHelper::hideRatingWhenNoReviews() && $avg <= 0) {
        return;
    }
@endphp

<div class="star-wrap card-product__rating card-product-style-2__rating d-flex align-items-center">
    @include(EcommerceHelper::viewPath('includes.rating-star'), [
        'avg' => $avg,
        'product' => $product,
    ])
</div>
