@php
    // $displayBlogSidebar=true → blog index (8/4 layout matching html/blog.html demo)
    // $displayBlogSidebar=false → category/tag/author archives (full-width 3-col grid)
    $displayBlogSidebar ??= true;
    $items = isset($posts) ? $posts : collect();
    $gridSizing = $displayBlogSidebar
        ? 'sm-col-2'
        : 'lg-col-3 md-col-2 sm-col-2';
@endphp

<section class="section-blog flat-spacing">
    <div class="container">
        <div class="row">
            <div class="{{ $displayBlogSidebar ? 'col-lg-8' : 'col-12' }}">
                <div class="tf-grid-layout {{ $gridSizing }}">
                    @forelse ($items as $post)
                        @include(Theme::getThemeNamespace('partials.blog.post-card'), ['post' => $post])
                    @empty
                        <p class="cl-text-2">{{ __('No posts found.') }}</p>
                    @endforelse

                    @if ($items instanceof \Illuminate\Pagination\AbstractPaginator && $items->hasPages())
                        <div class="wd-full">
                            {!! $items->onEachSide(1)->links(Theme::getThemeNamespace('partials.blog-pagination')) !!}
                        </div>
                    @endif
                </div>
            </div>

            @if ($displayBlogSidebar)
                <div class="col-lg-4 d-none d-lg-block">
                    @include(Theme::getThemeNamespace('partials.blog.sidebar'))
                </div>
            @endif
        </div>
    </div>
</section>
