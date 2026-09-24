@php
    use Botble\Media\Facades\RvMedia;

    $bundleProducts = $product->frequently_bought_together_products ?? collect();
@endphp

@if (! empty($bundleProducts) && (is_countable($bundleProducts) ? count($bundleProducts) : iterator_count($bundleProducts)) > 0)
    <div class="tf-product-fbt">
        <h5 class="mb-24">{{ __('Frequently Bought Together') }}</h5>

        <ul class="list-order-product list-bundle-prd">
            @foreach ($bundleProducts as $idx => $bundleItem)
                <li class="order-item fw-medium">
                    <div class="bundle-check d-flex">
                        <input name="bundleOrder[]"
                               class="tf-check style-2"
                               type="{{ $idx === 0 ? 'radio' : 'checkbox' }}"
                               value="{{ $bundleItem->id }}"
                               data-bundle-price="{{ $bundleItem->front_sale_price }}"
                               data-bb-toggle="bundle-pick"
                               @if ($idx === 0) checked @endif>
                    </div>

                    <a href="{{ $bundleItem->url }}" class="img-prd">
                        <img loading="lazy"
                             width="100"
                             height="133"
                             src="{{ RvMedia::getImageUrl($bundleItem->image) }}"
                             alt="{{ $bundleItem->name }}">
                    </a>

                    <div class="infor-prd">
                        <a href="{{ $bundleItem->url }}"
                           class="prd_name fw-medium lh-24 link link-underline">
                            {{ $bundleItem->name }}
                        </a>

                        @foreach ($bundleItem->variation_attribute_summary ?? [] as $attrLabel => $attrValue)
                            <div class="text-caption-01">
                                <span class="cl-text-2">{{ $attrLabel }}:</span> {{ $attrValue }}
                            </div>
                        @endforeach
                    </div>

                    <div class="quantity-price text-primary">
                        {{ format_price($bundleItem->front_sale_price) }}
                    </div>
                </li>
            @endforeach
        </ul>

        <h6 class="bundle-total-submit mb-12">
            <span class="text cl-text-2 fw-normal">{{ __('Total price:') }}</span>
            &nbsp;
            <span class="total-price-bundle fw-semibold" data-bb-value="bundle-total">
                {{ format_price(0) }}
            </span>
        </h6>

        <button type="button"
                class="btn-submit-total tf-btn btn-primary w-100 animate-btn"
                data-bb-toggle="add-bundle-to-cart"
                data-url="{{ url('ecommerce/cart/add-bundle') }}">
            {{ __('Add Selected To Cart') }}
            <i class="icon icon-shopping-cart-simple fs-24"></i>
        </button>
    </div>
@endif
