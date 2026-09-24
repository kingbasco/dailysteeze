<?php

use Theme\Amerce\Widgets\BlogCategoriesWidget;

if (! is_plugin_active('blog')) {
    return;
}

require_once __DIR__ . '/blog-categories.php';

register_widget(BlogCategoriesWidget::class);
