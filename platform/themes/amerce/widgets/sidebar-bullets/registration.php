<?php

use Theme\Amerce\Widgets\SidebarBulletsWidget;

if (! is_plugin_active('ecommerce')) {
    return;
}

require_once __DIR__ . '/sidebar-bullets.php';

register_widget(SidebarBulletsWidget::class);
