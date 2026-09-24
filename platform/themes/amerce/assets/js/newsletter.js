// Newsletter form AJAX handler.
//
// Intercepts every footer + shortcode subscribe form (form.form-sub,
// form.newsletter-form) and POSTs via fetch instead of full-page submit.
// The plugin's `public.newsletter.subscribe` endpoint already returns
// `{ error, message }` for AJAX requests, so we only need to read the
// JSON, surface a toast, and clear the input on success.

(function () {
    'use strict';

    var FORM_SELECTOR = 'form.form-sub, form.newsletter-form';

    function i18n(key, fallback) {
        return (window.amerceI18n && window.amerceI18n[key]) || fallback;
    }

    function getCsrfToken(form) {
        var formToken = form.querySelector('input[name="_token"]');
        if (formToken && formToken.value) return formToken.value;

        var meta = document.querySelector('meta[name="csrf-token"]');
        return meta ? meta.getAttribute('content') : '';
    }

    function showToast(message, type) {
        // Standard toast API from Botble's Theme package
        // (registerToastNotification → window.Theme.showSuccess/showError).
        if (window.Theme) {
            if (type === 'error' && typeof window.Theme.showError === 'function') {
                window.Theme.showError(message);
                return;
            }
            if (type !== 'error' && typeof window.Theme.showSuccess === 'function') {
                window.Theme.showSuccess(message);
                return;
            }
        }

        // Final fallback if Theme isn't loaded yet (toast script is in <footer>).
        // Avoid window.alert — log silently; the next user gesture re-triggers the
        // submit handler and Theme will be loaded by then.
        if (window.console && typeof window.console.warn === 'function') {
            window.console.warn('[newsletter] ' + message);
        }
    }

    function setLoading(form, loading) {
        var submit = form.querySelector('button[type="submit"], input[type="submit"]');
        if (! submit) return;

        if (loading) {
            submit.dataset.prevDisabled = submit.disabled ? '1' : '0';
            submit.disabled = true;
            submit.classList.add('btn-loading');
        } else {
            submit.disabled = submit.dataset.prevDisabled === '1';
            submit.classList.remove('btn-loading');
        }
    }

    document.addEventListener('submit', function (event) {
        var form = event.target;
        if (! (form instanceof HTMLFormElement)) return;
        if (! form.matches(FORM_SELECTOR)) return;

        event.preventDefault();

        var url = form.getAttribute('action');
        if (! url) return;

        var formData = new FormData(form);
        if (! formData.has('_token')) {
            formData.append('_token', getCsrfToken(form));
        }

        setLoading(form, true);

        fetch(url, {
            method: 'POST',
            body: formData,
            headers: {
                'Accept': 'application/json',
                'X-Requested-With': 'XMLHttpRequest',
            },
            credentials: 'same-origin',
        })
            .then(function (response) {
                return response.json().then(function (body) {
                    return { ok: response.ok, body: body };
                });
            })
            .then(function (result) {
                var body = result.body || {};
                var message = body.message || '';
                var hasError = !! body.error || ! result.ok;

                if (hasError) {
                    var errors = body.errors;
                    if (errors && typeof errors === 'object') {
                        var firstKey = Object.keys(errors)[0];
                        if (firstKey && Array.isArray(errors[firstKey]) && errors[firstKey].length) {
                            message = errors[firstKey][0];
                        }
                    }
                    showToast(message || i18n('subscription_failed', 'Subscription failed. Please try again.'), 'error');
                    return;
                }

                showToast(message || i18n('subscription_success', 'Subscribed successfully.'), 'success');
                form.reset();
            })
            .catch(function () {
                showToast(i18n('subscription_failed', 'Subscription failed. Please try again.'), 'error');
            })
            .finally(function () {
                setLoading(form, false);
            });
    });
})();
