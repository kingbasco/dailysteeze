@if (! is_plugin_active('blog'))
    @php return; @endphp
@endif

<div class="sidebar-item">
    <div class="sb-search">
        <form action="{{ route('public.search') }}" method="GET" class="form-search-blog">
            <fieldset>
                <input class="style-stroke-bottom" type="text" name="q"
                       placeholder="{{ $config['placeholder'] ?? __('Search...') }}"
                       value="{{ request('q') }}"
                       aria-label="{{ __('Search posts') }}">
            </fieldset>
            <button type="submit" class="btn-action link" aria-label="{{ __('Search') }}">
                <i class="icon icon-MagnifyingGlass"></i>
            </button>
        </form>
    </div>
</div>
