<div class="tf-grid-layout md-col-2 cl-gap-xxl-40">
    @forelse ($posts as $post)
        <article class="article-blog style-list hover-img wow fadeInLeft">
            <a href="{{ $post->url ?: '#' }}" class="blog-image img-style">
                {!! RvMedia::image($post->image ?? null, $post->name, 'medium', false, ['width' => 340, 'height' => 227, 'loading' => 'lazy']) !!}
            </a>
            <div class="blog-content">
                @if ($showMeta)
                    <p class="entry-date text-caption-01 fw-semibold cl-text-3">{{ $post->created_at?->format('d F') }}</p>
                @endif
                <h5 class="entry-title">
                    <a href="{{ $post->url ?: '#' }}" class="link-underline link">{!! BaseHelper::clean($post->name) !!}</a>
                </h5>
                @if ($showExcerpt && ! empty($post->description))
                    <p class="entry-desc cl-text-2">{!! BaseHelper::clean($post->description) !!}</p>
                @endif
                <a href="{{ $post->url ?: '#' }}" class="tf-btn-line-2 style-primary fw-semibold py-4">
                    {{ __('Read More') }}
                </a>
            </div>
        </article>
    @empty
        <p class="text-center text-muted col-12">{{ __('No posts found.') }}</p>
    @endforelse
</div>
