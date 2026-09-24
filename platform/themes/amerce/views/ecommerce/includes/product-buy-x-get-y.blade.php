@php
    use Botble\Media\Facades\RvMedia;

    $rules = $product->buy_x_get_y_rules ?? collect();
@endphp

@if (! empty($rules) && (is_countable($rules) ? count($rules) : iterator_count($rules)) > 0)
    <form class="form-buyX-getY"
          action="{{ route('public.cart.add-to-cart') }}"
          method="POST"
          data-bb-toggle="buy-x-get-y-form">
        @csrf

        <h5 class="title-buyX-getY">{{ __('Special Deal') }}</h5>

        <div class="group-item-product">
            @foreach ($rules as $index => $rule)
                <div class="item-product">
                    <div class="ribbon effect-flash">
                        {{ $rule['ribbon'] ?? __('plugins/ecommerce::products.buy_x_label', ['count' => $rule['quantity'] ?? 1]) }}
                    </div>
                    <div class="img-product">
                        <img loading="lazy"
                             src="{{ RvMedia::getImageUrl($rule['image'] ?? null) }}"
                             alt="{{ $rule['name'] ?? '' }}">
                    </div>
                    <div class="info-product">
                        @if (! empty($rule['url']))
                            <a href="{{ $rule['url'] }}"
                               class="name-product lh-24 fw-medium link-underline-text text-line-clamp-2">
                                {{ $rule['name'] ?? '' }}
                            </a>
                        @else
                            <span class="name-product lh-24 fw-medium text-line-clamp-2">
                                {{ $rule['name'] ?? '' }}
                            </span>
                        @endif

                        <div class="price-wrap">
                            <span class="price-new text-primary fw-semibold">
                                {{ format_price($rule['price'] ?? 0) }}
                            </span>
                            @if (! empty($rule['original_price']))
                                <span class="price-old text-caption-01 cl-text-3">
                                    {{ format_price($rule['original_price']) }}
                                </span>
                            @endif
                        </div>

                        @if (! empty($rule['variants']))
                            <div class="variant-product tf-select">
                                <select name="buy_x_get_y[{{ $index }}][variant_id]" data-bb-toggle="buy-x-variant">
                                    @foreach ($rule['variants'] as $variant)
                                        <option value="{{ $variant['id'] }}">{{ $variant['label'] }}</option>
                                    @endforeach
                                </select>
                            </div>
                        @endif
                    </div>
                </div>

                @if (! $loop->last)
                    <span class="plus-add">
                        <i class="icon icon-plus"></i>
                    </span>
                @endif
            @endforeach
        </div>

        <button type="submit" class="tf-btn effect-flash w-100">
            {{ __('Grab this deal') }}
        </button>
    </form>
@endif
