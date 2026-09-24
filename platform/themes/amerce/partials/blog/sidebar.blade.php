@php
    // Renders all widgets registered to the `blog_sidebar` (search, categories,
    // recent posts, tags). Wrapper classes match html/blog.html demo's outer
    // structure; each widget supplies its own `.sidebar-item` container.
    $blogSidebar = dynamic_sidebar('blog_sidebar');
@endphp

@if ($blogSidebar)
    <div class="blog-sidebar sidebar-content-wrap sticky-top">
        {!! $blogSidebar !!}
    </div>
@endif
