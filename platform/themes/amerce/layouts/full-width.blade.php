@php
    Theme::set('withContainer', false);
    Theme::set('mainClass', 'full-width');
@endphp

@extends(Theme::getThemeNamespace('layouts.base'))

@section('content')
    {!! Theme::content() !!}
@endsection
