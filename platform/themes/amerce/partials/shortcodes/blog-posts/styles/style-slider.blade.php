@php
    // Per-preset card modifier (e.g. 'style-3' for home-garden's tag-on-image variant).
    $cardModifier = trim((string) ($shortcode->card_modifier ?? ''));
    $categoryLabels = array_values(array_filter(array_map('trim', explode('|', (string) ($shortcode->category_labels ?? '')))));
    $showCategories = ($shortcode->show_categories ?? 'no') === 'yes' || ! empty($categoryLabels);
    $headingTag = in_array($shortcode->heading_tag ?? '', ['h4', 'h5'], true) ? $shortcode->heading_tag : 'h5';
    $imageSize = trim((string) ($shortcode->image_size ?? 'medium')) ?: null;
    // data_preview: desktop slides-per-view — default 3 (legacy). home-cosmetic §10
    // demo is 2-up (html/home-cosmetic.html line 2475). Pagination-lg follows it.
    // NB: cache the raw value before casting — `(int) ($shortcode->data_preview ?? 3)`
    // inside `in_array()` defaults correctly, but re-evaluating `(int) $shortcode->data_preview`
    // on the true-branch loses the `?? 3` fallback and renders `data-preview="0"`
    // when the attribute is unset (HomeSneaker §9 bug discovered 2026-05-15).
    $dataPreviewRaw = $shortcode->data_preview ?? 3;
    $dataPreview = in_array((int) $dataPreviewRaw, [1, 2, 3, 4], true) ? (int) $dataPreviewRaw : 3;
@endphp
<div dir="ltr" class="swiper tf-swiper"
    data-preview="{{ $dataPreview }}" data-tablet="2" data-mobile-sm="2" data-mobile="1"
    data-space-lg="30" data-space-md="20" data-space="10"
    data-pagination="1" data-pagination-sm="2" data-pagination-md="2" data-pagination-lg="{{ $dataPreview }}">
    <div class="swiper-wrapper">
        @forelse ($posts as $post)
            @php
                $categoryLabel = $categoryLabels[$loop->index] ?? $post->categories->first()?->name;
            @endphp
            <div class="swiper-slide">
                <article @class(['article-blog', $cardModifier, 'hover-img', 'wow fadeInUp']) @if($loop->index > 0) data-wow-delay="{{ number_format($loop->index / 10, 1) }}s" @endif>
                    <a href="{{ $post->url ?: '#' }}" class="blog-image img-style">
                        {!! RvMedia::image($post->image ?? null, $post->name, $imageSize, false, [
                            'loading' => 'lazy',
                            'style' => 'aspect-ratio: 4 / 3; object-fit: cover; width: 100%; height: auto;'
                        ]) !!}
                        @if ($showCategories && $categoryLabel)
                            <div class="wrap-tags d-flex gap-12">
                                <span class="tag text-caption-01">{!! BaseHelper::clean(mb_strtoupper($categoryLabel)) !!}</span>
                            </div>
                        @endif
                    </a>
                    <div class="blog-content">
                        @if ($showMeta)
                            <p class="entry-date text-caption-01 fw-semibold cl-text-3">{{ $post->created_at?->format('d F') }}</p>
                        @endif
                        <{{ $headingTag }} class="entry-title">
                            <a href="{{ $post->url ?: '#' }}" class="link-underline link text-capitalize">{!! BaseHelper::clean($post->name) !!}</a>
                        </{{ $headingTag }}>
                        @if ($showExcerpt && ! empty($post->description))
                            <p class="entry-desc cl-text-2">{!! BaseHelper::clean($post->description) !!}</p>
                        @endif
                    </div>
                </article>
            </div>
        @empty
            <div class="swiper-slide text-center text-muted">{{ __('No posts found.') }}</div>
        @endforelse
    </div>
    <div class="sw-line-default style-2 tf-sw-pagination"></div>
</div>
