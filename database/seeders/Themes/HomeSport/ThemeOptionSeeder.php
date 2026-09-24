<?php

namespace Database\Seeders\Themes\HomeSport;

class ThemeOptionSeeder extends \Database\Seeders\Themes\Main\ThemeOptionSeeder
{
    public function getThemeOptions(): array
    {
        return [
            ...parent::getThemeOptions(),
            'primary_color' => '#DC4646',
            'secondary_color' => '#1E1E1E',
            'header_style' => 'style-2',
            'footer_style' => 'style-5',
            // Demo home-sport topbar = `tf-topbar bg-dark tf-btn-swiper-main` (bare, no topbar-N, no d-none).
            'topbar_wrapper_override' => 'bg-dark tf-btn-swiper-main',
            // Demo home-sport footer = `tf-footer footer-s5 type-2 bg-dark`.
            'footer_wrapper_override' => 'footer-s5 type-2 bg-dark',
            'product_card_default_style' => 'style-2',
            'header_show_currency_language' => false,
            'homepage_body_class' => 'home-sport',
            // Demo home-sport footer hero = "AMERCE STORE".
            'footer_hero_text' => 'AMERCE STORE',
        ];
    }
}
