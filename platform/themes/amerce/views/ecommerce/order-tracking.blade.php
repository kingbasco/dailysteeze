@php
    use Botble\Ecommerce\Facades\EcommerceHelper;

    Theme::layout('full-width');
    Theme::set('pageTitle', __('Order tracking'));
    Theme::set('hideBreadcrumb', true);
@endphp

<section class="section-page-title text-center flat-spacing-2">
    <div class="container">
        <div class="main-page-title">
            <h3 class="letter-space-0">{{ __('Order tracking') }}</h3>
            <p class="text-body-1 cl-text-2">
                {{ __('Enter your order code and email to view the latest status of your order. The order code can be found in your confirmation email.') }}
            </p>
        </div>
    </div>
</section>

<div class="flat-spacing pt-0">
    <div class="container">
        <div class="row">
            <div class="col-sm-10 col-lg-8 col-xl-6 mx-auto">
                @if (session('success_msg'))
                    <div class="alert alert-success" role="alert">{{ session('success_msg') }}</div>
                @endif

                @if (session('error_msg'))
                    <div class="alert alert-danger" role="alert">{{ session('error_msg') }}</div>
                @endif

                <form action="{{ route('public.orders.tracking') }}" method="POST" class="form-tracking">
                    @csrf

                    <div class="form-content">
                        <fieldset class="tf-field">
                            <label for="amerce-tracking-code" class="tf-lable fw-medium">
                                {{ __('Order code') }}
                                <span class="text-primary">*</span>
                            </label>
                            <input
                                type="text"
                                name="order_id"
                                id="amerce-tracking-code"
                                value="{{ old('order_id', request('order_id')) }}"
                                placeholder="{{ __('e.g. #ABC1234') }}"
                                required>
                            @error('order_id')
                                <p class="text-danger small mt-2" role="alert">{{ $message }}</p>
                            @enderror
                        </fieldset>

                        <fieldset class="tf-field">
                            <label for="amerce-tracking-email" class="tf-lable fw-medium">
                                {{ __('Email or phone') }}
                                <span class="text-primary">*</span>
                            </label>
                            <input
                                type="text"
                                name="email"
                                id="amerce-tracking-email"
                                value="{{ old('email', request('email')) }}"
                                placeholder="{{ __('Email or phone used at checkout') }}"
                                autocomplete="email"
                                required>
                            @error('email')
                                <p class="text-danger small mt-2" role="alert">{{ $message }}</p>
                            @enderror
                        </fieldset>
                    </div>

                    <button type="submit" class="tf-btn animate-btn w-100 mt-20">
                        {{ __('Track order') }}
                    </button>
                </form>
            </div>
        </div>

        @if (! empty($order))
            <div class="row mt-40">
                <div class="col-12">
                    <div class="order-tracking-result">
                        @include(EcommerceHelper::viewPath('includes.order-tracking-detail'), ['order' => $order])
                    </div>
                </div>
            </div>
        @endif
    </div>
</div>
