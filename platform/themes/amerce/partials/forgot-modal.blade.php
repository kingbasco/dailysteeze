@if (is_plugin_active('ecommerce') && ! auth('customer')->check())
<div class="modal modalCentered fade modal-log modal-log_forgot" id="modalForgot" tabindex="-1" aria-labelledby="forgotModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <span class="icon-close-popup" data-bs-dismiss="modal" aria-label="{{ __('Close') }}">
                <i class="icon-X2"></i>
            </span>
            <div class="modal-heading text-center">
                <h3 class="title-pop mb-8" id="forgotModalLabel">{{ __('Forgot Password') }}</h3>
                <p class="desc-pop cl-text-2">{{ __('We will send instructions to reset your password.') }}</p>
            </div>
            <div class="modal-main">
                <form action="{{ route('customer.password.request') }}" method="POST" class="form-log">
                    @csrf
                    <div class="form-content">
                        <fieldset class="tf-field">
                            <label for="forgot-email" class="tf-lable fw-medium">
                                {{ __('Username or email address') }}
                                <span class="text-primary">*</span>
                            </label>
                            <input type="email" name="email" id="forgot-email" placeholder="{{ __('Username or email address') }}*" required>
                        </fieldset>
                    </div>
                    <div class="group-action">
                        <button type="submit" class="tf-btn animate-btn w-100">{{ __('Get Reset Code') }}</button>
                        <p class="orther-log text-center">
                            {{ __('Remember your password?') }}
                            <a href="#sign" data-bs-toggle="modal" class="text-primary text-decoration-underline">{{ __('Sign In') }}</a>
                        </p>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@endif
