<div class="row gy-30 mt-30">
    @forelse ($posts as $post)
        <div class="col-lg-4 col-md-6">
            <article class="blog-card-item">
                <a href="{{ $post->url ?: '#' }}" class="blog-image d-block radius-10 overflow-hidden">
                    {!! RvMedia::image($post->image ?? null, $post->name, 'medium', false, ['class' => 'w-100', 'loading' => 'lazy']) !!}
                </a>
                <div class="blog-content mt-15">
                    @if ($showMeta)
                        <p class="meta text-caption-01 cl-text-3">
                            {{ $post->created_at?->format('M d, Y') }}
                            @if ($post->author)
                                · {!! BaseHelper::clean($post->author->name ?? '') !!}
                            @endif
                        </p>
                    @endif
                    <h5 class="title fw-medium mt-5">
                        <a href="{{ $post->url ?: '#' }}" class="link-underline-primary">{!! BaseHelper::clean($post->name) !!}</a>
                    </h5>
                    @if ($showExcerpt && ! empty($post->description))
                        <p class="excerpt text-body-1 cl-text-2 mt-10">{!! BaseHelper::clean($post->description) !!}</p>
                    @endif
                </div>
            </article>
        </div>
    @empty
        <div class="col-12 text-center text-muted">{{ __('No posts found.') }}</div>
    @endforelse
</div>
