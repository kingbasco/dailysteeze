<?php

use Theme\Amerce\Widgets\NewsletterWidget;

if (! is_plugin_active('newsletter')) {
    return;
}

require_once __DIR__ . '/newsletter.php';

register_widget(NewsletterWidget::class);
