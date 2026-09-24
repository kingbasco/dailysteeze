<div class="widget widget-header-controls d-flex align-items-center gap-2">
    @if (! empty($config['show_search']))
        <a href="#search" data-bs-toggle="modal" class="nav-icon-item link" aria-label="{{ __('Search') }}">
            <i class="icon icon-MagnifyingGlass"></i>
        </a>
    @endif

    @if (! empty($config['show_dark_toggle']))
        <button type="button" class="nav-icon-item link bg-transparent border-0 p-0" data-action="toggle-theme-mode" aria-label="{{ __('Toggle theme') }}">
            <i class="icon icon-Sun is-light-only"></i>
            <i class="icon icon-Moon is-dark-only"></i>
        </button>
    @endif

    @if (! empty($config['show_language_switcher']))
        @include(Theme::getThemeNamespace('partials.language-switcher'))
    @endif
</div>
