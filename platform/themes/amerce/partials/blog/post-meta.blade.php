<div class="entry-meta">
    <div class="meta-item meta-date">
        <i class="icon icon-CalendarBlank"></i>
        <span class="text-body-1">
            {{ $post->created_at?->translatedFormat('F j, Y') }}
        </span>
    </div>
    @if ($post->author)
        <div class="br-line type-vertical"></div>
        <div class="meta-item meta-author">
            <i class="icon icon-User"></i>
            <span class="text-body-1">
                {{ __('by :name', ['name' => $post->author->name]) }}
            </span>
        </div>
    @endif
</div>
