<div class="container">
    <div class="newsletter-wrap text-center">
        @if (! empty($shortcode->heading ?? ''))
            <h3 class="heading fw-medium">{!! BaseHelper::clean($shortcode->heading) !!}</h3>
        @endif
        @if (! empty($shortcode->subheading ?? ''))
            <p class="sub-text text-body-1 cl-text-2 mt-10">{!! BaseHelper::clean($shortcode->subheading) !!}</p>
        @endif

        <form method="POST" action="{{ $formAction }}" class="newsletter-form mt-20 mx-auto" style="max-width:520px;">
            @csrf
            @if (! empty($shortcode->mailchimp_list_id ?? ''))
                <input type="hidden" name="list_id" value="{{ $shortcode->mailchimp_list_id }}">
            @endif
            <div class="d-flex gap-10">
                <input type="email" name="email" required
                    class="form-control flex-grow-1"
                    placeholder="{{ __('Your email address') }}"
                    aria-label="{{ __('Email address') }}">
                <button type="submit" class="tf-btn btn-fill animate-hover-btn radius-3">
                    <span>{!! BaseHelper::clean($shortcode->submit_button_text ?? __('Subscribe')) !!}</span>
                </button>
            </div>
            @if (! $newsletterActive)
                <p class="text-caption-01 cl-text-3 mt-10">{{ __('Newsletter plugin is not active.') }}</p>
            @endif
        </form>
    </div>
</div>
