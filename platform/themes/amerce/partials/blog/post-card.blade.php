@php
    // $featured swaps the thumbnail crop to a wider aspect; mirrors the html
    // demo's primary article-blog markup (assets/images/blog/blog-*.jpg).
    $featured ??= false;
    $thumbType = $featured ? 'horizontal_thumb' : 'medium';
@endphp
<article class="article-blog hover-img">
    <a href="{{ $post->url }}" class="blog-image img-style">
        {!! RvMedia::image($post->image, $post->name ?: 'Image', $thumbType, false, ['loading' => 'lazy']) !!}
    </a>
    <div class="blog-content">
        <p class="entry-date text-caption-01 fw-semibold cl-text-3">
            {{ $post->created_at?->translatedFormat('d F') }}
        </p>
        <h5 class="entry-title">
            <a href="{{ $post->url }}" class="link-underline link">
                {{ $post->name }}
            </a>
        </h5>
        @if (! empty($post->description))
            <p class="entry-desc cl-text-2">{{ $post->description }}</p>
        @endif
    </div>
</article>
