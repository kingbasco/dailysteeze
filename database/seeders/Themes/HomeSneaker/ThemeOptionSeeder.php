<?php

namespace Database\Seeders\Themes\HomeSneaker;

class ThemeOptionSeeder extends \Database\Seeders\Themes\Main\ThemeOptionSeeder
{
    public function getThemeOptions(): array
    {
        return [
            ...parent::getThemeOptions(),
            // Demo home-sneaker uses bg-primary (red `#dc4646`) for topbar — primary
            // overridden to red to match. Topbar bg class explicitly set to `bg-primary`
            // to render the red wash (other presets default to `bg-dark`).
            'primary_color' => '#dc4646',
            // secondary_color OMITTED — theme.css default `#70857a` (greenish) matches
            // the demo render. Prior override `#7C7C9F` was a visual mismatch.
            'topbar_bg_class' => 'bg-primary',
            // Demo home-sneaker topbar = `tf-topbar bg-primary tf-btn-swiper-main` (bare bg + swiper).
            'topbar_wrapper_override' => 'bg-primary tf-btn-swiper-main',
            // Demo home-sneaker footer = `tf-footer bg-main` (no `footer-style-N`, no position-relative).
            'footer_wrapper_override' => 'bg-main',
            // Clear old footer_extra_class (was 'bg-main' which now duplicates).
            'footer_extra_class' => '',
            'header_style' => 'style-11',
            // Demo uses standard `card-product_wrapper square` (style-1) with price in
            // `card-product_info` BELOW image. Style-3 positions name+price as absolute
            // overlay (only visible on hover) — wrong for sneaker. Fixed to style-1.
            'product_card_default_style' => 'style-1',
            // `.home-sneaker` body class has 0 CSS rules (Phase 1 baseline confirmed)
            // and the demo body is empty. Drop to mirror demo.
            'homepage_body_class' => '',
        ];
    }
}
