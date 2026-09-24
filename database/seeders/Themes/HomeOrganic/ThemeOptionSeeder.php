<?php

namespace Database\Seeders\Themes\HomeOrganic;

class ThemeOptionSeeder extends \Database\Seeders\Themes\Main\ThemeOptionSeeder
{
    public function getThemeOptions(): array
    {
        return [
            ...parent::getThemeOptions(),
            'primary_color' => '#67A453',
            'secondary_color' => '#1E2E1E',
            // Demo home-organic header = `tf-header header-abs-2 scr-box-shadow` (transparent overlay variant 2).
            'header_style' => 'style-14',
            // Demo home-organic footer = `tf-footer footer-s6` (light cream, no position-relative).
            'footer_style' => 'style-7',
            // Demo home-organic topbar = `tf-topbar d-none d-md-flex bg-dark` with phone+links LEFT + slides CENTER (no socials).
            // Approximation via topbar style-2 with slides + bg-dark (acceptable cosmetic diff: outer class
            // string differs slightly — demo lacks `topbar-s2` + `tf-btn-swiper-main` tokens).
            'topbar_style' => 'style-2',
            'topbar_bg_class' => 'bg-dark',
            'hotline' => '(+01) 1234 8888',
            'our_store_url' => '/our-stores',
            'contact_url' => '/contact',
            'product_card_default_style' => 'style-1',
            // `.home-organic` has 0 rules in theme.css (Phase 1 probe). Drop to avoid
            // dead body class (HomeFurniture/HomeJewelry pass lesson).
            'homepage_body_class' => '',
        ];
    }
}
