<?php

namespace Database\Seeders\Themes\HomeMental;

class ThemeOptionSeeder extends \Database\Seeders\Themes\Main\ThemeOptionSeeder
{
    public function getThemeOptions(): array
    {
        return [
            ...parent::getThemeOptions(),
            'primary_color' => '#DC4646',
            'secondary_color' => '#1E1E1E',
            'header_style' => 'style-7',
            // Demo home-mental: bare `nav-category-wrap` (no `style-2`).
            'header_category_modifier' => '',
            'footer_style' => 'style-2',
            // Demo home-mental topbar = `tf-topbar topbar-s2 d-none d-md-flex` (no bg).
            'topbar_style' => 'style-2',
            'topbar_slides' => '',
            'topbar_bg_class' => '',
            'hotline' => '(+01) 1234 8888',
            'our_store_url' => '/our-stores',
            'contact_url' => '/contact',
            // Demo home-mental footer = `tf-footer footer-s2 bg-dark` (no `type-reverse`).
            'footer_wrapper_override' => 'footer-s2 bg-dark',
            // Demo home-mental header bottom/action labels mirror html/home-mental.html.
            'header_account_label' => 'Login/Register',
            'header_bottom_offer_text' => 'Special Offers!',
            'header_bottom_offer_url' => '/products',
            'product_card_default_style' => 'style-1',
            'homepage_body_class' => 'home-mental',
        ];
    }
}
