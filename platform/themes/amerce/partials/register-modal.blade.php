@if (is_plugin_active('ecommerce') && ! auth('customer')->check())
<div class="modal modalCentered fade modal-log" id="register" tabindex="-1" aria-labelledby="registerModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <span class="icon-close-popup" data-bs-dismiss="modal" aria-label="{{ __('Close') }}">
                <i class="icon-X2"></i>
            </span>
            <div class="modal-heading text-center">
                <h3 class="title-pop mb-8" id="registerModalLabel">{{ __('Create Account') }}</h3>
                <p class="desc-pop cl-text-2">{{ __('Be part of our growing family of new customers!') }}</p>
            </div>
            <div class="modal-main">
                <form action="{{ route('customer.register.post') }}" method="POST" class="form-log">
                    @csrf
                    <div class="form-content">
                        <fieldset class="tf-field">
                            <label for="register-name" class="tf-lable fw-medium">
                                {{ __('Full name') }}
                                <span class="text-primary">*</span>
                            </label>
                            <input type="text" name="name" id="register-name" placeholder="{{ __('Full name') }}*" required>
                        </fieldset>
                        <fieldset class="tf-field">
                            <label for="register-email" class="tf-lable fw-medium">
                                {{ __('Email address') }}
                                <span class="text-primary">*</span>
                            </label>
                            <input type="email" name="email" id="register-email" placeholder="{{ __('Email address') }}*" required>
                        </fieldset>
                        <fieldset class="tf-field password-wrapper">
                            <label for="register-password" class="tf-lable fw-medium">
                                {{ __('Password') }}
                                <span class="text-primary">*</span>
                            </label>
                            <div class="password-wrapper w-100">
                                <span class="toggle-pass icon-EyeSlash fs-20 cl-text-3"></span>
                                <input class="password-field" type="password" name="password" id="register-password" placeholder="{{ __('Password') }}" required>
                            </div>
                        </fieldset>
                        <fieldset class="tf-field password-wrapper">
                            <label for="register-password-confirm" class="tf-lable fw-medium">
                                {{ __('Confirm Password') }}
                                <span class="text-primary">*</span>
                            </label>
                            <div class="password-wrapper w-100">
                                <span class="toggle-pass icon-EyeSlash fs-20 cl-text-3"></span>
                                <input class="password-field" type="password" name="password_confirmation" id="register-password-confirm" placeholder="{{ __('Confirm Password') }}" required>
                            </div>
                        </fieldset>
                    </div>
                    <div class="group-action">
                        <button type="submit" class="tf-btn animate-btn w-100">{{ __('Create Account') }}</button>
                        <a href="#sign" data-bs-toggle="modal" class="tf-btn btn-stroke">{{ __('Login') }}</a>
                    </div>
                    {!! apply_filters(BASE_FILTER_AFTER_LOGIN_OR_REGISTER_FORM, null, \Botble\Ecommerce\Models\Customer::class) !!}
                </form>
            </div>
        </div>
    </div>
</div>
@endif
