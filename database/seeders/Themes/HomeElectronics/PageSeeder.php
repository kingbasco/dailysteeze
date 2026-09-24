<?php

namespace Database\Seeders\Themes\HomeElectronics;

use Botble\Shortcode\Facades\Shortcode;

/**
 * Home2 — Electronics Hub. Mirrors html/home-electronics.html.
 * Demo has no slide-show; opens with Category swiper.
 *
 *   1. categories-grid        (style-slider)        — 8 cats
 *   2. ecommerce-collections  (style-banner-grid)   — Hear True Freedom hero LEFT + Desktop Sound + Smart Watch RIGHT
 *   3. ecommerce-collections  (style-cards-3)       — Table Lamp Sale / Hear Every Detail (2 cards)
 *   4. ecommerce-products     (style-tabs)          — Best Sellers Products (4 category tabs)
 *   5. banner-thumbs-product  (style-1)             — Thoughtfully Crafted Tech (existing partial geared for jewelry — flagged)
 *   6. ecommerce-products     (style-slider)        — Personalize Your Own Gear Bundle (no bundle widget — flagged)
 *   7. banner-image-text      (style-2)             — Precision at Your Fingertips
 *   8. testimonials           (style-thumbs)        — What Our Customers Say
 *   9. blog-posts             (style-slider)        — Insights For A Better You (limit 3)
 *  10. faq-list               (style-default)       — FAQ
 *  11. site-features          (style-2)             — 4 service boxes
 */
class PageSeeder extends \Database\Seeders\Themes\Main\PageSeeder
{
    protected function getHomepageContent(): string
    {
        // HomeElectronics HTML uses these six visible tab labels. Some names do
        // not exist as seeded categories, so those tabs intentionally fall back
        // to the shortcode's best-seller product source.
        $bestSellerCategoryIds = implode('|', ['Headphone', 'Mouse', 'Keyboard', 'Mousepad', 'Cable', 'Networking']);

        return htmlentities(implode(PHP_EOL, [
            // 1. Category swiper (8 categories) — demo's category-v02 style-3 hover-img layout
            //    (centered 100x100 icon image + name + items count, 8 cards on laptop, line pagination).
            Shortcode::generateShortcode('categories-grid', [
                'style' => 'style-slider-icon',
                'limit' => 8,
                'show_count' => 'yes',
                'spacing_class' => 'py-30',
            ]),

            // 2. Collection banner-split: hero LEFT + 2 stacked v04 cards RIGHT.
            //    Demo's banner-image-text type-abs style-14 (h1 white overlay) + 2 box-image_v04.
            Shortcode::generateShortcode('ecommerce-collections', [
                'style' => 'style-banner-split-v04',
                'collection_ids' => '1,2,3',
                'limit' => 3,
            ]),

            // 3. Collection 2-up horizontal cards (box-image_v04): Table Lamp Sale + Hear Every Detail
            Shortcode::generateShortcode('ecommerce-collections', [
                'style' => 'style-2-up-horizontal',
                'collection_ids' => '4,5',
                'limit' => 2,
            ]),

            // 4. Best Sellers Products — tabbed by category. Demo shows 24 cards across 4 tabs.
            //    Demo: 6 tabs with v3 slash-separated nav + "View All Products" CTA.
            Shortcode::generateShortcode('ecommerce-products', [
                'style' => 'style-tabs',
                'section_class' => 'ecommerce-products ecommerce-products--style-tabs flat-spacing pt-0',
                'title' => 'Best Sellers Products',
                'source' => 'best-seller',
                'limit' => 24,
                'items_per_row' => 4,
                'tab_labels' => 'Headphone|Mouse|Keyboard|Mousepad|Cables|Networking',
                'tab_categories' => $bestSellerCategoryIds,
                'tab_sources' => 'best-seller|best-seller|best-seller|best-seller|best-seller|best-seller',
                'tab_nav_style' => 'v3',
                'tab_nav_position' => 'under-title',
                'product_wrapper_class' => 'square',
                'load_tabs_ajax' => 'yes',
                'view_all_url' => '/products',
                'view_all_text' => 'View All Products',
            ]),

            // 5. Product Thumbs — "Thoughtfully Crafted Tech"
            //    Uses the new style-thumbs-grid partial: 4 lifestyle thumb buttons LEFT +
            //    swiper of wg-thumb-v1 slides RIGHT (lifestyle bg + overlay product card).
            //    cls-13..16.jpg are the demo's thumb/lifestyle pair (same image used both as
            //    LEFT thumb button and RIGHT slide background).
            Shortcode::generateShortcode('banner-thumbs-product', [
                'style' => 'style-thumbs-grid',
                'heading' => 'Thoughtfully Crafted Tech<br>For Modern Living',
                'subheading' => 'Discover innovative essentials packed with smart features.',
                'button_text' => 'View All Products',
                'button_url' => '/products',
                'product_ids' => '1,2,3,4',
                'thumb_1' => $this->safeFilePath('collection/cls-13.jpg'),
                'thumb_2' => $this->safeFilePath('collection/cls-14.jpg'),
                'thumb_3' => $this->safeFilePath('collection/cls-15.jpg'),
                'thumb_4' => $this->safeFilePath('collection/cls-16.jpg'),
            ]),

            // 6. Gear Bundle — paired-products slider LEFT + sticky bundle save widget RIGHT.
            //    New `gear-bundle` shortcode (functions/shortcodes.php) renders the demo's exact
            //    section-gear-bundle markup. Slider products = 6 products (paired in 3 slides);
            //    bundle widget shows 3 products as a pre-filled cart with subtotal + CTA.
            Shortcode::generateShortcode('gear-bundle', [
                'title' => 'Personalize Your Own Gear Bundle',
                'subtitle' => 'Mindful choices for everyday wellbeing.',
                'view_all_url' => '/products',
                'view_all_text' => 'View All Products',
                'product_ids' => '5,8,6,9,7,10',
                'bundle_caption' => 'Buy 3 products and save up to 30%',
                'bundle_progress' => 50,
                'bundle_product_ids' => '5,7,8',
                'bundle_button_text' => 'Add To Cart',
                'bundle_button_url' => '/cart',
            ]),

            // 7. Banner — "Precision at Your Fingertips" (full-width abs overlay matching demo §7).
            Shortcode::generateShortcode('banner-image-text', [
                'style' => 'style-abs-2',
                'heading' => 'Precision at Your Fingertips',
                'subheading' => 'Unleash Speed, Accuracy, and Control for the Ultimate Gaming Edge!',
                'button_text' => 'Shop Now',
                'button_url' => '/products',
                'image' => $this->safeFilePath('section/banner-9.jpg'),
            ]),

            // 8. Testimonials — two-col layout: lifestyle thumbs LEFT + testimonial card RIGHT.
            //    Demo §8 has NO heading; partial suppresses heading for style-thumbs-product.
            //    Title/subtitle still seeded for admin-form continuity but won't render.
            Shortcode::generateShortcode('testimonials', [
                'style' => 'style-thumbs-product',
                'autoplay' => 'yes',
                'limit' => 3,
            ]),

            // 9. Insights For A Better You blog (3 posts to match demo)
            Shortcode::generateShortcode('blog-posts', [
                'style' => 'style-slider',
                'title' => 'Insights For A Better You',
                'subtitle' => 'Explore mindful habits, wellness routines, and everyday calm.',
                'limit' => 3,
                'show_meta' => 'yes',
                'show_excerpt' => 'yes',
            ]),

            // 10. FAQ — two-col layout: heading + CTA LEFT, accordion RIGHT (style-side-cta).
            Shortcode::generateShortcode('faq-list', [
                'style' => 'style-side-cta',
                'title' => 'Have A Question? <br> We Are Here To Help.',
                'subtitle' => 'Check out the most common questions our customers asked. Still have questions?',
                'button_text' => 'Shop Now',
                'button_url' => '/products',
                'limit' => 5,
            ]),

            // 11. Box Icon — 4 service callouts in 4-up swiper (demo's box-icon_V01 + tf-swiper preview=4)
            //     style-1 partial already uses the demo's swiper markup; style-2 was a Bootstrap
            //     3-up grid that wrapped the 4th item to a new row.
            Shortcode::generateShortcode('site-features', [
                'style' => 'style-1',
                'quantity' => 4,
                'icon_class_1' => 'icon-ArrowUDownLeft',
                'title_1' => '14-Day Returns',
                'description_1' => 'Risk-free shopping with easy returns.',
                'icon_class_2' => 'icon-Package',
                'title_2' => 'Free Shipping',
                'description_2' => 'No extra costs, just the price you see.',
                'icon_class_3' => 'icon-Headset',
                'title_3' => '24/7 Support',
                'description_3' => 'Always here just for you.',
                'icon_class_4' => 'icon-SealPercent',
                'title_4' => 'Member Discounts',
                'description_4' => 'Special prices for our loyal customers.',
            ]),
        ]), ENT_NOQUOTES, 'UTF-8');
    }
}
