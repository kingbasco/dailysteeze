@php
    /**
     * Public store header — cover image, logo, name, badge, rating, contact meta inline,
     * description, social links. Mirrors shofy's bb-shop-banner layout.
     *
     * Inputs:
     *   $store  \Botble\Marketplace\Models\Store  (required)
     */
    $coverImage = method_exists($store, 'getMetaData') ? $store->getMetaData('background', true) : null;
    $coverImage = $coverImage ?: ($store->cover_image ?? null);
    $coverUrl = $coverImage ? \Botble\Media\Facades\RvMedia::getImageUrl($coverImage) : null;

    $reviewsEnabled = is_plugin_active('ecommerce') && \Botble\Ecommerce\Facades\EcommerceHelper::isReviewEnabled();
    $hideAddress = \Botble\Marketplace\Facades\MarketplaceHelper::hideStoreAddress();
    $hideEmail = \Botble\Marketplace\Facades\MarketplaceHelper::hideStoreEmail();
    $hidePhone = \Botble\Marketplace\Facades\MarketplaceHelper::hideStorePhoneNumber();
    $hideSocial = \Botble\Marketplace\Facades\MarketplaceHelper::hideStoreSocialLinks();
    $socials = (! $hideSocial && method_exists($store, 'getMetaData'))
        ? ($store->getMetaData('social_links', true) ?: [])
        : [];

    $reviewsCount = $reviewsEnabled ? (int) $store->reviews()->count() : 0;
@endphp

<header class="marketplace-store__banner" @if ($coverUrl) style="background-image: url('{{ $coverUrl }}');" @endif>
    <div class="marketplace-store__banner-overlay"></div>

    <div class="container marketplace-store__banner-inner">
        <div class="marketplace-store__banner-row">
            <div class="marketplace-store__avatar">
                {!! \Botble\Media\Facades\RvMedia::image(
                    $store->logo,
                    $store->name,
                    'thumb',
                    true,
                    ['class' => 'marketplace-store__avatar-img']
                ) !!}
            </div>

            <div class="marketplace-store__info">
                <h1 class="marketplace-store__name h3 mb-2 d-inline-flex align-items-center gap-2">
                    <span>{{ $store->name }}</span>
                    @if (! empty($store->badge))
                        {!! \Botble\Base\Facades\BaseHelper::clean($store->badge) !!}
                    @endif
                </h1>

                @if ($reviewsEnabled)
                    <div class="marketplace-store__rating d-flex align-items-center gap-2 mb-2">
                        @includeIf(\Botble\Ecommerce\Facades\EcommerceHelper::viewPath('includes.rating-star'), ['avg' => (float) ($store->reviews()->avg('star') ?? 0)])
                        <small class="marketplace-store__rating-count">
                            {{ $reviewsCount === 1 ? __('1 Review') : __(':count Reviews', ['count' => number_format($reviewsCount)]) }}
                        </small>
                    </div>
                @endif

                @if (
                    (! $hideAddress && $store->full_address)
                    || (! $hidePhone && $store->phone)
                    || (! $hideEmail && $store->email)
                )
                    <ul class="marketplace-store__contact list-unstyled d-flex flex-wrap align-items-center gap-3 mb-2 small">
                        @if (! $hideAddress && $store->full_address)
                            <li class="d-flex align-items-center gap-1">
                                <i class="icon icon-map-pin" aria-hidden="true"></i>
                                <span>{{ $store->full_address }}</span>
                            </li>
                        @endif

                        @if (! $hidePhone && $store->phone)
                            <li class="d-flex align-items-center gap-1">
                                <i class="icon icon-phone" aria-hidden="true"></i>
                                <a href="tel:{{ $store->phone }}">{{ $store->phone }}</a>
                            </li>
                        @endif

                        @if (! $hideEmail && $store->email)
                            <li class="d-flex align-items-center gap-1">
                                <i class="icon icon-mail" aria-hidden="true"></i>
                                <a href="mailto:{{ $store->email }}">{{ $store->email }}</a>
                            </li>
                        @endif
                    </ul>
                @endif

                @if (! empty($store->description))
                    <p class="marketplace-store__description mb-2">
                        {{ \Illuminate\Support\Str::limit(strip_tags($store->description), 280) }}
                    </p>
                @endif

                @if (! empty($socials))
                    <ul class="marketplace-store__socials list-inline mb-0">
                        @foreach (\Botble\Marketplace\Facades\MarketplaceHelper::getAllowedSocialLinks() as $key => $social)
                            @continue(! \Illuminate\Support\Arr::get($socials, $key))
                            <li class="list-inline-item">
                                <a
                                    href="{{ \Illuminate\Support\Arr::get($social, 'url') . \Illuminate\Support\Arr::get($socials, $key) }}"
                                    target="_blank"
                                    rel="noopener noreferrer"
                                    aria-label="{{ \Illuminate\Support\Arr::get($social, 'name', $key) }}"
                                >
                                    @if ($iconName = \Illuminate\Support\Arr::get($social, 'icon'))
                                        <i class="icon icon-{{ $iconName }}" aria-hidden="true"></i>
                                    @else
                                        <i class="icon icon-{{ $key }}" aria-hidden="true"></i>
                                    @endif
                                </a>
                            </li>
                        @endforeach
                    </ul>
                @endif
            </div>
        </div>
    </div>
</header>
