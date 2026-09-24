@php
    /**
     * Style-1 rating facet — shop card.
     * Renders five icon-Star spans so the row matches the demo even with zero
     * reviews; filled count tracks reviews_avg / average_rating when available.
     *
     * Input: $product
     */
    use Botble\Ecommerce\Facades\EcommerceHelper;

    if (! EcommerceHelper::isReviewEnabled()) {
        return;
    }

    $avg = (float) ($product->reviews_avg ?? $product->average_rating ?? 0);

    if (EcommerceHelper::hideRatingWhenNoReviews() && $avg <= 0) {
        return;
    }

    $filledStars = (int) round(max(0, min(5, $avg)));
@endphp

<div class="star-wrap card-product__rating d-flex align-items-center">
    @for ($i = 1; $i <= 5; $i++)
        <i class="icon icon-Star {{ $i <= $filledStars ? '' : 'cl-text-3' }}"></i>
    @endfor
</div>
