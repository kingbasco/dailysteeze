@if (! empty($config['menu_id']))
    {!! Menu::generateMenu([
        'slug'    => $config['menu_id'],
        'options' => ['class' => 'footer-menu-list'],
    ]) !!}
@endif
