<?php

use Theme\Amerce\Widgets\BlogSearchWidget;

if (! is_plugin_active('blog')) {
    return;
}

require_once __DIR__ . '/blog-search.php';

register_widget(BlogSearchWidget::class);
