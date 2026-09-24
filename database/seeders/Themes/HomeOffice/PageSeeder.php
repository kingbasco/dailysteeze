<?php

namespace Database\Seeders\Themes\HomeOffice;

use Botble\Shortcode\Facades\Shortcode;

/**
 * Home19 — Office Equipment. Mirrors html/home-office-equipment.html
 * section-for-section (CDP visual-parity verified 2026-05-15).
 *
 *   1. simple-slider      (style-1)         — Hero ("Boost Your Work Flow")          [demo L1253]
 *   2. categories-grid    (style-slider)    — 8-tile category-v02 style-3 swiper      [demo L1388]
 *   3. ecommerce-products (style-slider)    — Popular Products, 4-up                  [demo L1522]
 *   4. lookbook-hotspot   (style-banner-3)  — single-image workstation lookbook       [demo L1824]
 *   5. banner-image-text  (style-feature)   — "Future Mouse Technology" feature spread [demo L1910]
 *   6. ecommerce-products (style-tabs/v4)   — Best Sellers, left vertical icon tabs    [demo L2041]
 *   7. parallax-banner    (style-3)         — "Perfectly Balanced Work Kit" banner-v04 [demo L3649]
 *   8. blog-posts         (style-slider)    — News Insight, 3-up                       [demo L3677]
 *   9. image-gallery      (style-default)   — Shop Instagram, 7-tile swiper            [demo L3775]
 */
class PageSeeder extends \Database\Seeders\Themes\Main\PageSeeder
{
    protected function getHomepageContent(): string
    {
        return htmlentities(implode(PHP_EOL, [
            // 1. Hero — demo `tf-slideshow tf-btn-swiper-main mt-20` center/peek slider:
            //    radius-16 slides, fractional data-preview with a peek of the next
            //    slide, visible nav arrows, `sld_content top-50`, no `hover-sw-nav`.
            Shortcode::generateShortcode('simple-slider', [
                'key' => 'home-hero',
                'style' => 'style-1',
                'is_autoplay' => 'yes',
                'autoplay_speed' => 3000,
                'show_arrows' => 'yes',
                'show_dots' => 'yes',
                'wrapper_class' => 'mt-20',
                'content_position' => 'top-50',
                'center_mode' => 'yes',
                'image_radius_class' => 'radius-16',
                'hide_hover_nav' => 'yes',
                'nav_arrow_class' => 'tf-sw-nav-2 style-3 style-large text-white d-lg-flex d-none',
                'nav_arrow_icon_prev' => 'icon-ArrowLeft',
                'nav_arrow_icon_next' => 'icon-ArrowRight',
                'nav_action_class' => 'pst-2',
                'nav_wrap_class' => 'gr-nav_wrap d-flex align-items-center justify-content-between',
            ]),

            // 2. Shop the Workspace — 8-tile `category-v02 style-3` swiper.
            //    Demo: <section class="flat-spacing-3 pb-0"> > container-full >
            //    swiper data-preview=6 data-laptop=8. Card counts are demo marketing
            //    numbers, not real DB counts.
            Shortcode::generateShortcode('categories-grid', [
                'style' => 'style-slider',
                'limit' => 8,
                'show_count' => 'yes',
                'card_class' => 'category-v02',
                'card_extra_modifier' => 'style-3',
                'card_modifier' => 'hover-img',
                'card_image_class' => 'img-style',
                'card_name_class' => 'h6',
                'card_content_class' => 'text-center',
                'wrapper_class' => 'container-full',
                'swiper_preview' => 6,
                'swiper_preview_lg' => 8,
                'spacing_class' => 'flat-spacing-3 pb-0',
                'count_label' => 'items',
                'count_overrides' => '28,26,16,21,13,18,27,27',
            ]),

            // 3. Popular Products — demo shows 4 product cards (style-1 marquee cards
            //    via product_card_default_style theme option).
            Shortcode::generateShortcode('ecommerce-products', [
                'style' => 'style-slider',
                'title' => 'Popular Products',
                'subtitle' => 'These are the most popular and hottest products on the market right now.',
                'source' => 'best-seller',
                'limit' => 4,
                'items_per_row' => 4,
            ]),

            // 4. Lookbook — single full-width `banner-lookbook style-3` image with 3
            //    fixed-position shoppable pins (demo `position19/20/21`).
            Shortcode::generateShortcode('lookbook-hotspot', [
                'style' => 'style-banner-3',
                'image' => $this->safeFilePath('section/banner-lookbook-13.jpg'),
                'quantity' => 3,
                'product_id_1' => 7, 'x_percent_1' => 30, 'y_percent_1' => 40,
                'product_id_2' => 3, 'x_percent_2' => 65, 'y_percent_2' => 35,
                'product_id_3' => 9, 'x_percent_3' => 45, 'y_percent_3' => 60,
            ]),

            // 5. Feature — "Future Mouse Technology" centered-heading spread with a
            //    square product shot ringed by 4 feature callouts (demo `section-feature`).
            Shortcode::generateShortcode('banner-image-text', [
                'style' => 'style-feature',
                'heading' => 'Future Mouse Technology',
                'subheading' => 'With its Silent Switch technology and simple design, users can hold and use it for a long time without wrist or finger fatigue, and can comfortably click without worrying about noise',
                'image' => $this->safeFilePath('section/feature-tech.jpg'),
                // Icons are the demo's line-art illustrations, extracted from the
                // inline SVGs in html/home-office-equipment.html §5 as PNGs.
                'feature_1_name' => 'Scroll Wheel',
                'feature_1_desc' => 'The electrically assisted Scroll Wheel helps the user scroll without much force',
                'feature_1_icon' => $this->safeFilePath('section/office-feature-icons/feature-icon-1.png'),
                'feature_2_name' => 'Optional Buttons',
                'feature_2_desc' => 'Personalize button functions according to your habits and preferences.',
                'feature_2_icon' => $this->safeFilePath('section/office-feature-icons/feature-icon-2.png'),
                'feature_3_name' => 'DPI Settings',
                'feature_3_desc' => 'Adjusting the sensitivity of the computer mouse allows you to change the speed at which the cursor moves on the screen.',
                'feature_3_icon' => $this->safeFilePath('section/office-feature-icons/feature-icon-3.png'),
                'feature_3_icon_size' => 40,
                'feature_4_name' => 'Modern LED',
                'feature_4_desc' => 'The LED color range can be changed in a separate application for this mouse.',
                'feature_4_icon' => $this->safeFilePath('section/office-feature-icons/feature-icon-4.png'),
            ]),

            // 6. Best Sellers — `grid-cls-v4` LEFT vertical icon tabs (5 tabs).
            //    Demo: <section class="bg-main flat-spacing flat-animate-tab mx-15
            //    mx-xl-20 radius-20"> > container-full full-v2; each tab swiper is 3-up.
            Shortcode::generateShortcode('ecommerce-products', [
                'style' => 'style-tabs',
                'title' => 'Best Sellers',
                'subtitle' => 'Best-selling products are categorized into different sections.',
                'limit' => 20,
                'items_per_row' => 4,
                'tab_nav_style' => 'v4',
                'section_class' => 'ecommerce-products ecommerce-products--style-tabs bg-main flat-spacing flat-animate-tab mx-15 mx-xl-20 radius-20',
                'container_class' => 'container-full full-v2',
                'tab_labels' => 'Desks|Chairs|Monitor Arms|Mouses & Keyboards|Accessories',
                'tab_categories' => $this->officeTabCategories(),
                'tab_sources' => 'best-seller|best-seller|best-seller|best-seller|best-seller',
                'tab_icons' => $this->officeTabIcons(),
            ]),

            // 7. Banner — container-width `banner-v04 parallaxie` promo.
            Shortcode::generateShortcode('parallax-banner', [
                'style' => 'style-3',
                'heading' => 'The Perfectly Balanced Work Kit',
                'subheading' => 'Boost efficiency, reduce strain, and work smarter',
                'button_text' => 'Shop Now',
                'button_url' => '/products',
                'image' => $this->safeFilePath('section/banner-65.jpg'),
            ]),

            // 8. Blog — News Insight slider, 3-up (demo data-preview=3, 3 posts).
            Shortcode::generateShortcode('blog-posts', [
                'style' => 'style-slider',
                'title' => 'News Insight',
                'subtitle' => 'The latest news on styles, products, and setups.',
                'limit' => 3,
                'data_preview' => 3,
                'show_meta' => 'yes',
                'show_excerpt' => 'yes',
            ]),

            // 9. Gallery — Shop Instagram swiper. Demo wrapper is a bare `px-20 mb-20`
            //    section (no flat-spacing); 7 office gallery tiles.
            Shortcode::generateShortcode('image-gallery', [
                'style' => 'style-default',
                'title' => 'Shop Instagram',
                'subtitle' => 'Connect with us on all platforms to get new information about products',
                'quantity' => 7,
                'skip_spacing' => 'yes',
                'extra_section_class' => 'px-20 mb-20',
                'image_1' => $this->safeFilePath('gallery/office/gallery-67.jpg'),
                'link_1' => '/products',
                'image_2' => $this->safeFilePath('gallery/office/gallery-68.jpg'),
                'link_2' => '/products',
                'image_3' => $this->safeFilePath('gallery/office/gallery-69.jpg'),
                'link_3' => '/products',
                'image_4' => $this->safeFilePath('gallery/office/gallery-70.jpg'),
                'link_4' => '/products',
                'image_5' => $this->safeFilePath('gallery/office/gallery-71.jpg'),
                'link_5' => '/products',
                'image_6' => $this->safeFilePath('gallery/office/gallery-72.jpg'),
                'link_6' => '/products',
                'image_7' => $this->safeFilePath('gallery/office/gallery-73.jpg'),
                'link_7' => '/products',
            ]),
        ]), ENT_NOQUOTES, 'UTF-8');
    }

    /**
     * Resolve the five Best Sellers tab category groups (pipe-separated CSV)
     * from category names. The fourth tab combines Mouses + Keyboards.
     */
    private function officeTabCategories(): string
    {
        return implode('|', [
            $this->resolveCategoryIds(['Desks']),
            $this->resolveCategoryIds(['Chairs']),
            $this->resolveCategoryIds(['Monitor Arms']),
            $this->resolveCategoryIds(['Mouses', 'Keyboards']),
            $this->resolveCategoryIds(['Accessories']),
        ]);
    }

    /**
     * Pipe-separated icon image paths for the five Best Sellers tabs — the
     * `tab-btn-wrap-v4` vertical nav renders an icon image above each label.
     * Mirrors html/home-office-equipment.html category/png/cate-13..17.png.
     */
    private function officeTabIcons(): string
    {
        return implode('|', array_filter([
            $this->safeFilePath('categories/png/cate-13.png'),
            $this->safeFilePath('categories/png/cate-14.png'),
            $this->safeFilePath('categories/png/cate-15.png'),
            $this->safeFilePath('categories/png/cate-16.png'),
            $this->safeFilePath('categories/png/cate-17.png'),
        ]));
    }
}
