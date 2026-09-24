@if ($products instanceof \Illuminate\Contracts\Pagination\LengthAwarePaginator && $products->hasMorePages())
    <div
        class="wd-full justify-content-center mt-4"
        data-bb-toggle="infinite-scroll-wrapper"
        data-action="infinite-scroll"
        data-url="{{ $products->withQueryString()->nextPageUrl() }}"
        data-current-page="{{ $products->currentPage() }}"
        data-last-page="{{ $products->lastPage() }}"
    >
        <button
            type="button"
            id="loadMoreBtn"
            class="btn-loadmore tf-btn animate-btn tf-loading loadmore infinite-scroll"
            data-action="load-more"
            data-url="{{ $products->withQueryString()->nextPageUrl() }}"
        >
            <span class="text d-none">{{ __('Load More') }}</span>
            <span class="spinner-circle" aria-hidden="true">
                <span class="spinner-circle1 spinner-child"></span>
                <span class="spinner-circle2 spinner-child"></span>
                <span class="spinner-circle3 spinner-child"></span>
                <span class="spinner-circle4 spinner-child"></span>
                <span class="spinner-circle5 spinner-child"></span>
                <span class="spinner-circle6 spinner-child"></span>
                <span class="spinner-circle7 spinner-child"></span>
                <span class="spinner-circle8 spinner-child"></span>
                <span class="spinner-circle9 spinner-child"></span>
            </span>
        </button>
    </div>
@endif
