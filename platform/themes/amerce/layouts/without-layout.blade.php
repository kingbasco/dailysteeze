@php
    Theme::set('withoutLayout', true);
    Theme::set('hideBreadcrumb', true);
    Theme::set('withContainer', false);
@endphp

@extends(Theme::getThemeNamespace('layouts.base'))

@section('content')
    {!! Theme::content() !!}
@endsection
