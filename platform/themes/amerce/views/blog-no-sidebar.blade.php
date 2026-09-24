<div class="page-no-sidebar">
    @if (function_exists('shortcode'))
        {!! BaseHelper::clean(apply_filters(PAGE_FILTER_FRONT_PAGE_CONTENT, $page->content, $page)) !!}
    @else
        {!! BaseHelper::clean($page->content) !!}
    @endif
</div>
