<div class="row gy-3 ecommerce-coupons__grid">
    @foreach ($coupons as $coupon)
        @php
            $isPercent = ($coupon->type_option ?? 'amount') === 'percentage';
            $valueLabel = $isPercent
                ? rtrim(rtrim(number_format((float) $coupon->value, 2, '.', ''), '0'), '.') . '%'
                : format_price($coupon->value);
        @endphp
        <div class="col-lg-3 col-md-6 ecommerce-coupons__item">
            <div class="ecommerce-coupons__card p-3 border rounded d-flex align-items-center gap-3 bg-light h-100">
                <div class="ecommerce-coupons__value text-center px-3 py-2 bg-dark text-white rounded flex-shrink-0">
                    <span class="d-block h4 mb-0">{{ $valueLabel }}</span>
                    <span class="small text-uppercase">{{ __('OFF') }}</span>
                </div>
                <div class="ecommerce-coupons__body flex-grow-1">
                    <p class="ecommerce-coupons__name mb-1 fw-semibold">{{ $coupon->title ?: $coupon->code }}</p>
                    <p class="small text-muted mb-2">
                        {{ __('Code:') }}
                        <span class="ecommerce-coupons__code fw-semibold text-dark">{{ $coupon->code }}</span>
                    </p>
                    <button type="button"
                            class="btn btn-sm btn-outline-dark"
                            data-action="copy-coupon"
                            data-coupon="{{ $coupon->code }}">
                        {{ __('Copy code') }}
                    </button>
                </div>
            </div>
        </div>
    @endforeach
</div>
