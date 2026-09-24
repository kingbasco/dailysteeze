<?php

namespace Database\Seeders\Themes\HomeHeadphone;

use Botble\Shortcode\Facades\Shortcode;

/**
 * Home9 — Audio Gear. Mirrors html/home-headphone.html section-for-section.
 * Trust strip ("Returns free within 14 days...") is a header policy bar in
 * the html, NOT a content shortcode — that's why no `site-features` is seeded.
 *
 *    1. simple-slider          (style-headphone)              — Hero ("Built For Motion, Ready For Life") + infiniteSlide-policy-v2 USP strip
 *    2. banner-image-text      (style-text-centered)          — Section About ("TRUE SOUND" overline + centered quote)
 *    3. ecommerce-products     (style-tabs)                   — Top Pick ("Explore The Collection") — 5 tabs + left promo banner
 *    4. ecommerce-collections  (style-banner-collection-v02)  — Section banner — 5-item mosaic (item-3 large)
 *    5. ecommerce-products     (style-slider)                 — Section Collection ("The Active Collection") — flush, no flat-spacing
 *    6. banner-image-text      (style-banner-v05)             — True Sound — clip-text headline + centered product image
 *    7. before-after-image     (style-2)                      — Banner Image View Compare — dual left/right captions, no drag labels
 *    8. product-feature-zoom   (style-2-banner)               — Banner Product Single ("MH40 Wireless") — banner_modifier style-4
 *    9. testimonials           (style-v01-banner)             — Section Testimonials — full-bleed tes-21.jpg banner + testimonial-v01 style-7
 *   10. blog-posts             (style-insights-split)         — Section Insights — 1 big left + 2 list right
 */
class PageSeeder extends \Database\Seeders\Themes\Main\PageSeeder
{
    protected function getHomepageContent(): string
    {
        return htmlentities(implode(PHP_EOL, [
            // 1. Hero — `tf-slideshow style-2 v2` center-mode + infiniteSlide-policy-v2 USP strip.
            //    Mirrors html/home-headphone.html lines 1281-1455.
            Shortcode::generateShortcode('simple-slider', [
                'key' => 'home-hero',
                'style' => 'style-headphone',
                'is_autoplay' => 'yes',
                'autoplay_speed' => 3000,
                'show_arrows' => 'yes',
                'show_dots' => 'yes',
                'usp_quantity' => 3,
                'usp_text_1' => 'Returns free within 14 days',
                'usp_image_1' => $this->safeFilePath('section/policy-9.jpg'),
                'usp_text_2' => 'Free shipping over $20.00',
                'usp_image_2' => $this->safeFilePath('section/policy-10.jpg'),
                'usp_text_3' => 'Returns free within 14 days',
                'usp_image_3' => $this->safeFilePath('section/policy-11.jpg'),
            ]),

            // 2. Section About — centered text-only callout (no image). Mirrors demo lines 1458-1474:
            // small red "TRUE SOUND" overline + large centered quote + black pill "Read About Us" CTA.
            Shortcode::generateShortcode('banner-image-text', [
                'style' => 'style-text-centered',
                'heading' => 'TRUE SOUND',
                'subheading' => '"There\'s nothing like experiencing Perfect Immersion. Amerce designs audio for a smarter world, offering clarity and connection that feels entirely authentic."',
                'button_text' => 'Read About Us',
                'button_url' => '/about',
            ]),

            // 3. Top Pick — `section-top-pick flat-animate-tab` > sect-heading type-2 has-col-right
            //    (title-left + `tab-btn-wrap-v2 style-3` tabs-right) > row: col-lg-3 promo banner
            //    + col-lg-9 data-preview=3 swiper. Mirrors demo lines 1476-1546.
            Shortcode::generateShortcode('ecommerce-products', [
                'style' => 'style-tabs',
                'title' => 'Explore The Collection',
                'subtitle' => 'Browse smart audio solutions, from ANC to active models.',
                'section_class' => 'section-top-pick flat-animate-tab',
                'tab_labels' => 'New|Popular|Sale|Gaming|Wireless',
                'tab_sources' => 'latest|best-seller|featured|best-seller|latest',
                'tab_nav_style' => 'v2',
                'tab_nav_class_extra' => 'style-3',
                'items_per_row' => 3,
                'limit' => 12,
                'left_banner_image' => $this->safeFilePath('section/banner-41.jpg'),
                'left_banner_title' => 'Peak Audio',
                'left_banner_desc' => 'Experience peak audio performance with this top Amerce collection.',
                'left_banner_button_text' => 'Shop Now',
                'left_banner_button_url' => '/products',
            ]),

            // 4. Section banner — `section-banner-collection-v02 flat-spacing` > container-full >
            //    wrap-banner 5-item mosaic (item-3 large). Mirrors demo lines 2546-2615.
            Shortcode::generateShortcode('ecommerce-collections', [
                'style' => 'style-banner-collection-v02',
                'collection_ids' => '1,2,3,4,5',
                'limit' => 5,
            ]),

            // 5. Section Collection — The Active Collection. Demo wrapper is a bare
            //    `<section class="">` (no flat-spacing) > centered sect-heading type-2 +
            //    data-preview=4 swiper. Mirrors demo lines 2617-2914.
            Shortcode::generateShortcode('ecommerce-products', [
                'style' => 'style-slider',
                'title' => 'The Active Collection',
                'subtitle' => 'Ideal companion for the gym, running, or daily commute.',
                'source' => 'featured',
                'limit' => 4,
                'items_per_row' => 4,
                'section_class' => 'ecommerce-products ecommerce-products--style-slider',
            ]),

            // 6. True Sound — `container flat-spacing` > col-lg-10 mx-auto > `banner-v05 text-center`:
            //    clip-text headline + centered product image + title + desc + animate-btn.
            //    Mirrors demo lines 2916-2945.
            Shortcode::generateShortcode('banner-image-text', [
                'style' => 'style-banner-v05',
                'clip_text' => 'True Sound',
                'heading' => "Smarter Sound, Deeper Immersion:\nTech, Comfort, Performance",
                'subheading' => "Explore our innovative range engineered for pristine audio clarity and ergonomic comfort.\nUpgrade how you listen with cutting-edge intelligent technology.",
                'button_text' => 'Shop Now',
                'button_url' => '/products',
                'image' => $this->safeFilePath('section/true-sound.png'),
            ]),

            // 7. Banner Image View Compare — `container-full` > `banner-image-compare style-2`:
            //    dual 1920x720 images + LEFT/RIGHT captions, no draggable handle, no labels.
            //    Mirrors demo lines 2947-2966.
            Shortcode::generateShortcode('before-after-image', [
                'style' => 'style-2',
                'before_image' => $this->safeFilePath('section/headphone-before.jpg'),
                'after_image' => $this->safeFilePath('section/headphone-after.jpg'),
                'left_heading' => 'For The Warm Souls',
                'left_desc' => 'Soft, natural, easy on the eyes.',
                'right_heading' => 'For The Bold Minds',
                'right_desc' => 'A crisp color that stands out effortlessly.',
            ]),

            // 8. Banner Product Single — `banner-product-single style-4 section-image-zoom
            //    flat-spacing` > container > row: col-xl-7 zoom gallery + col-xl-5 info panel.
            //    Mirrors demo lines 2969-3276 (banner_modifier => style-4).
            Shortcode::generateShortcode('product-feature-zoom', [
                'style' => 'style-2-banner',
                'banner_modifier' => 'style-4',
                'product_id' => 1,
                'featured_category' => 'Headphone',
                'featured_name' => 'MH40 Wireless',
                'reviews_count' => 134,
                'badge_text' => 'Best seller',
                'urgency_text' => 'Selling fast! 18 people have this in their carts.',
            ]),

            // 9. Section Testimonials — `container-full` > `section-testimonials position-relative` >
            //    full-bleed tes-21.jpg banner (1770x600) + wrap-tes swiper of testimonial-v01
            //    style-7 (centered stars + author + h4 quote + product mini-card).
            //    Mirrors demo lines 3277-3435. Testimonials from HomeHeadphone\TestimonialSeeder.
            Shortcode::generateShortcode('testimonials', [
                'style' => 'style-v01-banner',
                'banner_image' => $this->safeFilePath('section/tes-21.jpg'),
                'testimonial_product_ids' => '1,2,3',
                'autoplay' => 'yes',
                'limit' => 3,
            ]),

            // 10. Section Insights — `flat-spacing section-insights` > container > centered
            //     sect-heading type-2 + row: col-xl-6 one big article-blog style-2 +
            //     col-xl-6 two article-blog style-list list-v2. Mirrors demo lines 3437-3507.
            Shortcode::generateShortcode('blog-posts', [
                'style' => 'style-insights-split',
                'title' => 'Sound Insights & Stories',
                'subtitle' => 'Latest tech, reviews, and how-to guides. Dive in.',
                'section_class' => 'flat-spacing section-insights',
                'limit' => 3,
                // Oldest-first so posts 1-3 (ANC Tech / Earbuds Guide / Battery Tips,
                // images blog-25/26/27) render in demo order — post 1's blog-25.jpg
                // is the only hi-res blog image, needed for the big-left card.
                'order_by' => 'oldest',
                'show_meta' => 'yes',
                'show_excerpt' => 'yes',
            ]),
        ]), ENT_NOQUOTES, 'UTF-8');
    }
}
