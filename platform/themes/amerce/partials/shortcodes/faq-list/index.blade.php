@php
    $allowed = ['style-accordion', 'style-tabs', 'style-side-cta', 'style-default'];
    $style = $shortcode->style ?? 'style-accordion';
    if ($style === 'style-default') {
        $style = 'style-accordion';
    }
    if (! in_array($style, $allowed, true)) {
        $style = 'style-accordion';
    }
    // style-side-cta renders heading inside its own LEFT column (two-col layout).
    $hideTopHeading = $style === 'style-side-cta';

    $faqs = collect();
    $categories = collect();
    if (is_plugin_active('faq') && class_exists(\Botble\Faq\Models\Faq::class)) {
        $limit = (int) ($shortcode->limit ?? 10);
        $catId = (int) ($shortcode->faq_category_id ?? 0);
        $query = \Botble\Faq\Models\Faq::query()
            ->wherePublished()
            ->with(['category'])
            ->orderByDesc('id');
        if ($catId > 0) {
            $query->where('category_id', $catId);
        }
        $faqs = $query->limit($limit > 0 ? $limit : 10)->get();
        $categories = $faqs->groupBy('category_id');
    }
    $uid = 'faq-' . substr(md5(spl_object_hash($shortcode) . microtime()), 0, 8);
@endphp

<section {!! $shortcode->htmlAttributes() !!} @class(['tf-section', 'faq-list' => $style !== 'style-side-cta', "faq-$style", 'flat-spacing'])>
    <div class="container">
        @if (! $hideTopHeading && ! empty($shortcode->title ?? ''))
            <div class="sect-heading text-center">
                <h3 class="s-title">{!! BaseHelper::clean($shortcode->title) !!}</h3>
            </div>
        @endif
        @include(Theme::getThemeNamespace("partials.shortcodes.faq-list.styles.$style"), [
            'shortcode'  => $shortcode,
            'faqs'       => $faqs,
            'categories' => $categories,
            'uid'        => $uid,
        ])
    </div>
</section>
