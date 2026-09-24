<?php

namespace Database\Seeders\Themes\HomeJewelry;

use Botble\Shortcode\Facades\Shortcode;

/**
 * Home6 — Jewelry & Watches. Mirrors html/home-jewelry.html section-for-section.
 *
 *   1. simple-slider          (style-1)              — Hero ("Jewelry Crafted To Capture Attention")
 *   2. banner-countdown       (style-1)              — "Hurry! Deals On" countdown
 *   3. categories-grid        (style-slider)         — Curated Categories
 *   4. infinity-marquee       (style-1)              — Black Friday promo strip
 *   5. ecommerce-collections  (style-cards-3)        — Section Collection (Shine/Luxury/Fresh)
 *   6. ecommerce-products     (style-slider)         — Best Sellers
 *   7. ecommerce-collections  (style-accordion-tabs) — Exclusive Jewellery Collections accordion
 *   8. ecommerce-products     (style-slider)         — New Arrivals
 *   9. banner-thumbs-product  (style-1)              — Featured Piece thumbs banner
 *  10. lookbook-hotspot       (style-v3 + mini_list) — Section Lookbook + Jewellery Lookbook mini-list (composite)
 *  11. banner-image-text      (style-highlight-swiper) — Section Highlight (Dazzling Vision swiper)
 *  12. blog-posts             (style-slider)         — Jewellery Inspirations
 *  13. site-features          (style-1)              — 14-Day Returns / Free Shipping / 24-7 / Member
 */
class PageSeeder extends \Database\Seeders\Themes\Main\PageSeeder
{
    protected function getHomepageContent(): string
    {
        return htmlentities(implode(PHP_EOL, [
            // 1. Hero — mirrors html/home-jewelry.html (sls-jewellry wrapper, hover nav)
            Shortcode::generateShortcode('simple-slider', [
                'key' => 'home-hero',
                'style' => 'style-1',
                'is_autoplay' => 'yes',
                'autoplay_speed' => 5000,
                'show_arrows' => 'no',  // hover-only nav, no external buttons
                'show_dots' => 'yes',
                'wrapper_class' => 'sls-jewellry',
            ]),

            // 2. Banner Countdown — "Hurry! Deals On" (v01 style-2 bg-dark, html pos 2)
            // Demo wraps the banner in `<div class="flat-spacing">` (L1712) → outer_spacing_class.
            Shortcode::generateShortcode('banner-countdown', [
                'style' => 'style-1',
                'style_modifier' => 'style-2',
                'background_class' => 'bg-dark',
                'container_class' => 'container-full',
                'outer_spacing_class' => 'flat-spacing',
                'heading' => 'Hurry! Deals On',
                'subheading' => 'Up to 50% Off Selected Styles. Don\'t Miss Out.',
                'target_date' => now()->addDays(13)->format('Y-m-d H:i'),
            ]),

            // 3. Curated Categoriess (demo HTML uses double-s typo at line 1736; preserved verbatim)
            Shortcode::generateShortcode('categories-grid', [
                'style' => 'style-slider',
                'title' => 'Curated Categoriess',
                'subtitle' => 'Explore premium selections that redefine comfort and style.',
                'limit' => 8,
                'show_count' => 'yes',
            ]),

            // 4. Slide — Black Friday promo strip (demo html/home-jewelry.html L1837-1850
            // uses `infiniteSlide-text-v02` + `<p class="text h5 fw-medium">` + icon-Star2
            // separators wrapped in `container-full flat-spacing`). Variant added 2026-05-15.
            Shortcode::generateShortcode('infinity-marquee', [
                'style' => 'style-1',
                'variant' => 'text-v02',
                'clone_count' => 5,
                'quantity' => 3,
                'heading_1' => 'Black Friday Sale: Up to 50% Off. Code: FUEL2025',
                'heading_2' => 'Black Friday Sale: Up to 50% Off. Code: FUEL2025',
                'heading_3' => 'Black Friday Sale: Up to 50% Off. Code: FUEL2025',
            ]),

            // 5. Section Collection — 3-card collection row (html pos 5).
            // Demo art is landscape 457x320 (L1856); default 'thumb' (square 400x400)
            // would center-crop and inflate card height ~240px → use 'original'.
            Shortcode::generateShortcode('ecommerce-collections', [
                'style' => 'style-cards-3',
                'card_image_size' => 'original',
                'collection_ids' => '1,2,3',
                'limit' => 3,
            ]),

            // 6. Best Sellers product slider (html section comment "Best Sale", visible h3 "Best Sellers")
            //    Demo shows 7 product cards in carousel. Demo header markup
            //    `sect-heading type-4 align-items-end` (L1908) = title_align='side-nav'
            //    which moves the prev/next arrows into the header row.
            Shortcode::generateShortcode('ecommerce-products', [
                'style' => 'style-slider',
                'title' => 'Best Sellers',
                'subtitle' => 'Most-loved jewellery pieces, hand-picked by our customers.',
                'title_align' => 'side-nav',
                'source' => 'best-seller',
                'limit' => 7,
                'items_per_row' => 4,
            ]),

            // 7. Banner Collection — Exclusive Jewellery Collections (accordion + image)
            // expanded_index=0 ensures first item is open by default — already the
            // blade default, set explicit for clarity.
            Shortcode::generateShortcode('ecommerce-collections', [
                'style' => 'style-accordion-tabs',
                'title' => 'Exclusive Jewellery Collections',
                'subtitle' => 'Discover exquisite pieces designed to elevate your style, perfect for every occasion.',
                'collection_ids' => '4,5,6,7',
                'limit' => 4,
                'expanded_index' => 0,
            ]),

            // 8. New Arrivals — same split-header treatment as §6.
            Shortcode::generateShortcode('ecommerce-products', [
                'style' => 'style-slider',
                'title' => 'New Arrivals',
                'subtitle' => 'Fresh designs to refresh your jewellery collection.',
                'title_align' => 'side-nav',
                'source' => 'latest',
                'limit' => 8,
                'items_per_row' => 4,
            ]),

            // 9. Banner Product Single — full PDP-style hero spotlight.
            // Demo data mirrors html/home-jewelry.html banner-product-single style-5
            // (Diamond Floral Pendant: 134 reviews, $399 sale / $450 regular,
            // SKU 53453412). product_ids drive the color-swatch row; featured_*
            // attributes override product DB lookups so the rendered card matches
            // the static demo verbatim.
            Shortcode::generateShortcode('banner-thumbs-product', [
                'style' => 'style-1',
                'product_ids' => '1,2,3,4',
                'featured_category' => 'Jewelry',
                'featured_name' => 'Diamond Floral Pendant',
                'featured_sku' => '53453412',
                'featured_reviews' => 134,
                'featured_sold' => 18,
                'featured_viewing' => 28,
                'featured_price' => '399',
                'featured_old_price' => '450',
                'featured_sale_percent' => 25,
                'featured_description' => 'Our signature removable magnetic ear pads are easily replaceable and provide serious sound isolation.',
                'featured_image' => $this->safeFilePath('products/single/detail-5.jpg'),
                'main_image' => $this->safeFilePath('products/single/detail-5_4.jpg'),
            ]),

            // 10. Section Lookbook + Jewellery Lookbook mini-list (composite).
            // Demo lines 3355-3603 wrap col-xl-8 lookbook (look-3 + look-4 with hotspots) +
            // col-xl-4 mini-list ("Jewellery Lookbook" heading + 4-product carousel) in
            // single `section-lookbook-hover-v03` section. Mini-list is embedded via the
            // `mini_list_*` attrs on the lookbook-hotspot shortcode (preset 5 retro lesson Y:
            // extend partial via attrs instead of forking).
            Shortcode::generateShortcode('lookbook-hotspot', [
                'style' => 'style-v3',
                'image' => $this->safeFilePath('lookbook/look-3.jpg') ?: $this->safeFilePath('section/banner-1.jpg'),
                'image_2' => $this->safeFilePath('lookbook/look-4.jpg') ?: $this->safeFilePath('section/banner-2.jpg'),
                'quantity' => 4,
                'x_percent_1' => 35, 'y_percent_1' => 40, 'product_id_1' => 1, 'column_1' => 1,
                'x_percent_2' => 65, 'y_percent_2' => 55, 'product_id_2' => 2, 'column_2' => 1,
                'x_percent_3' => 45, 'y_percent_3' => 65, 'product_id_3' => 3, 'column_3' => 2,
                'x_percent_4' => 60, 'y_percent_4' => 35, 'product_id_4' => 4, 'column_4' => 2,
                'mini_list_title' => 'Jewellery Lookbook',
                'mini_list_subtitle' => 'Discover our curated jewellery sets',
                'mini_list_product_ids' => '1,2,3,4',
            ]),

            // 12. Section Highlight — banner-47.jpg with 4-slide swiper of text overlays
            // (Dazzling Vision / Crafted Elegance / Bold Sparkle / True Connection).
            // Mirrors home-jewelry.html lines 3601-3653 section-highlight pattern.
            Shortcode::generateShortcode('banner-image-text', [
                'style' => 'style-highlight-swiper',
                'image' => $this->safeFilePath('section/banner-47.jpg'),
                'quantity' => 4,
                'heading_1' => 'Dazzling Vision',
                'content_1' => "Not just jewellery, it's a statement. Designed for those who shine their own way.",
                'heading_2' => 'Crafted Elegance',
                'content_2' => "Not just jewellery, it's a statement. Designed for those who value timeless beauty.",
                'heading_3' => 'Bold Sparkle',
                'content_3' => "Not just jewellery, it's a statement. Designed for those who express themselves freely.",
                'heading_4' => 'True Connection',
                'content_4' => "Not just jewellery, it's a statement. Designed for those who celebrate every moment.",
            ]),

            // 13. Jewellery Inspirations — Section Insights split layout.
            // Demo (html/home-jewelry.html L3655-3751) renders 1 big featured LEFT
            // + 3 stacked list posts RIGHT inside `<section class="flat-spacing
            // section-insights">`. style-insights-split blade defaults to 2 list
            // posts (HomeHeadphone parity) → pass list_count=3 + section_class.
            Shortcode::generateShortcode('blog-posts', [
                'style' => 'style-insights-split',
                'section_class' => 'flat-spacing section-insights',
                'title' => 'Jewellery Inspirations',
                'subtitle' => 'Latest trends, tips, and stories for jewellery lovers.',
                'limit' => 4,
                'list_count' => 3,
                'show_meta' => 'yes',
                'show_excerpt' => 'yes',
            ]),

            // 14. Site features (Benefits row) — REMOVED. Now rendered as the TOP STRIP of
            // footer style-6 (footer-s5 bg-main-5) which already emits the 4 service callouts
            // (14-Day Returns / Free Shipping / 24/7 Support / Member Discounts) via
            // theme_option `footer_service_*` defaults. Matches demo's footer-s5 wrap that
            // includes both the strip + 5-col body in a single cream-bg section.
        ]), ENT_NOQUOTES, 'UTF-8');
    }
}
