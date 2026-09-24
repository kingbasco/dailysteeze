@php
    /**
     * Rich vendor card rendered inside the product-detail "Vendor" tab/accordion.
     * Mirrors shofy's vendor-info layout but uses amerce icon classes + link styles.
     *
     * Inputs:
     *   $store  \Botble\Marketplace\Models\Store  (required)
     */
    $vendorCardEnabled = is_plugin_active('marketplace') && isset($store) && $store && ! empty($store->name);
    $reviewsEnabled = $vendorCardEnabled
        && is_plugin_active('ecommerce')
        && \Botble\Ecommerce\Facades\EcommerceHelper::isReviewEnabled();
    $hideRatingNoReviews = $reviewsEnabled
        && method_exists(\Botble\Ecommerce\Facades\EcommerceHelper::class, 'hideRatingWhenNoReviews')
        && \Botble\Ecommerce\Facades\EcommerceHelper::hideRatingWhenNoReviews();
    $reviewsCount = $reviewsEnabled ? (int) $store->reviews()->count() : 0;
    $showRating = $reviewsEnabled && (! $hideRatingNoReviews || $reviewsCount > 0);
@endphp

@if ($vendorCardEnabled)
    <div class="vendor-card">
        <div class="vendor-card__header d-flex gap-3 mb-3">
            <div class="vendor-card__avatar">
                {!! RvMedia::image(
                    $store->logo_url ?? $store->logo,
                    $store->name,
                    'thumb',
                    true,
                    ['class' => 'rounded-circle', 'style' => 'width: 70px; height: 70px; object-fit: cover;']
                ) !!}
            </div>
            <div class="vendor-card__heading">
                <h5 class="vendor-card__name mb-1">
                    <a href="{{ $store->url }}" class="text-reset link-underline-text">
                        {{ $store->name }}
                    </a>
                    @if (! empty($store->badge))
                        {!! BaseHelper::clean($store->badge) !!}
                    @endif
                </h5>

                @if ($showRating)
                    <div class="vendor-card__rating d-flex align-items-center gap-2">
                        @includeIf(EcommerceHelper::viewPath('includes.rating-star'), ['avg' => (float) ($store->reviews()->avg('star') ?? 0)])
                        <span class="small text-muted">
                            @if ($reviewsCount === 1)
                                ({{ __('1 Review') }})
                            @else
                                ({{ __(':count Reviews', ['count' => number_format($reviewsCount)]) }})
                            @endif
                        </span>
                    </div>
                @endif

                @if ($store->created_at)
                    <time class="small text-muted d-block mt-1" datetime="{{ $store->created_at->toDateString() }}">
                        {{ __('Joined :date', ['date' => $store->created_at->translatedFormat('F Y')]) }}
                    </time>
                @endif
            </div>
        </div>

        <ul class="vendor-card__meta list-unstyled d-flex flex-column gap-2 mb-3">
            @if (! MarketplaceHelper::hideStoreAddress() && $store->full_address)
                <li class="d-flex align-items-start gap-2">
                    <i class="icon icon-map-pin flex-shrink-0 mt-1" aria-hidden="true"></i>
                    <div>
                        <strong>{{ __('Address:') }}</strong>
                        <span>{{ $store->full_address }}</span>
                    </div>
                </li>
            @endif

            @if (! MarketplaceHelper::hideStorePhoneNumber() && $store->phone)
                <li class="d-flex align-items-center gap-2">
                    <i class="icon icon-phone flex-shrink-0" aria-hidden="true"></i>
                    <div>
                        <strong>{{ __('Phone:') }}</strong>
                        <a href="tel:{{ $store->phone }}" class="text-reset">{{ $store->phone }}</a>
                    </div>
                </li>
            @endif

            @if (! MarketplaceHelper::hideStoreEmail() && $store->email)
                <li class="d-flex align-items-center gap-2">
                    <i class="icon icon-mail flex-shrink-0" aria-hidden="true"></i>
                    <div>
                        <strong>{{ __('Email:') }}</strong>
                        <a href="mailto:{{ $store->email }}" class="text-reset">{{ $store->email }}</a>
                    </div>
                </li>
            @endif
        </ul>

        @php
            $blurb = ! empty($store->description)
                ? $store->description
                : (! empty($store->content) ? Str::words(strip_tags($store->content), 50) : '');
        @endphp
        @if ($blurb)
            <p class="vendor-card__description mb-3">
                {!! BaseHelper::clean($blurb) !!}
            </p>
        @endif

        <a href="{{ $store->url }}" class="tf-btn btn-dark vendor-card__cta">
            {{ __('Visit store') }}
            <i class="icon icon-ArrowUpRight1 ms-2" aria-hidden="true"></i>
        </a>
    </div>
@endif
