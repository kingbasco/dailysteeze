@php
    $groupsCount = max(1, count($resolved));
    $colClass = match (true) {
        $groupsCount === 1 => 'col-12',
        $groupsCount === 2 => 'col-md-6',
        $groupsCount === 3 => 'col-lg-4 col-md-6',
        default => 'col-lg-3 col-md-6',
    };
@endphp

<div class="row gy-4 ecommerce-product-groups__columns">
    @foreach ($resolved as $group)
        <div class="{{ $colClass }} ecommerce-product-groups__column">
            <div class="ecommerce-product-groups__column-header mb-3">
                <h3 class="h5 mb-0">{{ $group['tab_label'] ?: __('Products') }}</h3>
            </div>
            <ul class="list-unstyled d-flex flex-column gap-3 mb-0">
                @foreach ($group['products'] ?? [] as $product)
                    <li class="ecommerce-product-groups__column-item d-flex gap-3 align-items-center">
                        <a href="{{ $product->url }}" class="flex-shrink-0">
                            {!! \Botble\Media\Facades\RvMedia::image(
                                $product->image,
                                $product->name,
                                'thumb',
                                false,
                                ['width' => 80, 'height' => 80, 'class' => 'rounded']
                            ) !!}
                        </a>
                        <div class="flex-grow-1">
                            <h4 class="h6 mb-1">
                                <a href="{{ $product->url }}" class="text-reset text-decoration-none">{{ $product->name }}</a>
                            </h4>
                            <div class="ecommerce-product-groups__column-price">
                                @if ($product->front_sale_price !== $product->price)
                                    <del class="text-muted small me-1">{{ format_price($product->price) }}</del>
                                @endif
                                <span class="fw-semibold">{{ format_price($product->front_sale_price) }}</span>
                            </div>
                        </div>
                    </li>
                @endforeach
            </ul>
        </div>
    @endforeach
</div>
