<?php

namespace Database\Seeders\Themes\HomePetCare;

class ThemeOptionSeeder extends \Database\Seeders\Themes\Main\ThemeOptionSeeder
{
    public function getThemeOptions(): array
    {
        return [
            ...parent::getThemeOptions(),
            // Matches html/home-pet-care.html → styles.css line 18: `--primary: #DC4646;`
            'primary_color' => '#DC4646',
            'secondary_color' => '#5C3A1E',
            'header_style' => 'style-5',
            'footer_style' => 'style-5',
            // Demo home-pet-care has NO topbar.
            'show_topbar' => false,
            // Demo home-pet-care footer = `tf-footer footer-s5` (no bg-dark, light variant).
            'footer_wrapper_override' => 'footer-s5',
            // Pet-care footer has NO top service strip — the box-icon strip is rendered
            // as a separate site-features section ABOVE the footer (mirrors
            // html/home-pet-care.html lines 2902-2965 vs the footer at line 3045+).
            'footer_show_service_strip' => false,
            // Pet-care demo footer omits the giant "AMERCE STORE" infinity-marquee
            // gradient hero text (sport/electronics use it; pet-care does not).
            'footer_hero_text' => '',
            'product_card_default_style' => 'style-2',
            'homepage_body_class' => 'home-pet-care',
        ];
    }
}
