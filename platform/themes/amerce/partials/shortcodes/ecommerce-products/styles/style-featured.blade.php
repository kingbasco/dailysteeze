@php
    $items = collect($products);
    $hero = $items->first();
    $rest = $items->skip(1)->take(4);
@endphp

@if ($hero)
    <div class="row gy-4 ecommerce-products__featured">
        <div class="col-lg-6">
            <article class="ecommerce-products__featured-hero position-relative h-100 d-flex">
                <a href="{{ $hero->url }}" class="d-block w-100 overflow-hidden rounded">
                    {!! \Botble\Media\Facades\RvMedia::image(
                        $hero->image,
                        $hero->name,
                        'large',
                        false,
                        ['class' => 'w-100 h-100 object-fit-cover']
                    ) !!}
                </a>
                <div class="ecommerce-products__featured-overlay position-absolute bottom-0 start-0 p-4">
                    <h3 class="h4 mb-2">
                        <a href="{{ $hero->url }}" class="text-reset text-decoration-none">{{ $hero->name }}</a>
                    </h3>
                    <p class="ecommerce-products__featured-price fs-5 fw-semibold mb-0">
                        {{ format_price($hero->front_sale_price) }}
                    </p>
                </div>
            </article>
        </div>
        <div class="col-lg-6">
            <div class="row gy-3">
                @foreach ($rest as $product)
                    <div class="col-6 ecommerce-products__featured-item">
                        @includeIf(Theme::getThemeNamespace('views.ecommerce.includes.product-item'), ['product' => $product])
                    </div>
                @endforeach
            </div>
        </div>
    </div>
@endif
