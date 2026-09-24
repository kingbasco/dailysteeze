{{-- Mirrors html/home-furniture.html "Category" section (lines 1444-1559):
     full-width swiper of category-v05 cards. First card is an optional CTA
     (e.g. "Sale Off") with bg-primary background and a SealPercent-style icon;
     remaining cards are image-first category tiles on bg-main.
     7 cards visible on laptop, 5 on desktop default, dot pagination.

     Attributes consumed (admin-form fields):
       cta_label       — text shown on the leading promo card (empty hides it)
       cta_count       — quantity text under the label (e.g. "36 items")
       cta_url         — destination link
       cta_icon        — icomoon class (default: SealPercent)
       count_overrides — pipe-separated counts to display per category in order
                         (e.g. "12|18|26|32|22|14"). When set, replaces the DB
                         `products_count` value for parity with html demos that
                         hardcode counts. Empty/missing falls back to DB count.
                         Added 2026-05-15 for HomeFurniture parity (demo lines
                         1444-1559 show 12/18/26/32/22/14 not DB-derived counts).
--}}
@php
    $ctaLabel = trim((string) ($shortcode->cta_label ?? ''));
    $ctaCount = trim((string) ($shortcode->cta_count ?? ''));
    $ctaUrl   = trim((string) ($shortcode->cta_url ?? '#'));
    $ctaIcon  = trim((string) ($shortcode->cta_icon ?? 'icon-SealPercent')) ?: 'icon-SealPercent';
    $hasCta   = $ctaLabel !== '';

    // count_overrides: pipe-separated ints, e.g. "12|18|26|32".
    $countOverridesRaw = trim((string) ($shortcode->count_overrides ?? ''));
    $countOverrides = $countOverridesRaw !== ''
        ? array_values(array_filter(array_map('trim', explode('|', $countOverridesRaw)), fn ($v) => $v !== ''))
        : [];
@endphp

<div class="container-full">
    <div dir="ltr" class="swiper tf-swiper categories-grid-slider-cta"
        data-laptop="7" data-preview="5" data-tablet="4"
        data-mobile-sm="3" data-mobile="2"
        data-space-lg="20" data-space-md="15" data-space="10"
        data-pagination="2" data-pagination-sm="3" data-pagination-md="4" data-pagination-lg="7">
        <div class="swiper-wrapper">
            @if ($hasCta)
                <div class="swiper-slide">
                    <a href="{{ $ctaUrl }}" class="category-v05 bg-primary wow fadeInUp">
                        <div class="cate-icon text-white">
                            <i class="icon {{ $ctaIcon }}"></i>
                        </div>
                        <div class="cate-content">
                            <h6 class="cate_name text-white">{!! BaseHelper::clean($ctaLabel) !!}</h6>
                            @if ($ctaCount !== '')
                                <p class="cate_quantity text-white">{!! BaseHelper::clean($ctaCount) !!}</p>
                            @endif
                        </div>
                    </a>
                </div>
            @endif
            @forelse ($categories as $idx => $category)
                @php
                    $overrideCount = $countOverrides[$idx] ?? null;
                    $displayCount = $overrideCount !== null
                        ? (int) $overrideCount
                        : (int) ($category->products_count ?? 0);
                @endphp
                <div class="swiper-slide">
                    <a href="{{ $category->url ?: '#' }}" class="category-v05 bg-main wow fadeInUp">
                        <div class="cate-image">
                            {!! RvMedia::image($category->image ?? null, $category->name, 'thumb', false, ['width' => 60, 'height' => 60, 'loading' => 'lazy']) !!}
                        </div>
                        <div class="cate-content">
                            <h6 class="cate_name link">{!! BaseHelper::clean($category->name) !!}</h6>
                            @if ($showCount)
                                <p class="cate_quantity cl-text-2">
                                    {{ trans_choice(':count item|:count items', $displayCount, ['count' => $displayCount]) }}
                                </p>
                            @endif
                        </div>
                    </a>
                </div>
            @empty
                <div class="swiper-slide text-center text-muted">{{ __('No categories selected.') }}</div>
            @endforelse
        </div>
        <div class="sw-dot-default tf-sw-pagination"></div>
    </div>
</div>
