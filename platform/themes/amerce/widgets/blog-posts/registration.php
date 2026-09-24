<?php

use Theme\Amerce\Widgets\BlogPostsWidget;

if (! is_plugin_active('blog')) {
    return;
}

require_once __DIR__ . '/blog-posts.php';

register_widget(BlogPostsWidget::class);
