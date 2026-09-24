<?php

namespace Database\Seeders\Themes\HomePetCare;

use Botble\Shortcode\Facades\Shortcode;

/**
 * Home12 — Pet Care. Mirrors html/home-pet-care.html section-for-section.
 * Demo has no slide-show; the page opens with a Category swiper, then a
 * Banner Collection block acts as the hero.
 *
 *   1. categories-grid        (style-slider)            — 7-tile category swiper
 *   2. ecommerce-collections  (style-banner-split-v04)  — Banner Collection (hero + 2 stacked)
 *   3. ecommerce-products     (style-slider)            — Top Pet Picks This Week
 *   4. lookbook-hotspot       (style-v2)                — Lookbook
 *   5. ecommerce-products     (style-slider, sale)      — Pet Deal Of The Week
 *   6. image-gallery          (style-paired-banner-overlay-cf) — Banner Product (2-up overlay)
 *   7. product-feature-zoom   (style-2-detail)          — Product Single (Hammock Cat Tower / Cat Tower)
 *   8. testimonials           (style-v3-image)          — Customer Reviews (image-first verified card)
 *   9. blog-posts             (style-slider)            — Insights For Happier Pets
 *  10. site-features          (style-2)                 — Box Icon
 *  11. image-gallery          (style-default)           — Gallery
 */
class PageSeeder extends \Database\Seeders\Themes\Main\PageSeeder
{
    protected function getHomepageContent(): string
    {
        return htmlentities(implode(PHP_EOL, [
            // 1. Category swiper — demo §1 uses `category-v05` card with cate-content overlay.
            Shortcode::generateShortcode('categories-grid', [
                'style' => 'style-slider',
                'card_class' => 'category-v05',
                'card_modifier' => 'hover-img',
                'limit' => 8,
                'show_count' => 'yes',
                'swiper_preview' => 5,
                'swiper_preview_lg' => 7,
                // Demo (html lines 1268-1270) uses "12 items" — not "12 Products".
                'count_label' => 'items',
            ]),

            // 2. Banner Collection — section-banner-cls (hero LEFT banner-15 + 2 stacked RIGHT cls-17/cls-18)
            Shortcode::generateShortcode('ecommerce-collections', [
                'style' => 'style-banner-split-v04',
                'collection_ids' => '1,2,3',
                'limit' => 3,
                'banner_image' => $this->safeFilePath('section/banner-15.jpg'),
                'banner_heading' => "Everything\nYour Pet\nDeserves",
                'banner_subheading' => "Premium pet essentials curated for\nhappier, healthier companions.",
                'banner_button_text' => 'Shop Now',
                'banner_button_url' => '/products',
                'container_class' => 'container-full',
                'wrapper_class' => 'main-section',
                'image_radius_class' => 'radius-20',
                'gap' => 20,
            ]),

            // 3. Top Pet Picks This Week — demo §3 uses a 4-col × 2-row swiper grid
            //    (data-grid="2") with `card-product_wrapper square` cards. Pagination
            //    values (2/2/3/4) match HTML so slidesPerGroup pages a full row.
            Shortcode::generateShortcode('ecommerce-products', [
                'style' => 'style-slider',
                'title' => 'Top Pet Picks This Week',
                'subtitle' => "Curated favorites chosen to make your pets' days more fun and comfortable.",
                'title_align' => 'left',
                'view_all_url' => '/products',
                'view_all_text' => 'View All Products',
                'source' => 'best-seller',
                'limit' => 8,
                'items_per_row' => 4,
                'grid_rows' => 2,
                'product_wrapper_class' => 'square',
                'card_style' => 'style-1',
                'pagination' => 2,
                'pagination_sm' => 2,
                'pagination_md' => 3,
                'pagination_lg' => 4,
            ]),

            // 4. Lookbook — demo "Bundle & Save For Pets" (html lines 2031-2228).
            //    Demo configures 2 hotspots showing product-9.jpg (Cozy Dog Bed)
            //    and product-10.jpg (Calming Treats) — these are the only catalog
            //    rows with the "Animals Like Us" yellow package look the bundle
            //    cards visually rely on. CSS positions: position7 (top 63%, left 21.5%)
            //    and position8 (top 61.7%, left 53.9%) — see styles.css L14922-14929.
            Shortcode::generateShortcode('lookbook-hotspot', [
                'style' => 'style-v2',
                'title' => 'Bundle & Save For Pets',
                'subtitle' => 'Weekly essentials handpicked to keep your pets happy and healthy.',
                'image' => $this->safeFilePath('section/banner-lookbook-5.jpg'),
                'quantity' => 2,
                'x_percent_1' => 21.5, 'y_percent_1' => 63,   'product_id_1' => 9,  'column_1' => 1,
                'x_percent_2' => 53.9, 'y_percent_2' => 61.7, 'product_id_2' => 10, 'column_2' => 1,
            ]),

            // 5. Pet Deal Of The Week — demo (html lines 2230-2400) uses a 3-col composite:
            //    mini-list LEFT (3 products) → banner CENTER (banner-image-text style-8 with
            //    countdown, no button) → mini-list RIGHT (3 products). 6 products total fed
            //    from `source=sale`. banner-16.jpg is the cream-color banner background.
            Shortcode::generateShortcode('ecommerce-products', [
                'style' => 'style-auto-mini-list-with-banner',
                'title' => 'Pet Deal Of The Week',
                'subtitle' => 'Best-selling treats, toys, and gear your furry friends will love.',
                'source' => 'sale',
                'limit' => 6,
                'banner_image' => $this->safeFilePath('section/banner-16.jpg'),
                'banner_style' => 'style-8',
                'banner_heading' => 'Save Up To 50%',
                'banner_subheading' => 'HURRY! PAWLIDAY SALE ENDS SOON',
                'banner_show_button' => 'no',
                'banner_countdown_seconds' => 1093120,
                'banner_button_url' => '/products',
            ]),

            // 6. Banner Product — themesFlat container-full 2-up `banner-image-text type-abs style-6` (banner-17 + banner-18)
            //    Use new `image-gallery/style-paired-banner-overlay-cf` (container-full + type-abs style-6 overlay).
            //    Demo line 2491-2516: banner-1 (banner-17 purple bg) → WHITE text + 2-line headline;
            //    banner-2 (banner-18 yellow bg) → DARK text + 2-line headline. \n inside title becomes <br>.
            Shortcode::generateShortcode('image-gallery', [
                'style' => 'style-paired-banner-overlay-cf',
                'quantity' => 2,
                'image_1' => $this->safeFilePath('section/banner-17.jpg'),
                'link_1' => '/products',
                'title_1' => "Fuel Their Energy\nEvery Day",
                'description_1' => 'HEALTHY MEALS FOR DOGS',
                'button_text_1' => 'Shop Now',
                'text_color_1' => 'white',
                'image_2' => $this->safeFilePath('section/banner-18.jpg'),
                'link_2' => '/products',
                'title_2' => "Keep Them Purring\nAll Day",
                'description_2' => 'TASTY BITES FOR CATS',
                'button_text_2' => 'Shop Now',
                'text_color_2' => 'dark',
            ]),

            // 7. Product Single — single-product detail panel matching demo's
            //    `banner-product-single section-image-zoom` (no thumb strip; main image LEFT
            //    + sticky info wrap RIGHT with countdown + sold-bar + size variants).
            //    Mirrors html/home-pet-care.html lines 2522-2657. Uses product 3 (Cat Tower)
            //    + featured_name override "Hammock Cat Tower Grey" + 4 weight-bucket sizes.
            // Product-Single section pulls from real Product #3 (Hammock Cat Tower Grey).
            // Only marketing-overlay attributes with no product-data equivalent are passed
            // here (urgency text, countdown, sold-it bar, size variants for demo display,
            // CTA visibility). Name / category / price / old price / sale% / description
            // come from the product itself (see HomePetCare\Ecommerce\ProductSeeder row 3).
            Shortcode::generateShortcode('product-feature-zoom', [
                'style' => 'style-2-detail',
                'product_id' => 3,
                // Demo uses a single uppercase tag "PET CARE" (html line 2539) instead
                // of the multi-category breadcrumb the full product page renders.
                'detail_tag' => 'PET CARE',
                'reviews_count' => 134,
                'urgency_text' => '18 sold in last 32 hours',
                'badge_text' => '',
                'size_options' => '25 lbs|39.99,50 Lbs|59.99,100 Lbs|79.99,150 Lbs|89.99',
                'default_size_index' => 1,
                // Demo lines 2573-2602: Hurry-Up countdown (≈12d 15h 38m 16s) + 84% sold-it bar.
                'countdown_seconds' => 1093120,
                'countdown_label' => 'Hurry Up! Offer ends In:',
                'sold_percent' => 84,
                'stock_text' => 'Only 24 item(s) left in stock!',
                // Demo CTA = single black "Add To Cart" only — hide Buy It Now + View Full.
                'show_buy_now' => 'no',
                'show_view_full' => 'no',
            ]),

            // 8. Customer Reviews — image-first verified-buyer card with product mini-card.
            //    Demo (html lines 2659-2740) uses `<section class="themesFlat">` → cream
            //    `flat-spacing bg-main radius-20` wrapper → `testimonial-v01 style-3` cards
            //    (image LEFT + content RIGHT with embedded product mini-card).
            Shortcode::generateShortcode('testimonials', [
                'style' => 'style-v3-product',
                'bg_main' => 'yes',
                'section_class' => 'themesFlat',
                'title' => 'Customer Reviews',
                'subtitle' => 'Our customers adore our products, and we constantly aim to delight them.',
                // Demo (html line 2675) has no autoplay — swiper sits still until user paginates.
                'autoplay' => 'no',
                'limit' => 2,
                // Pair each testimonial card with the matching demo product mini-card.
                // testimonials index sorts DB rows orderByDesc('id'), so Daniel (id=2) is
                // items[0] and Emma (id=1) is items[1]. Demo wants Emma → Cozy Dog Bed (#9)
                // and Daniel → Calming Treats (#10) — these are the pet-themed products
                // closest to the demo's product-13/14 references.
                'testimonial_product_ids' => '10,9',
            ]),

            // 9. Blog — Insights For Happier Pets
            Shortcode::generateShortcode('blog-posts', [
                'style' => 'style-slider',
                'title' => 'Insights For Happier Pets',
                'subtitle' => 'Discover caring tips and daily inspiration for your furry friends.',
                'limit' => 6,
                'show_meta' => 'yes',
                'show_excerpt' => 'yes',
            ]),

            // 10. Box Icon — demo §10 lines 2902-2964: `box-icon_V01 style-2` 4-up swiper.
            //    site-features `style-1` emits the box-icon_V01 swiper (style-2 emits a
            //    different `tf-features-bar` block — pet-care demo wants the swiper variant).
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

            // 11. Gallery — HomePetCare variant gallery-12..16
            Shortcode::generateShortcode('image-gallery', [
                'style' => 'style-default',
                'quantity' => 5,
                'image_1' => $this->safeFilePath('gallery/gallery-12.jpg'),
                'link_1' => '/products',
                'image_2' => $this->safeFilePath('gallery/gallery-13.jpg'),
                'link_2' => '/products',
                'image_3' => $this->safeFilePath('gallery/gallery-14.jpg'),
                'link_3' => '/products',
                'image_4' => $this->safeFilePath('gallery/gallery-15.jpg'),
                'link_4' => '/products',
                'image_5' => $this->safeFilePath('gallery/gallery-16.jpg'),
                'link_5' => '/products',
            ]),
        ]), ENT_NOQUOTES, 'UTF-8');
    }
}
