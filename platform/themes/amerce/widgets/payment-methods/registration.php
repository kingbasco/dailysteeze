<?php

use Theme\Amerce\Widgets\PaymentMethodsWidget;

if (! is_plugin_active('ecommerce')) {
    return;
}

require_once __DIR__ . '/payment-methods.php';

register_widget(PaymentMethodsWidget::class);
