<?php

namespace Database\Seeders\Themes\HomeMental;

use Botble\Shortcode\Facades\Shortcode;

/**
 * Home18 — Mental Wellness. Mirrors html/home-mental.html section-for-section.
 *
 *   1. simple-slider          (style-1)             — Hero slideshow ("Nourish Your Body & Elevate Your Mind")
 *   2. categories-grid        (style-slider)        — Shop By Category swiper + "View All" CTA
 *   3. ecommerce-collections  (style-slider)        — 3-card box-image_v02 slider ("Rest Better"/"Nourish"/"Find Your Calm")
 *   4. ecommerce-products     (style-tabs)          — Top Picks This Week (4 tabs)
 *   5. banner-duo             —                       2-up banners (Nature's Support + Vaccines Keep You Strong)
 *   6. ecommerce-products     (style-mini-list)     — Featured Products (vertical compact cards)
 *   7. testimonials           (style-v2-product)    — Customer Say! (helper)
 *   8. banner-image-text      (style-wide-abs)      — Wide promo (type-abs style-14 type-2)
 *   9. blog-posts             (style-slider)        — Insights For A Better You
 *  10. site-features          (style-2)             — 4-icon trust strip
 */
class PageSeeder extends \Database\Seeders\Themes\Main\PageSeeder
{
    protected function getHomepageContent(): string
    {
        return htmlentities(implode(PHP_EOL, [
            // 1. Hero slideshow ("Nourish Your Body & Elevate Your Mind")
            // html/home-mental.html: tf-slideshow tf-btn-swiper-main hover-sw-nav (no external arrows).
            Shortcode::generateShortcode('simple-slider', [
                'key' => 'home-hero',
                'style' => 'style-1',
                'is_autoplay' => 'yes',
                'autoplay_speed' => 5000,
                'show_arrows' => 'no',
                'show_dots' => 'yes',
            ]),

            // 2. Shop By Category — mindful wellness categories swiper with
            //    "View All Category" CTA on the right (type-2 has-col-right heading).
            //    HTML uses category-v02 (rounded gray bg) cards with hover-img.
            Shortcode::generateShortcode('categories-grid', [
                'style' => 'style-slider',
                'title' => 'Shop By Category',
                'subtitle' => 'Mindful choices for everyday wellbeing.',
                'limit' => 6,
                'show_count' => 'yes',
                'view_all_url' => '/products',
                'view_all_text' => 'View All Category',
                'card_class' => 'category-v02',
                'card_modifier' => 'hover-img',
                'card_image_class' => 'img-style overflow-visible',
                'card_content_class' => 'text-center',
                'count_label' => 'products',
                'swiper_preview_lg' => 6,
                'swiper_space_lg' => 10,
                'wrapper_class' => 'container',
                'sale_card_active' => 'yes',
                'sale_card_discount' => '15%',
                'sale_card_label' => 'OFF',
                'sale_card_title' => 'Sale Off',
                'sale_card_count' => '52 Items',
                'sale_card_url' => '/products',
            ]),

            // 3. Collection — 3-card box-image_v02 slider (Rest Better / Nourish / Find Your Calm).
            //    Uses ecommerce-collections style-slider partial purpose-built for this layout
            //    (renders box-image_v02 with title/desc/View More CTA). Collection IDs 7,8,9
            //    are seeded with 'section' => true in ProductCollectionSeeder.
            Shortcode::generateShortcode('ecommerce-collections', [
                'style' => 'style-slider',
                'collection_ids' => '7,8,9',
                'limit' => 3,
                'spacing_class' => '',
            ]),

            // 4. Top Picks This Week — tabbed product slider (Medications / Devices /
            //    Wellness / Offers). Demo shows 16 product cards across 4 tabs.
            Shortcode::generateShortcode('ecommerce-products', [
                'style' => 'style-tabs',
                'title' => 'Top Picks This Week',
                'subtitle' => 'Weekly Favorites Selected With Care To Support Your Wellbeing.',
                'limit' => 8, // Per tab limit
                'items_per_row' => 4,
                'card_style' => 'style-1',
                'card_extra_class' => 'product-style_stroke',
                'tab_labels' => 'Medications|Devices|Wellness|Offers',
                'tab_categories' => $this->mentalTabCategories(),
                'tab_sources' => 'best-seller|featured|best-seller|sale',
                'tab_nav_style' => 'v2',
                'tab_nav_position' => 'right',
                'tab_nav_class_extra' => 'mb-0',
                'tab_btn_class_extra' => 'py-4',
                'tab_label_class' => 'fw-semibold',
                'load_tabs_ajax' => 'yes',
            ]),

            // 5. Collection — 2-up `banner-image-text type-abs style-1` cards side-by-side.
            //    Demo lines 3083-3120: Nature's Support (banner-4) + Vaccines Keep You Strong
            //    (banner-5). Uses banner-duo (graduated by cosmetic) — md-col-2 grid wrapper
            //    with 2 abs-overlay banner cards.
            Shortcode::generateShortcode('banner-duo', [
                'style' => 'style-1',
                'section_class' => 'flat-spacing-2 pt-0',
                'image_1' => $this->safeFilePath('section/banner-4.jpg'),
                'title_1' => "Nature's Support<br>for Modern Life",
                'subtitle_1' => 'Boost vitality and balance with clean, mindful ingredients.',
                'button_text_1' => 'Shop Styles',
                'button_url_1' => '/products',
                'image_2' => $this->safeFilePath('section/banner-5.jpg') ?: $this->safeFilePath('section/banner-3.jpg'),
                'title_2' => 'Vaccines Keep You<br>Strong & Ready',
                'subtitle_2' => 'Stay strong and balanced with vaccines that protect your daily health.',
                'button_text_2' => 'Shop Styles',
                'button_url_2' => '/products',
            ]),

            // 6. Brands — infinite logo strip. Mirrors home-mental.html line 3122-3140.
            Shortcode::generateShortcode('brand-logos', [
                'style' => 'style-infinite',
                'modifier_class' => '', // No style-2 border
                'section_class' => 'pt-0 pb-0', // Spacing handled by neighbor sections
                'clone_count' => 3,
            ]),

            // 6. Featured Products — demo shows 6 products in 2 columns flanking 2 banners.
            Shortcode::generateShortcode('ecommerce-products', [
                'style' => 'style-mini-list',
                'title' => 'Featured Products',
                'subtitle' => 'Top styles everyone\'s talking about.',
                'source' => 'featured',
                'limit' => 6,
                'items_per_row' => 3,
                'slides_per_view' => 3,
                'show_banners' => 'yes',
                'banner_image_1' => $this->safeFilePath('section/banner-6.jpg'),
                'banner_title_1' => 'Vitamins <br> Every Day',
                'banner_desc_1' => 'Discover calming products <br> for deeper, peaceful sleep.',
                'banner_image_2' => $this->safeFilePath('section/banner-7.jpg'),
                'banner_title_2' => 'Vitamins <br> Every Day',
                'banner_desc_2' => 'Discover calming products <br> for deeper, peaceful sleep.',
            ]),

            // 9. Testimonial — Customer Say! (no avatar image, just stars + product card)
            $this->mentalTestimonialsShortcode(),

            // 10. Wide promo banner ("Nature's Support For Modern Life") —
            //     type-abs style-14 type-2 (absolute content over wide image)
            Shortcode::generateShortcode('banner-image-text', [
                'style' => 'style-wide-abs',
                'heading' => 'Nature\'s Support <br class="d-none d-sm-block"> For Modern Life',
                'subheading' => 'Balanced nutrition made simple — support <br class="d-none d-sm-block"> your body and mind every single day.',
                'button_text' => 'Shop Styles',
                'button_url' => '/products',
                'image' => $this->safeFilePath('section/banner-8.jpg') ?: $this->safeFilePath('section/banner-6.jpg'),
            ]),

            // 11. Blog slider ("Insights For A Better You")
            Shortcode::generateShortcode('blog-posts', [
                'style' => 'style-slider',
                'title' => 'Insights For A Better You',
                'subtitle' => 'Explore mindful habits, wellness routines, and everyday calm.',
                'limit' => 6,
                'show_meta' => 'yes',
                'show_excerpt' => 'yes',
            ]),

            // 11. Site Features — trust strip with icons.
            Shortcode::generateShortcode('site-features', [
                'style' => 'style-flat-swiper',
                'card_modifier' => 'style-2',
                'title_tag' => 'h5',
                'section_class' => 'flat-spacing pt-0',
                'inner_class' => 'flat-spacing pb-0',
                'show_border' => 'yes',
                'quantity' => 4,
                'title_1' => '14-Day Returns',
                'description_1' => 'Risk-free shopping with easy returns.',
                'icon_class_1' => 'icon-ArrowUDownLeft',
                'title_2' => 'Free Shipping',
                'description_2' => 'No extra costs, just the price you see.',
                'icon_class_2' => 'icon-Package',
                'title_3' => '24/7 Support',
                'description_3' => '24/7 support, always here just for you.',
                'icon_class_3' => 'icon-Headset',
                'title_4' => 'Member Discounts',
                'description_4' => 'Special prices for our loyal customers.',
                'icon_class_4' => 'icon-SealPercent',
            ]),
        ]), ENT_NOQUOTES, 'UTF-8');
    }

    /**
     * Resolve the four Top Picks tab category groups (pipe-separated CSV)
     * from category names. Empty groups (like "Offers") rely on tab_sources
     * (e.g. `sale`) to filter products at query time.
     */
    private function mentalTabCategories(): string
    {
        $resolve = fn (array $names): string => $this->resolveCategoryIds($names);

        return implode('|', [
            $resolve(['Supplements']),                                // Medications
            $resolve(['Health Devices']),                             // Devices
            $resolve(['Sleep & Recovery', 'Relaxation', 'Mind Balance', 'Body Care']),
            '',                                                       // Offers — sale source, no category filter
        ]);
    }

    /**
     * Customer Say! testimonials specific to the wellness preset. Uses the
     * `style-v2-product` variant — no lifestyle/avatar image, just stars +
     * author + quote + product card row (mirrors home-mental.html line 3419).
     */
    protected function mentalTestimonialsShortcode(): string
    {
        return Shortcode::generateShortcode('testimonials', [
            'style' => 'style-v2-product',
            'title' => 'Customer Say!',
            'subtitle' => 'Our customers adore our products, and we constantly aim to delight them.',
            'autoplay' => 'yes',
            'quantity' => 2,
            'name_1' => 'Emma Collins',
            'role_1' => 'Verified Buyer',
            'rating_1' => 5,
            'content_1' => '"I love how calm and balanced I feel after using these products. Everything feels more natural, lighter, and easy again every day."',
            'product_image_1' => $this->safeFilePath('products/mental/product-1.jpg') ?: $this->safeFilePath('products/product-4.jpg'),
            'product_name_1' => 'Gaia Herbs Relax Gummies',
            'product_price_1' => '$74.99',
            'product_url_1' => '/products',
            'name_2' => 'Sophia Ramirez',
            'role_2' => 'Verified Buyer',
            'rating_2' => 5,
            'content_2' => '"These supplements have become part of my nightly routine. I sleep deeper, rest longer, wake up feeling genuinely refreshed every morning."',
            'product_image_2' => $this->safeFilePath('products/mental/product-3.jpg') ?: $this->safeFilePath('products/product-6.jpg'),
            'product_name_2' => 'Blooming Blends Sleep Drops',
            'product_price_2' => '$74.99',
            'product_url_2' => '/products',
        ]);
    }
}
