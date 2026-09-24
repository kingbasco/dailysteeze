@php
    /**
     * Sidebar "Contact Vendor" card for the store detail page.
     * Wraps the marketplace plugin's contact form + JS submission handler.
     *
     * Inputs:
     *   $store        \Botble\Marketplace\Models\Store
     *   $contactForm  \Botble\Marketplace\Forms\ContactStoreForm
     */
    if (! \Botble\Marketplace\Facades\MarketplaceHelper::isEnabledMessagingSystem()) {
        return;
    }

    $authCustomer = auth('customer')->user();
    $isOwnStore = $authCustomer && $store->id == $authCustomer->store?->id;
    if ($isOwnStore) {
        return;
    }

    if (! isset($contactForm) || ! $contactForm) {
        return;
    }
@endphp

<div class="marketplace-store__contact-card">
    <h5 class="marketplace-store__contact-title">{{ __('Contact Vendor') }}</h5>
    <p class="marketplace-store__contact-lead">
        {{ __('All messages are recorded and spam is not tolerated. Your email address will be shown to the recipient.') }}
    </p>

    <div class="marketplace-store__contact-body">
        {{-- Plugin-generated trusted HTML — must NOT pass through BaseHelper::clean
             (HTMLPurifier strips <input>/<textarea> form fields as unsafe). --}}
        {!! $contactForm->renderForm() !!}
    </div>
</div>

@includeIf(\Botble\Marketplace\Facades\MarketplaceHelper::viewPath('includes.contact-form-script'))
