<?php

namespace Database\Seeders\Themes\HomeGarden;

class ThemeOptionSeeder extends \Database\Seeders\Themes\Main\ThemeOptionSeeder
{
    public function getThemeOptions(): array
    {
        return [
            ...parent::getThemeOptions(),
            'primary_color' => '#4A7C59',
            'secondary_color' => '#1E2E1E',
            'header_style' => 'style-2',
            'footer_style' => 'style-2',
            // Demo home-garden footer = `tf-footer footer-s2 type-reverse bg-main-6`.
            'footer_wrapper_override' => 'footer-s2 type-reverse bg-main-6',
            // Demo home-garden topbar = `tf-topbar bg-dark tf-btn-swiper-main` (bare, no topbar-N, no d-none).
            'topbar_wrapper_override' => 'bg-dark tf-btn-swiper-main',
            // Demo home-garden footer marquee — html/home-garden.html lines 3447-3460
            // emit `<div class="footer-inner-slide-text"><div class="infiniteSlide-footer-text type-2">...AMERCE COMMERCE MULTIPURPOSE ECOMMERCE...`.
            'footer_marquee_text' => 'AMERCE COMMERCE MULTIPURPOSE ECOMMERCE',
            'footer_marquee_class' => 'type-2',
            'product_card_default_style' => 'style-2',
            'header_show_currency_language' => false,
            'homepage_body_class' => 'home-garden',
            'enabled_product_size_guide' => false,
        ];
    }
}
