@php
    SeoHelper::setTitle(__('500 - Server Error'));
@endphp

<div class="section-500 pt-100 pb-100">
    <div class="container">
        <div class="row">
            <div class="col-12 text-center">
                <div class="error-500-content">
                    <div class="error-500__illustration mb-30">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200" width="150" height="150" fill="none">
                            <circle cx="100" cy="100" r="95" stroke="currentColor" stroke-width="2"/>
                            <text x="100" y="120" font-size="80" font-weight="bold" text-anchor="middle" fill="currentColor">500</text>
                        </svg>
                    </div>
                    <h1 class="error-500__title mb-20">{{ __('Server Error') }}</h1>
                    <p class="error-500__description mb-30">
                        {{ __('Something went wrong on our end. Please try again later.') }}
                    </p>
                    <a href="{{ BaseHelper::getHomepageUrl() }}" class="at-btn btn-primary">
                        {{ __('Back to Home') }}
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
