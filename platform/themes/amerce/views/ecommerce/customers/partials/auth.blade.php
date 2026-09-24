@php
    $icon = Arr::get($formOptions, 'icon');
    $heading = Arr::get($formOptions, 'heading');
    $description = Arr::get($formOptions, 'description');
    $bannerDirection = Arr::get($formOptions, 'bannerDirection', 'vertical');

    $banner = Arr::get($formOptions, 'banner');

    if (! $banner) {
        $bannerDirection = 'vertical';
    }
@endphp

@if (Arr::get($formOptions, 'has_wrapper', 'yes') === 'yes')
    <section class="flat-spacing-2">
        <div class="container">
            <div @class(['row justify-content-center'])>
                <div @class([
                    'col-xl-6 col-lg-8' => $bannerDirection === 'vertical',
                    'col-lg-10' => $bannerDirection === 'horizontal',
                ])>
@endif
                    <div @class([
                        'auth-card amerce-auth-card',
                        'amerce-auth-card--horizontal row g-0' => $bannerDirection === 'horizontal',
                    ])>
                        @if ($banner && $bannerDirection === 'horizontal')
                            <div class="col-md-6 amerce-auth-card__media">
                                {{ RvMedia::image($banner, $heading ?: '', attributes: ['class' => 'amerce-auth-card__banner']) }}
                            </div>
                        @endif

                        @if ($bannerDirection === 'horizontal')
                            <div class="col-md-6 amerce-auth-card__content">
                        @endif

                        @if ($banner && $bannerDirection === 'vertical')
                            <div class="amerce-auth-card__media">
                                {{ RvMedia::image($banner, $heading ?: '', attributes: ['class' => 'amerce-auth-card__banner']) }}
                            </div>
                        @endif

                        @if ($icon || $heading || $description)
                            <div class="amerce-auth-card__header">
                                @if ($icon)
                                    <span class="amerce-auth-card__icon">
                                        <x-core::icon :name="$icon" />
                                    </span>
                                @endif

                                @if ($heading)
                                    <h3 class="amerce-auth-card__title letter-space-0">{{ $heading }}</h3>
                                @endif

                                @if ($description)
                                    <p class="amerce-auth-card__description text-body-1 cl-text-2">{{ $description }}</p>
                                @endif
                            </div>
                        @endif

                        <div class="amerce-auth-card__body">
                            @if ($showStart)
                                {!! Form::open(Arr::except($formOptions, ['template'])) !!}
                            @endif

                            @if (session()->has('status'))
                                <div role="alert" class="alert alert-success">{{ session('status') }}</div>
                            @elseif (session()->has('auth_error_message'))
                                <div role="alert" class="alert alert-danger">{{ session('auth_error_message') }}</div>
                            @elseif (session()->has('auth_success_message'))
                                <div role="alert" class="alert alert-success">{{ session('auth_success_message') }}</div>
                            @elseif (session()->has('auth_warning_message'))
                                <div role="alert" class="alert alert-warning">{{ session('auth_warning_message') }}</div>
                            @endif

                            @if ($showFields)
                                {{ $form->getOpenWrapperFormColumns() }}

                                @foreach ($fields as $field)
                                    @continue(in_array($field->getName(), $exclude))

                                    {!! $field->render() !!}
                                @endforeach

                                {{ $form->getCloseWrapperFormColumns() }}
                            @endif

                            @if ($showEnd)
                                {!! Form::close() !!}
                            @endif

                            @if ($form->getValidatorClass())
                                @push('footer')
                                    {!! $form->renderValidatorJs() !!}
                                @endpush
                            @endif
                        </div>

                        @if ($bannerDirection === 'horizontal')
                            </div>
                        @endif
                    </div>
@if (Arr::get($formOptions, 'has_wrapper', 'yes') === 'yes')
                </div>
            </div>
        </div>
    </section>
@endif
