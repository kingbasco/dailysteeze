<?php

namespace Database\Seeders\Themes\HomeCosmetic;

use Botble\Shortcode\Facades\Shortcode;

/**
 * Home4 — Beauty & Cosmetics. Mirrors html/home-cosmetic.html section-for-section.
 * Audit: plans/reports/audit-260505-1957-home-cosmetic-demo.md
 *
 *   1. simple-slider          (style-1)            — Hero (3 slides "Reveal Your Timeless Beauty"...)
 *   2. infinity-marquee       (style-2)            — Policy strip (2 alternating shipping/returns)
 *   3. ecommerce-products     (style-slider)       — Find Your Perfect Match (Top Pick, 4 items)
 *   4. banner-duo             (default)            — 2-up: ULTIMATE MOISTURE + LIFE CHANGING LIP MASK
 *   5. lookbook-hotspot       (style-bundle-carousel-left) — Combo Collection (heading + carousel + banner)
 *   6. product-feature-zoom   (style-1)            — Hyggee Relief Chamomile Mist (vertical thumbs + zoom)
 *   7. banner-countdown       (style-3)            — Glow On Sale (full-bleed bg image)
 *   8. testimonials           (style-thumbs-product) — Customer Say! (image LEFT + content+product RIGHT)
 *   9. before-after-image     (style-default)      — Skin treatment compare slider
 *  10. blog-posts             (style-slider)       — Insights for a Better You
 *  11. site-features          (style-2)            — Box Icon (Easy Returns/Free Shipping/24/7/Member Perks)
 *  12. image-gallery          (style-default)      — Shop Our Insta Glow (gallery-27..31)
 */
class PageSeeder extends \Database\Seeders\Themes\Main\PageSeeder
{
    protected function getHomepageContent(): string
    {
        return htmlentities(implode(PHP_EOL, [
            // 1. Hero — mirrors html/home-cosmetic.html line 1365+:
            //   <div class="tf-slideshow tf-btn-swiper-main hover-sw-nav">
            //     ...
            //     <div class="sld_content pst-2">
            //   </div>
            //   ...
            //   <div class="sw-line-default style-2 tf-sw-pagination"></div>
            // hover-sw-nav reveals built-in arrows on hover; no external nav.
            Shortcode::generateShortcode('simple-slider', [
                'key' => 'home-hero',
                'style' => 'style-1',
                'is_autoplay' => 'yes',
                'autoplay_speed' => 3000,
                'show_arrows' => 'no',  // hover-only nav, no external buttons
                'show_dots' => 'yes',
                'pagination_class' => 'style-2',
                'content_position' => 'pst-2',
            ]),

            // 2. Policy strip — `infiniteSlide-policy style-2` with 2 alternating font-icon
            //    + policy-text uppercase items. Mirrors html/home-cosmetic.html lines 1462-1481.
            //    Uses `variant=policy-icon` (graduated 2026-05-08) — emits icon-Lightning-1 +
            //    `p.policy-text text-caption-02 lh-20 fw-semibold text-uppercase`. NO image.
            Shortcode::generateShortcode('infinity-marquee', [
                'style' => 'style-1',
                'variant' => 'policy-icon',
                'clone_count' => 3,
                'quantity' => 2,
                'heading_1' => 'Enjoy free shipping on orders above $20',
                'icon_class_1' => 'icon-Lightning-1',
                'heading_2' => 'Free returns within 14 days',
                'icon_class_2' => 'icon-Lightning-1',
                // Demo (line 1461) is a bare `infiniteSlide-policy style-2` — no
                // flat-spacing-3 wrapper, no bg. themesFlat = no-op (zero padding).
                'spacing_class' => 'themesFlat',
                'background_class' => '',
            ]),

            // 3. Find Your Perfect Match (Top Pick) — demo shows exactly 4 products
            Shortcode::generateShortcode('ecommerce-products', [
                'style' => 'style-slider',
                'title' => 'Find Your Perfect Match',
                'subtitle' => 'From glow boosting serums to timeless beauty must haves start your routine today.',
                'source' => 'best-seller',
                'limit' => 4,
                'items_per_row' => 4,
            ]),

            // 4-5. Two banner cards side-by-side. Mirrors demo's `tf-grid-layout md-col-2 gap-10`
            //      wrapping 2× `banner-image-text type-abs style-11 hover-img` (700x700 square,
            //      bottom-left white text overlay). One composite shortcode replaces the two
            //      stacked banner-image-text calls.
            Shortcode::generateShortcode('banner-duo', [
                'image_1' => $this->safeFilePath('section/banner-30.jpg'),
                'title_1' => 'ULTIMATE MOISTURE<br>CREAM DUO',
                'subtitle_1' => 'Nourish your skin with clinically proven hydration.',
                'button_text_1' => 'Shop Now',
                'button_url_1' => '/products',
                'image_2' => $this->safeFilePath('section/banner-31.jpg'),
                'title_2' => 'LIFE CHANGING<br>LIP MASK DUO',
                'subtitle_2' => 'Discover 2 hydrating lip masks with proven plump effect.',
                'button_text_2' => 'Shop Now',
                'button_url_2' => '/products',
            ]),

            // 6. Lookbook — Combo Collection. Mirrors demo's `section-lookbook-hover`:
            //    heading + 2-up product carousel LEFT, banner RIGHT with one pin overlay.
            Shortcode::generateShortcode('lookbook-hotspot', [
                'style' => 'style-bundle-carousel-left',
                'title' => 'Combo Collection',
                'subtitle' => 'Explore curated sets designed to blend trend and timeless elegance.',
                'button_text' => 'Buy At A Discount - $69.99',
                'button_url' => '/products',
                'image' => $this->safeFilePath('section/banner-lookbook-10.jpg') ?: $this->safeFilePath('section/banner-30.jpg'),
                'quantity' => 3,
                'x_percent_1' => 50, 'y_percent_1' => 50, 'product_id_1' => 1, 'column_1' => 1,
                'x_percent_2' => 50, 'y_percent_2' => 50, 'product_id_2' => 2, 'column_2' => 1,
                'x_percent_3' => 50, 'y_percent_3' => 50, 'product_id_3' => 3, 'column_3' => 1,
            ]),

            // 6. Banner Product Single — vertical thumbs LEFT + main swiper with zoom +
            //    full product detail panel RIGHT (category / name / stars+reviews /
            //    badge+urgency / price / size variants / qty / Add to cart + Buy It Now +
            //    View Full). Mirrors demo's `banner-product-single style-2 section-image-zoom`.
            Shortcode::generateShortcode('product-feature-zoom', [
                'style' => 'style-2-banner',
                'product_id' => 1,
                'featured_category' => 'Skin care',
                'featured_name' => 'Hyggee Relief Chamomile Mist',
                'featured_price' => 79.99,
                'featured_old_price' => 98.99,
                'featured_sale_percent' => 25,
                'reviews_count' => 134,
                'urgency_text' => 'Selling fast! 22 people have this in their carts.',
                'badge_text' => 'Best seller',
                'size_options' => '30ml|39.99,100ml|59.99',
                'default_size_index' => 1,
            ]),

            // 8. Banner Countdown — Glow On Sale (full-bleed banner-32.jpg bg)
            Shortcode::generateShortcode('banner-countdown', [
                'style' => 'style-3',
                'heading' => 'Glow On Sale. Your<br>Radiance Starts Here',
                'subheading' => 'Discover your perfect skincare ritual and save while it lasts.',
                'button_text' => 'Shop Now - $69.99',
                'button_url' => '/products',
                'background_image' => $this->safeFilePath('section/banner-32.jpg'),
                'target_date' => now()->addDays(9)->format('Y-m-d H:i'),
            ]),

            // 9. Customer Say! — `testimonial-v01 style-1 type-3 style-def` 2-up swiper:
            //    image LEFT (285x380) + content RIGHT + product mini-card (88x88).
            //    Mirrors html/home-cosmetic.html §8 (lines 2345-2415). Centered
            //    `sect-heading type-2` rendered by index.blade.php from title/subtitle.
            Shortcode::generateShortcode('testimonials', [
                'style' => 'style-v2-product',
                'card_type' => 'style-1-cosmetic',
                'title' => 'Customer Say!',
                'subtitle' => 'Our customers adore our products, and we constantly aim to delight them.',
                'autoplay' => 'yes',
                'limit' => 2,
                'testimonial_product_ids' => '5,6',
            ]),

            // 10. Before/After image compare — skin treatment results slider
            Shortcode::generateShortcode('before-after-image', [
                'style' => 'style-default',
                'before_image' => $this->safeFilePath('section/skin-before.jpg'),
                'after_image' => $this->safeFilePath('section/skin-after.jpg'),
                'before_label' => 'Before',
                'after_label' => 'After',
            ]),

            // 11. Blog — Insights for a Better You. Demo: 2 slides.
            Shortcode::generateShortcode('blog-posts', [
                'style' => 'style-slider',
                'title' => 'Insights for a Better You',
                'subtitle' => 'Explore mindful habits, wellness routines, and everyday calm.',
                'limit' => 4,
                'show_meta' => 'yes',
                'show_excerpt' => 'yes',
                // Demo (line 2475) is a 2-up slider, not the blade default 3-up.
                'data_preview' => 2,
            ]),

            // 11. Box Icon — site features. Demo uses `themesFlat` 4-up swiper with
            //     large black icons + line pagination (NO gray card wrapper). The
            //     custom `style-flat-swiper` partial mirrors that exactly.
            Shortcode::generateShortcode('site-features', [
                'style' => 'style-flat-swiper',
                // Demo (line 2526) is a bare `themesFlat` wrapper (no-op = zero
                // padding). Drop padding on BOTH the index <section> and the
                // style partial's inner div.
                'outer_section_class' => 'themesFlat',
                'section_class' => 'themesFlat',
                'quantity' => 4,
                'icon_class_1' => 'icon-ArrowUDownLeft',
                'title_1' => 'Easy Returns',
                'description_1' => 'Simple and hassle free returns.',
                'icon_class_2' => 'icon-Truck2',
                'title_2' => 'Free Shipping',
                'description_2' => 'Enjoy free delivery on all qualifying orders.',
                'icon_class_3' => 'icon-Headset',
                'title_3' => '24/7 Support',
                'description_3' => 'Beauty experts ready to help.',
                'icon_class_4' => 'icon-SealPercent',
                'title_4' => 'Exclusive Member Perks',
                'description_4' => 'Exclusive deals and early access.',
            ]),

            // 13. Shop Our Insta Glow — gallery-27..31 (cosmetic-themed)
            Shortcode::generateShortcode('image-gallery', [
                'style' => 'style-default',
                'title' => 'Shop Our Insta Glow',
                'subtitle' => 'Find clean beauty favorites loved by our online community.',
                'quantity' => 5,
                'image_1' => $this->safeFilePath('gallery/gallery-27.jpg'),
                'link_1' => '/products',
                'image_2' => $this->safeFilePath('gallery/gallery-28.jpg'),
                'link_2' => '/products',
                'image_3' => $this->safeFilePath('gallery/gallery-29.jpg'),
                'link_3' => '/products',
                'image_4' => $this->safeFilePath('gallery/gallery-30.jpg'),
                'link_4' => '/products',
                'image_5' => $this->safeFilePath('gallery/gallery-31.jpg'),
                'link_5' => '/products',
            ]),
        ]), ENT_NOQUOTES, 'UTF-8');
    }
}
