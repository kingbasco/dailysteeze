<?php

namespace Database\Seeders\Themes\HomeAuto;

class ThemeOptionSeeder extends \Database\Seeders\Themes\Main\ThemeOptionSeeder
{
    public function getThemeOptions(): array
    {
        return [
            ...parent::getThemeOptions(),
            'primary_color' => '#D32F2F',
            'secondary_color' => '#1E1E1E',
            'header_style' => 'style-7',
            'footer_style' => 'style-2',
            'footer_container_class' => 'container',
            // Demo home-auto topbar = `tf-topbar topbar-s2 d-none d-md-flex` (NO bg color class).
            'topbar_style' => 'style-2',
            'topbar_slides' => '',
            'topbar_bg_class' => '',
            'topbar_inner_container' => 'container',
            'topbar_color_mode' => 'light',
            'hotline' => '(+01) 1234 8888',
            'our_store_url' => '/our-stores',
            'contact_url' => '/contact',
            'header_account_label' => 'Login/Register',
            'header_bottom_offer_text' => 'Special Offers!',
            // Demo home-auto footer = `tf-footer footer-s2 bg-dark` (NO `type-reverse`).
            'footer_wrapper_override' => 'footer-s2 bg-dark',
            // Demo home-auto product cards = `card-product` (style-1) — price visible BELOW image
            // (master plan retro lesson BB).
            'product_card_default_style' => 'style-1',
            'homepage_body_class' => 'home-auto',
        ];
    }
}
