<?php

namespace Database\Seeders\Themes\HomeFashion2;

use Botble\Shortcode\Facades\Shortcode;

/**
 * Home20 — Fashion Modern. Mirrors html/home-fashion-2.html
 * section-for-section using existing shortcodes.
 *
 *   1. simple-slider          (style-1)        — Hero ("Find Your Signature Style")
 *   2. categories-grid        (style-slider)   — 5+ tile category swiper (no title)
 *   3. ecommerce-products     (style-tabs)     — New Arrivals / Best Sellers / On Sale
 *   4. ecommerce-products     (style-slider)   — "Trending Now" (Product Thumbs fallback)
 *   5. ecommerce-collections  (style-slider)   — Curated Collections For Style
 *   6. infinity-marquee       (style-1)        — Modern Minimalism / Artisan Craftsmanship strip
 *   7. ecommerce-products     (style-slider)   — Featured Sweaters and Knits
 *   8. testimonials           (style-v2)       — What Our Customers Say
 *   9. image-gallery          (style-default)  — Follow Us On Instagram
 */
class PageSeeder extends \Database\Seeders\Themes\Main\PageSeeder
{
    protected function getHomepageContent(): string
    {
        return htmlentities(implode(PHP_EOL, [
            // 1. Hero ("Find Your Signature Style" / "Your Ultimate Style Destination")
            //    Demo (lines 1623-1636) uses square 44×44 boxed nav arrows
            //    `tf-sw-nav-2 d-lg-flex d-none` with plain icon-ArrowLeft/Right
            //    (not the default circular long-arrow set).
            Shortcode::generateShortcode('simple-slider', [
                'key' => 'home-hero',
                'style' => 'style-1',
                'is_autoplay' => 'yes',
                'autoplay_speed' => 5000,
                'show_arrows' => 'yes',
                'show_dots' => 'yes',
                'nav_arrow_class' => 'tf-sw-nav-2 d-lg-flex d-none',
                'nav_arrow_icon_prev' => 'icon-ArrowLeft',
                'nav_arrow_icon_next' => 'icon-ArrowRight',
            ]),

            // 2. Category swiper — 5 tiles, asymmetric right-bleed wrapper
            //    (html/home-fashion-2.html lines 1633-1730: container-layout-right,
            //    category-v06 style-2 hover-img4, swiper data-preview="4.3605").
            //    Demo hardcodes "78 / 120 / 48 / 62 / 36 items" — real DB counts won't
            //    match, so pass count_overrides for demo parity.
            Shortcode::generateShortcode('categories-grid', [
                'style' => 'style-slider',
                'limit' => 5,
                'show_count' => 'yes',
                'wrapper_class' => 'container-layout-right',
                'card_extra_modifier' => 'style-2',
                // Demo swiper is `data-preview="4.3605"` — set BOTH preview and
                // preview_lg so the desktop card width matches (preview_lg alone
                // only feeds data-laptop; data-preview stayed at the default 5).
                'swiper_preview' => '4.3605',
                'swiper_preview_lg' => '4.3605',
                // Demo cate art is 800×1066 portrait; `thumb` (400×400) would
                // center-crop it square — keep the original aspect.
                'card_image_size' => 'original',
                'count_overrides' => '78,120,48,62,36',
                'count_label' => 'items',
            ]),

            // 3. Tabbed product slider — demo (lines 1733-1763) renders tabs-only
            //    centered (no main title/subtitle) with `tab-btn-wrap-v3 style-4`
            //    nav, h4-sized labels, py-4 tab buttons. Demo swiper is `data-grid="2"`
            //    (4×2 = 8 products) and the section is `flat-spacing pt-0`.
            Shortcode::generateShortcode('ecommerce-products', [
                'style' => 'style-tabs',
                'limit' => 8,
                'items_per_row' => 4,
                'grid_rows' => 2,
                'section_class' => 'ecommerce-products ecommerce-products--style-tabs flat-spacing pt-0',
                'tab_labels' => 'New Arrivals|Best Sellers|On Sale',
                'tab_categories' => '||',
                'tab_sources' => 'latest|best-seller|sale',
                'tab_nav_style' => 'v3',
                'tab_nav_class_extra' => 'style-4 justify-content-sm-center mb-0',
                'tab_btn_class_extra' => 'py-4',
                'tab_label_class' => 'h4',
            ]),

            // 4. Slim Ribbed Cotton T-Shirt — section-thumbs-v2 (full-width 2-col):
            //    big square image swiper RIGHT, heading + 3-product mini-card swiper LEFT.
            //    Mirrors html/home-fashion-2.html lines 3803-3953.
            Shortcode::generateShortcode('banner-thumbs-product', [
                'style' => 'style-thumbs-v2',
                'heading' => 'Slim Ribbed Cotton T-Shirt',
                'subheading' => 'Slim Ribbed Cotton T-Shirt top\'s minimal design focuses on user needs and allows to adapt and support many environments.',
                'product_ids' => '1,2,3',
                // Optional per-slide square assets (lifestyle 1:1 crops); falls back to product image.
                'square_image_1' => $this->safeFilePath('products/fashion-2/square/product-1_2.jpg'),
                'square_image_2' => $this->safeFilePath('products/fashion-2/square/product-2_2.jpg'),
                'square_image_3' => $this->safeFilePath('products/fashion-2/square/product-4_2.jpg'),
            ]),

            // 5. Collection — Curated Collections For Style. Demo (lines 3954-4066)
            //    is `banner-collect-v01 style-2 st-2_2` accordion-tabs: left column
            //    heading + 4-item accordion + "Shop Collections" button, right column
            //    705×705 square image per active tab.
            Shortcode::generateShortcode('ecommerce-collections', [
                'style' => 'style-accordion-tabs',
                'title' => 'Curated Collections For Style',
                'subtitle' => 'Thoughtfully designed fashion pieces defining modern elegance.',
                'collection_ids' => '1,2,3,4',
                'container_class' => 'container',
                'card_modifier' => 'style-2 st-2_2',
                'accordion_modifier' => 'style-2',
                'title_class' => 'h5 fw-medium',
                'button_text' => 'Shop Collections',
                'button_url' => '/products',
                'image_size' => 'original',
            ]),

            // 6. Infinite marquee — collection cards strip. Demo (lines 4068-4127)
            //    is a bare `<div class="bg-main-2">` with NO spacing block, and the
            //    6 headings/images are: Modern Minimalism (cls-34), Artisan
            //    Craftsmanship (cls-35), Sustainable Luxury (cls-36), Luxe and
            //    Livable (cls-37), Confidence in Every Step (cls-38), Curated
            //    Confidence (cls-3).
            Shortcode::generateShortcode('infinity-marquee', [
                'style' => 'style-1',
                'background_class' => 'bg-main-2',
                'spacing_class' => '',
                'clone_count' => 3,
                'quantity' => 6,
                'heading_1' => 'Modern Minimalism',
                'image_1' => $this->safeFilePath('collection/cls-34.jpg') ?: $this->safeFilePath('collection/cls-1.jpg'),
                'link_1' => '/products',
                'heading_2' => 'Artisan Craftsmanship',
                'image_2' => $this->safeFilePath('collection/cls-35.jpg') ?: $this->safeFilePath('collection/cls-2.jpg'),
                'link_2' => '/products',
                'heading_3' => 'Sustainable Luxury',
                'image_3' => $this->safeFilePath('collection/cls-36.jpg') ?: $this->safeFilePath('collection/cls-3.jpg'),
                'link_3' => '/products',
                'heading_4' => 'Luxe and Livable',
                'image_4' => $this->safeFilePath('collection/cls-37.jpg') ?: $this->safeFilePath('collection/cls-4.jpg'),
                'link_4' => '/products',
                'heading_5' => 'Confidence in Every Step',
                'image_5' => $this->safeFilePath('collection/cls-38.jpg') ?: $this->safeFilePath('collection/cls-5.jpg'),
                'link_5' => '/products',
                'heading_6' => 'Curated Confidence',
                'image_6' => $this->safeFilePath('collection/cls-3.jpg') ?: $this->safeFilePath('collection/cls-1.jpg'),
                'link_6' => '/products',
            ]),

            // 7. Featured Sweaters and Knits — demo (lines 4130-4185) is a
            //    `container-full` row: left col-lg-3 heading + "View All Products"
            //    button, right col-lg-9 product slider (data-preview=3).
            Shortcode::generateShortcode('ecommerce-products', [
                'style' => 'style-slider-side-heading',
                'title' => 'Featured Sweaters and Knits',
                'subtitle' => 'Our curated knitwear collection for maximum warmth and flawless style.',
                'source' => 'featured',
                'limit' => 6,
                'items_per_row' => 3,
                'view_all_url' => '/products',
                'view_all_text' => 'View All Products',
            ]),

            // 8. Testimonials — What Our Customers Say. Demo (lines 4425-4520) is
            //    `testimonial-v04 style-2` 3-up inside `flat-spacing pt-0` >
            //    `flat-spacing bg-main` > `container-full`, with a left heading +
            //    "Read All Reviews" link (no nav arrows). Themed fashion quotes +
            //    product mini-cards come from HomeFashion2\TestimonialSeeder.
            Shortcode::generateShortcode('testimonials', [
                'style' => 'style-v4',
                'title' => 'What Our Customers Say',
                'subtitle' => 'Real stories from people who love our products.',
                'autoplay' => 'yes',
                'limit' => 6,
                'card_modifier' => 'style-2',
                'container_class' => 'container-full',
                'preview' => 3,
                'bg_main' => 'yes',
                'view_all_url' => '/products',
                'view_all_text' => 'Read All Reviews',
                'section_class' => 'flat-spacing pt-0',
                // Pairs render-order [Emma, Evelyn, Cara] with product mini-cards:
                // Cotton Tee (T-shirt review), Turtleneck Knit (top), Denim Jacket.
                'testimonial_product_ids' => '1,4,9',
            ]),

            // 9. Gallery — Follow Us On Instagram. Demo (line 4583) wraps in a bare
            //    `themesFlat px-10 pb-40` section (no `flat-spacing` padding block).
            Shortcode::generateShortcode('image-gallery', [
                'style' => 'style-default',
                'title' => 'Follow Us On Instagram',
                'subtitle' => '@Amerce',
                'skip_spacing' => 'yes',
                'extra_section_class' => 'px-10 pb-40',
                'quantity' => 5,
                'image_1' => $this->safeFilePath('gallery/gallery-52.jpg') ?: $this->safeFilePath('gallery/gallery-1.jpg'),
                'link_1' => '/products',
                'image_2' => $this->safeFilePath('gallery/gallery-53.jpg') ?: $this->safeFilePath('gallery/gallery-2.jpg'),
                'link_2' => '/products',
                'image_3' => $this->safeFilePath('gallery/gallery-54.jpg') ?: $this->safeFilePath('gallery/gallery-3.jpg'),
                'link_3' => '/products',
                'image_4' => $this->safeFilePath('gallery/gallery-55.jpg') ?: $this->safeFilePath('gallery/gallery-4.jpg'),
                'link_4' => '/products',
                'image_5' => $this->safeFilePath('gallery/gallery-56.jpg') ?: $this->safeFilePath('gallery/gallery-5.jpg'),
                'link_5' => '/products',
            ]),
        ]), ENT_NOQUOTES, 'UTF-8');
    }
}
