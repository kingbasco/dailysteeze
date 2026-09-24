@if (! empty($config['menu_id']))
    <nav class="widget widget-main-menu">
        {!! Menu::generateMenu([
            'slug'    => $config['menu_id'],
            'view'    => 'main-menu',
            'options' => ['class' => 'tf-menu list-unstyled m-0'],
        ]) !!}
    </nav>
@endif
