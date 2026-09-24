<?php

namespace Database\Seeders\Themes\HomeBag;

use Botble\Shortcode\Facades\Shortcode;

/**
 * Home15 — Bags & Accessories. Mirrors html/home-bag-accessories.html.
 *
 *   1. ecommerce-collections (style-banner-1plus2)     — Grid Collection (Bag/Belt/Jewelry)
 *   2. categories-grid       (style-slider)            — Shop By Categories
 *   3. ecommerce-products    (style-slider, grid 2x4)  — Today's Best Choices
 *   4. image-gallery         (style-paired-banner-image-top) — Collection (2-up swiper)
 *   5. ecommerce-products    (style-slider-countdown)  — Limited-Time Deals (countdown-v08)
 *   6. brand-logos           (style-slider)            — Brand strip
 *   7. lookbook-hotspot      (style-3-up-swiper-banners) — Lookbook
 *   8. site-features         (style-1)                 — Box Icon
 *   9. testimonials          (style-v2-product, card_type=style-1-bag) — Customer Say!
 *  10. image-gallery         (style-default)           — Follow Us On Instagram
 */
class PageSeeder extends \Database\Seeders\Themes\Main\PageSeeder
{
    protected function getHomepageContent(): string
    {
        return htmlentities(implode(PHP_EOL, [
            // 1. Grid Collection — asymmetric 1-tall + 2-stacked grid mirroring
            //    html/home-bag-accessories.html lines 1320-1389. HomeBag\ProductCollectionSeeder
            //    reorders so ids 1/2/3 = Handbags/Belts/Jewelry with the demo's cls-1/2/3 art
            //    (woman+bag / woman+sunglasses / hand+rings). Per-cell title overrides match
            //    the demo's `<br>`-split headlines.
            Shortcode::generateShortcode('ecommerce-collections', [
                'style' => 'style-banner-1plus2',
                'collection_ids' => '1,2,3',
                'limit' => 3,
                'title_1' => 'Jacquard Bucket <br> Bag With Logo',
                'desc_1' => 'Up to 50% Off Bestsellers',
                'title_2' => 'Leather Belt <br> With Oval Buckle',
                'desc_2' => 'Up to 50% Off Bestsellers',
                'title_3' => 'latest Jewelry <br> Collection',
                'desc_3' => 'Up to 50% Off Bestsellers',
                'button_text' => 'Shop Now',
                // Demo wraps §1 in `<div class="flat-spacing-3 pb-0">` (top padding only, no
                // bottom padding) — the next section's `flat-spacing` provides the gap.
                'spacing_class' => 'flat-spacing-3 pb-0',
            ]),

            // 2. Shop By Categories — demo §2 uses `category-v08` 6-up swiper with
            //    centered text ("cate-content text-center") and hardcoded marketing counts
            //    (Bags 36 / Beanie 48 / Belts 19 / Jewelry 23 / Mittens 20 / Shoes 35).
            //    Order matches HomeBag\ProductCategorySeeder (Bags / Beanie / Belts /
            //    Jewelry / Mittens / Shoes).
            Shortcode::generateShortcode('categories-grid', [
                'style' => 'style-slider',
                'card_class' => 'category-v08',
                'card_modifier' => 'hover-img',
                'card_content_class' => 'text-center',
                'title' => 'Shop By Categories',
                'subtitle' => 'Discover bags and accessories crafted for everyday style.',
                'limit' => 6,
                'show_count' => 'yes',
                'count_label' => 'Items',
                'count_overrides' => '36,48,19,23,20,35',
                'swiper_preview_lg' => 6,
                'swiper_preview' => 6,
                // Demo wraps §2 in `<div class="container">` (1440px max) — not the live
                // default `px-10 mt-30` (full-width). Use a 1440px-capped container so the
                // 6 circles render at the demo's smaller scale with whitespace around items.
                'wrapper_class' => 'container',
                // Demo data-space-lg="30" between cards (live default 20).
                'swiper_space_lg' => '30',
            ]),

            // 3. Today's Best Choices — demo §3 is a 4-up swiper with `data-grid="2"`
            //    (8 cards in 2 rows). Pagination bullets cap at 4 (one per col at lg).
            Shortcode::generateShortcode('ecommerce-products', [
                'style' => 'style-slider',
                'title' => 'Today\'s Best Choices',
                'subtitle' => 'Discover today\'s standout sportswear picks.',
                'source' => 'best-seller',
                'limit' => 8,
                'items_per_row' => 4,
                'grid_rows' => 2,
                'pagination_lg' => 4,
                'pagination_md' => 3,
                'pagination_sm' => 2,
                'pagination' => 2,
                // Demo §3 wrapper is `<section class="flat-spacing pt-0">` (no top padding —
                // §1's bottom-zero padding stacks against §3's zero-top padding).
                'section_class' => 'ecommerce-products ecommerce-products--style-slider flat-spacing pt-0',
            ]),

            // 4. Banner pair "Shoes Designed For Comfort And Style" + "Bags That Elevate
            //    Your Everyday Look" — demo §4 is a 2-up swiper of `banner-image-text
            //    style-top-left tl-3` cards (870x680 image-on-top, h2 title, p.desc).
            //    Title uses `<br class="d-none d-sm-block">` (lesson #16 — `\n` collapses
            //    to a space, breaking the demo's two-line headline).
            Shortcode::generateShortcode('image-gallery', [
                'style' => 'style-paired-banner-image-top',
                'quantity' => 2,
                'image_1' => $this->safeFilePath('section/banner-57.jpg'),
                'link_1' => '/products',
                'title_1' => 'Shoes Designed For <br class="d-none d-sm-block"> Comfort And Style',
                'description_1' => 'Shoes Designed For Comfort And Style',
                'button_text_1' => 'Shop Now',
                'image_2' => $this->safeFilePath('section/banner-58.jpg'),
                'link_2' => '/products',
                'title_2' => 'Bags That Elevate <br class="d-none d-sm-block"> Your Everyday Look',
                'description_2' => 'Functional designs combining style, storage.',
                'button_text_2' => 'Shop Now',
            ]),

            // 5. Limited-Time Deals (Product Countdown) — countdown-v08 in section-heading
            //    col-right + 4-up product slider. Uses style-slider-countdown (graduated
            //    2026-05-08). Empty title/subtitle suppress the index's centered heading;
            //    custom_title/custom_subtitle render the demo's left-aligned heading.
            //    Demo shows 4 product cards.
            Shortcode::generateShortcode('ecommerce-products', [
                'style' => 'style-slider-countdown',
                'title' => '',
                'subtitle' => '',
                'custom_title' => 'Limited-Time Deals On!',
                'custom_subtitle' => 'Up to 50% Off Selected Style. Don\'t Miss Out',
                'target_date' => now()->addDays(12)->addHours(15)->format('Y-m-d H:i'),
                'source' => 'sale',
                'limit' => 4,
                'items_per_row' => 4,
            ]),

            // 6. Brand strip — demo §6 (L2551-2574) is an `infiniteSlide-brand syle-3` marquee
            //    (typo in demo HTML kept verbatim) with 6 logos, NO `<section>` wrapper or
            //    `flat-spacing` padding. style-infinite emits the same markup; section_class=''
            //    drops the default flat-spacing.
            Shortcode::generateShortcode('brand-logos', [
                'style' => 'style-infinite',
                'modifier_class' => 'syle-3',
                'limit' => 6,
                'section_class' => '',
            ]),

            // 7. Lookbook — demo §7 (L2575-2688) is a 3-up swiper of `banner-lookbook
            //    wrap-lookbook_hover` cards (570x570 radius-20) inside `container-full`,
            //    each with 1 hotspot pin. style-3-up-swiper-banners takes image/image_2/
            //    image_3 + per-column hotspots.
            Shortcode::generateShortcode('lookbook-hotspot', [
                'style' => 'style-3-up-swiper-banners',
                'image' => $this->safeFilePath('lookbook/look-7.jpg'),
                'image_2' => $this->safeFilePath('lookbook/look-8.jpg'),
                'image_3' => $this->safeFilePath('lookbook/look-9.jpg'),
                'quantity' => 3,
                'x_percent_1' => 50, 'y_percent_1' => 50, 'product_id_1' => 1, 'column_1' => 1,
                'x_percent_2' => 50, 'y_percent_2' => 50, 'product_id_2' => 2, 'column_2' => 2,
                'x_percent_3' => 50, 'y_percent_3' => 50, 'product_id_3' => 3, 'column_3' => 3,
            ]),

            // 8. Box Icon — demo §8 (L2690-2750) is a bare `<div class="themesFlat">` wrapper
            //    (zero vertical padding) with a 4-up box-icon swiper. `compact='yes'` drops
            //    the top br-line divider + inner `flat-spacing pb-0`; `outer_section_class`
            //    swaps the default `flat-spacing` for `themesFlat` (no-op = zero padding).
            Shortcode::generateShortcode('site-features', [
                'style' => 'style-1',
                'compact' => 'yes',
                'outer_section_class' => 'themesFlat',
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

            // 9. Testimonials — Customer Say! demo §9 (L2751-2861) uses `testimonial-v01
            //    style-1 style-def` 2-up swiper. card_type='style-1-bag' branches into the
            //    bag-specific layout (LEFT image 285x380, RIGHT content with p.author-name
            //    + h6.text-capitalize quote + product mini-card 88x88). HomeBag\TestimonialSeeder
            //    seeds Emma + Sophia photos; testimonial_product_ids pairs them with bag
            //    products 8 (Suede Bowling Bag, $67.99) and 7 (Leather Crossbody, $22.99).
            Shortcode::generateShortcode('testimonials', [
                'style' => 'style-v2-product',
                'card_type' => 'style-1-bag',
                'title' => 'Customer Say!',
                'subtitle' => 'Our customers adore our products, and we constantly aim to delight them.',
                'autoplay' => 'yes',
                'limit' => 2,
                'testimonial_product_ids' => '8,7',
            ]),

            // 10. Follow Us On Instagram — variant gallery-57..61
            Shortcode::generateShortcode('image-gallery', [
                'style' => 'style-default',
                'title' => 'Follow Us On Instagram',
                'subtitle' => '@Amerce',
                'quantity' => 5,
                'image_1' => $this->safeFilePath('gallery/gallery-57.jpg'),
                'link_1' => '/products',
                'image_2' => $this->safeFilePath('gallery/gallery-58.jpg'),
                'link_2' => '/products',
                'image_3' => $this->safeFilePath('gallery/gallery-59.jpg'),
                'link_3' => '/products',
                'image_4' => $this->safeFilePath('gallery/gallery-60.jpg'),
                'link_4' => '/products',
                'image_5' => $this->safeFilePath('gallery/gallery-61.jpg'),
                'link_5' => '/products',
            ]),
        ]), ENT_NOQUOTES, 'UTF-8');
    }
}
