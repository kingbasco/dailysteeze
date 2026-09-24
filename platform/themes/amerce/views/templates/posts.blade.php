{{--
    Blog plugin's `[blog-posts]` shortcode renderer looks for this view path
    (Theme::getThemeNamespace() . "::views.templates.posts") and falls back to
    its plain <article> default if missing. Wraps the theme's blog-posts style
    partials so the rendered shortcode matches the rest of the design system.
--}}
@php
    $allowed = ['style-grid', 'style-slider', 'style-list', 'style-insights-split'];
    $style = in_array($shortcode->style ?? '', $allowed, true) ? $shortcode->style : 'style-grid';
    $showExcerpt = ($shortcode->show_excerpt ?? 'yes') === 'yes';
    $showMeta = ($shortcode->show_meta ?? 'yes') === 'yes';
    $sectionClass = trim((string) ($shortcode->section_class ?? 'flat-spacing-2'));
    $containerClass = trim((string) ($shortcode->container_class ?? 'container'));
    $limit = (int) ($shortcode->limit ?? 4);

    $items = $posts;
    if ($items instanceof \Illuminate\Support\Collection || $items instanceof \Illuminate\Pagination\AbstractPaginator) {
        if (($shortcode->order_by ?? '') === 'oldest') {
            $items = $items->sortBy([
                ['created_at', 'asc'],
                ['id', 'asc'],
            ]);
        }

        $items = $items->take($limit > 0 ? $limit : 4);
    }
@endphp

<section {!! $shortcode->htmlAttributes() !!} class="{{ $sectionClass }} blog-posts-{{ $style }}">
    <div class="{{ $containerClass }}">
        @if (! empty($shortcode->title ?? '') || ! empty($shortcode->subtitle ?? ''))
            <div class="sect-heading type-2 text-center wow fadeInUp">
                @if (! empty($shortcode->title ?? ''))
                    <h3 class="s-title">{!! BaseHelper::clean($shortcode->title) !!}</h3>
                @endif
                @if (! empty($shortcode->subtitle ?? ''))
                    <p class="s-desc text-body-1 cl-text-2">{!! BaseHelper::clean($shortcode->subtitle) !!}</p>
                @endif
            </div>
        @endif

        @include(Theme::getThemeNamespace("partials.shortcodes.blog-posts.styles.$style"), [
            'shortcode'   => $shortcode,
            'posts'       => $items,
            'showExcerpt' => $showExcerpt,
            'showMeta'    => $showMeta,
        ])
    </div>
</section>
