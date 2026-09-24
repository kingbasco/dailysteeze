<?php

namespace Database\Seeders\Themes\HomeFurniture;

class ThemeOptionSeeder extends \Database\Seeders\Themes\Main\ThemeOptionSeeder
{
    public function getThemeOptions(): array
    {
        return [
            ...parent::getThemeOptions(),
            // Per audit-260505-1856-home-furniture-demo.md:
            // primary #dc4646 (red CTA), secondary #70857a (sage), header-s8 + has-by-category,
            // footer-s5 (we use footer style-2 + bg-dark variant since theme.css has no s5 rules),
            // product card style-1 (square 1:1 with marquee/countdown variants).
            'primary_color' => '#dc4646',
            'secondary_color' => '#70857a',
            // header.blade.php maps style-10 → `header-s8 has-by-category` (NOT style-8 →
            // header-s6). Demo uses header-s8 → use style-10. Confirmed via map at
            // partials/header.blade.php lines 28-43.
            'header_style' => 'style-10',
            'footer_style' => 'style-5',
            'product_card_default_style' => 'style-1',
            // theme.css ships zero rules for `.home-furniture` — drop to avoid dead-class
            // noise on <body> (CDP baseline 2026-05-15 rule count = 0).
            'homepage_body_class' => '',
            // Furniture topbar layout: phone+links LEFT, vertical announcement swiper CENTER,
            // currency+language RIGHT, sage `bg-secondary`, NO socials.
            'topbar_style' => 'style-2',
            // Sage bg per demo (`tf-topbar bg-secondary`).
            'topbar_bg_class' => 'bg-secondary',
            'topbar_slides' => "Midseason Sale: 20% Off - Auto Applied at Checkout - Limited Time Only\n20% Off - Auto Applied at Checkout - Limited Time Only",
            'hotline' => '(+01) 1234 8888',
            'our_store_url' => '/our-store',
            'contact_url' => '/contact',
            // Clear social URLs so socials don't carry over from preset 1's Main seeder defaults.
            'facebook_url' => '',
            'twitter_url' => '',
            'instagram_url' => '',
            'tiktok_url' => '',
            'snapchat_url' => '',
            // Demo home-furniture footer = no `footer-hero-text` block — suppress default fallback.
            'footer_hero_text' => '',
            // Header style-10 "Special Offers!" pill — link to sale-products page.
            // Blade renders this in #dc4646 via `text-primary` when a URL is set.
            'header_special_offers_url' => '/products?on_sale=1',
        ];
    }
}
