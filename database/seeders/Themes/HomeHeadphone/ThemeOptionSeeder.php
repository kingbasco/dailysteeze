<?php

namespace Database\Seeders\Themes\HomeHeadphone;

class ThemeOptionSeeder extends \Database\Seeders\Themes\Main\ThemeOptionSeeder
{
    public function getThemeOptions(): array
    {
        return [
            ...parent::getThemeOptions(),
            // Demo home-headphone.html renders shared baseline styles.css — no theme override.
            'primary_color' => '#DC4646',
            'secondary_color' => '#70857A',
            'header_style' => 'style-9',
            // Demo home-headphone header appends `mb-6` to wrapper.
            'header_extra_class' => 'mb-6',
            'footer_style' => 'style-5',
            // Demo home-headphone footer = `tf-footer footer-s5 type-2 bg-dark`.
            'footer_wrapper_override' => 'footer-s5 type-2 bg-dark',
            // Demo product cards = `card-product style-5 square` (static rating, price-new/old, NEW/-% badge).
            'product_card_default_style' => 'style-5',
            // Demo `<body>` has no class; `.home-headphone` has 0 CSS rules.
            'homepage_body_class' => '',
            // Demo home-headphone footer hero = "AMERCE STORE"; demo lacks the 4-feature service strip.
            'footer_hero_text' => 'AMERCE STORE',
            'footer_show_service_strip' => false,
        ];
    }
}
