<?php

namespace Database\Seeders\Themes\HomeConstruct;

use Botble\Shortcode\Facades\Shortcode;

/**
 * Home14 — Tools & Construction. Mirrors html/home-construction.html.
 *
 *   1. simple-slider          (style-1)          — Hero ("Products Crafted To Withstand Time")
 *   2. infinity-marquee       (text-v03)         — Return Shipping announcement strip
 *   3. categories-grid        (style-slider)     — Construction Categories
 *   4. ecommerce-products     (style-tabs)       — Top Picks This Week (tabbed)
 *   5. banner-thumbs-product  (style-thumbs-arrival) — Section Arrival
 *   6. ecommerce-products     (style-slider)     — Top Picks This Week (plain slider)
 *   7. banner-countdown       (style-1)          — Banner Countdown
 *   8. lookbook-hotspot       (style-v3)         — Lookbook (2-col static)
 *   9. brand-logos            (style-infinite)   — Brand marquee
 *  10. banner-thumbs-product  (style-1)          — Banner Product Single
 *  11. testimonials           (style-v2-product)  — Testimonials
 *  12. blog-posts             (style-slider)     — Blog
 */
class PageSeeder extends \Database\Seeders\Themes\Main\PageSeeder
{
    protected function getHomepageContent(): string
    {
        return htmlentities(implode(PHP_EOL, [
            // 1. Hero — html/home-construction.html: tf-slideshow tf-btn-swiper-main.
            //    Content uses sld_content type-4 per demo. No hover arrows, line pagination.
            Shortcode::generateShortcode('simple-slider', [
                'key' => 'home-hero',
                'style' => 'style-1',
                'is_autoplay' => 'yes',
                'autoplay_speed' => 3000,
                'show_arrows' => 'no',
                'show_dots' => 'yes',
                'content_position' => 'type-4',
                'wrapper_class' => '',
                'use_container' => 'yes',
                'container_class' => 'container-full',
            ]),

            // 2. Return Shipping announcement strip — `infiniteSlide-text-v03 mb-40`.
            //    Mirrors html/home-construction.html lines 1321-1336.
            //    3 messages + icon-Star2 separators, cloned 5× for seamless loop.
            Shortcode::generateShortcode('infinity-marquee', [
                'style' => 'style-1',
                'variant' => 'text-v03',
                'extra_class' => 'mb-40',
                'clone_count' => 5,
                'quantity' => 3,
                'heading_1' => 'FREE SHIPPING ON ALL ORDERS OVER $20.00',
                'heading_2' => 'RETURNS ARE FREE WITHIN 14 DAYS',
                'heading_3' => 'SECURE PAYMENT WITH EVERY PURCHASE',
            ]),

            // 3. Construction Categories — `category-v04` swiper grid, 5×2, 10 slides.
            //    HTML uses `swiper-cate` with `data-grid="2"` for 2-row layout.
            Shortcode::generateShortcode('categories-grid', [
                'style' => 'style-slider',
                'title' => 'Construction Categories',
                'subtitle' => 'Essential tools and equipment designed for professional building work.',
                'limit' => 10,
                'show_count' => 'yes',
                'card_class' => 'category-v04',
                'card_modifier' => 'hover-img',
                'card_image_class' => 'img-style',
                'card_content_class' => 'text-center',
                'swiper_class' => 'swiper-cate',
                'swiper_grid' => '2',
                'swiper_space_lg' => '40',
                'wrapper_class' => '',
            ]),

            // 4. Top Picks This Week (tabbed, AJAX + grid-with-banner) — `section-top-pick-v02`
            //    Uses style-auto-featured-tabs with tab_content_layout=grid-with-banner.
            //    First tab SSR, others load via AJAX. Banner on left, product grid on right.
            Shortcode::generateShortcode('ecommerce-products', [
                'style' => 'style-auto-featured-tabs',
                'section_class' => 'section-top-pick-v02',
                'title' => 'Top Picks This Week',
                'subtitle' => 'Weekly Favorites Selected With Care To Support Your Wellbeing.',
                'limit' => 10,
                'items_per_row' => 4,
                'tab_labels' => 'Medications|Devices|Wellness|Offers',
                'tab_categories' => '|||',
                'tab_sources' => 'best-seller|featured|best-seller|featured',
                'tab_label_class' => 'fw-semibold',
                'tab_content_layout' => 'grid-with-banner',
                'banner_image' => $this->safeFilePath('section/banner-54.jpg'),
                'banner_heading' => "Top Quality\nAccessories",
                'banner_subheading' => "Discover Premium Parts to\nEnhance Performance.",
                'banner_button_text' => 'Shop Now',
                'banner_button_url' => '/products',
            ]),

            // 5. Section Arrival — `section-thumbs-arrival style-2` 3-col composite
            //    (heading+single thumb-product LEFT + 2 banner imgs RIGHT). Mirrors
            //    html/home-construction.html lines 3694-3744.
            Shortcode::generateShortcode('banner-thumbs-product', [
                'style' => 'style-thumbs-arrival',
                'overline' => 'BEST SELL OF THE WEEK',
                'heading' => 'The Future Of Construction',
                'description' => 'Beautiful foliage, crafted planters, and must-have tools that help you build a relaxing green sanctuary indoors.',
                'product_ids' => '1',
                'banner_image_1' => $this->safeFilePath('section/banner-55.jpg'),
                'banner_image_2' => $this->safeFilePath('section/banner-56.jpg'),
            ]),

            // 6. Top Picks This Week (2nd section) — plain product slider (NO tabs).
            //    HTML lines 3746-4036: <section class=""> with swiper wrap-sw-over, 4 product cards.
            Shortcode::generateShortcode('ecommerce-products', [
                'style' => 'style-slider',
                'title' => 'Top Picks This Week',
                'subtitle' => 'Weekly Favorites Selected With Care To Support Your Wellbeing.',
                'limit' => 8,
                'items_per_row' => 4,
                'source' => 'featured',
            ]),

            // 7. Banner Countdown — "Hurry! Deals On" (v01 style-4 with bg image)
            Shortcode::generateShortcode('banner-countdown', [
                'style' => 'style-1',
                'style_modifier' => 'style-4',
                'show_image' => 'yes',
                'heading' => 'Hurry! Deals On',
                'subheading' => 'Up to 50% Off Selected Styles. Don\'t Miss Out.',
                'background_image' => $this->safeFilePath('section/banner-countdown.jpg'),
                'target_date' => now()->addDays(7)->format('Y-m-d H:i'),
            ]),

            // 8. Lookbook — 2-slide swiper with hotspots + brand marquee below.
            //    HTML uses `banner-lookbook style-2` slides inside `swiper-type-number`.
            //    style-v3 renders 2-col static lookbook with hotspots (closest available).
            Shortcode::generateShortcode('lookbook-hotspot', [
                'style' => 'style-v3',
                'title' => 'Shop The Look',
                'subtitle' => '',
                'image' => $this->safeFilePath('section/banner-lookbook-12.jpg'),
                'image_2' => $this->safeFilePath('section/banner-lookbook-14.jpg'),
                'quantity' => 4,
                'x_percent_1' => 35, 'y_percent_1' => 40, 'product_id_1' => 2, 'column_1' => 1,
                'x_percent_2' => 65, 'y_percent_2' => 55, 'product_id_2' => 1, 'column_2' => 1,
                'x_percent_3' => 45, 'y_percent_3' => 65, 'product_id_3' => 1, 'column_3' => 2,
                'x_percent_4' => 60, 'y_percent_4' => 35, 'product_id_4' => 3, 'column_4' => 2,
            ]),

            // 9. Brand marquee — `infiniteSlide-brand style-2` below lookbook.
            Shortcode::generateShortcode('brand-logos', [
                'style' => 'style-infinite',
                'section_class' => '',
                'clone_count' => 3,
                'items_per_row' => 7,
            ]),

            // 10. Banner Product Single — `banner-product-single style-thumbs-position`
            //    Full product detail with gallery + info. Uses product-feature-zoom style-2-detail.
            Shortcode::generateShortcode('product-feature-zoom', [
                'style' => 'style-2-detail',
                'wrapper_style' => 'style-thumbs-position',
                'title' => 'Top Picks This Week',
                'subtitle' => 'Weekly Favorites Selected With Care To Support Your Wellbeing.',
                'product_id' => 1,
                'show_view_full' => 'yes',
            ]),

            // 11. Testimonials — `testimonial-v01 style-2 type-3`, 4 slides.
            //    HTML heading is "Loved By Happy Parents" (copy-paste from baby demo).
            Shortcode::generateShortcode('testimonials', [
                'style' => 'style-v2-product',
                'section_class' => '',
                'heading_container_class' => 'container-full',
                'card_type' => 'type-3',
                'title' => 'Loved By Happy Parents',
                'subtitle' => 'Real stories from moms and dads who trust us with their baby\'s care.',
                'autoplay' => 'yes',
                'quantity' => 4,
                'avatar_1' => $this->safeFilePath('testimonials/avatar-4.jpg'),
                'name_1' => 'Emma Collins',
                'role_1' => 'Verified Buyer',
                'rating_1' => 5,
                'content_1' => '"The baby onesies are incredibly soft, super cozy, and gentle on delicate skin my newborn sleeps so peacefully now!"',
                'product_image_1' => $this->safeFilePath('products/construction/product-1.jpg'),
                'product_name_1' => 'Gentle Comfort for Mess...',
                'product_price_1' => '$29.99',
                'product_url_1' => '/products',
                'avatar_2' => $this->safeFilePath('testimonials/avatar-5.jpg'),
                'name_2' => 'Michael Carter',
                'role_2' => 'Verified Buyer',
                'rating_2' => 5,
                'content_2' => '"Finally found bottles that don’t leak, clean easily, save time, and make feeding so much simpler. Total lifesaver for busy parents!"',
                'product_image_2' => $this->safeFilePath('products/construction/product-9.jpg'),
                'product_name_2' => 'Frigg Moon Natural...',
                'product_price_2' => '$69.99',
                'product_url_2' => '/products',
                'avatar_3' => $this->safeFilePath('testimonials/avatar-6.jpg'),
                'name_3' => 'Olivia Brooks',
                'role_3' => 'Verified Buyer',
                'rating_3' => 5,
                'content_3' => '"Everything feels carefully designed, beautifully made, and filled with genuine care. You can tell parents built this brand with heart."',
                'product_image_3' => $this->safeFilePath('products/construction/product-5.jpg'),
                'product_name_3' => 'Little Dine Wooden High...',
                'product_price_3' => '$69.99',
                'product_url_3' => '/products',
                'avatar_4' => $this->safeFilePath('testimonials/avatar-7.jpg'),
                'name_4' => 'Daniel Walker',
                'role_4' => 'Verified Buyer',
                'rating_4' => 5,
                'content_4' => '"Delivery was fast, packaging absolutely adorable, product quality truly amazing, every little detail felt genuinely cared for."',
                'product_image_4' => $this->safeFilePath('products/construction/product-6.jpg'),
                'product_name_4' => 'Activity Walk Behind...',
                'product_price_4' => '$69.99',
                'product_url_4' => '/products',
            ]),

            // 12. Blog — `flat-spacing` slider, 3 blog posts.
            //     HTML heading is "Insights For Happier Pets" (copy-paste from pet demo).
            Shortcode::generateShortcode('blog-posts', [
                'style' => 'style-slider',
                'section_class' => 'flat-spacing',
                'container_class' => 'container',
                'title' => 'Insights For Happier Pets',
                'subtitle' => 'Discover caring tips and daily inspiration for your furry friends.',
                'limit' => 3,
                'order_by' => 'oldest',
                'category_labels' => 'WOOD|CONSTRUCTION|PLUMBER',
                'heading_tag' => 'h4',
                'image_size' => '',
                'show_meta' => 'yes',
                'show_excerpt' => 'yes',
            ]),
        ]), ENT_NOQUOTES, 'UTF-8');
    }
}
