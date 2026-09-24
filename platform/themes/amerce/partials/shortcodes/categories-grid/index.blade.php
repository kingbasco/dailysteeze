@php
    $allowed = ['style-grid-4', 'style-grid-5', 'style-grid-6', 'style-slider', 'style-slider-icon', 'style-slider-cta', 'style-slider-circle', 'style-slider-wide-image', 'style-card-vertical', 'style-hover-list', 'style-auto-category-slider'];
    $style = in_array($shortcode->style ?? '', $allowed, true) ? $shortcode->style : 'style-grid-4';

    $categories = collect();
    if (is_plugin_active('ecommerce') && class_exists(\Botble\Ecommerce\Models\ProductCategory::class)) {
        $ids = \Botble\Shortcode\ShortcodeField::parseIds($shortcode->category_ids ?? null);
        $limit = (int) ($shortcode->limit ?? 8);
        $query = \Botble\Ecommerce\Models\ProductCategory::query()
            ->wherePublished()
            ->with(['slugable'])
            ->withCount(['products' => fn ($q) => $q->wherePublished()]);
        if (! empty($ids)) {
            $query->whereIn('id', $ids)->orderByRaw('FIELD(id, ' . implode(',', array_map('intval', $ids)) . ')');
        } else {
            $query->where('is_featured', true)->orderBy('order')->orderByDesc('id');
        }
        $categories = $query->limit($limit > 0 ? $limit : 12)->get();
    }
    $showCount = ($shortcode->show_count ?? 'no') === 'yes';

    // The circular slider variant matches the demo's clean "Shop By Categories" section
    // (white background, type-2 heading) — boxed grids keep the muted bg-main-2 wash.
    $isCircleSlider = $style === 'style-slider-circle';
    // Slider styles all sit on white bg in the demos (decor §1, bag §1, pet-care §1,
    // furniture §1, electronics §1) — only the boxed grid styles use the muted
    // `bg-main-2` wash.
    $isCleanBgSlider = $isCircleSlider
        || $style === 'style-slider'
        || $style === 'style-slider-icon'
        || $style === 'style-slider-cta'
        || $style === 'style-slider-wide-image'
        || $style === 'style-auto-category-slider';
    $sectionClass = $isCleanBgSlider ? '' : 'bg-main-2';

    // When `view_all_url` is supplied, switch to the home-mental two-column heading
    // (`type-2 has-col-right`) with a "View All" CTA on the right. Otherwise keep
    // the existing centered heading variants.
    $viewAllUrl = trim((string) ($shortcode->view_all_url ?? ''));
    $viewAllText = $shortcode->view_all_text ?? __('View All Category');
    $hasViewAll = $viewAllUrl !== '';

    if ($hasViewAll) {
        $headingClass = 'sect-heading type-2 has-col-right wow fadeInUp';
    } else {
        $headingClass = ($isCircleSlider || $style === 'style-auto-category-slider' || $style === 'style-slider-wide-image') ? 'sect-heading type-2 text-center wow fadeInUp' : 'sect-heading type-5 text-center';
    }

    // Demo's slider-cta variant (home-furniture lines 1444-1559) wraps the
    // swiper in `flat-spacing-3 pt-0 mt-10` — tighter than the default
    // `flat-spacing` block and with no top padding so it hugs the header.
    // Pet-care (style-slider with category-v05 cards) wraps in `flat-spacing-3`
    // so the colored bg-vN cards sit close to the header.
    $cardClass = (string) ($shortcode->card_class ?? '');
    $spacingClassOverride = trim((string) ($shortcode->spacing_class ?? ''));
    if ($spacingClassOverride !== '') {
        $spacingClass = $spacingClassOverride;
    } elseif ($style === 'style-slider-cta') {
        $spacingClass = 'flat-spacing-3 pt-0 mt-10';
    } elseif ($style === 'style-slider' && $cardClass === 'category-v05') {
        $spacingClass = 'flat-spacing-3';
    } else {
        $spacingClass = 'flat-spacing';
    }

    // skip_section='yes' drops the `<section class="tf-section …">` + `.container`
    // heading wrapper entirely, rendering just the style partial — for demos whose
    // category block is a bare `<div>` with no section padding / no heading
    // (html/home-pod.html §2 line 1367 = bare `<div class="mt-10 px-10">`).
    $skipSection = ($shortcode->skip_section ?? '') === 'yes';
@endphp

@if ($skipSection)
    @include(Theme::getThemeNamespace("partials.shortcodes.categories-grid.styles.$style"), [
        'shortcode'  => $shortcode,
        'categories' => $categories,
        'showCount'  => $showCount,
    ])
@else
<section {!! $shortcode->htmlAttributes() !!} class="tf-section section-categories categories-grid categories-{{ $style }} {{ $spacingClass }} {{ $sectionClass }}">
    <div class="container">
        @if (! empty($shortcode->title ?? '') || ! empty($shortcode->subtitle ?? '') || $hasViewAll)
            <div class="{{ $headingClass }}">
                <div>
                    @if (! empty($shortcode->title ?? ''))
                        <h3 class="s-title">{!! BaseHelper::clean($shortcode->title) !!}</h3>
                    @endif
                    @if (! empty($shortcode->subtitle ?? ''))
                        <p class="s-desc text-body-1 cl-text-2">{!! BaseHelper::clean($shortcode->subtitle) !!}</p>
                    @endif
                </div>
                @if ($hasViewAll)
                    <a href="{{ $viewAllUrl }}" class="tf-btn-line-2 style-primary py-4">
                        <span class="fw-semibold">{!! BaseHelper::clean($viewAllText) !!}</span>
                    </a>
                @endif
            </div>
        @endif
    </div>
    @include(Theme::getThemeNamespace("partials.shortcodes.categories-grid.styles.$style"), [
        'shortcode'  => $shortcode,
        'categories' => $categories,
        'showCount'  => $showCount,
    ])
</section>
@endif
