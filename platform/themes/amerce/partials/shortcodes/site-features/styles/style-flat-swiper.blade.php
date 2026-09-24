@php
    /**
     * Mirrors html/home-cosmetic.html §11 (lines 2525-2585) and html/home-garden.html
     * §10 (lines 3213-3273) — `box-icon_V01` swiper. Per-preset knobs:
     *   card_modifier    : extra class on .box-icon_V01 (e.g. 'has-line' for home-garden's
     *                      vertical separator between cards).
     *   icon_class_extra : extra class on the icon span (e.g. 'mb-16' to match home-garden).
     *   title_tag        : 'h5' (home-garden) | 'h6' (cosmetic, default).
     *   pagination_class : 'sw-line-default style-2' (default) | 'sw-dot-default' (home-garden).
     *   data_space_lg    : preset-specific gap (e.g. 60.67 for home-garden).
     */
    $cardModifier   = trim((string) ($shortcode->card_modifier ?? ''));
    $iconClassExtra = trim((string) ($shortcode->icon_class_extra ?? ''));
    // Coalesce FIRST, then validate — `?? 'h6'` inside in_array() still returned the
    // null original via the ternary, emitting `<>` instead of `<h6>`.
    $titleTag       = ($tt = (string) ($shortcode->title_tag ?? 'h6')) && in_array($tt, ['h4', 'h5', 'h6'], true) ? $tt : 'h6';
    $paginationClass = trim((string) ($shortcode->pagination_class ?? 'sw-line-default style-2'));
    $dataSpaceLg    = (float) ($shortcode->data_space_lg ?? 30);
    $dataSpaceMd    = (float) ($shortcode->data_space_md ?? 20);
    $dataSpace      = (float) ($shortcode->data_space    ?? 10);

    $sectionClass   = trim((string) ($shortcode->section_class ?? 'flat-spacing'));
    $innerClass     = trim((string) ($shortcode->inner_class ?? ''));
    $showBorder     = ($shortcode->show_border ?? 'no') === 'yes';
@endphp

<div class="{{ $sectionClass }}">
    <div class="container">
        <div class="position-relative {{ $innerClass }}">
            @if ($showBorder)
                <div class="br-line fake-class top-0"></div>
            @endif
            <div dir="ltr" class="swiper tf-swiper"
             data-preview="4" data-tablet="3" data-mobile-sm="2" data-mobile="1"
             data-space-lg="{{ $dataSpaceLg }}" data-space-md="{{ $dataSpaceMd }}" data-space="{{ $dataSpace }}"
             data-pagination="1" data-pagination-sm="2" data-pagination-md="3" data-pagination-lg="4">
            <div class="swiper-wrapper">
                @foreach ($items as $item)
                    <div class="swiper-slide">
                        <div class="box-icon_V01 {{ $cardModifier }} wow fadeInLeft">
                            @if (! empty($item['icon_class']))
                                <span class="icon {{ $iconClassExtra }}">
                                    <i class="icon {{ $item['icon_class'] }}"></i>
                                </span>
                            @endif
                            <div class="content">
                                @if (! empty($item['title']))
                                    <{{ $titleTag }} class="title">{!! BaseHelper::clean($item['title']) !!}</{{ $titleTag }}>
                                @endif
                                @if (! empty($item['description']))
                                    <p class="text cl-text-2">{!! BaseHelper::clean($item['description']) !!}</p>
                                @endif
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
            <div class="{{ $paginationClass }} tf-sw-pagination"></div>
        </div>
    </div>
</div>
