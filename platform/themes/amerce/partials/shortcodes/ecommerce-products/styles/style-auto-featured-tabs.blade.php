@php
    use Botble\Base\Facades\BaseHelper;

    $tabs = $tabs ?? [];
    $perView = max(1, min(6, (int) ($shortcode->items_per_row ?: 4)));
    $limit = (int) ($shortcode->limit ?: 10);
    $ajaxUrl = \Illuminate\Support\Facades\Route::has('public.ajax.featured-tabs-products')
        ? route('public.ajax.featured-tabs-products')
        : '';

    // Grid-with-banner layout (construction demo §4).
    $tabLayout       = trim((string) ($shortcode->tab_content_layout ?? 'swiper'));
    $isGridWithBanner = $tabLayout === 'grid-with-banner';
    $bannerImage      = (string) ($shortcode->banner_image ?? '');
    $bannerHeading    = (string) ($shortcode->banner_heading ?? '');
    $bannerSubheading = (string) ($shortcode->banner_subheading ?? '');
    $bannerBtnText    = (string) ($shortcode->banner_button_text ?? __('Shop Now'));
    $bannerBtnUrl     = (string) ($shortcode->banner_button_url ?? '#');
    $tabLabelClass    = trim((string) ($shortcode->tab_label_class ?? '')) ?: 'fw-medium';
    $tabNavModifier   = $isGridWithBanner ? '' : 'style-2 text-nowrap';
@endphp

<div
    class="flat-animate-tab"
    data-featured-tabs
    data-ajax-url="{{ $ajaxUrl }}"
    data-limit="{{ $limit }}"
    data-items-per-row="{{ $perView }}"
    @if ($isGridWithBanner)
        data-layout="grid-with-banner"
        data-banner-image="{{ $bannerImage }}"
        data-banner-heading="{{ $bannerHeading }}"
        data-banner-subheading="{{ $bannerSubheading }}"
        data-banner-button-text="{{ $bannerBtnText }}"
        data-banner-button-url="{{ $bannerBtnUrl }}"
    @endif
>
    <div class="sect-heading type-2 has-col-right">
        <div class="wow fadeInUp">
            @if (! empty($shortcode->title ?? ''))
                <h3 class="s-title">{!! BaseHelper::clean($shortcode->title) !!}</h3>
            @endif
            @if (! empty($shortcode->subtitle ?? ''))
                <p class="s-desc text-body-1 cl-text-2">{!! BaseHelper::clean($shortcode->subtitle) !!}</p>
            @endif
        </div>
        <div class="col-right overflow-auto wow fadeInUp" data-wow-delay="0.1s">
            <ul class="tab-btn-wrap-v2 {{ $tabNavModifier }}" role="tablist">
                @foreach ($tabs as $i => $tab)
                    <li class="nav-tab-item" role="presentation">
                        <a
                            href="#{{ $tab['slug'] }}"
                            class="tf-btn-tab @if ($i === 0) active @endif"
                            role="tab"
                            data-featured-tab
                            data-source="{{ $tab['source'] ?? ($shortcode->source ?: 'latest') }}"
                            data-category="{{ $tab['category_value'] ?? '' }}"
                            data-loaded="{{ ! empty($tab['loaded']) ? 'true' : 'false' }}"
                        >
                            <span class="{{ $tabLabelClass }}">{{ $tab['label'] }}</span>
                        </a>
                    </li>
                @endforeach
            </ul>
        </div>
    </div>

    <div class="tab-content">
        @foreach ($tabs as $i => $tab)
            <div class="tab-pane @if ($i === 0) active show @endif" id="{{ $tab['slug'] }}" role="tabpanel">
                <div class="featured-tab-content" data-featured-tabs-content>
                    @if (! empty($tab['loaded']))
                        @if ($isGridWithBanner)
                            @include(Theme::getThemeNamespace('partials.shortcodes.ecommerce-products.styles.style-auto-featured-tabs-grid-banner'), [
                                'products' => $tab['products'],
                                'bannerImage' => $bannerImage,
                                'bannerHeading' => $bannerHeading,
                                'bannerSubheading' => $bannerSubheading,
                                'bannerBtnText' => $bannerBtnText,
                                'bannerBtnUrl' => $bannerBtnUrl,
                            ])
                        @else
                            @include(Theme::getThemeNamespace('partials.shortcodes.ecommerce-products.styles.style-auto-featured-tabs-products'), [
                                'products' => $tab['products'],
                                'perView' => $perView,
                            ])
                        @endif
                    @else
                        <div class="featured-tabs-loading py-5 text-center cl-text-2">{{ __('Loading...') }}</div>
                    @endif
                </div>
            </div>
        @endforeach
    </div>
</div>
