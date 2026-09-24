@php
    $title       = trim((string) ($config['title'] ?? ''));
    $defaultIcon = trim((string) ($config['icon'] ?? 'icon-CheckCircle'));

    $items = array_values(array_filter(
        (array) ($config['items'] ?? []),
        fn ($row) => is_array($row) && trim((string) ($row['text'] ?? '')) !== ''
    ));
@endphp

@if (! empty($items))
    <div class="tf-product-sidebar-bullets widget-sidebar-bullets">
        @if ($title !== '')
            <p class="h6 mb-12">{{ $title }}</p>
        @endif

        <ul class="list-sidebar-bullets">
            @foreach ($items as $item)
                @php
                    $rowIcon = trim((string) ($item['icon'] ?? ''));
                    $iconClass = $rowIcon !== '' ? $rowIcon : $defaultIcon;
                @endphp
                <li class="sidebar-bullet-item">
                    <i class="icon {{ $iconClass }}"></i>
                    <span>{{ $item['text'] }}</span>
                </li>
            @endforeach
        </ul>
    </div>
@endif
