@if ($paginator->hasPages())
    <nav class="at-pagination d-flex align-items-center justify-content-between">
        <div class="at-pagination__prev me-auto">
            @if ($paginator->onFirstPage())
                <span class="at-pagination__arrow at-pagination__arrow--disabled">
                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="12" viewBox="0 0 14 12" fill="none">
                        <path d="M5.66667 1L1 5.66667M1 5.66667L5.66667 10.3333M1 5.66667H13"
                              stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>
                    {{ __('PREV') }}
                </span>
            @else
                <a href="{{ $paginator->previousPageUrl() }}" class="at-pagination__arrow">
                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="12" viewBox="0 0 14 12" fill="none">
                        <path d="M5.66667 1L1 5.66667M1 5.66667L5.66667 10.3333M1 5.66667H13"
                              stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>
                    {{ __('PREV') }}
                </a>
            @endif
        </div>

        <ul class="at-pagination__pages list-unstyled d-flex align-items-center gap-2 mb-0">
            @foreach ($elements as $element)
                @if (is_string($element))
                    <li class="pagination_item"><span>{{ $element }}</span></li>
                @endif
                @if (is_array($element))
                    @foreach ($element as $page => $url)
                        <li class="pagination_item {{ $page == $paginator->currentPage() ? 'current' : '' }}">
                            @if ($page == $paginator->currentPage())
                                <span>{{ $page }}</span>
                            @else
                                <a href="{{ $url }}">{{ $page }}</a>
                            @endif
                        </li>
                    @endforeach
                @endif
            @endforeach
        </ul>

        <div class="at-pagination__next ms-auto">
            @if ($paginator->hasMorePages())
                <a href="{{ $paginator->nextPageUrl() }}" class="at-pagination__arrow">
                    {{ __('NEXT') }}
                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="12" viewBox="0 0 14 12" fill="none">
                        <path d="M8.33333 1L13 5.66667M13 5.66667L8.33333 10.3333M13 5.66667H1"
                              stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>
                </a>
            @else
                <span class="at-pagination__arrow at-pagination__arrow--disabled">
                    {{ __('NEXT') }}
                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="12" viewBox="0 0 14 12" fill="none">
                        <path d="M8.33333 1L13 5.66667M13 5.66667L8.33333 10.3333M13 5.66667H1"
                              stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>
                </span>
            @endif
        </div>
    </nav>
@endif
