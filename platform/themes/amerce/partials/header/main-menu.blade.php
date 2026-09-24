{{-- Main menu — renders Botble Menu by location 'main-menu'.
     Accepts optional $menuClass so individual header styles can append modifier
     classes (e.g. style-5 demo expects `justify-content-center`). --}}
@php
    $menuClass = trim('box-nav-menu ' . ($menuClass ?? ''));
@endphp
{!! Menu::renderMenuLocation('main-menu', [
    'options' => ['class' => $menuClass],
    'view'    => 'main-menu',
]) !!}
