<?php

namespace Database\Seeders\Themes\HomeOffice;

class ThemeOptionSeeder extends \Database\Seeders\Themes\Main\ThemeOptionSeeder
{
    public function getThemeOptions(): array
    {
        return [
            ...parent::getThemeOptions(),
            // CDP-verified against html/home-office-equipment.html: the demo ships no
            // theme override and renders the shared baseline styles.css palette.
            'primary_color' => '#DC4646',
            'secondary_color' => '#70857A',
            'header_style' => 'style-6',
            'footer_style' => 'style-2',
            // Demo home-office-equipment header = `tf-header header-s5 scr-box-shadow bg-dark` (note class ORDER).
            // Default modifier order produces `header-s5 bg-dark scr-box-shadow` — wrong order. Override the
            // entire wrapper class string to match demo verbatim.
            'header_wrapper_override' => 'tf-header header-s5 scr-box-shadow bg-dark',
            // Demo home-office-equipment has NO topbar.
            'show_topbar' => false,
            // Demo home-office-equipment footer = `tf-footer footer-s2 bg-dark` (no `type-reverse`).
            'footer_wrapper_override' => 'footer-s2 bg-dark',
            // Demo cards = base card-product with `product-marquee_sale` — only
            // views/ecommerce/includes/product/style-1/ ships that markup.
            'product_card_default_style' => 'style-1',
            // Demo <body> has no class; `.home-office-equipment` = 0 CSS rules.
            'homepage_body_class' => '',
        ];
    }
}
