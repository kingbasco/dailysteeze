@if (is_plugin_active('ecommerce') && ! auth('customer')->check())
<div class="modal modalCentered fade modal-log" id="sign" tabindex="-1" aria-labelledby="signModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <span class="icon-close-popup" data-bs-dismiss="modal" aria-label="{{ __('Close') }}">
                <i class="icon-X2"></i>
            </span>
            <div class="modal-heading text-center">
                <h3 class="title-pop mb-8" id="signModalLabel">{{ __('Sign In') }}</h3>
                <p class="desc-pop cl-text-2">{{ __('Sign in to access your personalized experience.') }}</p>
            </div>
            <div class="modal-main">
                <form action="{{ route('customer.login.post') }}" method="POST" class="form-log">
                    @csrf
                    <div class="form-content">
                        <fieldset class="tf-field">
                            <label for="signin-email" class="tf-lable fw-medium">
                                {{ __('Username or email address') }}
                                <span class="text-primary">*</span>
                            </label>
                            <input type="text" name="email" id="signin-email" placeholder="{{ __('Username or email address') }}*" required>
                        </fieldset>
                        <fieldset class="tf-field password-wrapper">
                            <label for="signin-password" class="tf-lable fw-medium">
                                {{ __('Password') }}
                                <span class="text-primary">*</span>
                            </label>
                            <div class="password-wrapper w-100">
                                <span class="toggle-pass icon-EyeSlash fs-20 cl-text-3"></span>
                                <input class="password-field" type="password" name="password" id="signin-password" placeholder="{{ __('Password') }}" required>
                            </div>
                        </fieldset>
                        <fieldset class="field-bottom">
                            <div class="checkbox-wrap">
                                <input class="tf-check style-2" type="checkbox" name="remember" id="signin-remember">
                                <label for="signin-remember">{{ __('Remember me') }}</label>
                            </div>
                            <a href="#modalForgot" data-bs-toggle="modal" class="link text-decoration-underline">
                                <span class="text-caption-01 fw-semibold">{{ __('Forgot Your Password?') }}</span>
                            </a>
                        </fieldset>
                    </div>
                    <div class="group-action">
                        <button type="submit" class="tf-btn animate-btn w-100">{{ __('Login') }}</button>
                        <a href="#register" data-bs-toggle="modal" class="tf-btn btn-stroke">{{ __('Create Account') }}</a>
                    </div>
                    {!! apply_filters(BASE_FILTER_AFTER_LOGIN_OR_REGISTER_FORM, null, \Botble\Ecommerce\Models\Customer::class) !!}
                </form>
            </div>
        </div>
    </div>
</div>
@endif
