@php
    Theme::set('hideBreadcrumb', true);
    Theme::set('withContainer', false);
    Theme::set('mainClass', 'landing');
@endphp

@extends(Theme::getThemeNamespace('layouts.base'))

@section('content')
    {!! Theme::content() !!}
@endsection
