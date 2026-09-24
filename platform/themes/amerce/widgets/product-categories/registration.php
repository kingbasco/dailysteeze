<?php

use Theme\Amerce\Widgets\ProductCategoriesWidget;

if (! is_plugin_active('ecommerce')) {
    return;
}

require_once __DIR__ . '/product-categories.php';

register_widget(ProductCategoriesWidget::class);
