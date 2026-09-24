<?php

namespace Database\Seeders\Themes\HomeSneaker;

use Botble\Shortcode\Facades\Shortcode;

/**
 * Home8 — Sneaker Shop. Mirrors html/home-sneaker.html section-for-section.
 *
 *   1. simple-slider          (style-1)        — Hero ("Move Smarter & Step Further")
 *   2. categories-grid        (style-slider)   — Category swiper
 *   3. ecommerce-products     (style-slider)   — Today's Best Choices
 *   4. ecommerce-collections  (style-slider)   — "BIG SEASON SALE — 50% OFF" banner row
 *   5. ecommerce-products     (style-slider)   — Featured Products
 *   6. parallax-banner        (style-1)        — Step Into Better Movement (Banner Step)
 *   7. banner-image-text      (style-3)        — Performance in Every Step (Feature)
 *   8. testimonials           (style-v2-product) — What Customers Are Saying
 *   9. blog-posts             (style-slider)   — Footwear Insights
 *  10. image-gallery          (style-default)  — Follow Us On Instagram
 */
class PageSeeder extends \Database\Seeders\Themes\Main\PageSeeder
{
    protected function getHomepageContent(): string
    {
        return htmlentities(implode(PHP_EOL, [
            // 1. Hero — html/home-sneaker.html: tf-slideshow tf-btn-swiper-main hover-sw-nav.
            Shortcode::generateShortcode('simple-slider', [
                'key' => 'home-hero',
                'style' => 'style-1',
                'is_autoplay' => 'yes',
                'autoplay_speed' => 5000,
                'show_arrows' => 'no',
                'show_dots' => 'yes',
            ]),

            // 2. Categories hover-list — demo home-sneaker.html lines 1500-1530:
            // `cate-list > wg-cate-text` with large grey text + count subscript;
            // hover reveals cate-image overlay next to text. Built new style-hover-list partial.
            Shortcode::generateShortcode('categories-grid', [
                'style' => 'style-hover-list',
                'limit' => 5,
                'show_count' => 'yes',
            ]),

            // 3. Today's Best Choices — demo home-sneaker.html L1556-1568:
            // `sect-heading has-col-right align-items-center` + title LEFT + "View More"
            // text-link RIGHT. Closest existing knob: title_align='left' + view_all_url
            // (renders `sect-heading type-2 has-col-right` with tf-btn-line-2 link).
            Shortcode::generateShortcode('ecommerce-products', [
                'style' => 'style-slider',
                'title' => 'Today\'s Best Choices',
                'subtitle' => 'Handpicked sport shoes trending right now.',
                'source' => 'best-seller',
                'limit' => 5,
                'items_per_row' => 4,
                'title_align' => 'left',
                'view_all_url' => '/products',
                'view_all_text' => 'View More',
            ]),

            // 4. BIG SEASON SALE — 2 large promo cards with text BELOW image (banner-duo-bottom).
            // Mirrors demo lines 2015-2080: `tf-grid-layout md-col-2 gap-10` + 2 `banner-image-text
            // style-bottom bt-center` cards. Card 1 = SALE OFF UP TO 50% (white bg, dark text);
            // Card 2 = BIG SEASON SALE (red/coral bg, white text).
            Shortcode::generateShortcode('banner-duo-bottom', [
                'image_1' => $this->safeFilePath('section/sneaker/banner-66.jpg'),
                'title_1' => 'SALE OFF UP TO 50%',
                'desc_1' => 'Grab top sport shoes at unbeatable deals — limited time.',
                'button_text_1' => 'Order Now',
                'button_url_1' => '/products',
                'bg_class_1' => 'bg-main',
                'text_class_1' => '',
                'image_2' => $this->safeFilePath('section/sneaker/banner-67.jpg'),
                'title_2' => 'BIG SEASON SALE',
                'desc_2' => 'Exclusive deals on top-style sneakers. Save more while stocks last.',
                'button_text_2' => 'Order Now',
                'button_url_2' => '/products',
                'bg_class_2' => 'bg-primary',
                'text_class_2' => 'text-white',
            ]),

            // 5. Featured Products — demo §5 (L2054+) mirrors §3 split-header layout.
            Shortcode::generateShortcode('ecommerce-products', [
                'style' => 'style-slider',
                'title' => 'Featured Products',
                'subtitle' => 'Top picks curated for your active lifestyle.',
                'source' => 'featured',
                'limit' => 5,
                'items_per_row' => 4,
                'title_align' => 'left',
                'view_all_url' => '/products',
                'view_all_text' => 'View More',
            ]),

            // 6. Step Into Better Movement — banner-step-feature composite (full-bleed bg + heading TOP +
            // 6 benefit pills LEFT + 2 product cards RIGHT). Mirrors home-sneaker.html §6 lines 2503-2670.
            Shortcode::generateShortcode('banner-step-feature', [
                'image' => $this->safeFilePath('section/sneaker/banner-68.jpg'),
                'heading' => 'Step Into Better <br>Movement',
                'benefit_1_icon' => 'icon-Wind',
                'benefit_1_name' => 'Breathable Comfort',
                'benefit_2_icon' => 'icon-Feather',
                'benefit_2_name' => 'Enhanced Cushioning',
                'benefit_3_icon' => 'icon-SneakerMove',
                'benefit_3_name' => 'Superior Traction',
                'benefit_4_icon' => 'icon-Exclude',
                'benefit_4_name' => 'Flexible Support',
                'benefit_5_icon' => 'icon-Sparkle',
                'benefit_5_name' => 'Lightweight Design',
                'benefit_6_icon' => 'icon-ShieldCheck',
                'benefit_6_name' => 'Durable Construction',
                'product_id_1' => 10,
                'product_id_2' => 11,
            ]),

            // 7. Performance in Every Step — feature-callout-quad composite (central exploded shoe
            // image + 4 feature callouts in 2x2). Mirrors home-sneaker.html §7 lines 2670-2740.
            Shortcode::generateShortcode('feature-callout-quad', [
                'title' => 'Performance in Every Step',
                'subtitle' => 'Designed for stability, comfort, and all day movement giving you balanced support and smooth <br class="d-none d-lg-block">performance from your first step to your last.',
                'image' => $this->safeFilePath('section/sneaker/feature-shoe.png'),
                'feature_1_icon' => 'icon-Wind',
                'feature_1_name' => 'Breathable Comfort',
                'feature_1_desc' => 'Soft, breathable fabrics deliver lasting comfort you can feel.',
                'feature_2_icon' => 'icon-Sparkle',
                'feature_2_name' => 'Superior Traction',
                'feature_2_desc' => 'Advanced outsole design delivers reliable grip on multiple surfaces.',
                'feature_3_icon' => 'icon-Exclude',
                'feature_3_name' => 'Flexible Support',
                'feature_3_desc' => 'Adaptive support provides stability while allowing natural movement.',
                'feature_4_icon' => 'icon-Feather',
                'feature_4_name' => 'Enhanced Cushioning',
                'feature_4_desc' => 'Soft cushioning absorbs impact for all-day comfort.',
            ]),

            // 8. Testimonials — `testimonial-v05` 2-up cards with image LEFT + content RIGHT
            // (mirrors demo lines 2750-2820 with Emma Roberts + Daniel Parker + tes-29/30.jpg).
            Shortcode::generateShortcode('testimonials', [
                'style' => 'style-card-image-left',
                'title' => 'What Customers Are Saying',
                'subtitle' => 'Honest reviews from real users who love our sport shoes.',
                'autoplay' => 'yes',
                'limit' => 2,
            ]),

            // 9. Footwear Insights blog slider
            Shortcode::generateShortcode('blog-posts', [
                'style' => 'style-slider',
                'title' => 'Footwear Insights',
                'subtitle' => 'Discover the latest trends, technology, and tips to choose the perfect pair for your lifestyle.',
                'limit' => 6,
                'show_meta' => 'yes',
                'show_excerpt' => 'yes',
            ]),

            // 10. Follow Us On Instagram
            Shortcode::generateShortcode('image-gallery', [
                'style' => 'style-default',
                'title' => 'Follow Us On Instagram',
                'subtitle' => '@Amerce',
                'quantity' => 5,
                'image_1' => $this->safeFilePath('gallery/sneaker/gallery-74.jpg'),
                'link_1' => '/products',
                'image_2' => $this->safeFilePath('gallery/sneaker/gallery-75.jpg'),
                'link_2' => '/products',
                'image_3' => $this->safeFilePath('gallery/sneaker/gallery-76.jpg'),
                'link_3' => '/products',
                'image_4' => $this->safeFilePath('gallery/sneaker/gallery-77.jpg'),
                'link_4' => '/products',
                'image_5' => $this->safeFilePath('gallery/sneaker/gallery-78.jpg'),
                'link_5' => '/products',
            ]),
        ]), ENT_NOQUOTES, 'UTF-8');
    }
}
