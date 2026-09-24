<?php

namespace Database\Seeders\Themes\HomeAuto;

use Botble\Shortcode\Facades\Shortcode;

/**
 * Home13 — Automotive Parts. Mirrors html/home-auto.html section-for-section.
 *
 *   1. simple-slider          (style-1)        — Hero ("Enhanced Traction for Every Drive")
 *   2. site-features          (style-1)        — Box Icon trust strip
 *   3a. banner-image-text     (style-abs-left) — "Power Your Drive" (banner-28.jpg)
 *   3b. banner-image-text     (style-abs-left) — "Built For The Road" (banner-22.jpg)
 *   4. categories-grid        (style-slider)   — Top Categories For You
 *   5. ecommerce-products     (style-auto-flash-sale) — Best Deals Of The Week!
 *   6. image-gallery          (style-auto-banner-trio) — Smooth Rides Start With Care
 *   7. ecommerce-products     (style-slider)   — Featured Products
 *   8. banner-image-text      (style-wide-abs) — Banner Sale wide promo
 *   9. ecommerce-products     (style-slider)   — Featured 2 / New Arrivals (matches demo §9 ordering)
 *  10. parallax-banner        (style-1)        — CTA ("Top Quality Auto Parts")
 *  11. blog-posts             (style-slider)   — Insights For Smarter Drives
 */
class PageSeeder extends \Database\Seeders\Themes\Main\PageSeeder
{
    protected function getHomepageContent(): string
    {
        return htmlentities(implode(PHP_EOL, [
            // 1. Hero — mirrors html/home-auto.html line 1418+:
            //   <section class="tf-slideshow tf-btn-swiper-main hover-sw-nav flat-spacing-3 pb-0">
            //     <div class="container">
            //       <div class="swiper ... slider_effect_fade radius-12" data-effect="fade" data-delay="3000">
            //         ...
            //       </div>
            //       <div class="sw-line-default style-2 pst-3 tf-sw-pagination"></div>
            //     </div>
            //   </section>
            // Slide content uses .sld_content type-2, .slideshow-wrap sm-has-ov.
            // No external arrow nav (hover-sw-nav reveals built-in Swiper buttons).
            Shortcode::generateShortcode('simple-slider', [
                'key' => 'home-hero',
                'style' => 'style-1',
                'is_autoplay' => 'yes',
                'autoplay_speed' => 3000,
                'show_arrows' => 'no',  // demo doesn't render external nav
                'show_dots' => 'yes',
                'wrapper_class' => 'flat-spacing-3 pb-0',
                'inner_class' => 'radius-12',
                'use_container' => 'yes',
                'pagination_class' => 'style-2 pst-3',
                'content_position' => 'type-2',
                'slideshow_extra' => 'sm-has-ov',
            ]),

            // 2. Box Icon trust strip
            Shortcode::generateShortcode('site-features', [
                'style' => 'style-1',
                'quantity' => 4,
                'icon_class_1' => 'icon-Truck',
                'title_1' => 'Free Shipping',
                'description_1' => 'Free shipping on orders over $99.',
                'icon_class_2' => 'icon-ArrowUDownLeft',
                'title_2' => '30-Day Returns',
                'description_2' => 'Risk-free returns within 30 days.',
                'icon_class_3' => 'icon-ShieldCheck',
                'title_3' => 'Authenticity Guaranteed',
                'description_3' => 'OEM-grade parts only.',
                'icon_class_4' => 'icon-Headset',
                'title_4' => '24/7 Support',
                'description_4' => 'Expert advice when you need it.',
            ]),

            // 3. Banner Image — mirrors html/home-auto.html two-card promo block.
            Shortcode::generateShortcode('image-gallery', [
                'style' => 'style-auto-promo-duo',
                'quantity' => 2,
                'image_1' => $this->safeFilePath('section/banner-28.jpg'),
                'link_1' => '/products',
                'title_1' => "Power Your\nDrive",
                'description_1' => 'Save Big on Performance Parts.',
                'button_text_1' => 'Shop Now',
                'image_2' => $this->safeFilePath('section/banner-22.jpg'),
                'link_2' => '/products',
                'title_2' => "Built For The\nRoad",
                'description_2' => 'Up to 40% Off Repair Tools.',
                'button_text_2' => 'Shop Now',
            ]),

            // 4. Top Categories For You
            Shortcode::generateShortcode('categories-grid', [
                'style' => 'style-auto-category-slider',
                'title' => 'Top Categories For You',
                'limit' => 6,
                'show_count' => 'no',
            ]),

            // 5. Best Deals Of The Week — demo heading/countdown + framed product carousel.
            Shortcode::generateShortcode('ecommerce-products', [
                'style' => 'style-auto-flash-sale',
                'title' => '',
                'custom_title' => 'Best Deals Of The Week!',
                'source' => 'sale',
                'limit' => 4,
                'items_per_row' => 4,
                'view_all_text' => 'View All Products',
                'view_all_url' => '/products',
                'countdown_timer' => 1093120,
            ]),

            // 6. Banner Image #2 — mirrors html/home-auto.html three overlay image cards.
            Shortcode::generateShortcode('image-gallery', [
                'style' => 'style-auto-banner-trio',
                'quantity' => 3,
                'image_1' => $this->safeFilePath('section/banner-23.jpg'),
                'link_1' => '/products',
                'title_1' => 'Smooth Rides Start With Care',
                'description_1' => 'Quality oil keeps engines young.',
                'button_text_1' => 'View More',
                'image_2' => $this->safeFilePath('section/banner-24.jpg'),
                'link_2' => '/products',
                'title_2' => "Save Your Vehicle\nShop Smarter.",
                'description_2' => 'Auto Parts for Peak Performance',
                'button_text_2' => 'View More',
                'image_3' => $this->safeFilePath('section/banner-25.jpg'),
                'link_3' => '/products',
                'title_3' => "Upgrade Your Ride\nwith Style",
                'description_3' => 'Smart accessories built for comfort.',
                'button_text_3' => 'View More',
            ]),

            // 7. Featured Products — category tabs load product sliders with AJAX.
            Shortcode::generateShortcode('ecommerce-products', [
                'style' => 'style-auto-featured-tabs',
                'title' => 'Featured Products',
                'subtitle' => 'Weekly Favorites Selected With Care To Support Your Wellbeing.',
                'source' => 'featured',
                'tab_labels' => 'Brake Pads|Air Filters|Brake Rotors|Brake Hydraulics',
                'tab_categories' => 'brake-pads|air-filters|brake-rotors|brake-hydraulics',
                'tab_sources' => 'latest|latest|latest|latest',
                'limit' => 10,
                'items_per_row' => 4,
            ]),

            // 8. Banner Sale — exact `banner-sale` composite (bg-percent + 35% + coupon).
            Shortcode::generateShortcode('banner-image-text', [
                'style' => 'style-auto-banner-sale',
                'discount' => '35%',
                'heading' => 'Super Discount For Your First Purchase',
                'subheading' => 'Use discount code in checkout page..',
                'coupon_code' => 'Amerce',
                'bg_image' => $this->safeFilePath('section/bg-percent.png'),
                'item_image' => $this->safeFilePath('item/graphic-item-2.png'),
            ]),

            // 9. Featured Products 2 — demo §9 heading is "Featured Products" (repeated), 6 cards.
            Shortcode::generateShortcode('ecommerce-products', [
                'style' => 'style-auto-mini-list-with-banner',
                'title' => 'Featured Products',
                'subtitle' => 'Best-selling treats, toys, and gear your furry friends will love.',
                'source' => 'latest',
                'limit' => 6,
                'items_per_row' => 3,
                'banner_image' => $this->safeFilePath('section/banner-26.jpg'),
                'banner_heading' => 'Save Up To 50%',
                'banner_subheading' => 'HURRY! SALE ENDS SOON',
                'banner_button_text' => 'Shop Now',
                'banner_button_url' => '/products',
            ]),

            // 10. Banner + Contact Form (demo §10).
            Shortcode::generateShortcode('banner-contact-form', [
                'title' => "Top Quality Auto Parts \n & Smart Accessories",
                'subtitle' => 'Discover Premium Parts to Enhance Performance.',
                'button_text' => 'Shop Now',
                'button_url' => '/products',
                'image' => $this->safeFilePath('section/banner-27.jpg'),
                'contact_title' => 'Contact Us',
                'contact_subtitle' => 'You can also call customer service on (+01) 1234 8888',
            ]),

            // 11. Insights For Smarter Drives
            Shortcode::generateShortcode('blog-posts', [
                'style' => 'style-list',
                'title' => 'Insights For Smarter Drives',
                'subtitle' => 'Discover expert tips, performance guides, and trends every car lover should know.',
                'limit' => 4,
                'show_meta' => 'yes',
                'show_excerpt' => 'yes',
            ]),
        ]), ENT_NOQUOTES, 'UTF-8');
    }
}
