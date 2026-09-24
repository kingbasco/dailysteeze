<?php

namespace Database\Seeders\Themes\HomePod;

class ThemeOptionSeeder extends \Database\Seeders\Themes\Main\ThemeOptionSeeder
{
    public function getThemeOptions(): array
    {
        return [
            ...parent::getThemeOptions(),
            'primary_color' => '#DC4646',
            // Demo home-pod rendered --secondary = #70857A (CDP-verified Phase 1).
            'secondary_color' => '#70857A',
            'header_style' => 'style-4',
            'footer_style' => 'style-5',
            // Demo home-pod topbar = `tf-topbar topbar-s2 d-none d-md-flex bg-dark` with a vertical
            // center swiper of 2 announcement slides (html/home-pod.html L50-86). The slides-flavor
            // heuristic in topbar.blade.php drops `topbar-s2` when slides are present, so force the
            // wrapper class explicitly via topbar_wrapper_override.
            'topbar_style' => 'style-2',
            'topbar_wrapper_override' => 'topbar-s2 d-none d-md-flex bg-dark',
            'topbar_slides' => "Midseason Sale: 20% Off - Auto Applied at Checkout - Limited Time Only\n20% Off - Auto Applied at Checkout - Limited Time Only",
            'topbar_bg_class' => 'bg-dark',
            // Demo topbar uses `.container` (1440px), not `.container-full` (1800px) — content sits
            // inset from viewport edges.
            'topbar_inner_container' => 'container',
            'hotline' => '(+01) 1234 8888',
            'our_store_url' => '/our-stores',
            'contact_url' => '/contact',
            // Demo header user icon ships with a "Login/Register" label next to it (html/home-pod.html L137).
            'header_account_label' => 'Login/Register',
            // Demo home-pod footer = `tf-footer footer-s5 type-2 bg-dark`.
            'footer_wrapper_override' => 'footer-s5 type-2 bg-dark',
            // `square` is a card-wrapper modifier (set per-section via product_wrapper_class
            // in PageSeeder §3/§7), NOT a card style — keep the style at style-1.
            'product_card_default_style' => 'style-1',
            // Demo <body> has no class; `.home-pod` has 0 CSS rules — dead key.
            'homepage_body_class' => '',
            // Demo home-pod footer hero = "AMERCE STORE".
            'footer_hero_text' => 'AMERCE STORE',
        ];
    }
}
