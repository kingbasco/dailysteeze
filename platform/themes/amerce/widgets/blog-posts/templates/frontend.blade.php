@php
    // $posts is provided by Botble\Blog\Widgets\Fronts\Posts::data(). The admin
    // form lets editors pick `type` (latest / featured / popular / recent) and
    // `number_display` (limit).
    $title = $config['title'] ?? $config['name'] ?? __('Recent Posts');
@endphp

@if ($posts->isNotEmpty())
    <div class="sidebar-item">
        @if (! empty($title))
            <h5 class="sb-title">{{ $title }}</h5>
        @endif
        <ul class="sb-recent">
            @foreach ($posts as $post)
                <li class="recent-item">
                    <a href="{{ $post->url }}" class="image">
                        {!! RvMedia::image($post->image, $post->name ?: 'Image', 'thumb', false, ['width' => 90, 'height' => 90, 'loading' => 'lazy']) !!}
                    </a>
                    <div class="meta">
                        <p class="meta-date text-caption-01 cl-text-2">
                            {{ $post->created_at?->translatedFormat('d F') }}
                        </p>
                        <a href="{{ $post->url }}" class="meta-name link-underline link fw-medium">
                            {{ $post->name }}
                        </a>
                    </div>
                </li>
            @endforeach
        </ul>
    </div>
@endif
