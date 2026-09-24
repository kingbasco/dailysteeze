{{-- Page-scoped layout safety net (.section-our-store .card-store sizing rules)
     lives in assets/sass/component/_inline-migrated.scss. --}}

@php
    use Botble\Media\Facades\RvMedia;

    // Store cards come from theme_option('store_locations'), seeded by
    // Themes/Main/ThemeOptionSeeder so a fresh install ships with six demo
    // locations. Admins can swap them via Theme Options without touching code.
    $storeLocations = theme_option('store_locations', []);
    if (is_string($storeLocations)) {
        $storeLocations = json_decode($storeLocations, true) ?? [];
    }
    if (! is_array($storeLocations)) {
        $storeLocations = [];
    }

    $defaultMapQuery = static function (string $address): string {
        return 'https://www.google.com/maps?q=' . urlencode($address);
    };
@endphp

<section class="section-page-title text-center flat-spacing-2 pb-0">
    <div class="container">
        <div class="main-page-title">
            <div class="breadcrumbs">
                <a href="{{ url('/') }}" class="text-caption-01 cl-text-3 link">{{ __('Home') }}</a>
                <i class="icon icon-CaretRightThin cl-text-3"></i>
                <p class="text-caption-01">{{ __('Our Stores') }}</p>
            </div>
            <h3>{{ __('Our Stores') }}</h3>
            <p class="text-body-1 cl-text-2">
                {{ __('Explore our store locations, experience our collections in person, and easily find') }}
                <br class="d-none d-lg-block">
                {{ __("the one that's closest to you.") }}
            </p>
        </div>
    </div>
</section>

<section class="section-our-store flat-spacing pt-0">
    <div class="container">
        <div class="tf-grid-layout sm-col-2 xl-col-3 flat-spacing-2 pb-0">
            @foreach ($storeLocations as $store)
                @php
                    $name    = $store['name']    ?? '';
                    $address = $store['address'] ?? '';
                    $phone   = $store['phone']   ?? '';
                    $email   = $store['email']   ?? '';
                    $hours   = $store['hours']   ?? '';
                    $mapUrl  = $store['map_url'] ?? ($address ? $defaultMapQuery($address) : '');
                    $imageSrc = ! empty($store['image'])
                        ? RvMedia::getImageUrl($store['image'], null, false, RvMedia::getDefaultImage())
                        : RvMedia::getDefaultImage();
                    $telHref = $phone ? 'tel:' . preg_replace('/[^0-9+]/', '', $phone) : null;
                @endphp

                <div class="card-store">
                    <div class="store-image">
                        <img loading="lazy" width="450" height="338" src="{{ $imageSrc }}" alt="{{ $name }}">
                    </div>
                    <div class="store-infor">
                        @if ($name)
                            <h5 class="info_name">{{ $name }}</h5>
                        @endif

                        <ul class="list-info d-grid gap-4">
                            @if ($address)
                                <li>
                                    <span class="cl-text-2">{{ __('Address:') }}</span>
                                    @if ($mapUrl)
                                        <a href="{{ $mapUrl }}" target="_blank" rel="noopener noreferrer" class="link">{{ $address }}</a>
                                    @else
                                        <span class="link">{{ $address }}</span>
                                    @endif
                                </li>
                            @endif
                            @if ($phone)
                                <li>
                                    <span class="cl-text-2">{{ __('Phone:') }}</span>
                                    <a href="{{ $telHref }}" class="link">{{ $phone }}</a>
                                </li>
                            @endif
                            @if ($email)
                                <li>
                                    <span class="cl-text-2">{{ __('Email:') }}</span>
                                    <a href="mailto:{{ $email }}" class="link">{{ $email }}</a>
                                </li>
                            @endif
                            @if ($hours)
                                <li>
                                    <span class="cl-text-2">{{ __('Hours:') }}</span>
                                    <span class="link">{{ $hours }}</span>
                                </li>
                            @endif
                        </ul>

                        @if ($mapUrl)
                            <a href="{{ $mapUrl }}" target="_blank" rel="noopener noreferrer"
                               class="d-inline-flex align-items-center gap-4 link">
                                <span class="text-decoration-underline fw-medium lh-24">
                                    {{ __('Get direction') }}
                                </span>
                                <i class="icon icon-ArrowUpRight1 fs-20"></i>
                            </a>
                        @endif
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</section>
