<?php

namespace Database\Seeders\Themes\HomeDecor;

use Botble\Base\Enums\BaseStatusEnum;

/**
 * HomeDecor — ergonomic-furniture customer reviews mirroring html/home-decor.html
 * §7 "What Our Customers Say" (lines 2135-2242). Two "Verified Buyer" cards
 * (Martin Culhane, Talan Baptista) using the demo's tes-7.jpg / tes-8.jpg
 * lifestyle photos. Each card pairs with a decor product mini-card — wired via
 * testimonial_product_ids in PageSeeder.
 *
 * Insertion order is REVERSED from rendering order: testimonials index sorts
 * `orderByDesc('id')`, so the LAST inserted row becomes slide 1. To render
 * Martin → Talan (demo order), seed Talan first, Martin last.
 */
class TestimonialSeeder extends \Database\Seeders\Themes\Main\TestimonialSeeder
{
    public function getTestimonials(): array
    {
        return [
            // Inserted first → lowest id → DESC sort puts it at slide 2.
            [
                'name' => 'Talan Baptista',
                'company' => 'Verified Buyer',
                'content' => '"Excellent quality and design. The desk setup is sleek, sturdy, and keeps me focused during long hours."',
                'image' => $this->filePath('testimonials/tes-8.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            // Inserted last → highest id → DESC sort puts it at slide 1.
            [
                'name' => 'Martin Culhane',
                'company' => 'Verified Buyer',
                'content' => '"The ergonomic chair has completely changed how I work. My posture feels better, and I can sit comfortably all day without any back pain."',
                'image' => $this->filePath('testimonials/tes-7.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
