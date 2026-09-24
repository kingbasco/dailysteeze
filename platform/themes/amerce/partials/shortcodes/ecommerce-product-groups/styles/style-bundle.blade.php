@php
    $bundle = collect($resolved)->flatMap(fn ($group) => collect($group['products'] ?? []))->take(4);
    $bundleTotal = $bundle->sum('front_sale_price');
@endphp

@if ($bundle->isNotEmpty())
    <div class="ecommerce-product-groups__bundle p-4 border rounded">
        <div class="row align-items-center gy-4">
            <div class="col-lg-8">
                <div class="d-flex flex-wrap gap-3 align-items-center ecommerce-product-groups__bundle-items">
                    @foreach ($bundle as $index => $product)
                        <div class="ecommerce-product-groups__bundle-item text-center">
                            <a href="{{ $product->url }}" class="d-block">
                                {!! \Botble\Media\Facades\RvMedia::image(
                                    $product->image,
                                    $product->name,
                                    'thumb',
                                    false,
                                    ['width' => 120, 'height' => 120, 'class' => 'rounded']
                                ) !!}
                            </a>
                            <p class="small mt-2 mb-0">{{ $product->name }}</p>
                            <p class="small fw-semibold mb-0">{{ format_price($product->front_sale_price) }}</p>
                        </div>
                        @if (! $loop->last)
                            <span class="ecommerce-product-groups__bundle-plus h3 mb-0" aria-hidden="true">+</span>
                        @endif
                    @endforeach
                </div>
            </div>
            <div class="col-lg-4 text-lg-end">
                <p class="ecommerce-product-groups__bundle-label small text-uppercase text-muted mb-1">
                    {{ __('Bundle total') }}
                </p>
                <p class="ecommerce-product-groups__bundle-total h3 mb-3">
                    {{ format_price($bundleTotal) }}
                </p>
                <button type="button" class="btn btn-dark btn-lg" data-action="bundle-add-to-cart">
                    {{ __('Add bundle to cart') }}
                </button>
            </div>
        </div>
    </div>
@endif
