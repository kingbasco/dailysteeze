<?php

namespace Database\Seeders\Themes\HomeBaby;

use Botble\Shortcode\Facades\Shortcode;

/**
 * Home11 — Baby Products. Mirrors html/home-baby.html section-for-section.
 *
 *   1. simple-slider          (style-baby)              — Hero (slideshow-2 single-column w/ decorative graphic overlay)
 *   2. infinity-marquee       (style-1, variant=policy) — Return Shipping policy strip (flat-spacing + .container, no bg)
 *   3. categories-grid        (style-slider-wide-image) — Shop By Categories
 *   4. ecommerce-products     (style-tabs)              — This Week's Highlights (5 tabs, 4x2 grid, no marquee)
 *   5. image-gallery          (style-paired-banner-side) — Banner promo (Little Joys / Fresh Finds)
 *   6. ecommerce-products     (style-banner-carousel-side) — Parent & Baby Favorites (banner LEFT col-4 + 3x2 swiper RIGHT)
 *   7. lookbook-hotspot       (style-bundle-slider)     — Bundle (2-up swiper of hotspotted banners)
 *   8. testimonials           (style-v2-product, type-2) — Loved By Happy Parents (4-up, has-col-right heading)
 *   9. blog-posts             (style-slider)            — Stories For Modern Parents
 *  10. image-gallery          (style-default)           — Shop Instagram
 */
class PageSeeder extends \Database\Seeders\Themes\Main\PageSeeder
{
    protected function getHomepageContent(): string
    {
        return htmlentities(implode(PHP_EOL, [
            // 1. Hero — slideshow-2 single-column w/ decorative graphic overlay.
            //    Mirrors html/home-baby.html lines 1478-1592.
            Shortcode::generateShortcode('simple-slider', [
                'key' => 'home-hero',
                'style' => 'style-baby',
                'is_autoplay' => 'yes',
                'autoplay_speed' => 3000,
                'show_arrows' => 'no',
                'show_dots' => 'yes',
                'wrapper_class' => 'pt-30 p-xl-0',
                'text_color' => 'white',
                'button_style' => 'pill-white',
            ]),

            // 2. Return Shipping — `infiniteSlide-policy` policy strip.
            //    Mirrors html/home-baby.html lines 1594-1622: `<div class="flat-spacing">
            //    <div class="container"><div class="infiniteSlide-policy">` — taller
            //    `flat-spacing` block, wrapped in `.container`, on a plain white bg.
            Shortcode::generateShortcode('infinity-marquee', [
                'style' => 'style-1',
                'variant' => 'policy',
                'background_class' => '',
                'spacing_class' => 'flat-spacing',
                'use_container' => 'yes',
                'clone_count' => 3,
                'quantity' => 4,
                'heading_1' => 'Free shipping on all orders over $20.00',
                'image_1' => $this->safeFilePath('section/policy-1.jpg'),
                'heading_2' => 'Returns are free within 14 days',
                'image_2' => $this->safeFilePath('section/policy-2.jpg'),
                'heading_3' => 'Free shipping on all orders over $20.00',
                'image_3' => $this->safeFilePath('section/policy-3.jpg'),
                'heading_4' => 'Returns are free within 14 days',
                'image_4' => $this->safeFilePath('section/policy-4.jpg'),
            ]),

            // 3. Shop By Categories — `themesFlat` section (no flat-spacing block),
            //    single `type-2` centered heading (rendered by index.blade.php).
            Shortcode::generateShortcode('categories-grid', [
                'style' => 'style-slider-wide-image',
                'spacing_class' => 'themesFlat',
                'title' => 'Shop By Categories',
                'subtitle' => 'Explore trusted essentials to comfort and nurture your little one.',
                'limit' => 8,
                'show_count' => 'yes',
            ]),

            // 4. This Week's Highlights — tabbed 4x2 grid (demo uses curly apostrophe).
            //    Demo §4: `sect-heading type-2 has-col-right` w/ `tab-btn-wrap-v2 style-2`
            //    tabs on the right, swiper `data-preview="4" data-grid="2"`, action-rich
            //    `square` cards. Five tabs: New / Popular / Sale / Baby / Kids.
            Shortcode::generateShortcode('ecommerce-products', [
                'style' => 'style-tabs',
                'title' => 'This Week’s Highlights',
                'subtitle' => 'Discover our most-loved baby essentials picked for comfort, safety, and style.',
                'source' => 'latest',
                'limit' => 8,
                'items_per_row' => 4,
                'tab_labels' => 'New|Popular|Sale|Baby|Kids',
                'tab_sources' => 'latest|best-seller|sale|featured|latest',
                'tab_nav_class_extra' => 'style-2',
                'grid_rows' => 2,
                'product_wrapper_class' => 'square',
            ]),

            // 5. Banner promo — demo §5 themesFlat 2-up swiper of `banner-image-text style-5 hover-img`.
            Shortcode::generateShortcode('image-gallery', [
                'style' => 'style-paired-banner-side',
                'quantity' => 2,
                'image_1' => $this->safeFilePath('section/banner-19.jpg'),
                'link_1' => '/products',
                'title_1' => 'Little Joys, Big Savings!',
                'description_1' => 'Up to 50% OFF on baby must-haves',
                'button_text_1' => 'View All Products',
                'image_2' => $this->safeFilePath('section/banner-20.jpg'),
                'link_2' => '/products',
                'title_2' => 'Fresh Finds for Little Smiles',
                'description_2' => 'Soft, safe, and ready for every cuddle.',
                'button_text_2' => 'Explore Now',
            ]),

            // 6. Parent & Baby Favorites — banner LEFT (col-lg-4, `banner-image-text type-abs
            //    style-6`, 450x830 portrait) + product swiper RIGHT (col-lg-8, data-preview=3
            //    data-grid=2). Mirrors html/home-baby.html lines 4696-5184.
            Shortcode::generateShortcode('ecommerce-products', [
                'style' => 'style-banner-carousel-side',
                'title' => '',
                'subtitle' => '',
                'custom_title' => 'Parent & Baby Favorites',
                'custom_subtitle' => 'Discover the softest, most-loved essentials for your little world.',
                'view_all_url' => '/products',
                'view_all_text' => 'View All Products',
                'banner_image' => $this->safeFilePath('section/banner-21.jpg'),
                'banner_subheading' => 'LOVE IN EVERY LITTLE DETAIL',
                'banner_heading' => 'Comfort And Care For Your Baby',
                'banner_button_text' => 'View All Products',
                'banner_button_url' => '/products',
                'source' => 'featured',
                'limit' => 6,
                'items_per_row' => 2,
            ]),

            // 7. The Ultimate Baby Bundle — `style-bundle-slider`: centered `type-2` heading
            //    above a 2-up swiper of hotspotted banner slides. Hotspots grouped by
            //    `column` into slides; x/y from styles.css `.banner-lookbook .position4`
            //    (32.5%, 61.2%) and `.position5` (61.7%, 51.8%). Lines 5185-5323.
            Shortcode::generateShortcode('lookbook-hotspot', [
                'style' => 'style-bundle-slider',
                'title' => 'The Ultimate Baby Bundle',
                'subtitle' => 'A handpicked collection of premium baby must-haves for comfort, quality.',
                'image' => $this->safeFilePath('section/banner-lookbook-6.jpg') ?: $this->safeFilePath('section/banner-1.jpg'),
                'image_2' => $this->safeFilePath('section/banner-lookbook-7.jpg') ?: $this->safeFilePath('section/banner-2.jpg'),
                'quantity' => 4,
                'x_percent_1' => 32.5, 'y_percent_1' => 61.2, 'product_id_1' => 1, 'column_1' => 1,
                'x_percent_2' => 61.7, 'y_percent_2' => 51.8, 'product_id_2' => 9, 'column_2' => 1,
                'x_percent_3' => 32.5, 'y_percent_3' => 61.2, 'product_id_3' => 2, 'column_3' => 2,
                'x_percent_4' => 61.7, 'y_percent_4' => 51.8, 'product_id_4' => 10, 'column_4' => 2,
            ]),

            // 8. Loved By Happy Parents — `testimonials style-v2-product` card_type=type-2:
            //    4-up swiper of `testimonial-v01 style-2 type-2` cards, `has-col-right`
            //    heading with a "View All Products" CTA. Baby-themed seed data comes from
            //    HomeBaby\TestimonialSeeder; product mini-cards wired via testimonial_product_ids
            //    (render order Emma, Michael, Olivia, Daniel). Lines 5324-5531.
            Shortcode::generateShortcode('testimonials', [
                'style' => 'style-v2-product',
                'card_type' => 'type-2',
                'title' => 'Loved By Happy Parents',
                'subtitle' => 'Real stories from moms and dads who trust us with their baby\'s care.',
                'autoplay' => 'yes',
                'limit' => 4,
                'view_all_url' => '/products',
                'view_all_text' => 'View All Products',
                'testimonial_product_ids' => '1,9,10,3',
            ]),

            // 9. Stories For Modern Parents
            Shortcode::generateShortcode('blog-posts', [
                'style' => 'style-slider',
                'title' => 'Stories For Modern Parents',
                'subtitle' => 'Thoughtful ideas and everyday inspiration for raising happy little ones.',
                'limit' => 6,
                'show_meta' => 'yes',
                'show_excerpt' => 'yes',
            ]),

            // 10. Shop Instagram — gallery 5-up swiper (demo §10, bare `themesFlat`
            //     section with no vertical padding).
            Shortcode::generateShortcode('image-gallery', [
                'style' => 'style-default',
                'skip_spacing' => 'yes',
                'title' => 'Shop Instagram',
                'subtitle' => 'Elevate your wardrobe with fresh finds today!',
                'quantity' => 5,
                'image_1' => $this->safeFilePath('gallery/gallery-17.jpg'),
                'link_1' => '/products',
                'image_2' => $this->safeFilePath('gallery/gallery-18.jpg'),
                'link_2' => '/products',
                'image_3' => $this->safeFilePath('gallery/gallery-19.jpg'),
                'link_3' => '/products',
                'image_4' => $this->safeFilePath('gallery/gallery-20.jpg'),
                'link_4' => '/products',
                'image_5' => $this->safeFilePath('gallery/gallery-21.jpg'),
                'link_5' => '/products',
            ]),
        ]), ENT_NOQUOTES, 'UTF-8');
    }
}
