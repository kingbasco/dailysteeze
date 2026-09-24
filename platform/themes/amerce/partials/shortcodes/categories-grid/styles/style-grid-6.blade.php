@php $cols = 6; @endphp

<div class="container">
    <div class="row gy-30 gx-20 mt-30 row-cols-2 row-cols-sm-3 row-cols-md-4 row-cols-lg-5 row-cols-xl-{{ $cols }}">
        @forelse ($categories as $category)
            <div class="col">
                <div class="category-v03 style-3 hover-img4">
                    <a href="{{ $category->url ?: '#' }}" class="cate-image img-style4">
                        {!! RvMedia::image($category->image ?? null, $category->name, 'thumb', false, ['loading' => 'lazy']) !!}
                    </a>
                    <div class="cate-content">
                        <a href="{{ $category->url ?: '#' }}" class="cate_name h5 fw-medium rounded-0">
                            {!! BaseHelper::clean($category->name) !!}
                            @if ($showCount)
                                <span class="cate-count text-caption-01 cl-text-3">({{ (int) ($category->products_count ?? 0) }})</span>
                            @endif
                            <i class="icon icon-ArrowUpRight1"></i>
                        </a>
                    </div>
                </div>
            </div>
        @empty
            <div class="col text-center text-muted">{{ __('No categories selected.') }}</div>
        @endforelse
    </div>
</div>
