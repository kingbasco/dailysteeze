<div class="ecommerce-products__list d-flex flex-column gap-3">
    @foreach ($products as $product)
        <article class="ecommerce-products__list-item d-flex align-items-center gap-3 p-3 border rounded">
            <a href="{{ $product->url }}" class="ecommerce-products__list-thumb flex-shrink-0">
                {!! \Botble\Media\Facades\RvMedia::image(
                    $product->image,
                    $product->name,
                    'thumb',
                    false,
                    ['width' => 120, 'height' => 120, 'class' => 'rounded']
                ) !!}
            </a>
            <div class="ecommerce-products__list-body flex-grow-1">
                @if ($product->brand_id && $product->brand)
                    <p class="ecommerce-products__list-brand text-uppercase small text-muted mb-1">
                        {{ $product->brand->name }}
                    </p>
                @endif
                <h3 class="h6 mb-2">
                    <a href="{{ $product->url }}" class="text-reset text-decoration-none">{{ $product->name }}</a>
                </h3>
                <div class="ecommerce-products__list-price">
                    @if ($product->front_sale_price !== $product->price)
                        <del class="text-muted me-2">{{ format_price($product->price) }}</del>
                    @endif
                    <span class="fw-semibold">{{ format_price($product->front_sale_price) }}</span>
                </div>
            </div>
            <div class="ecommerce-products__list-actions">
                <a href="{{ $product->url }}" class="btn btn-sm btn-outline-dark">{{ __('View') }}</a>
            </div>
        </article>
    @endforeach
</div>
