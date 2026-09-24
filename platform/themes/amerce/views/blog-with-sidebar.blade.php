<div class="page-with-sidebar">
    <div class="row">
        <div class="col-lg-8">
            @if (function_exists('shortcode'))
                {!! BaseHelper::clean(apply_filters(PAGE_FILTER_FRONT_PAGE_CONTENT, $page->content, $page)) !!}
            @else
                {!! BaseHelper::clean($page->content) !!}
            @endif
        </div>
        <div class="col-lg-4">
            @include(Theme::getThemeNamespace('partials.sidebar'))
        </div>
    </div>
</div>
