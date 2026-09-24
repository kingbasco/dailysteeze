@php
    $allowed = ['style-grid', 'style-slider', 'style-list', 'style-insights-split'];
    $style = in_array($shortcode->style ?? '', $allowed, true) ? $shortcode->style : 'style-grid';

    $posts = collect();
    if (is_plugin_active('blog') && interface_exists(\Botble\Blog\Repositories\Interfaces\PostInterface::class)) {
        $limit = (int) ($shortcode->limit ?? 4);
        $ids = \Botble\Shortcode\ShortcodeField::parseIds($shortcode->category_ids ?? null);
        $query = \Botble\Blog\Models\Post::query()
            ->wherePublished()
            ->with(['categories', 'author', 'slugable']);
        if (! empty($ids)) {
            $query->whereHas('categories', function ($q) use ($ids) {
                $q->whereIn(\Botble\Blog\Models\Category::query()->getModel()->getTable() . '.id', $ids);
            });
        }

        if (($shortcode->order_by ?? '') === 'oldest') {
            $query->orderBy('created_at')->orderBy('id');
        } else {
            $query->orderByDesc('created_at')->orderByDesc('id');
        }

        $posts = $query->limit($limit > 0 ? $limit : 4)->get();
    }
    $showExcerpt = ($shortcode->show_excerpt ?? 'yes') === 'yes';
    $showMeta = ($shortcode->show_meta ?? 'yes') === 'yes';
    $sectionClass = trim((string) ($shortcode->section_class ?? 'flat-spacing-2'));
@endphp

<section {!! $shortcode->htmlAttributes() !!} class="{{ $sectionClass }} blog-posts-{{ $style }}">
    <div class="container">
        @if ($shortcode->title || $shortcode->subtitle)
            <div class="sect-heading type-2 text-center wow fadeInUp">
                @if ($shortcode->title)
                    <h3 class="s-title">{!! BaseHelper::clean($shortcode->title) !!}</h3>
                @endif
                @if ($shortcode->subtitle)
                    <p class="s-desc text-body-1 cl-text-2">{!! BaseHelper::clean($shortcode->subtitle) !!}</p>
                @endif
            </div>
        @endif

        @include(Theme::getThemeNamespace("partials.shortcodes.blog-posts.styles.$style"), [
            'shortcode'   => $shortcode,
            'posts'       => $posts,
            'showExcerpt' => $showExcerpt,
            'showMeta'    => $showMeta,
        ])
    </div>
</section>
