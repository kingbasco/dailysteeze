<?php

namespace Database\Seeders\Themes\HomeOrganic;

use Botble\Shortcode\Facades\Shortcode;

/**
 * Home5 — Organic & Grocery. Mirrors html/home-organic.html section-for-section.
 *
 *   1. simple-slider              (style-1)               — Hero ("Organic Greens for a Healthier You")
 *   2. categories-grid            (style-slider-circle)   — Category swiper (5 circular discs)
 *   3. banner-products-composite  (style-organic)         — Customer Favorites (banner LEFT col-4 + 6-product 3x2 grid RIGHT)
 *   4. countdown-banner-quad      (composite)             — Countdown LEFT + 4 banners (1+2+2 grid)
 *   5. ecommerce-products         (style-slider)          — Popular Product / "Nature's New Finds" overline
 *   6. product-feature-zoom       (style-2-detail s-3)    — Banner Product Single (Wunder Workshop, vertical thumbs zoom)
 *   7. testimonials               (style-organic-verified)— Loved By Our Customers (3 lifestyle, Verified + product mini-card)
 *   8. image-gallery              (style-default)         — Follow Us On Instagram (gallery-32..36)
 */
class PageSeeder extends \Database\Seeders\Themes\Main\PageSeeder
{
    protected function getHomepageContent(): string
    {
        return htmlentities(implode(PHP_EOL, [
            // 1. Hero
            // Hero — html/home-organic.html: tf-slideshow tf-btn-swiper-main hover-sw-nav.
            Shortcode::generateShortcode('simple-slider', [
                'key' => 'home-hero',
                'style' => 'style-1',
                'is_autoplay' => 'yes',
                'autoplay_speed' => 5000,
                'show_arrows' => 'no',
                'show_dots' => 'yes',
            ]),

            // 2. Category swiper — circular discs (category-v02 rounded-circle), matches demo lines 1383-1463.
            Shortcode::generateShortcode('categories-grid', [
                'style' => 'style-slider-circle',
                'limit' => 5,
                'show_count' => 'yes',
            ]),

            // 3. Customer Favorites — composite: heading + "View All Products" CTA + portrait banner
            // (banner-33.jpg) LEFT (col-lg-4) + 6-product 3x2 grid RIGHT (col-lg-8). Mirrors
            // html/home-organic.html lines 1469-1932 (`section-banner-favorite`).
            Shortcode::generateShortcode('banner-products-composite', [
                'style' => 'style-organic',
                'title' => 'Customer Favorites',
                'subtitle' => 'OUR BESTSELLERS',
                'image' => $this->safeFilePath('section/organic/banner-33.jpg'),
                'banner_subtitle' => 'Naturally sweet and full of flavor.',
                'banner_heading' => 'Crispy Organic Apple Rings',
                'banner_button_text' => 'Shop Now',
                'banner_button_url' => '/products',
                'view_all_url' => '/products',
                'view_all_text' => 'View All Products',
                'source' => 'best-seller',
                'limit' => 6,
            ]),

            // 4. Countdown + 4 banners in 1+2+2 grid (countdown-banner-quad composite).
            // Mirrors html/home-organic.html lines 1935-2030: countdown card LEFT
            // (col 1) + 2 banner-image-text cards stacked in col 2 + 2 stacked in col 3.
            Shortcode::generateShortcode('countdown-banner-quad', [
                // Demo §4 (L1934-2028) has NO section wrapper — bare `<div class="tf-grid-layout…">`.
                // Pass empty `outer_spacing_class` to skip the default `flat-spacing pt-0` padding.
                'outer_spacing_class' => '',
                'countdown_image' => $this->safeFilePath('section/organic/banner-38.jpg'),
                'countdown_heading' => 'Grand Opening Sale',
                'countdown_subheading' => 'Up to 30% off all organic products!',
                'target_date' => now()->addDays(13)->format('Y-m-d H:i'),
                'countdown_button_text' => 'Shop Now',
                'countdown_button_url' => '/products',
                // Col 2 — banners 1 (Seasonal Fruits) + 2 (Organic Coffee)
                'banner_1_image' => $this->safeFilePath('section/organic/banner-34.jpg'),
                'banner_1_overline' => 'Up to 25% off',
                'banner_1_title' => 'Seasonal Fruits Offer',
                'banner_1_button_text' => 'Shop Now',
                'banner_1_button_url' => '/products',
                'banner_2_image' => $this->safeFilePath('section/organic/banner-35.jpg'),
                'banner_2_overline' => 'Most Loved Picks',
                'banner_2_title' => 'Organic Coffee Blend',
                'banner_2_button_text' => 'Shop Now',
                'banner_2_button_url' => '/products',
                // Col 3 — banners 3 (Fresh Veggies) + 4 (Healthy Starts)
                'banner_3_image' => $this->safeFilePath('section/organic/banner-36.jpg'),
                'banner_3_overline' => 'Top Organic Choices',
                'banner_3_title' => 'Fresh Veggies Deal',
                'banner_3_button_text' => 'Shop Now',
                'banner_3_button_url' => '/products',
                'banner_4_image' => $this->safeFilePath('section/organic/banner-37.jpg'),
                'banner_4_overline' => 'Most Loved Picks',
                'banner_4_title' => 'Healthy Starts Here',
                'banner_4_button_text' => 'Shop Now',
                'banner_4_button_url' => '/products',
            ]),

            // 5. Popular Product / "Nature's New Finds" overline. Demo shows 4 product cards.
            //    Demo inverts vs preset 1 convention: title = "Popular Product" (h2 big),
            //    subtitle = "Nature's New Finds" (small overline).
            //    Matches html/home-organic.html lines 2030-2055.
            Shortcode::generateShortcode('ecommerce-products', [
                'style' => 'style-slider',
                'title' => 'Popular Product',
                'subtitle' => 'Nature\'s New Finds',
                'source' => 'featured',
                'limit' => 4,
                'items_per_row' => 4,
                // Demo §5 (L2032-2048): `sect-heading type-2 has-col-right` — eyebrow
                // ABOVE title + "View All Products" CTA RIGHT.
                'title_align' => 'left',
                'subtitle_position' => 'above',
                'view_all_url' => '/products',
                'view_all_text' => 'View All Products',
            ]),

            // 6. Banner Product Single — vertical thumbs + zoom + product detail panel.
            // Mirrors html/home-organic.html lines 2341-2510 (`banner-product-single style-3
            // section-image-zoom`). Reuses preset 4's style-2-detail partial with `wrapper_style=style-3`
            // attr override + `section_bg=bg-main`. Targets product 3 = Wunder Workshop Superior Chaga.
            Shortcode::generateShortcode('product-feature-zoom', [
                'style' => 'style-2-detail',
                // Demo §6 (L2340-2508): `flat-spacing bg-main` outer + `banner-product-single
                // style-3 section-image-zoom` inner with `container-2`, vertical thumb slider,
                // Best seller pill, Buy It Now + wishlist/compare action boxes.
                'wrapper_style' => 'style-3',
                'section_bg' => 'bg-main',
                'container_class' => 'container-2',
                'show_thumb_slider' => 'yes',
                'show_buy_it_now' => 'yes',
                'show_action_boxes' => 'yes',
                'show_view_full' => 'yes',
                'product_id' => 3,
                'detail_tag' => 'Organic',
                'reviews_count' => 134,
                'urgency_text' => 'Selling fast! 22 people have this in their carts.',
                'badge_text' => 'Best seller',
                'size_options' => '40g|79.99,100g|119.99',
                'default_size_index' => 0,
            ]),

            // 7. Testimonials — Loved By Our Customers. New `style-organic-verified` partial mirrors
            // demo's `testimonial-v01 style-def style-4 type-2` (image TOP + 5★ + content +
            // author + Verified checkmark + 60x60 product mini-card with name + price).
            Shortcode::generateShortcode('testimonials', [
                'style' => 'style-organic-verified',
                'title' => 'Loved By Our Customers',
                'subtitle' => 'Real stories from people who trust and love our organic products every day.',
                'autoplay' => 'yes',
                'limit' => 3,
                // Demo §7 (L2511): `<div class="container-2">` — wider than default `container`.
                'heading_container_class' => 'container-2',
                'container_class' => 'container-2',
            ]),

            // 8. Follow Us On Instagram
            // Demo §8 (L2651) wraps gallery in `<section class="themesFlat">` — a no-op
            // class meaning ZERO vertical padding. `skip_spacing='yes'` drops `flat-spacing`.
            Shortcode::generateShortcode('image-gallery', [
                'style' => 'style-default',
                'title' => 'Follow Us On Instagram',
                'subtitle' => '@Amerce',
                'skip_spacing' => 'yes',
                'quantity' => 5,
                'image_1' => $this->safeFilePath('gallery/organic/gallery-32.jpg'),
                'link_1' => '/products',
                'image_2' => $this->safeFilePath('gallery/organic/gallery-33.jpg'),
                'link_2' => '/products',
                'image_3' => $this->safeFilePath('gallery/organic/gallery-34.jpg'),
                'link_3' => '/products',
                'image_4' => $this->safeFilePath('gallery/organic/gallery-35.jpg'),
                'link_4' => '/products',
                'image_5' => $this->safeFilePath('gallery/organic/gallery-36.jpg'),
                'link_5' => '/products',
            ]),
        ]), ENT_NOQUOTES, 'UTF-8');
    }
}
