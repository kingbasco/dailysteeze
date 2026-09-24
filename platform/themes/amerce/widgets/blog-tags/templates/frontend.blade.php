@php
    // $tags is provided by Botble\Blog\Widgets\Fronts\Tags::data() via the
    // get_popular_tags() helper. Limit comes from $config['number_display'].
    $title = $config['title'] ?? $config['name'] ?? __('Popular Tags');
@endphp

@if ($tags->isNotEmpty())
    <div class="sidebar-item">
        @if (! empty($title))
            <h5 class="sb-title">{{ $title }}</h5>
        @endif
        <ul class="sb-tag">
            @foreach ($tags as $tag)
                <li><a href="{{ $tag->url }}" class="text-caption-01">{{ $tag->name }}</a></li>
            @endforeach
        </ul>
    </div>
@endif
