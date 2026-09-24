<?php

namespace Database\Seeders\Themes\HomeDecor;

use Botble\Shortcode\Facades\Shortcode;

/**
 * Home16 — Decor. Mirrors html/home-decor.html section-for-section.
 *
 *   1. simple-slider          (style-1)        — Hero ("Office decor that sparks creativity.")
 *   2. infinity-marquee       (style-1)        — Return Shipping policy strip (3 text+image pairs)
 *   3. categories-grid        (style-slider)   — Curated Categories
 *   4. ecommerce-products     (style-slider)   — Discover New Products (Top Pick)
 *   5. lookbook-hotspot       (style-v2)       — Lookbook
 *   6. ecommerce-products     (style-slider)   — New Arrivals
 *   7. testimonials           (style-v3-image) — What Our Customers Say (image-first verified card)
 *   8. banner-image-text      (style-wide-abs) — "Enjoy Up To 50% Off" wide promo
 *   9. site-features          (style-2)        — Box Icon trust strip
 *  10. image-gallery          (style-default)  — Gallery
 */
class PageSeeder extends \Database\Seeders\Themes\Main\PageSeeder
{
    protected function getHomepageContent(): string
    {
        return htmlentities(implode(PHP_EOL, [
            // 1. Hero — demo §1 (lines 1308-1411): `slider-wrap_3` 2-col split — LEFT panel
            //    (.sld-content with blurred .sld-image_left bg + .content-sld_wrap text) +
            //    RIGHT main image (.sld-image_right). Fundamentally different from style-1's
            //    full-bleed overlay; use the dedicated `style-split` blade.
            Shortcode::generateShortcode('simple-slider', [
                'key' => 'home-hero',
                'style' => 'style-split',
                'is_autoplay' => 'yes',
                'autoplay_speed' => 3000,
                'show_dots' => 'yes',
                'inner_class' => 'container-full-3',
            ]),

            // 2. Return Shipping policy strip (html pos 2: infiniteSlide-policy-v2).
            //    Demo lines 1414-1430: 3 text+image pairs cloned 5x.
            //    Uses `variant=policy-v2` to emit demo's `infiniteSlide-policy-v2`
            //    + `<p class="policy-text h1 fw-medium">` + `policy-image` markup.
            Shortcode::generateShortcode('infinity-marquee', [
                'style' => 'style-1',
                'variant' => 'policy-v2',
                'clone_count' => 5,
                'quantity' => 3,
                'heading_1' => 'Elegant Comfort',
                'image_1' => $this->safeFilePath('section/policy-5.jpg'),
                'heading_2' => 'Timeless Comfort',
                'image_2' => $this->safeFilePath('section/policy-6.jpg'),
                'heading_3' => 'Pure Comfort',
                'image_3' => $this->safeFilePath('section/policy-7.jpg'),
            ]),

            // 3. Curated Categories — demo §3 (lines 1432-1511): 5-up swiper of
            //    `category-v01` cards inside `<section class="flat-spacing"><div class="container">`.
            //    No count display (drop show_count), `swiper-cate` extra class, data-space-lg=40.
            Shortcode::generateShortcode('categories-grid', [
                'style' => 'style-slider',
                'card_class' => 'category-v01',
                'card_modifier' => 'hover-img',
                'title' => 'Curated Categories',
                'subtitle' => 'Explore premium selections that redefine comfort and style.',
                'limit' => 5,
                'wrapper_class' => 'container',
                'swiper_class' => 'swiper-cate',
                'swiper_space_lg' => '40',
                'swiper_preview_lg' => '5',
                'swiper_preview' => '5',
            ]),

            // 4. Discover New Products — demo §4 (lines 1513-1812): 4 cards single row
            //    with `card-product_wrapper square` (square aspect modifier per memory
            //    `feedback-square-is-wrapper-modifier.md`).
            Shortcode::generateShortcode('ecommerce-products', [
                'style' => 'style-slider',
                'title' => 'Discover New Products',
                'subtitle' => 'Top styles everyone\'s talking about.',
                'source' => 'best-seller',
                'limit' => 4,
                'items_per_row' => 4,
                'product_wrapper_class' => 'square',
            ]),

            // 5. Lookbook — demo §5 (lines 1813-1992): 1-up numbered swiper of two
            //    1920x640 `banner-lookbook wrap-lookbook_hover style-2` banners,
            //    each with 2 preset-position pins (position4 + position5), wrapped
            //    in `<div class="container-full-3">` with `box-nav-pag` "Shop The
            //    Look" prev/next/fraction nav. Uses the new style-decor-swiper-banners
            //    blade — `style-v2` was the pet-care 2-col split (lesson
            //    `feedback-lookbook-style-v2-wrong-preset-layout.md`).
            Shortcode::generateShortcode('lookbook-hotspot', [
                'style' => 'style-decor-swiper-banners',
                'image' => $this->safeFilePath('section/banner-lookbook-8.jpg') ?: $this->safeFilePath('gallery/gallery-1.jpg'),
                'image_2' => $this->safeFilePath('section/banner-lookbook-9.jpg') ?: $this->safeFilePath('gallery/gallery-2.jpg'),
                'nav_title' => 'Shop The Look',
                'quantity' => 4,
                // Banner 1 — 2 pins (chair + desk in demo)
                'product_id_1' => 5, 'column_1' => 1,
                'product_id_2' => 6, 'column_2' => 1,
                // Banner 2 — 2 pins (table + decor in demo)
                'product_id_3' => 5, 'column_3' => 2,
                'product_id_4' => 6, 'column_4' => 2,
            ]),

            // 5b. Brand strip — demo §5 trailer (lines 1952-1989): bare
            //     `infiniteSlide-brand style-2 wow fadeInUp` 7-brand marquee
            //     (bohome, living, west-elm, anthro, stanza, urban, crate) sitting
            //     under the lookbook. Pass `section_class=''` so the outer
            //     `<section>` drops `flat-spacing` (demo has no vertical padding).
            Shortcode::generateShortcode('brand-logos', [
                'style' => 'style-infinite',
                'modifier_class' => 'style-2',
                'clone_count' => 3,
                'section_class' => '',
            ]),

            // 6. New Arrival — demo §6 (lines 1994-2133): 2-col `section-thumbs-arrival`:
            //    LEFT col-lg-6 tag + h3 "Very Conference" + desc + sw-main-thumb swiper of
            //    product thumbs; RIGHT col-lg-6 sw-thumb swiper of large images + prev/next
            //    nav. Demo uses the SAME product ("Very Conference") on every slide, just
            //    with different lifestyle images — pull product id=2 (Very Conference) only
            //    so LEFT thumb + RIGHT image always show the same data (avoids sync drift
            //    on different positions). Powered by the new `style-thumbs-arrival` blade.
            //    `container_class='sw-thumbs-arrival tf-sw-thumbs'` so the index renders
            //    `<section><div class="sw-thumbs-arrival tf-sw-thumbs">{style}` matching demo.
            Shortcode::generateShortcode('ecommerce-products', [
                'style' => 'style-thumbs-arrival',
                'title' => 'Very Conference',
                'subtitle' => "Very Conference's minimal design focuses on user needs and allows Very to adapt and support many environments.",
                'tag_text' => 'New arrivals',
                // limit=3 pulls a Collection (ProductRepository::getProducts with
                // take=1 returns a SINGLE model — fails `is_countable` check in
                // ecommerce-products/index.blade.php and the section silently
                // disappears). The style-thumbs-arrival blade clamps to first 1
                // so LEFT thumb-swiper + RIGHT image-swiper render a SINGLE shared
                // slide — eliminates the cross-swiper sync drift documented in
                // theme.js carousel.js L206-207.
                'source' => 'latest',
                'limit' => 3,
                'section_class' => 'section-thumbs-arrival flat-spacing',
                'container_class' => 'sw-thumbs-arrival tf-sw-thumbs',
            ]),

            // 7. Testimonials — demo §7 (lines 2135-2242): `testimonial-v01 style-def style-4`
            //    2-up swiper inside `<section class="themesFlat">`. Card body: 234x312 left
            //    image + Eye overlay → right column star(fs-16) → plain quote → author-name
            //    + verified-icon (no "Verified Buyer" label) → product mini-card 60x60.
            //    Themed customers (Martin Culhane, Talan Baptista) seeded via HomeDecor\TestimonialSeeder.
            //    `testimonial_product_ids` pairs them with decor product 1/2 ("Paris"=Milano-equivalent
            //    and "Very Conference"=Openest-equivalent in the catalog).
            Shortcode::generateShortcode('testimonials', [
                'style' => 'style-v2-product',
                'card_type' => 'style-1-decor',
                'outer_class' => 'themesFlat',
                'title' => 'What Our Customers Say',
                'subtitle' => 'Real stories from people who love our products.',
                'autoplay' => 'yes',
                'limit' => 2,
                'testimonial_product_ids' => '1,2',
            ]),

            // 8. Wide promo banner — demo §8 (lines 2244-2270): `banner-image-text
            //    type-abs style-10 parallaxie` with CENTERED text-white overlay
            //    (mini-title eyebrow + h2 heading + desc + Shop Now button) on the
            //    banner-29.jpg background. New `style-parallax-promo` blade.
            Shortcode::generateShortcode('banner-image-text', [
                'style' => 'style-parallax-promo',
                'mini_title' => 'Summer 2025 Sale Event',
                'heading' => 'Enjoy Up To 50% Off',
                'subheading' => 'Perfect pieces for your favorite spaces.',
                'button_text' => 'Shop Now',
                'button_url' => '/products',
                'image' => $this->safeFilePath('section/banner-29.jpg') ?: $this->safeFilePath('section/banner-1.jpg'),
            ]),

            // 9. Box Icon trust strip — demo §9 (lines 2271-2330): `<div class="flat-spacing pt-0">`
            //    (NO br-line, NO nested flat-spacing pb-0). Apply `compact='yes'` (drop divider +
            //    nested padding) + `outer_section_class='flat-spacing pt-0'` (override default
            //    flat-spacing to match demo's pt-0 zero top padding). Demo icons + copy:
            //    Armchair/Premium Quality, Truck/Fast & Secure Delivery, Users/Trusted By
            //    Customers, Leaf/Sustainable Design.
            Shortcode::generateShortcode('site-features', [
                'style' => 'style-1',
                'quantity' => 4,
                'compact' => 'yes',
                'outer_section_class' => 'flat-spacing pt-0',
                'title_tag' => 'h6',
                'icon_class_1' => 'icon-Armchair',
                'title_1' => 'Premium Quality',
                'description_1' => 'Premium build. Pure comfort.',
                'icon_class_2' => 'icon-Truck',
                'title_2' => 'Fast & Secure Delivery',
                'description_2' => 'Fast, safe delivery.',
                'icon_class_3' => 'icon-Users',
                'title_3' => 'Trusted By Customers',
                'description_3' => 'Loved by customers worldwide.',
                'icon_class_4' => 'icon-Leaf',
                'title_4' => 'Sustainable Design',
                'description_4' => 'Sustainable design for greener living.',
            ]),

            // 10. Gallery — demo §10 (lines 2332-2407): bare `<div class="mb-10 px-10">`
            //    (no section, no flat-spacing) with 5-up swiper of gallery-22..26 items.
            //    `skip_spacing='yes'` drops the default `flat-spacing` from the section,
            //    `extra_section_class='mb-10 px-10'` applies demo's wrapper utilities,
            //    `wrapper_class=''` drops the inner `<div class="container">` wrap.
            Shortcode::generateShortcode('image-gallery', [
                'style' => 'style-default',
                'skip_spacing' => 'yes',
                'extra_section_class' => 'mb-10 px-10',
                'wrapper_class' => '',
                'quantity' => 5,
                'image_1' => $this->safeFilePath('gallery/gallery-22.jpg'),
                'link_1' => '/products',
                'image_2' => $this->safeFilePath('gallery/gallery-23.jpg'),
                'link_2' => '/products',
                'image_3' => $this->safeFilePath('gallery/gallery-24.jpg'),
                'link_3' => '/products',
                'image_4' => $this->safeFilePath('gallery/gallery-25.jpg'),
                'link_4' => '/products',
                'image_5' => $this->safeFilePath('gallery/gallery-26.jpg'),
                'link_5' => '/products',
            ]),
        ]), ENT_NOQUOTES, 'UTF-8');
    }
}
