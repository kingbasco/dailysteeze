<?php

namespace Database\Seeders\Themes\HomeDecor;

class ThemeOptionSeeder extends \Database\Seeders\Themes\Main\ThemeOptionSeeder
{
    public function getThemeOptions(): array
    {
        return [
            ...parent::getThemeOptions(),
            'primary_color' => '#A6896C',
            'secondary_color' => '#1F1F1F',
            // Demo home-decor header = `tf-header header-s7 scr-box-shadow` (header-s7 → style-9).
            'header_style' => 'style-9',
            // Demo home-decor footer = bare `<footer class="tf-footer">` — style-9 emits empty modifier.
            'footer_style' => 'style-9',
            'product_card_default_style' => 'style-1',
            // `.home-decor` has 0 rules in theme.css → drop the body class (lesson #11).
            'homepage_body_class' => '',
        ];
    }
}
