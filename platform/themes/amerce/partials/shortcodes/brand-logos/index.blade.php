@php
    $allowed = ['style-grid', 'style-slider', 'style-infinite'];
    $style = in_array($shortcode->style ?? '', $allowed, true) ? $shortcode->style : 'style-grid';
    $itemsPerRow = max(2, min(12, (int) ($shortcode->items_per_row ?? 6)));
    $sectionClass = trim((string) ($shortcode->section_class ?? 'flat-spacing'));

    $brands = collect();
    if (is_plugin_active('ecommerce') && class_exists(\Botble\Ecommerce\Models\Brand::class)) {
        $ids = \Botble\Shortcode\ShortcodeField::parseIds($shortcode->brand_ids ?? null);
        $query = \Botble\Ecommerce\Models\Brand::query()
            ->wherePublished()
            ->with(['slugable']);
        if (! empty($ids)) {
            $query->whereIn('id', $ids)->orderByRaw('FIELD(id, ' . implode(',', array_map('intval', $ids)) . ')');
        } else {
            $query->orderBy('order')->orderByDesc('id');
        }
        $brands = $query->limit(50)->get();
    }
@endphp

<section {!! $shortcode->htmlAttributes() !!} @class(['tf-section', 'brand-logos', "brand-logos-$style", $sectionClass => $sectionClass !== ''])>
    @if (! empty($shortcode->title ?? ''))
        <div class="container">
            <div class="sect-heading text-center">
                <h3 class="s-title">{!! BaseHelper::clean($shortcode->title) !!}</h3>
            </div>
        </div>
    @endif
    @include(Theme::getThemeNamespace("partials.shortcodes.brand-logos.styles.$style"), [
        'shortcode'   => $shortcode,
        'brands'      => $brands,
        'itemsPerRow' => $itemsPerRow,
    ])
</section>
