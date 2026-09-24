<?php

namespace Database\Seeders\Themes\HomeGarden;

use Botble\Shortcode\Facades\Shortcode;

/**
 * Home17 — Garden & Outdoor. Mirrors html/home-garden.html section-for-section.
 *
 *   1. simple-slider          (style-3)                  — Hero ("Find Quiet With Plants") split panel
 *   2. ecommerce-products     (style-grid-with-banner)   — Best-Selling Plants + inline left banner
 *   3. banner-image-text      (style-section-cls-v02)    — Indoor Plant Picks 4-card composite
 *   4. ecommerce-products     (style-slider)             — Trending Green Finds
 *   5. banner-image-text      (style-plant-care-spotlight) — Plant Care, Elevated for Home
 *   6. banner-image-text      (style-banner-v02)         — Parallax promo banner
 *   7. testimonials           (style-v3-image)           — What Our Customers Say (image-first card)
 *   8. banner-thumbs-product  (style-1)                  — Banner Product Single
 *   9. blog-posts             (style-slider)             — Guides, Tips & Inspiration
 *  10. site-features          (style-2)                  — Box Icon
 *  11. image-gallery          (style-default)            — Gallery
 */
class PageSeeder extends \Database\Seeders\Themes\Main\PageSeeder
{
    protected function getHomepageContent(): string
    {
        return htmlentities(implode(PHP_EOL, [
            // 1. Hero — split-panel layout (dark green panel + image), mirrors
            //    html/home-garden.html lines 1572-1687 (slideshow-3 / slider-wrap_4).
            Shortcode::generateShortcode('simple-slider', [
                'key' => 'home-hero',
                'style' => 'style-3',
                'is_autoplay' => 'yes',
                'autoplay_speed' => 5000,
                'show_arrows' => 'no',
                'show_dots' => 'yes',
            ]),

            // 2. Best-Selling Plants — composite (banner-48 left + 6 product cards in
            //    2-col grid). Mirrors html/home-garden.html lines 1688-2080. The custom
            //    heading + col-right "View All Products" link is rendered by the variant
            //    itself (suppressed here by leaving title/subtitle empty so the shared
            //    index does not also render its centered heading).
            Shortcode::generateShortcode('ecommerce-products', [
                'style' => 'style-grid-with-banner',
                'title' => '',
                'subtitle' => '',
                'custom_title' => 'Best-Selling Plants',
                'custom_subtitle' => 'A selection of our most-loved indoor plants and essentials.',
                'view_all_text' => 'View All Products',
                'view_all_url' => '/products',
                'banner_image' => $this->safeFilePath('section/banner-48.jpg'),
                'banner_heading' => "Discover Your\nNew Green",
                'banner_subheading' => 'Handpicked selections perfect for modern homes',
                'banner_button_text' => 'Shop now',
                'banner_button_url' => '/products',
                'source' => 'best-seller',
                'limit' => 6,
                'card_style' => 'style-1',
                'card_extra_class' => 'text-center align-items-center',
                'product_wrapper_class' => 'square',
            ]),

            // 3. Indoor Plant Picks — 4-card composite (1 tall left + 2 small top-right
            //    + 1 wide bottom-right). Mirrors html/home-garden.html lines 2082-2167
            //    (`section-banner-cls-v02`).
            Shortcode::generateShortcode('banner-image-text', [
                'style' => 'style-section-cls-v02',
                'left_image' => $this->safeFilePath('section/banner-49.jpg'),
                'left_heading' => 'Indoor Plant Picks',
                'left_subheading' => 'Lush, easy-care varieties for every corner',
                'left_button_text' => 'Shop Now',
                'left_button_url' => '/products',
                'top1_image' => $this->safeFilePath('section/banner-50.jpg'),
                'top1_heading' => 'Modern Plant Pots',
                'top1_subheading' => 'Up to 50% Off Bestsellers.',
                'top1_button_text' => 'Shop Now',
                'top1_button_url' => '/products',
                'top2_image' => $this->safeFilePath('section/banner-51.jpg'),
                'top2_heading' => 'Simple Plant Tools',
                'top2_subheading' => 'Practical gear for simple',
                'top2_button_text' => 'Shop Now',
                'top2_button_url' => '/products',
                'bottom_image' => $this->safeFilePath('section/banner-52.jpg'),
                'bottom_heading' => 'Home Green Decor',
                'bottom_subheading' => 'Natural accents to refresh spaces.',
                'bottom_button_text' => 'Shop Now',
                'bottom_button_url' => '/products',
            ]),

            // 4. Trending Green Finds — demo shows 7 product cards with side-nav heading
            Shortcode::generateShortcode('ecommerce-products', [
                'style' => 'style-slider',
                'title' => 'Trending Green Finds',
                'subtitle' => 'Popular choices that bring freshness and character to any room.',
                'title_align' => 'side-nav',
                'source' => 'featured',
                'limit' => 8,
                'items_per_row' => 4,
                'card_style' => 'style-1',
                'card_extra_class' => 'text-center align-items-center',
                'product_wrapper_class' => 'square',
            ]),

            // 5. Plant Care, Elevated for Home — 2-up product spotlight pair under
            //    centered section heading. Mirrors html/home-garden.html lines 2624-2700:
            //    `<div class="sect-heading type-2 text-center"><h3>...</h3><p>...</p></div>` +
            //    `<div class="row gap-x-40"><div class="col-lg-6">.plan-care-item hover-img4 ips-1`
            //    pair with image + title + description + "Buy now - $XX.XX" CTA per cell.
            Shortcode::generateShortcode('banner-image-text', [
                'style' => 'style-plant-care-spotlight',
                'heading' => 'Plant Care, Elevated for Home',
                'subheading' => 'Thoughtfully designed supplies that simplify nurturing your indoor greenery.',
                'button_text' => 'Buy now',
                'image_1' => $this->safeFilePath('section/plan-item-1.jpg') ?: $this->safeFilePath('section/banner-49.jpg'),
                'title_1' => 'Daily Plant Nutrient Care',
                'desc_1' => 'This liquid blend enriches soil, balances pH, boosts plant health, and blends easily with watering.',
                'price_1' => '$12.00',
                'link_1' => '/products',
                'image_2' => $this->safeFilePath('section/plan-item-2.jpg') ?: $this->safeFilePath('section/banner-49.jpg'),
                'title_2' => 'Simple Pot Watering Aid',
                'desc_2' => 'A simple attachable tool that delivers hydration, making watering smoother and more consistent overall.',
                'price_2' => '$18.00',
                'link_2' => '/products',
            ]),

            // 6. Banner promo wide — `banner-v02 parallaxie` with full-bleed bg image.
            //    Mirrors html/home-garden.html lines 2691-2714.
            Shortcode::generateShortcode('banner-image-text', [
                'style' => 'style-banner-v02',
                'heading' => "Nurture A Home Filled With\nCalm Green Beauty",
                'subheading' => "Experience thoughtfully crafted pieces that refresh your space\nand elevate your everyday living.",
                'button_text' => 'View All Products',
                'button_url' => '/products',
                'image' => $this->safeFilePath('section/banner-53.jpg'),
            ]),

            // 7. Testimonials — image-first card (`testimonial-v03 hover-img4`).
            //    Mirrors html/home-garden.html lines 2716-2856.
            Shortcode::generateShortcode('testimonials', [
                'style' => 'style-v3-image',
                'title' => 'What Our Customers Say',
                'subtitle' => 'Real stories from people who love our products.',
                'autoplay' => 'yes',
                'limit' => 6,
            ]),

            // 8. Banner Product Single — mirrors home-garden.html style-6 (mini-PDP banner).
            // Pulls data from Product ID 4 (Anthurium Andreanum).
            Shortcode::generateShortcode('banner-thumbs-product', [
                'style' => 'style-6',
                'product_ids' => '4',
            ]),

            // 9. Guides, Tips & Inspiration — `article-blog style-3 hover-img` cards.
            //    Mirrors html/home-garden.html lines 3120-3212.
            Shortcode::generateShortcode('blog-posts', [
                'style' => 'style-slider',
                'title' => 'Guides, Tips & Inspiration',
                'subtitle' => 'Helpful plant knowledge, simple care, creative greenery styling.',
                'limit' => 6,
                'show_meta' => 'yes',
                'show_excerpt' => 'yes',
                'card_modifier' => 'style-3',
            ]),

            // 10. Box Icon — `box-icon_V01 has-line` swiper, order matches
            //     html/home-garden.html lines 3220-3267
            //     (Free Shipping → 14-Day Returns → 24/7 Support → Member Discounts).
            Shortcode::generateShortcode('site-features', [
                'style' => 'style-flat-swiper',
                'card_modifier' => 'has-line',
                'icon_class_extra' => 'mb-16',
                'title_tag' => 'h5',
                'pagination_class' => 'sw-dot-default',
                'data_space_lg' => 60.67,
                'data_space_md' => 33,
                'data_space' => 13,
                'quantity' => 4,
                'icon_class_1' => 'icon-Package',
                'title_1' => 'Free Shipping',
                'description_1' => 'No extra costs, just the price you see.',
                'icon_class_2' => 'icon-ArrowUDownLeft',
                'title_2' => '14-Day Returns',
                'description_2' => 'Risk-free shopping with easy returns.',
                'icon_class_3' => 'icon-Headset',
                'title_3' => '24/7 Support',
                'description_3' => '24/7 support, always here just for you.',
                'icon_class_4' => 'icon-SealPercent',
                'title_4' => 'Member Discounts',
                'description_4' => 'Special prices for our loyal customers.',
            ]),

            // 11. Gallery — `gallery-item style-2 rounded-0` cards inside `container-full-4`.
            //    Mirrors html/home-garden.html lines 3274-3351.
            Shortcode::generateShortcode('image-gallery', [
                'style' => 'style-default',
                'quantity' => 5,
                'wrapper_class' => 'container-full-4',
                'card_modifier' => 'style-2 rounded-0',
                'image_1' => $this->safeFilePath('gallery/gallery-42.jpg'),
                'link_1' => '/products',
                'image_2' => $this->safeFilePath('gallery/gallery-43.jpg'),
                'link_2' => '/products',
                'image_3' => $this->safeFilePath('gallery/gallery-44.jpg'),
                'link_3' => '/products',
                'image_4' => $this->safeFilePath('gallery/gallery-45.jpg'),
                'link_4' => '/products',
                'image_5' => $this->safeFilePath('gallery/gallery-46.jpg'),
                'link_5' => '/products',
            ]),
        ]), ENT_NOQUOTES, 'UTF-8');
    }
}
