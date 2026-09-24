<?php

namespace Database\Seeders\Themes\HomeElectronics;

class ThemeOptionSeeder extends \Database\Seeders\Themes\Main\ThemeOptionSeeder
{
    public function getThemeOptions(): array
    {
        return [
            ...parent::getThemeOptions(),
            // Demo home-electronics keeps the template primary red for header badges,
            // prices, and the "Special Offers!" bottom-bar link.
            'primary_color' => '#DC4646',
            'secondary_color' => '#1E1E1E',
            'header_style' => 'style-7',
            // Demo home-electronics header diverges from auto/mental:
            //   inner uses `container-full` (vs `container`), `nav-category-wrap` has NO `style-2`
            //   modifier, btn has `gap-12`, list-icon is `fs-24`.
            'header_inner_container' => 'container-full',
            'header_category_modifier' => '',
            'header_category_btn_gap' => 'gap-12',
            'header_category_btn_icon_size' => 'fs-24',
            'footer_style' => 'style-2',
            // Demo home-electronics topbar = `tf-topbar topbar-s2 d-none d-md-flex bg-dark`
            // (phone+links LEFT, NO center slides, currency+language RIGHT, no socials).
            'topbar_style' => 'style-2',
            // Drop the inherited Main fashion 2-slide carousel — demo electronics has no center slides.
            'topbar_slides' => '',
            // Demo electronics uses bg-dark on the topbar (Main inherits → also bg-dark, but make explicit).
            'topbar_bg_class' => 'bg-dark',
            // LEFT slot of style-2 topbar — phone link + Our Store + Contact.
            'hotline' => '(+01) 1234 8888',
            'our_store_url' => '/our-stores',
            'contact_url' => '/contact',
            // Demo home-electronics header bottom/action labels mirror html/home-electronics.html.
            'header_account_label' => 'Login/Register',
            'header_bottom_offer_text' => 'Special Offers!',
            'header_bottom_offer_url' => '/products',
            // style-1 = demo's square card-product (1:1, action overlay + Add-to-Cart bar).
            // style-2 was a portrait card with countdown timer — doesn't match electronics demo.
            'product_card_default_style' => 'style-1',
            'homepage_body_class' => 'home-electronics',
            // Demo home-electronics footer marquee = "AMERCE COMMERCE MULTIPURPOSE ECOMMERCE".
            'footer_marquee_text' => 'AMERCE COMMERCE MULTIPURPOSE ECOMMERCE',
        ];
    }
}
