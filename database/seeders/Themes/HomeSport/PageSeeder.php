<?php

namespace Database\Seeders\Themes\HomeSport;

use Botble\Shortcode\Facades\Shortcode;

/**
 * Home7 — Sports & Fitness. Mirrors html/home-sport.html section-for-section.
 * Demo has no slide-show; opens with a 3-card Grid Collection (Performance /
 * Precision Gear / Peak Performance) acting as the hero.
 *
 *   1. ecommerce-collections  (style-slider)   — Grid Collection (hero)
 *   2. site-features          (style-1)        — Box Icon trust strip
 *   3. ecommerce-products     (style-slider)   — Performance Starts Here (Best Choice)
 *   4. ecommerce-collections  (style-banner-grid) — Collection (Strength / Outdoor / Court)
 *   5. ecommerce-products     (style-tabs)     — Tab Collection (sport-category tabs)
 *   6. brand-logos            (style-slider)   — Brand strip
 *   7. lookbook-hotspot       (style-v2)       — Lookbook
 *   8. banner-thumbs-product  (style-1)        — Banner Product Single
 *   9. testimonials           (style-v2-product) — Customer Say!
 *  10. image-gallery          (style-default)  — Shop Instagram
 */
class PageSeeder extends \Database\Seeders\Themes\Main\PageSeeder
{
    protected function getHomepageContent(): string
    {
        return htmlentities(implode(PHP_EOL, [
            // 1. Hero Grid Asymmetric — 1 large hero + 2 small stacked cards (grid-cls-v3).
            // Mirrors home-sport.html lines 1330-1420: banner-59 hero ("Pickleball: Your Next Obsession")
            // + banner-60/61 small cards (Precision Gear / Peak Performance).
            Shortcode::generateShortcode('hero-grid-asymmetric', [
                'hero_image' => $this->safeFilePath('section/banner-59.jpg'),
                'hero_title' => 'Pickleball: Your <br>Next Obsession.',
                'hero_desc' => 'Up to 50% Off Accessories',
                'hero_button_text' => 'Shop Now',
                'hero_button_url' => '/products',
                'card_1_image' => $this->safeFilePath('section/banner-60.jpg'),
                'card_1_title' => 'Precision Gear <br>Ultimate Game',
                'card_1_desc' => 'Up to 50% Off Bestsellers',
                'card_1_button_text' => 'Shop Now',
                'card_1_button_url' => '/products',
                'card_2_image' => $this->safeFilePath('section/banner-61.jpg'),
                // Demo copy: html/home-sport.html line ~1410 — "Peak Performance Ultimate Style"
                // with "Up to 50% Off Bestsellers" eyebrow.
                'card_2_title' => 'Peak Performance <br>Ultimate Style',
                'card_2_desc' => 'Up to 50% Off Bestsellers',
                'card_2_button_text' => 'Shop Now',
                'card_2_button_url' => '/products',
            ]),

            // 2. Box Icon — demo §2 (lines 1396-1455) trust strip 4-up swiper (box-icon_V01).
            //    Per phase-05 audit: re-added to match demo body section-count even though
            //    footer-style-5 top-strip also emits these icons.
            //    compact=yes: demo has no top divider line + no doubled padding.
            Shortcode::generateShortcode('site-features', [
                'style' => 'style-1',
                'compact' => 'yes',
                'quantity' => 4,
                'icon_class_1' => 'icon-ArrowUDownLeft',
                'title_1' => '14-Day Returns',
                'description_1' => 'Risk-free shopping with easy returns.',
                'icon_class_2' => 'icon-Package',
                'title_2' => 'Free Shipping',
                'description_2' => 'No extra costs, just the price you see.',
                'icon_class_3' => 'icon-Headset',
                'title_3' => '24/7 Support',
                'description_3' => '24/7 support, always here just for you.',
                'icon_class_4' => 'icon-SealPercent',
                'title_4' => 'Member Discounts',
                'description_4' => 'Special prices for our loyal customers.',
            ]),

            // 3. Performance Starts Here (Best Choice) — demo §3 (lines 1457-1530) is a
            // 2-row swiper grid (`data-grid="2"` + 8 products) of action-rich `style-1`
            // cards (NEW badge + action icons + Quick Add + marquee + swatches). card_style
            // overrides the theme default (style-2 slide-up reveal). grid_rows + pagination_*
            // + product_wrapper_class=square knobs added during the pet-care pass.
            Shortcode::generateShortcode('ecommerce-products', [
                'style' => 'style-slider',
                'title' => 'Performance Starts Here',
                'subtitle' => 'Premium sports gear crafted for durability, comfort, and results.',
                'source' => 'best-seller',
                'limit' => 8,
                'items_per_row' => 4,
                'grid_rows' => 2,
                'card_style' => 'style-1',
                'product_wrapper_class' => 'square',
                'pagination' => 2,
                'pagination_sm' => 2,
                'pagination_md' => 3,
                'pagination_lg' => 4,
            ]),

            // 4. Collection — Strength / Outdoor / Court Sports. Demo §4 (lines 2167-2241)
            // is a 3-card `px-20` swiper of `box-cls-v1 style-3` overlay cards, NOT the
            // static `style-banner-grid`. style-slider-overlay added during this pass.
            Shortcode::generateShortcode('ecommerce-collections', [
                'style' => 'style-slider-overlay',
                'collection_ids' => '4,5,6',
                'limit' => 3,
            ]),

            // 5. Burn On Your Feet — tab-product-showcase composite (heading + numbered tab list LEFT
            // + tab-pane image with product overlay card RIGHT). Mirrors home-sport.html §5
            // `banner-collect-v03 flat-animate-tab-2`. Uses sport-tab-1..4.jpg + 4 running shoe products.
            Shortcode::generateShortcode('tab-product-showcase', [
                'title' => 'Burn On Your Feet',
                'subtitle' => 'Speed comfort endurance balance.',
                'view_all_url' => '/products',
                'view_all_text' => 'View More',
                // Demo §5 tabs are all running shoes (XT8 / Cushion 500 / Ekiden / JF190.1).
                // The sport catalog only has one running-shoe SKU (id=1, JF190.1 Grip White),
                // so every tab maps to it — the tab labels carry the demo copy.
                'tab_1_label' => 'XT8 Running Shoes',
                'tab_1_image' => $this->safeFilePath('section/sport-tab-1.jpg'),
                'tab_1_product_id' => 1,
                'tab_2_label' => 'Cushion 500 Running Shoes',
                'tab_2_image' => $this->safeFilePath('section/sport-tab-2.jpg'),
                'tab_2_product_id' => 1,
                'tab_3_label' => 'Ekiden One Running Shoes',
                'tab_3_image' => $this->safeFilePath('section/sport-tab-3.jpg'),
                'tab_3_product_id' => 1,
                'tab_4_label' => 'JF190.1 Running Shoes',
                'tab_4_image' => $this->safeFilePath('section/sport-tab-4.jpg'),
                'tab_4_product_id' => 1,
            ]),

            // 6. Brand strip — demo §6 (lines 2393-2419) is `infiniteSlide-brand syle-3`,
            // an infinite-scroll marquee (style-infinite), not a paged slider.
            Shortcode::generateShortcode('brand-logos', [
                'style' => 'style-infinite',
                'modifier_class' => 'syle-3',
                'limit' => 6,
            ]),

            // 7. Lookbook — 2-image swiper, ONE hotspot per slide. Demo §7 (lines 2421-2497)
            // pins position22 (look-10 → product-7 yoga mat) + position23 (look-11 → product-2
            // hand weights). x/y from html/assets/css/styles.css lines 14982-14989.
            Shortcode::generateShortcode('lookbook-hotspot', [
                'style' => 'style-v3',
                'wide' => 'yes',
                'image' => $this->safeFilePath('lookbook/look-10.jpg'),
                'image_2' => $this->safeFilePath('lookbook/look-11.jpg'),
                'quantity' => 2,
                'x_percent_1' => 39.5, 'y_percent_1' => 27.2, 'product_id_1' => 7, 'column_1' => 1,
                'x_percent_2' => 34.5, 'y_percent_2' => 48.2, 'product_id_2' => 2, 'column_2' => 2,
            ]),

            // 8. Banner Product Single — full PDP panel (product-feature-zoom style-3-pdp)
            // mirroring demo §8 (lines 2498-2713): LEFT thumbnail gallery + RIGHT info
            // column (tag, name, rating/sold/SKU meta, price, desc, live-viewing,
            // quantity, Add To Cart + Buy It Now, Compare/Ask/Size-Guide/Share, View
            // All Details). Targets product 4 (Pickleball Racket, seeded with 4 images).
            Shortcode::generateShortcode('product-feature-zoom', [
                'style' => 'style-3-pdp',
                'product_id' => 4,
                'detail_tag' => 'Racquet Sports',
                'reviews_count' => 134,
                'urgency_text' => '18 sold in last 32 hours',
                'viewing_count' => 28,
            ]),

            // 9. Customer Say! — demo §9 (lines 2714-2870) is `testimonial-v01 style-8 style-def`
            // (image LEFT + product mini-card RIGHT) inside a cream `bg-main flat-spacing` box.
            // card_type=style-8 + bg_main knobs added to style-v2-product during this pass.
            // testimonial_product_ids pairs by DESC-id order: [Emma→8 (20L bag), Sophia→2 (weights)].
            Shortcode::generateShortcode('testimonials', [
                'style' => 'style-v2-product',
                'card_type' => 'style-8',
                'bg_main' => 'yes',
                'title' => 'Customer Say!',
                'subtitle' => 'Our customers adore our products, and we constantly aim to delight them.',
                'autoplay' => 'no',
                'limit' => 2,
                'testimonial_product_ids' => '8,2',
            ]),

            // 10. Shop Instagram
            Shortcode::generateShortcode('image-gallery', [
                'style' => 'style-default',
                'title' => 'Shop Instagram',
                'subtitle' => 'Connect with us on all platforms to get new information about products.',
                'quantity' => 5,
                'image_1' => $this->safeFilePath('gallery/gallery-62.jpg'),
                'link_1' => '/products',
                'image_2' => $this->safeFilePath('gallery/gallery-63.jpg'),
                'link_2' => '/products',
                'image_3' => $this->safeFilePath('gallery/gallery-64.jpg'),
                'link_3' => '/products',
                'image_4' => $this->safeFilePath('gallery/gallery-65.jpg'),
                'link_4' => '/products',
                'image_5' => $this->safeFilePath('gallery/gallery-66.jpg'),
                'link_5' => '/products',
            ]),
        ]), ENT_NOQUOTES, 'UTF-8');
    }
}
