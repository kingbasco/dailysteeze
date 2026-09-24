<?php

namespace Database\Seeders\Themes\HomeBaby;

class ThemeOptionSeeder extends \Database\Seeders\Themes\Main\ThemeOptionSeeder
{
    public function getThemeOptions(): array
    {
        return [
            ...parent::getThemeOptions(),
            // Demo home-baby.html renders --primary: #DC4646 (shared styles.css, no inline override).
            'primary_color' => '#DC4646',
            'secondary_color' => '#A8C5D8',
            'header_style' => 'style-8',
            // Demo home-baby has NO topbar.
            'show_topbar' => false,
            // Demo footer is `tf-footer footer-s6`.
            'footer_style' => 'style-7',
            'product_card_default_style' => 'style-1',
            'homepage_body_class' => 'home-baby',
        ];
    }
}
