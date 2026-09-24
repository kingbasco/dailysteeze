<?php

namespace Database\Seeders\Themes\HomePod;

use Botble\Shortcode\Facades\Shortcode;

/**
 * Home10 — Pods. Mirrors html/home-pod.html section-for-section.
 * Demo has no slide-show; opens with a 2-column banner pair acting as hero.
 *
 *   1. ecommerce-collections  (style-banner-grid) — Banner-pair hero ("Nourish Your Body" + 2nd)
 *   2. categories-grid        (style-slider)   — Category swiper
 *   3. ecommerce-products     (style-slider)   — Top Trending
 *   4. banner-countdown       (style-1)        — Banner Countdown
 *   5. lookbook-hotspot       (style-v2)       — Lookbook
 *   6. ecommerce-collections  (style-slider)   — Collection
 *   7. ecommerce-products     (style-tabs)     — Tab product
 *   8. banner-countdown       (style-1)        — "Save 25% — Up To 35% Off"
 *   9. testimonials           (style-v2-product) — Customer Say!
 *  10. site-features          (style-2)        — Box Icon
 *  11. image-gallery          (style-default)  — Gallery
 */
class PageSeeder extends \Database\Seeders\Themes\Main\PageSeeder
{
    protected function getHomepageContent(): string
    {
        return htmlentities(implode(PHP_EOL, [
            // 1. Slide Show — 2-up paired hero (themesFlat slider_effect_fade-md + banner-image-text type-abs style-3)
            // Mirrors html/home-pod.html lines 1298-1366 (Slide Show with text overlay per slide).
            Shortcode::generateShortcode('image-gallery', [
                'style' => 'style-paired-overlay',
                'quantity' => 2,
                'image_1' => $this->safeFilePath('section/banner-10.jpg'),
                'link_1' => '/products',
                'title_1' => 'Nourish Your Body',
                'description_1' => 'Discover wellness essentials packed with vitamins<br class="d-none d-sm-block">and nutrients to keep your body',
                'button_text_1' => 'Shop Styles',
                'image_2' => $this->safeFilePath('section/banner-11.jpg'),
                'link_2' => '/products',
                'title_2' => 'Nourish Your Body',
                'description_2' => 'Discover wellness essentials packed with vitamins<br class="d-none d-sm-block">and nutrients to keep your body',
                'button_text_2' => 'Shop Styles',
            ]),

            // 2. Category swiper — demo §2 (L1367): `mt-10 px-10` wrapper, `data-laptop=5
            // data-preview=4` swiper of plain `category-v03 hover-img4` cards (372x490, h6 name).
            Shortcode::generateShortcode('categories-grid', [
                'style' => 'style-card-vertical',
                'limit' => 9,
                'show_count' => 'no',
                'skip_section' => 'yes',
                'wrapper_class' => 'mt-10 px-10',
                'card_modifier' => 'hover-img4',
                'name_class' => 'h6 fw-medium link',
                'data_laptop' => 5,
                'data_preview' => 4,
                'image_height' => 490,
            ]),

            // 3. Top Trending — demo §3 (L1453): `data-preview=4 data-grid=2` 2-row swiper
            // of clean `card-product_wrapper square` cards. 8 products → 4x2 grid.
            Shortcode::generateShortcode('ecommerce-products', [
                'style' => 'style-slider',
                'title' => 'Top Trending',
                'subtitle' => 'Browse our Top Trending: the hottest picks loved by all.',
                'source' => 'best-seller',
                'limit' => 8,
                'items_per_row' => 4,
                'grid_rows' => 2,
                'product_wrapper_class' => 'square',
            ]),

            // 4. Banner Countdown — "Hurry! Deals On" (v01 bg-primary, html pos 4)
            Shortcode::generateShortcode('banner-countdown', [
                'style' => 'style-1',
                'background_class' => 'bg-primary',
                'container_class' => 'container-2',
                'heading' => 'Hurry! Deals On',
                'subheading' => 'Up to 50% Off Selected Styles. Don\'t Miss Out.',
                'button_text' => 'Shop Now',
                'button_url' => '/products',
                'target_date' => now()->addDays(13)->format('Y-m-d H:i'),
            ]),

            // 5. Lookbook — demo §5 (L2052): bare `themesFlat` 2-up swiper of two
            // `banner-lookbook wrap-lookbook_hover` banners (960x600). Banner 1 has
            // 2 preset-position pins, banner 2 has 1 — split by `column` (1 vs 2).
            Shortcode::generateShortcode('lookbook-hotspot', [
                'style' => 'style-swiper-banners',
                'image' => $this->safeFilePath('section/banner-lookbook-3.jpg') ?: $this->safeFilePath('section/banner-1.jpg'),
                'image_2' => $this->safeFilePath('section/banner-lookbook-4.jpg') ?: $this->safeFilePath('section/banner-2.jpg'),
                'quantity' => 3,
                'x_percent_1' => 35, 'y_percent_1' => 40, 'product_id_1' => 1, 'column_1' => 1,
                'x_percent_2' => 65, 'y_percent_2' => 55, 'product_id_2' => 2, 'column_2' => 1,
                'x_percent_3' => 45, 'y_percent_3' => 65, 'product_id_3' => 3, 'column_3' => 2,
            ]),

            // 6. Collection — 1+2+2 grid (1 hero portrait + 4 small cards) per demo §6.
            // First collection = hero (Save 25% Today portrait); next 4 = small box-image_v03 cards.
            Shortcode::generateShortcode('ecommerce-collections', [
                'style' => 'style-banner-grid-quad',
                'collection_ids' => '4,5,6,7,8',
                'limit' => 5,
            ]),

            // 7. Tab product — demo §7 (L2236): `tab-btn-wrap-v1 style-2
            // justify-content-sm-center` large centered heading tabs (span h3 fw-medium),
            // 4-up swiper of clean `card-product_wrapper square` cards across 3 tabs.
            Shortcode::generateShortcode('ecommerce-products', [
                'style' => 'style-tabs',
                'title' => '',
                'subtitle' => '',
                'limit' => 12,
                'items_per_row' => 4,
                // Demo §7 wrapper is `flat-spacing pt-0` — hugs the Collection section above.
                'section_class' => 'ecommerce-products ecommerce-products--style-tabs flat-spacing pt-0',
                'tab_nav_style' => 'v1',
                'tab_nav_class_extra' => 'style-2 justify-content-sm-center',
                'tab_label_class' => 'h3 fw-medium',
                'product_wrapper_class' => 'square',
                'tab_labels' => 'What\'s Hot?|Best Sellers|Just Arrivals',
                'tab_categories' => '||',
                'tab_sources' => 'featured|best-seller|latest',
            ]),

            // 8. "Up To 50% Off Christmas" Banner Countdown — v02 3-col layout (image LEFT + center text + image RIGHT)
            Shortcode::generateShortcode('banner-countdown', [
                'style' => 'style-2',
                'heading' => 'Up To 50% Off Christmas. Limited Time Only!',
                'subheading' => 'Hurry! Holiday Deals On',
                'button_text' => 'Shop Now',
                'button_url' => '/products',
                'background_image' => $this->safeFilePath('section/banner-13.jpg'),
                'background_image_2' => $this->safeFilePath('section/banner-14.jpg'),
                'target_date' => now()->addDays(9)->format('Y-m-d H:i'),
            ]),

            // 9. Customer Say! — demo §9 (L3158): `testimonial-v01 style-1 type-2`
            // 2-up swiper, LEFT photo (285x380) + content + product mini-card.
            // Themed via HomePod\TestimonialSeeder (Emma Collins, Sophia Ramirez).
            // testimonial_product_ids pairs item[0]=Emma → product 2 (Dinosaur Theme
            // Mug), item[1]=Sophia → product 5 (Photo Candle).
            Shortcode::generateShortcode('testimonials', [
                'style' => 'style-v2-product',
                'card_type' => 'style-1-pod',
                'title' => 'Customer Say!',
                'subtitle' => 'Our customers adore our products, and we constantly aim to delight them.',
                'autoplay' => 'yes',
                'limit' => 6,
                'testimonial_product_ids' => '2,5',
            ]),

            // 10. Box Icon — demo wants box-icon_V01 style-2 4-up swiper (site-features style-1)
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

            // 11. Gallery — demo §11 (L3400): bare `mb-10 px-10` wrapper, `data-laptop=6
            // data-preview=5` swiper of `gallery-item` cards (274x274). gallery-6..10 art.
            Shortcode::generateShortcode('image-gallery', [
                'style' => 'style-default',
                'wrapper_class' => 'mb-10 px-10',
                'skip_spacing' => 'yes',
                'data_laptop' => 6,
                'quantity' => 6,
                'image_1' => $this->safeFilePath('gallery/gallery-6.jpg'),
                'link_1' => '/products',
                'image_2' => $this->safeFilePath('gallery/gallery-7.jpg'),
                'link_2' => '/products',
                'image_3' => $this->safeFilePath('gallery/gallery-8.jpg'),
                'link_3' => '/products',
                'image_4' => $this->safeFilePath('gallery/gallery-9.jpg'),
                'link_4' => '/products',
                'image_5' => $this->safeFilePath('gallery/gallery-10.jpg'),
                'link_5' => '/products',
                'image_6' => $this->safeFilePath('gallery/gallery-11.jpg'),
                'link_6' => '/products',
            ]),
        ]), ENT_NOQUOTES, 'UTF-8');
    }
}
