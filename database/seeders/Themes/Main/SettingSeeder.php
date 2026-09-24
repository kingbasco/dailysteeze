<?php

namespace Database\Seeders\Themes\Main;

use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Database\Seeders\Traits\HasEcommerceSettingsSeeder;

class SettingSeeder extends BaseSeeder
{
    use HasEcommerceSettingsSeeder;

    public function run(): void
    {
        $this->saveSettings([
            'admin_email' => ['support@amerce.test'],
            'admin_logo' => null,
            'admin_favicon' => null,
            'admin_title' => 'Amerce',
            'theme' => 'amerce',
            'show_admin_bar' => '1',
            'enable_change_admin_theme' => '1',
            'language_hide_default' => '1',
            'language_switcher_display' => 'dropdown',
            'language_display' => 'all',
            'language_hide_languages' => '[]',
            'locale' => 'en',
            'locale_direction' => 'ltr',
            'enable_send_error_reporting_via_email' => '0',
            'enable_https' => '0',
            'enable_cache' => '0',
            'cache_admin_menu_enable' => '1',
            'cache_time_site_map' => '3600',
            'enable_send_mail_when_new_user_registered' => '0',
            'enable_send_mail_user_registered_to_admin' => '0',
            'enable_change_password' => '1',
            'enable_register' => '1',
            'enable_recaptcha' => '0',
            'enable_captcha' => '0',
            'show_site_name_when_logged_in' => '1',
            'media_random_hash' => md5((string) time()),
            'time_zone' => 'UTC',
            'enable_multi_language_in_admin' => '0',
            'media_chunk_enabled' => '0',
            'media_chunk_size' => '1048576',
            'media_max_upload_filesize' => null,
            'media_aws_use_signed_urls' => '0',
            'media_aws_signed_url_expiry' => '60',
            'enable_geo_ip' => '0',
            'enable_audit_log' => '1',
        ]);

        // Plugin-shipped ecommerce defaults — payment gateway settings (COD, bank transfer,
        // Stripe, PayPal, Mollie, Razorpay, ...), digital products, order prefix, SKU format.
        // Override with theme-specific values via the array argument.
        if (is_plugin_active('ecommerce')) {
            $this->saveEcommerceSettings([
                'ecommerce_store_order_prefix' => 'AM',
                'ecommerce_product_sku_format' => 'AM-%s%s%s%s',
                'payment_bank_transfer_description' => 'Please send money to our bank account: AMERCE - 0123 4567 8901.',
            ]);
        }
    }
}
