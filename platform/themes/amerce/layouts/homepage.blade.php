@php
    Theme::set('hideBreadcrumb', true);
    Theme::set('withContainer', false);
    Theme::set('mainClass', 'homepage');
@endphp

@extends(Theme::getThemeNamespace('layouts.base'))

@section('content')
    {!! Theme::content() !!}
@endsection
