{{-- Contact-form CSS overrides (.section-contact rules) live in
     assets/sass/component/_inline-migrated.scss. --}}

@php
    use Botble\Shortcode\Facades\Shortcode;

    $storePhone = theme_option('store_phone');
    $storeEmail = theme_option('store_email');
    $storeAddress = theme_option('store_address');
    $businessHoursWeekday = theme_option('store_business_hours_weekday');
    $businessHoursWeekend = theme_option('store_business_hours_weekend');
    $mapAddress = theme_option('store_map_address') ?: $storeAddress;
@endphp

<section class="section-page-title text-center flat-spacing-2 pb-0">
    <div class="container">
        <div class="main-page-title">
            <div class="breadcrumbs">
                <a href="{{ url('/') }}" class="text-caption-01 cl-text-3 link">{{ __('Home') }}</a>
                <i class="icon icon-CaretRightThin cl-text-3"></i>
                <p class="text-caption-01">{{ __('Contact Us') }}</p>
            </div>
            <h3>{{ __('Contact Us') }}</h3>
            <p class="text-body-1 cl-text-2">
                {{ __("Get in touch with us for inquiries, support, or collaboration we're here to help you.") }}
            </p>
        </div>
    </div>
</section>

@if ($mapAddress)
    <div class="section-map flat-spacing-2 pb-0">
        <div class="container">
            <div class="wg-map">
                {!! Shortcode::compile('[google-map width="100%" height="500"]' . e($mapAddress) . '[/google-map]')->toHtml() !!}
            </div>
        </div>
    </div>
@endif

<section class="section-contact flat-spacing">
    <div class="container">
        <div class="row gy-5 flex-wrap-reverse">
            <div class="col-md-6">
                <div class="col-left">
                    <div class="heading d-grid gap-8">
                        <h4>{{ __('Information') }}</h4>
                        <p class="cl-text-2">
                            {{ __('Have a question? Please contact us using the customer support channels below.') }}
                        </p>
                    </div>
                    <div class="grid-info tf-grid-layout sm-col-2">
                        @if ($storePhone)
                            <div class="d-grid gap-8">
                                <h6>{{ __('Phone:') }}</h6>
                                <p>
                                    <a href="tel:{{ preg_replace('/[^0-9+]/', '', $storePhone) }}" class="cl-text-2 link">
                                        {{ $storePhone }}
                                    </a>
                                </p>
                            </div>
                        @endif

                        @if ($storeEmail)
                            <div class="d-grid gap-8">
                                <h6>{{ __('Email:') }}</h6>
                                <p>
                                    <a href="mailto:{{ $storeEmail }}" class="cl-text-2 link">
                                        {{ $storeEmail }}
                                    </a>
                                </p>
                            </div>
                        @endif

                        @if ($storeAddress)
                            <div class="wd-full d-grid gap-8">
                                <h6>{{ __('Address:') }}</h6>
                                <p>
                                    <a href="https://www.google.com/maps?q={{ urlencode($storeAddress) }}"
                                       target="_blank" rel="noopener noreferrer"
                                       class="cl-text-2 link">
                                        {{ $storeAddress }}
                                    </a>
                                </p>
                            </div>
                        @endif

                        @if ($businessHoursWeekday || $businessHoursWeekend)
                            <div class="wd-full d-grid gap-8">
                                <h6>{{ __('Open Time:') }}</h6>
                                <ul class="open-text">
                                    @if ($businessHoursWeekday)
                                        <li class="d-flex gap-4 mb-4">{{ $businessHoursWeekday }}</li>
                                    @endif
                                    @if ($businessHoursWeekend)
                                        <li class="d-flex gap-4">{{ $businessHoursWeekend }}</li>
                                    @endif
                                </ul>
                            </div>
                        @endif
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <h4 class="mb-8">{{ __('Get In Touch') }}</h4>
                <p class="mb-24 cl-text-2">
                    {{ __('Use the form below to get in touch with the sales team') }}
                </p>
                {{-- [contact-form] without display_fields/mandatory_fields uses
                     the plugin defaults (Name + Email + Address + Phone + Subject
                     + Message). Demo CSS classes (.form-get, .tf-field, .tf-lable)
                     come from add_action(BASE_FILTER_EXTENDED_FORM, ...) in
                     functions.php — styling matches html/contact.html. --}}
                {!! Shortcode::compile('[contact-form][/contact-form]')->toHtml() !!}
            </div>
        </div>
    </div>
</section>
