@php
    use Botble\Blog\Models\Post;

    // Prev/next via composite (created_at, id) so seeded posts that share a
    // timestamp still navigate cleanly. Matches html/blog-single.html
    // nav-post-list and group-direc footer; Botble has no built-in helper.
    $prevPost = Post::query()->wherePublished()
        ->where(fn ($query) => $query
            ->where('created_at', '<', $post->created_at)
            ->orWhere(fn ($q) => $q->where('created_at', $post->created_at)->where('id', '<', $post->getKey())))
        ->orderByDesc('created_at')
        ->orderByDesc('id')
        ->first();

    $nextPost = Post::query()->wherePublished()
        ->where(fn ($query) => $query
            ->where('created_at', '>', $post->created_at)
            ->orWhere(fn ($q) => $q->where('created_at', $post->created_at)->where('id', '>', $post->getKey())))
        ->orderBy('created_at')
        ->orderBy('id')
        ->first();

    $blogIndexUrl = function_exists('get_blog_page_url') ? get_blog_page_url() : url('/');
    $primaryCategory = $post->categories->first();

    // Demo crumb chain is Home → Blog → Post Title (BlogService's default
    // injects the post category instead, which doesn't match the html/blog-single.html
    // demo). Override with a custom 3-level chain for the post detail header.
    $postCrumbs = [
        ['label' => __('Home'), 'url' => url('/')],
        ['label' => __('Blog'), 'url' => $blogIndexUrl],
        ['label' => $post->name, 'url' => $post->url],
    ];
@endphp

<div class="section-page-title-single flat-spacing-3">
    <div class="container">
        <div class="main-page-title">
            <div class="breadcrumbs">
                @include(Theme::getThemeNamespace('partials.breadcrumb-list'), ['crumbs' => $postCrumbs])
            </div>
            <div class="nav-post-list">
                @if ($prevPost)
                    <a href="{{ $prevPost->url }}" class="link nav-post-item nav-post-prev" aria-label="{{ __('Previous post') }}">
                        <i class="icon icon-CaretLeft"></i>
                    </a>
                @else
                    <span class="link nav-post-item nav-post-prev disabled" aria-disabled="true">
                        <i class="icon icon-CaretLeft"></i>
                    </span>
                @endif
                <a href="{{ $blogIndexUrl }}" class="link nav-all-post nav-post-link" aria-label="{{ __('All posts') }}">
                    <i class="icon icon-SquaresFour"></i>
                </a>
                @if ($nextPost)
                    <a href="{{ $nextPost->url }}" class="link nav-post-item nav-post-next" aria-label="{{ __('Next post') }}">
                        <i class="icon icon-CaretRightThin"></i>
                    </a>
                @else
                    <span class="link nav-post-item nav-post-next disabled" aria-disabled="true">
                        <i class="icon icon-CaretRightThin"></i>
                    </span>
                @endif
            </div>
        </div>
    </div>
</div>

<section class="section-blog-single">
    <div class="main-blog-single">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    @if ($post->image)
                        <div class="blog-image mb-30">
                            {!! RvMedia::image($post->image, $post->name, 'hero-banner', false, ['loading' => 'eager']) !!}
                        </div>
                    @endif

                    <div class="blog-content">
                        <div class="blog-heading">
                            @if ($primaryCategory)
                                <div class="entry-tag fw-medium">{{ $primaryCategory->name }}</div>
                            @endif
                            <h3 class="entry-title">{{ $post->name }}</h3>
                            @include(Theme::getThemeNamespace('partials.blog.post-meta'))
                        </div>

                        <div class="ck-content">
                            {!! BaseHelper::clean($post->content) !!}
                        </div>

                        <div class="box-social-tag">
                            @if ($post->tags->isNotEmpty())
                                <div class="tags-right d-flex align-items-center flex-wrap gap-8">
                                    <p>{{ __('Tags:') }}</p>
                                    @foreach ($post->tags as $tag)
                                        <a href="{{ $tag->url }}" class="tag-item text-caption-01">{{ $tag->name }}</a>
                                    @endforeach
                                </div>
                            @endif
                            <div class="social-left">
                                <p>{{ __('Share this post:') }}</p>
                                {!! Theme::renderSocialSharing($post->url, $post->description, $post->image) !!}
                            </div>
                        </div>

                        @if ($prevPost || $nextPost)
                            <div class="group-direc">
                                @if ($prevPost)
                                    <a href="{{ $prevPost->url }}" class="btn-direc prev link">
                                        <p class="fw-semibold text-decoration-underline">{{ __('Previous') }}</p>
                                        <p class="name-post h6 fw-medium">{{ $prevPost->name }}</p>
                                    </a>
                                @else
                                    <span></span>
                                @endif
                                <span class="br-line type-vertical"></span>
                                @if ($nextPost)
                                    <a href="{{ $nextPost->url }}" class="btn-direc next link">
                                        <p class="fw-semibold text-decoration-underline">{{ __('Next') }}</p>
                                        <p class="name-post h6 fw-medium">{{ $nextPost->name }}</p>
                                    </a>
                                @else
                                    <span></span>
                                @endif
                            </div>
                        @endif
                    </div>
                </div>

                <div class="col-lg-4 d-none d-lg-block">
                    @include(Theme::getThemeNamespace('partials.blog.sidebar'))
                </div>
            </div>
        </div>
    </div>
</section>

@if (is_plugin_active('blog'))
    @include(Theme::getThemeNamespace('partials.blog.related-posts'))
@endif
