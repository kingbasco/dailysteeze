<?php

namespace Database\Seeders\Themes\HomeFurniture;

use Botble\Shortcode\Facades\Shortcode;

/**
 * Home3 — Furniture Store. Mirrors html/home-furniture.html section-for-section.
 * Demo has no slide-show; opens with Category swiper.
 *
 * Reuses preset-2 (electronics) shared assets where possible:
 *   - categories-grid `style-slider-icon`
 *   - ecommerce-products `style-tabs` (tab_nav_style=v3 + view_all CTA)
 *   - ecommerce-collections `style-2-up-horizontal` (3-up box-image_v04)
 *   - banner-image-text `style-abs-2` (full-width abs overlay for §8 Discover)
 *   - testimonials `style-thumbs-product` (text + product showcase, no avatar)
 *   - faq-list `style-side-cta`
 *   - site-features `style-1` (4-up box-icon swiper, footer top strip)
 *
 * Sections:
 *   1. categories-grid        (style-slider-icon)        — 7 furniture cats
 *   2. parallax-banner        (style-1)                  — Paralaxie hero ("AMERCE")
 *   3. ecommerce-products     (style-slider)             — Where Comfort Meets Timeless Design (8 products)
 *   4. banner-collection      (style-2)                  — Banner Product (4-tabs LEFT + image RIGHT) [first-pass via existing]
 *   5. ecommerce-collections  (style-cards-3)            — Featured Collection (3 collection cards)
 *   6. banner-countdown       (style-1)                  — Limited Time Furniture Offers
 *   7. lookbook-hotspot       (style-v4-carousel)        — Banner Lookbook (preset-1 partial)
 *   8. banner-image-text      (style-abs-2)              — Banner Discover (full-width abs overlay)
 *   9. ecommerce-products     (style-tabs, v3 + slashes) — Top Sellers You Can't Miss (6 tabs)
 *  10. testimonials           (style-thumbs-product)     — What Our Customers Say
 *  11. blog-posts             (style-list)               — Stories For Modern Homes (4 posts)
 *  12. image-gallery          (style-default)            — Gallery (5 squares)
 */
class PageSeeder extends \Database\Seeders\Themes\Main\PageSeeder
{
    protected function getHomepageContent(): string
    {
        // Top-seller tab category IDs (resolved from seeded names)
        $topSellerCategoryIds = $this->resolveCategoryIds(['Sofas', 'Chairs', 'Tables', 'Beds', 'Storage', 'New Arrivals']);

        return htmlentities(implode(PHP_EOL, [
            // 1. Category swiper (7 cards: 1 CTA + 6 categories) — uses style-slider-cta
            //    (image-left layout matching demo's `category-v05` markup, lines 1444-1559).
            //    Demo's first slide is the red "Sale Off" CTA card (bg-primary +
            //    SealPercent icon + "36 items"). Remaining slides: New Arrivals,
            //    Sofas, Chairs, Tables, Beds, Storage on bg-main with cate-{1..6}.jpg.
            Shortcode::generateShortcode('categories-grid', [
                'style' => 'style-slider-cta',
                'limit' => 6,
                'show_count' => 'yes',
                'cta_label' => 'Sale Off',
                'cta_count' => '36 items',
                'cta_url' => '/products?on_sale=1',
                'cta_icon' => 'icon-SealPercent',
                // Override DB-derived products_count to match demo's fixed counts
                // (html/home-furniture.html L1444-1559: 12 / 18 / 26 / 32 / 22 / 14).
                'count_overrides' => '12|18|26|32|22|14',
            ]),

            // 2. Parallax banner — html/home-furniture.html line 1562-1577:
            //    full-width desk image with "AMERCE - AMERCE -" circular rotating text overlay.
            //    No headline/subheading/button — purely an immersive hero pause between
            //    Categories and the Products grid. The 'circular_text' attr drives the
            //    wg-circular-text widget the theme JS picks up via #circularText.
            Shortcode::generateShortcode('parallax-banner', [
                'style' => 'style-2',
                'image' => $this->safeFilePath('slider/furniture/slider-1.jpg')
                    ?: $this->safeFilePath('section/furniture-banner-1.jpg'),
                'height' => 560,
                'circular_text' => 'AMERCE - AMERCE - AMERCE - AMERCE -',
            ]),

            // 3. Featured product slider — "Where Comfort Meets Timeless Design"
            //    Demo (L1580-2165): title LEFT (col-lg-7), subtitle + View All RIGHT
            //    (col-lg-5), 4-up grid x 2 rows (data-preview=4, data-grid=2 → 8 cards
            //    in a 2-row 4-col grid).
            Shortcode::generateShortcode('ecommerce-products', [
                'style' => 'style-slider',
                'title' => 'Where Comfort Meets <br> Timeless Design.',
                'subtitle' => 'Explore furniture pieces made to elevate daily life with subtle elegance and lasting quality.',
                'title_align' => 'left',
                'subtitle_position' => 'right',
                'source' => 'featured',
                'limit' => 8,
                'items_per_row' => 4,
                'grid_rows' => 2,
                'view_all_url' => '/products',
                'view_all_text' => 'View All Products',
            ]),

            // 4. Banner Product — `flat-animate-tab-2 banner-collect-v02` 4-tab nav LEFT
            //    + tab-content image RIGHT + bottom thumbs strip + desc + CTA. Mirrors
            //    html/home-furniture.html lines 2166-2249. Uses style-tabs (graduated
            //    2026-05-08) — Bootstrap data-bs-toggle handles tab switching.
            Shortcode::generateShortcode('banner-collection', [
                'style' => 'style-tabs',
                'tab_1_label' => 'Modern Comfort Living',
                'tab_2_label' => 'Natural Wood Home',
                'tab_3_label' => 'Minimal Forms Everyday',
                'tab_4_label' => 'Timeless Design Space',
                'tab_1_image' => $this->safeFilePath('section/furniture-banner-2.jpg'),
                'thumb_1' => $this->safeFilePath('products/furniture/no-bg/product-1.png'),
                'thumb_2' => $this->safeFilePath('products/furniture/no-bg/product-5.png'),
                'thumb_3' => $this->safeFilePath('products/furniture/no-bg/product-7.png'),
                'description' => 'A nature-inspired collection featuring rich wood textures, soft finishes, and timeless forms for comfortable, balanced living.',
                'button_text' => 'Shop Collection',
                'button_url' => '/products',
            ]),

            // 5. Featured Collection — 3-up cards (cls-1/2/3 imagery)
            Shortcode::generateShortcode('ecommerce-collections', [
                'style' => 'style-cards-3',
                'title' => 'Featured Collection',
                'subtitle' => 'Design-forward furniture selected to shape spaces with warmth and intention.',
                'collection_ids' => '1,2,3',
                'limit' => 3,
            ]),

            // 6. Banner Countdown — Limited Time Furniture Offers
            Shortcode::generateShortcode('banner-countdown', [
                'style' => 'style-1',
                'heading' => 'Limited Time Furniture Offers.',
                'subheading' => 'Enjoy special pricing on designs for modern homes.',
                'button_text' => 'Code: AMERCE',
                'button_url' => '/products',
                'target_date' => now()->addDays(7)->format('Y-m-d H:i'),
            ]),

            // 7. Banner Lookbook — `tf-lookbook-hover lookbook-hover-v2` 2-col composite:
            //    banner LEFT (with pinned dropdowns showing mini lookbook-product cards) +
            //    Bundle & Save RIGHT (numbered bundle-prd-v2 cards). Mirrors furniture §7
            //    demo lines 2338-2557. Uses style-v4-bundle (graduated 2026-05-08).
            Shortcode::generateShortcode('lookbook-hotspot', [
                'style' => 'style-v4-bundle',
                'image' => $this->safeFilePath('lookbook/look-5.jpg') ?: $this->safeFilePath('section/furniture-banner-1.jpg'),
                'bundle_heading' => 'Bundle & Save',
                'bundle_subtitle' => 'Thoughtfully paired pieces to save more.',
                'quantity' => 3,
                'x_percent_1' => 35, 'y_percent_1' => 40, 'product_id_1' => 8,
                'x_percent_2' => 65, 'y_percent_2' => 55, 'product_id_2' => 9,
                'x_percent_3' => 45, 'y_percent_3' => 65, 'product_id_3' => 3,
            ]),

            // 8. Banner Discover — full-width parallax-banner (closest match to demo's
            //    `banner-v03 parallaxie`). Builds an immersive hero-style banner with bg-image.
            //    Demo (L2558-2586): subheading ABOVE heading, LEFT-aligned text.
            Shortcode::generateShortcode('parallax-banner', [
                'style' => 'style-1',
                'heading' => 'Furniture Crafted For <br> Everyday Comfort & Style',
                'subheading' => 'DESIGNED FOR MODERN LIVING',
                'subheading_position' => 'above',
                'text_alignment' => 'left',
                'button_text' => 'Discover Our Designs',
                'button_url' => '/products',
                'image' => $this->safeFilePath('section/furniture-banner-1.jpg') ?: $this->safeFilePath('section/banner-1.jpg'),
            ]),

            // 9. Top Sellers tabs — 6 furniture-category tabs with v3 slash separators
            //    Demo shows 24 product cards across 6 tabs.
            Shortcode::generateShortcode('ecommerce-products', [
                'style' => 'style-tabs',
                'title' => 'Top Sellers You Can\'t Miss',
                'source' => 'best-seller',
                'limit' => 24,
                'items_per_row' => 4,
                'tab_labels' => 'Sofas|Chairs|Tables|Beds|Storage|New Arrivals',
                'tab_categories' => str_replace(',', '|', $topSellerCategoryIds),
                'tab_sources' => 'best-seller|best-seller|best-seller|best-seller|best-seller|best-seller',
                'tab_nav_style' => 'v3',
                // Demo §9 (L2587+): title CENTERED, 6 v3 slash tabs CENTERED below
                // (not the default split-row with tabs on the right).
                'header_layout' => 'stacked-center',
                'view_all_url' => '/products',
                'view_all_text' => 'View All Products',
            ]),

            // 10. Testimonials — 2-up text + product card layout (no avatar/lifestyle image).
            //     Demo's `section-testimonial-v2` wraps `testimonial-v04` cards 2-up
            //     inside a cream/beige section bg — toggle via `bg_main=yes`.
            //     `style-v4` was graduated 2026-05-08 to mirror demo markup exactly.
            Shortcode::generateShortcode('testimonials', [
                'style' => 'style-v4',
                'title' => 'What Our Customers Say',
                'subtitle' => 'Real stories from people who love our products.',
                'autoplay' => 'yes',
                'limit' => 4,
                'bg_main' => 'yes',
            ]),

            // 11. Blog — Stories For Modern Homes (4 posts in 2x2 grid via style-list)
            Shortcode::generateShortcode('blog-posts', [
                'style' => 'style-list',
                'title' => 'Stories For Modern Homes',
                'subtitle' => 'Inspiring ideas, design tips, and everyday stories to help create comfortable.',
                'limit' => 4,
                'show_meta' => 'yes',
                'show_excerpt' => 'yes',
            ]),

            // 12. Gallery — 5 furniture lifestyle squares (gallery-47..51 from variant pool).
            //     Don't use gallery-1..5 — those resolve to fashion images in the shared pool.
            Shortcode::generateShortcode('image-gallery', [
                'style' => 'style-default',
                'quantity' => 5,
                'image_1' => $this->safeFilePath('gallery/gallery-47.jpg'),
                'link_1' => '/products',
                'image_2' => $this->safeFilePath('gallery/gallery-48.jpg'),
                'link_2' => '/products',
                'image_3' => $this->safeFilePath('gallery/gallery-49.jpg'),
                'link_3' => '/products',
                'image_4' => $this->safeFilePath('gallery/gallery-50.jpg'),
                'link_4' => '/products',
                'image_5' => $this->safeFilePath('gallery/gallery-51.jpg'),
                'link_5' => '/products',
            ]),
        ]), ENT_NOQUOTES, 'UTF-8');
    }
}
