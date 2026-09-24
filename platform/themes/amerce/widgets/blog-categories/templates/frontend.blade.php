@php
    // $categories is provided by Botble\Blog\Widgets\Fronts\Categories::data().
    // $config['display_posts_count'] is the canonical key ('yes'|'no').
    $title = $config['title'] ?? $config['name'] ?? __('Categories');
    $showCount = ($config['display_posts_count'] ?? 'yes') === 'yes';
@endphp

@if ($categories->isNotEmpty())
    <div class="sidebar-item">
        @if (! empty($title))
            <h5 class="sb-title">{{ $title }}</h5>
        @endif
        <ul class="sb-category">
            @foreach ($categories as $category)
                <li>
                    <a href="{{ $category->url }}">
                        {{ $category->name }}
                        @if ($showCount)
                            <span class="count">({{ number_format($category->posts_count ?? 0) }})</span>
                        @endif
                    </a>
                </li>
            @endforeach
        </ul>
    </div>
@endif
