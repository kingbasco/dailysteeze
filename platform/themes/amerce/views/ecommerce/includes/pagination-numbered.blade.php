@if ($products instanceof \Illuminate\Contracts\Pagination\LengthAwarePaginator && $products->hasPages())
    @php
        $prevSvg = '<svg xmlns="http://www.w3.org/2000/svg" width="10" height="14" viewBox="0 0 10 14" fill="none" aria-hidden="true"><path d="M8 1L2 7L8 13" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/></svg>';
        $nextSvg = '<svg xmlns="http://www.w3.org/2000/svg" width="10" height="14" viewBox="0 0 10 14" fill="none" aria-hidden="true"><path d="M2 1L8 7L2 13" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/></svg>';
    @endphp
    <div class="d-flex justify-content-center tf-page-pagination-wrap">
        <div class="tf-page-pagination">
            @if ($products->onFirstPage())
                <span class="pag-item disabled" aria-disabled="true">{!! $prevSvg !!}</span>
            @else
                <a href="{{ $products->previousPageUrl() }}" class="pag-item" rel="prev" aria-label="{{ __('Previous') }}">{!! $prevSvg !!}</a>
            @endif

            @foreach ($products->onEachSide(1)->links()->elements as $element)
                @if (is_string($element))
                    <span class="pag-item dots">{{ $element }}</span>
                @endif

                @if (is_array($element))
                    @foreach ($element as $page => $url)
                        @if ($page == $products->currentPage())
                            <p class="pag-item active" aria-current="page">{{ $page }}</p>
                        @else
                            <a href="{{ $url }}" class="pag-item">{{ $page }}</a>
                        @endif
                    @endforeach
                @endif
            @endforeach

            @if ($products->hasMorePages())
                <a href="{{ $products->nextPageUrl() }}" class="pag-item" rel="next" aria-label="{{ __('Next') }}">{!! $nextSvg !!}</a>
            @else
                <span class="pag-item disabled" aria-disabled="true">{!! $nextSvg !!}</span>
            @endif
        </div>
    </div>
@endif
