@php
    use Botble\Ecommerce\Facades\EcommerceHelper;

    if (! EcommerceHelper::isReviewEnabled()) {
        return;
    }

    $selectedRating = (int) request()->query('rating', 0);
    $ratingOptions = [5, 4, 3, 2, 1];
@endphp

<div class="widget-facet" data-bb-toggle="filter-rating">
    <div
        class="facet-title"
        data-bs-target="#filter-rating-collapse"
        role="button"
        data-bs-toggle="collapse"
        aria-expanded="true"
        aria-controls="filter-rating-collapse"
    >
        <h6>{{ __('Rating') }}</h6>
        <span class="icon icon-CaretDown"></span>
    </div>
    <div id="filter-rating-collapse" class="collapse show">
        <ul class="collapse-body filter-group-check">
            @foreach ($ratingOptions as $value)
                <li class="list-item">
                    <input
                        type="radio"
                        class="tf-check style-2"
                        id="filter-rating-{{ $value }}"
                        name="rating"
                        value="{{ $value }}"
                        @checked($selectedRating === $value)
                        data-action="apply-filter"
                    >
                    <label for="filter-rating-{{ $value }}" class="label">
                        <span class="rating-stars d-inline-flex align-items-center gap-1">
                            @for ($i = 1; $i <= 5; $i++)
                                <i class="icon {{ $i <= $value ? 'icon-Star' : 'icon-StarOutline' }}"></i>
                            @endfor
                            <span class="ms-1">{{ $value === 1 ? __(':count star & up', ['count' => $value]) : __(':count stars & up', ['count' => $value]) }}</span>
                        </span>
                    </label>
                </li>
            @endforeach
        </ul>
    </div>
</div>
