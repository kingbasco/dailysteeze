<?php

namespace Database\Seeders\Themes\HomeFashion2;

class ThemeOptionSeeder extends \Database\Seeders\Themes\Main\ThemeOptionSeeder
{
    public function getThemeOptions(): array
    {
        return [
            ...parent::getThemeOptions(),
            // Verified via CDP getComputedStyle on html/home-fashion-2.html — demo
            // renders --primary #DC4646 / --secondary #70857A (NOT the #1E1E1E the
            // seeder previously guessed; styles.css base is #DC4646).
            'primary_color' => '#DC4646',
            'secondary_color' => '#70857A',
            'header_style' => 'style-9',
            // Demo home-fashion-2 footer = `tf-footer footer-s5 bg-white` — matches `style-8` default.
            'footer_style' => 'style-8',
            // Demo §3/§7 product cards are the `style-1` Themesflat card (static
            // "HOT SALE % OFF" marquee + single badge + color swatches), NOT the
            // `style-2` slide-up countdown card — inherit Main's `style-1` default.
            // Demo <body> has NO class; `.home-fashion-2` has 0 CSS rules — keep empty
            // so it doesn't inherit Main's `home-fashion` default.
            'homepage_body_class' => '',
        ];
    }
}
