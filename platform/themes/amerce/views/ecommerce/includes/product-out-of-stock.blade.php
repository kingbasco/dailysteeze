<div class="tf-product-out-of-stock">
    <div class="alert bg-danger-lt text-danger-fg mb-12 d-flex align-items-center gap-2" role="alert">
        <i class="icon icon-X2"></i>
        <span class="fw-semibold">{{ __('Currently out of stock') }}</span>
    </div>

    <form class="form-notice-stock"
          action="{{ url('ecommerce/notify-back-in-stock') }}"
          method="POST"
          data-bb-toggle="notify-back-in-stock">
        @csrf
        <input type="hidden" name="product_id" value="{{ $product->id }}" />

        <h5 class="title text-capitalize">{{ __('Notify me when it is back in stock') }}</h5>
        <p class="desc cl-text-2">
            {{ __('Enter your email address to be notified if the product becomes available again.') }}
        </p>
        <div class="form-content">
            <input type="text"
                   name="name"
                   placeholder="{{ __('Name *') }}"
                   required>
            <input type="email"
                   name="email"
                   placeholder="{{ __('Email *') }}"
                   required>
            <button type="submit" class="tf-btn animate-btn">
                {{ __('Subscribe Now') }}
            </button>
        </div>
    </form>
</div>
