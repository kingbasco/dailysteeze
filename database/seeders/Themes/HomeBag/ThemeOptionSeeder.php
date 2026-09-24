<?php

namespace Database\Seeders\Themes\HomeBag;

class ThemeOptionSeeder extends \Database\Seeders\Themes\Main\ThemeOptionSeeder
{
    public function getThemeOptions(): array
    {
        return [
            ...parent::getThemeOptions(),
            // Demo home-bag-accessories CDP-verified --primary / --secondary (Phase 1 2026-05-15).
            'primary_color' => '#DC4646',
            'secondary_color' => '#70857A',
            'header_style' => 'style-4',
            'footer_style' => 'style-2',
            // Demo home-bag-accessories topbar = `tf-topbar topbar-s2 d-none d-md-flex bg-dark` with a
            // vertical center swiper of 2 announcement slides (html/home-bag-accessories.html L50-110).
            // The slides-flavor heuristic in topbar.blade.php drops `topbar-s2` when slides are present,
            // so force the wrapper class explicitly via topbar_wrapper_override (lesson #14).
            'topbar_style' => 'style-2',
            'topbar_wrapper_override' => 'topbar-s2 d-none d-md-flex bg-dark',
            'topbar_slides' => "Midseason Sale: 20% Off - Auto Applied at Checkout - Limited Time Only\n20% Off - Auto Applied at Checkout - Limited Time Only",
            'topbar_bg_class' => 'bg-dark',
            // Demo topbar uses `.container` (1440px), not `.container-full` (1800px) — content sits
            // inset from viewport edges (lesson #13).
            'topbar_inner_container' => 'container',
            'hotline' => '(+01) 1234 8888',
            'our_store_url' => '/our-stores',
            'contact_url' => '/contact',
            // Demo header user icon ships with a "Login/Register" label next to it
            // (html/home-bag-accessories.html L145-147).
            'header_account_label' => 'Login/Register',
            'product_card_default_style' => 'style-1',
            // `.home-bag-accessories` has 0 CSS rules in theme.css (lesson #11) — drop body class.
            'homepage_body_class' => '',
            // Demo home-bag-accessories footer marquee = "AMERCE COMMERCE MULTIPURPOSE ECOMMERCE".
            'footer_marquee_text' => 'AMERCE COMMERCE MULTIPURPOSE ECOMMERCE',
        ];
    }
}
