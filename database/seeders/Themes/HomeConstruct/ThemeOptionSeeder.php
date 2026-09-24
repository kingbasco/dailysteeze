<?php

namespace Database\Seeders\Themes\HomeConstruct;

class ThemeOptionSeeder extends \Database\Seeders\Themes\Main\ThemeOptionSeeder
{
    public function getThemeOptions(): array
    {
        return [
            ...parent::getThemeOptions(),
            'primary_color' => '#DC4646',
            'secondary_color' => '#1E1E1E',
            'header_style' => 'style-1',
            // Demo home-construction header = bare `<header class="tf-header">` (no `header-s1`, no `scr-box-shadow`).
            'header_wrapper_override' => 'tf-header',
            'footer_style' => 'style-5',
            // Demo home-construction topbar = `tf-topbar bg-dark` (bare bg, no slides, no swiper, no d-none).
            'topbar_wrapper_override' => 'bg-dark',
            'product_card_default_style' => 'style-1',
            'product_card_extra_class' => 'product-style_stroke',
            'homepage_body_class' => 'home-construction',
            // Demo home-construction header hides the currency/language switcher
            // (html/home-construction.html has no switcher in the header-right area).
            'header_show_currency_language' => false,
            // Demo home-construction footer = no `footer-hero-text` block — suppress default fallback.
            'footer_hero_text' => '',
        ];
    }
}
