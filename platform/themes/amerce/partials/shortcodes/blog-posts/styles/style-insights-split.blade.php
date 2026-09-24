@php
    /**
     * Insights split layout — one big featured post LEFT + two stacked list
     * posts RIGHT. Mirrors html/home-headphone.html lines 3437-3507:
     *   `<section class="flat-spacing section-insights"><div class="container">`
     *   (section + container + centered heading are emitted by the parent
     *   index.blade.php) > `<div class="row">`:
     *     col-lg-5 col-xl-6 — one `article-blog style-2 hover-img` (img 690x521)
     *     col-lg-7 col-xl-6 — two `article-blog style-list list-v2 hover-img`
     *                         (img 340x227 img-cover)
     *
     * Takes the first 3 posts: posts[0] = big left, posts[1..2] = list right.
     * The parent index already supplies the `section-insights` wrapper via the
     * `section_class` knob, so this style emits only the inner `.row`.
     *
     * Knobs:
     *   list_count — number of stacked list posts on the right column.
     *                Default 2 (back-compat with HomeHeadphone, which uses 1
     *                featured + 2 list = 3 total). HomeJewelry §12 demo
     *                (html/home-jewelry.html L3655-3751) renders 1 featured +
     *                3 list = 4 total → pass list_count='3'.
     *
     * @var \Illuminate\Support\Collection $posts
     * @var bool $showExcerpt
     * @var bool $showMeta
     */
    $posts = collect($posts)->values();
    $featured = $posts->first();
    $listCount = is_numeric($shortcode->list_count ?? null) ? max(1, (int) $shortcode->list_count) : 2;
    $rest = $posts->slice(1, $listCount)->values();
@endphp

@if ($featured)
    <div class="row">
        <div class="col-lg-5 col-xl-6">
            <article class="article-blog style-2 hover-img wow fadeInLeft h-100">
                <a href="{{ $featured->url ?: '#' }}" class="blog-image img-style">
                    {{-- Original image — NOT `medium` (800x800 square), which crops the
                         landscape blog art (690x521 / 340x227). --}}
                    {!! RvMedia::image($featured->image ?? null, $featured->name, null, false, ['width' => 690, 'height' => 521, 'loading' => 'lazy']) !!}
                </a>
                <div class="blog-content">
                    @if ($showMeta)
                        <p class="entry-date text-caption-01 fw-semibold text-white">{{ $featured->created_at?->format('d F') }}</p>
                    @endif
                    <h4 class="entry-title">
                        <a href="{{ $featured->url ?: '#' }}" class="link-underline link text-white">{!! BaseHelper::clean($featured->name) !!}</a>
                    </h4>
                    @if ($showExcerpt && ! empty($featured->description))
                        <p class="entry-desc text-white">{!! BaseHelper::clean($featured->description) !!}</p>
                    @endif
                </div>
            </article>
        </div>
        <div class="col-lg-7 col-xl-6">
            @foreach ($rest as $post)
                <article class="article-blog style-list list-v2 hover-img wow fadeInLeft">
                    <a href="{{ $post->url ?: '#' }}" class="blog-image img-style w-100">
                        {!! RvMedia::image($post->image ?? null, $post->name, null, false, ['width' => 340, 'height' => 227, 'class' => 'img-cover', 'loading' => 'lazy']) !!}
                    </a>
                    <div class="blog-content">
                        @if ($showMeta)
                            <p class="entry-date text-caption-01 fw-semibold cl-text-3">{{ $post->created_at?->format('d F') }}</p>
                        @endif
                        <h4 class="entry-title">
                            <a href="{{ $post->url ?: '#' }}" class="link-underline link text-line-clamp-2">{!! BaseHelper::clean($post->name) !!}</a>
                        </h4>
                        @if ($showExcerpt && ! empty($post->description))
                            <p class="entry-desc cl-text-2">{!! BaseHelper::clean($post->description) !!}</p>
                        @endif
                    </div>
                </article>
            @endforeach
        </div>
    </div>
@else
    <p class="text-center text-muted">{{ __('No posts found.') }}</p>
@endif
