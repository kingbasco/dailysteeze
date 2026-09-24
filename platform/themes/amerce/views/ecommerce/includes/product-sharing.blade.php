@php
    use Botble\SeoHelper\Facades\SeoHelper;
    use Botble\Theme\Facades\Theme;
@endphp

{{-- Share modal — opened by [data-bs-toggle="modal"][href="#share"] in
     tf-product-extra-link. Buttons come from Theme::renderSocialSharing() so
     the channel set follows the admin's Theme Options config. --}}
<div class="modal modalCentered fade modal-share" id="share" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-heading d-flex align-items-center justify-content-between">
                <h4 class="title-pop mb-0">{{ __('Share') }}</h4>
                <span class="cs-pointer d-flex link" data-bs-dismiss="modal" aria-label="{{ __('Close') }}">
                    <i class="icon icon-X2 fs-24"></i>
                </span>
            </div>
            <div class="modal-main">
                <div class="tf-product-sharing-modal mb-20">
                    {{-- Theme::renderSocialSharing returns a trusted view from
                         packages/theme::fronts.social-sharing — it ships its own
                         <style> block + inline SVG icons. Do NOT wrap in
                         BaseHelper::clean(): HTMLPurifier strips <style> and
                         SVGs, leaving plain text labels. --}}
                    {!! Theme::renderSocialSharing($product->url, SeoHelper::getDescription(), $product->image) !!}
                </div>
                {{-- Self-contained Copy button (does NOT delegate to the
                     package's data-bb-toggle="social-sharing-clipboard").
                     Reason: the package's execCommand fallback appends the
                     temporary <input> to document.body, which Bootstrap marks
                     [inert] when the modal is open — so input.select() fails
                     silently and clipboard stays empty even though the icon
                     still flips to "Copied". This handler scopes the temp
                     input INSIDE the modal so inert doesn't apply, then fires
                     Theme.showSuccess() / Theme.showError() (registered via
                     ThemeSupport::registerToastNotification). --}}
                <div class="wrap-code btn-coppy-text">
                    <p class="coppyText cl-text-2 text-truncate mb-0">{{ $product->url }}</p>
                    <button
                        type="button"
                        class="btn-action-copy tf-btn"
                        data-bb-toggle="copy-share-link"
                        data-clipboard-text="{{ $product->url }}"
                        title="{{ trans('packages/theme::theme.common.copy_link') }}"
                    >
                        <span data-copy-state="idle">{{ __('Copy') }}</span>
                        <span data-copy-state="done" style="display: none;">{{ __('Copied') }}</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

{{-- Copy-share-link click handler lives in assets/js/main.js → copyShareLink().
     Translation strings (link_copied, copy_failed) are exposed via
     window.amerceI18n in layouts/base.blade.php. --}}
