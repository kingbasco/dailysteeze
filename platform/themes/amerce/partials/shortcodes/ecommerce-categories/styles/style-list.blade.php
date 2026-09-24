<ul class="ecommerce-categories__list list-unstyled d-flex flex-wrap gap-3 mb-0">
    @foreach ($categories as $category)
        <li class="ecommerce-categories__list-item">
            <a href="{{ $category->url }}"
               class="d-inline-flex align-items-center gap-2 px-3 py-2 border rounded text-reset text-decoration-none">
                <span class="ecommerce-categories__name">{{ $category->name }}</span>
                @if ($shortcode->show_count)
                    <span class="badge bg-secondary text-secondary-fg">{{ (int) ($category->products_count ?? 0) }}</span>
                @endif
            </a>
        </li>
    @endforeach
</ul>
