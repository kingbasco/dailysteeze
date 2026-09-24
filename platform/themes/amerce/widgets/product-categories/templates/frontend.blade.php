<div class="widget widget-product-categories tf-product-categories-widget">
    @if (! empty($config['title']))
        {{-- h6 + text-seal mirrors the trust-seal title used by the
             Safe-Checkout payment widget so all product-detail sidebar
             blocks share one heading style. --}}
        <p class="h6 text-seal mb-0">{{ $config['title'] }}</p>
    @endif

    @if ($categories->isNotEmpty())
        <ul class="tf-product-categories-list list-unstyled mb-0">
            @foreach ($categories as $category)
                <li class="tf-product-categories-item">
                    <a href="{{ $category->url }}" class="tf-product-categories-link link">
                        <span class="tf-product-categories-name">{{ $category->name }}</span>
                        @if ($showCount)
                            <span class="tf-product-categories-count cl-text-3">({{ $category->products_count ?? 0 }})</span>
                        @endif
                    </a>

                    @if ($maxDepth > 1 && $category->children->isNotEmpty())
                        <ul class="tf-product-categories-sublist list-unstyled">
                            @foreach ($category->children as $subcat)
                                <li class="tf-product-categories-item">
                                    <a href="{{ $subcat->url }}" class="tf-product-categories-link link">
                                        <span class="tf-product-categories-name">{{ $subcat->name }}</span>
                                        @if ($showCount)
                                            <span class="tf-product-categories-count cl-text-3">({{ $subcat->products_count ?? 0 }})</span>
                                        @endif
                                    </a>
                                </li>
                            @endforeach
                        </ul>
                    @endif
                </li>
            @endforeach
        </ul>
    @endif
</div>
