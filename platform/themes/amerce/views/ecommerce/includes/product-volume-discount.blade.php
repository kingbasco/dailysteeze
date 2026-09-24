@php
    use Botble\Media\Facades\RvMedia;

    $tiers = $product->volume_discount_tiers ?? collect();
@endphp

@if (! empty($tiers) && (is_countable($tiers) ? count($tiers) : iterator_count($tiers)) > 0)
    <div class="tf-product-volume-discount overflow-auto">
        <h5 class="mb-20">{{ __('Best Deal For You') }}</h5>

        <div class="flat-check-list list-volume-discount-thumbnail">
            @foreach ($tiers as $tier)
                <label class="check-item volume-discount-thumbnail-item">
                    <span class="volume-check d-none">
                        <input type="radio"
                               name="volume_discount"
                               value="{{ $tier['id'] ?? $loop->index }}"
                               data-bb-toggle="volume-discount-pick">
                    </span>

                    <div class="image-box">
                        @if (! empty($tier['image']))
                            <img loading="lazy"
                                 width="210"
                                 height="280"
                                 src="{{ RvMedia::getImageUrl($tier['image']) }}"
                                 alt="{{ $product->name }}">
                        @endif

                        @if (! empty($tier['save_label']))
                            <div class="tags-save text-caption-01">
                                {{ __('plugins/ecommerce::products.volume_save', ['percent' => $tier['save_label']]) }}
                            </div>
                        @endif
                    </div>

                    <div class="content-discount">
                        <p class="count fw-medium text-body-1">
                            {{ trans_choice('plugins/ecommerce::products.volume_buy_n_items', $tier['quantity'] ?? 1, ['count' => $tier['quantity'] ?? 1]) }}
                        </p>
                        <div class="price-wrap">
                            <span class="price-new text-primary fw-semibold">
                                {{ format_price($tier['price'] ?? 0) }}
                            </span>
                            @if (! empty($tier['original_price']))
                                <span class="price-old text-caption-01 cl-text-3">
                                    {{ format_price($tier['original_price']) }}
                                </span>
                            @endif
                        </div>
                    </div>
                </label>
            @endforeach
        </div>

        <button type="button"
                class="tf-btn animate-btn w-100"
                data-bb-toggle="apply-volume-discount">
            {{ __('Choose this deal') }}
        </button>
    </div>
@endif
