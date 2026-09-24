@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Theme\Facades\Theme;

    SeoHelper::setTitle(__('404 - Not found'));
    Theme::fireEventGlobalAssets();

    Theme::set('withContainer', false);
    Theme::set('hideBreadcrumb', true);

    $productsUrl = function_exists('route') && \Illuminate\Support\Facades\Route::has('public.products')
        ? route('public.products')
        : url('/products');
@endphp

@extends(Theme::getThemeNamespace('layouts.base'))

@section('content')
    <section class="section-404 flat-spacing">
        <div class="container">
            <div class="row">
                <div class="col-md-8 offset-md-2 col-sm-10 offset-sm-1">
                    <div class="image">
                        <img loading="lazy" width="930" height="579"
                             src="{{ Theme::asset()->url('images/section/404.svg') }}"
                             alt="{{ __('Page not found') }}">
                    </div>
                </div>
                <div class="col-12">
                    <div class="wrap">
                        <div class="content">
                            <h2 class="title">{{ __('Something’s Missing') }}</h2>
                            <p class="sub-title cl-text-2">
                                {{ __('This page is missing or you assembled the link incorrectly') }}
                            </p>
                        </div>
                        <div class="group-btn">
                            <a href="{{ BaseHelper::getHomepageUrl() }}" class="tf-btn animate-btn">
                                {{ __('Back to home page') }}
                            </a>
                            <a href="{{ $productsUrl }}" class="tf-btn btn-stroke">
                                {{ __('Product list') }}
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
