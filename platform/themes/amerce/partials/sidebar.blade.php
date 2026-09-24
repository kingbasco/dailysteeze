@php
    $sidebarId = $sidebarId ?? 'blog_sidebar';
    $sidebarContent = dynamic_sidebar($sidebarId);
@endphp

@if ($sidebarContent)
    <aside class="tf-sidebar tf-sidebar--{{ $sidebarId }}">
        {!! $sidebarContent !!}
    </aside>
@endif
