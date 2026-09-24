<?php

namespace Database\Seeders\Themes\HomeCosmetic;

class ThemeOptionSeeder extends \Database\Seeders\Themes\Main\ThemeOptionSeeder
{
    public function getThemeOptions(): array
    {
        return [
            ...parent::getThemeOptions(),
            // Demo --primary verified via CDP getComputedStyle = #DC4646 (not #E8A4A4).
            'primary_color' => '#DC4646',
            'secondary_color' => '#5C2E2E',
            // Demo home-cosmetic header = `tf-header header-abs scr-box-shadow-2` (transparent overlay,
            // alternate shadow variant). style-13 → `header-abs` + `scr-box-shadow-2` via
            // `header_shadow_class` theme_option override.
            'header_style' => 'style-13',
            'header_shadow_class' => 'scr-box-shadow-2',
            // Announcement strip below the header bar (demo lines 1320-1359).
            'header_announcement_slides' => "Midseason Sale: 20% Off - Auto Applied at Checkout - Limited Time Only\n20% Off - Auto Applied at Checkout - Limited Time Only",
            // Demo home-cosmetic footer = `tf-footer footer-s6 position-relative`.
            // style-7 → `footer-s6`; append `position-relative` via footer_extra_class.
            'footer_style' => 'style-7',
            'footer_extra_class' => 'position-relative',
            // Demo home-cosmetic has NO topbar.
            'show_topbar' => false,
            'product_card_default_style' => 'style-1',
            // Demo <body> has no class; clear the parent's `home-fashion` default
            // (`.home-cosmetic` has 0 rules in styles.css — nothing depends on it).
            'homepage_body_class' => '',
        ];
    }
}
