{{-- Recursive category tree node --}}
<li class="categories-dropdown__item @if($category->children->count()) has-children @endif">
    <a href="{{ $category->url }}" class="dropdown-item d-flex align-items-center justify-content-between">
        <span>{{ $category->name }}</span>
        @if ($category->children->count())
            <i class="icon icon-CaretRight"></i>
        @endif
    </a>
    @if ($category->children->count())
        <ul class="categories-dropdown__submenu">
            @foreach ($category->children as $child)
                @include(Theme::getThemeNamespace('partials.header.categories-item'), ['category' => $child])
            @endforeach
        </ul>
    @endif
</li>
