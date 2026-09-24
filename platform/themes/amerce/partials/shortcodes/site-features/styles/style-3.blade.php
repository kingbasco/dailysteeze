<div class="container">
    <div class="tf-features-bar style-icons-only">
        <div class="row gy-30 justify-content-center">
            @foreach ($items as $item)
                <div class="col-auto">
                    <div class="features-item d-flex align-items-center gap-10">
                        @if (! empty($item['icon_class']))
                            <i class="icon {{ $item['icon_class'] }} fs-24"></i>
                        @endif
                        @if (! empty($item['title']))
                            <span class="title fw-medium">{!! BaseHelper::clean($item['title']) !!}</span>
                        @endif
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</div>
