<?php

namespace Database\Seeders\Themes\HomeJewelry;

class ThemeOptionSeeder extends \Database\Seeders\Themes\Main\ThemeOptionSeeder
{
    public function getThemeOptions(): array
    {
        return [
            ...parent::getThemeOptions(),
            'primary_color' => '#C9A572',
            'secondary_color' => '#1B2A40',
            'header_style' => 'style-12',
            // Footer style-6 = light cream (bg-main-5) variant of style-5; mirrors demo
            // `tf-footer footer-s5 bg-main-5` with 4-up site-features top-strip + 5-col body.
            'footer_style' => 'style-6',
            // Demo home-jewelry topbar = `tf-topbar d-none d-md-flex bg-dark` (organic-style topbar).
            'topbar_style' => 'style-2',
            'topbar_bg_class' => 'bg-dark',
            'hotline' => '(+01) 1234 8888',
            'our_store_url' => '/our-stores',
            'contact_url' => '/contact',
            'product_card_default_style' => 'style-1',
            // .home-jewelry has 0 rules in theme.css (Phase 1 probe). Drop body class
            // to match demo's empty <body> per HomeFurniture-pass lesson #1.
            'homepage_body_class' => '',
            // Match demo footer phone "(+01) 1234 8888" (html/home-jewelry.html L3826);
            // otherwise inherits Main default "315-666-6688".
            'footer_phone' => '(+01) 1234 8888',
        ];
    }
}
