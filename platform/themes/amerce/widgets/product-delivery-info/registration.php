<?php

use Theme\Amerce\Widgets\ProductDeliveryInfoWidget;

if (! is_plugin_active('ecommerce')) {
    return;
}

require_once __DIR__ . '/product-delivery-info.php';

register_widget(ProductDeliveryInfoWidget::class);
