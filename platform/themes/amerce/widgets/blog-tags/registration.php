<?php

use Theme\Amerce\Widgets\BlogTagsWidget;

if (! is_plugin_active('blog')) {
    return;
}

require_once __DIR__ . '/blog-tags.php';

register_widget(BlogTagsWidget::class);
