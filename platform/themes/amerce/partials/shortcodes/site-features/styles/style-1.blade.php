@php
    /**
     * `compact` (default no) — drops the top `br-line` divider and the nested
     * `flat-spacing pb-0` block. HomeSport's demo §2 (html/home-sport.html line
     * 1397) is a bare `flat-spacing > container > swiper` with no divider and no
     * doubled top padding; other variants keep the divider + extra spacing.
     *
     * `title_tag` (default h5) — heading element for each box-icon title.
     * home-decor.html §9 (line 2285) uses `<h6 class="title">` — pass `title_tag='h6'`.
     * Allowlist: h2..h6 + p (no h1 — box-icon is a sub-section heading).
     */
    $compact = ($shortcode->compact ?? 'no') === 'yes';
    $titleTagRaw = trim((string) ($shortcode->title_tag ?? 'h5'));
    $titleTag = in_array($titleTagRaw, ['h2', 'h3', 'h4', 'h5', 'h6', 'p'], true) ? $titleTagRaw : 'h5';
@endphp

<div class="container">
    <div @class(['position-relative', 'flat-spacing pb-0' => ! $compact])>
        @unless ($compact)
            <div class="br-line fake-class top-0"></div>
        @endunless
        <div dir="ltr" class="swiper tf-swiper"
            data-preview="4" data-tablet="3" data-mobile-sm="2" data-mobile="1"
            data-space-lg="30" data-space-md="20" data-space="10"
            data-pagination="1" data-pagination-sm="2" data-pagination-md="3" data-pagination-lg="4">
            <div class="swiper-wrapper">
                @foreach ($items as $item)
                    <div class="swiper-slide">
                        <div class="box-icon_V01 style-2 wow fadeInLeft">
                            @if (! empty($item['icon_class']))
                                <span class="icon"><i class="icon {{ $item['icon_class'] }}"></i></span>
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
            <div class="sw-line-default style-2 tf-sw-pagination"></div>
        </div>
    </div>
</div>
