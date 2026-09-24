<?php

namespace Database\Seeders\Themes\HomeFashion2;

use Botble\Base\Enums\BaseStatusEnum;

/**
 * HomeFashion2 — fashion-buyer reviews mirroring html/home-fashion-2.html §8
 * "Testimonial" (lines 4425-4575). Three "Verified Buyer" cards
 * (Emma Collins, Evelyn Taylor, Cara Wang). The `style-v4` card has no avatar,
 * so the `image` field is unused on render — each card instead pairs with a
 * product mini-card wired via `testimonial_product_ids` in PageSeeder.
 *
 * Insertion order is REVERSED from rendering order: the testimonials index
 * sorts `orderByDesc('id')`, so the LAST inserted row becomes slide 1. To
 * render Emma → Evelyn → Cara (demo order), seed Cara first, Emma last.
 */
class TestimonialSeeder extends \Database\Seeders\Themes\Main\TestimonialSeeder
{
    public function getTestimonials(): array
    {
        return [
            // Inserted first → lowest id → DESC sort puts it at slide 3.
            [
                'name' => 'Cara Wang',
                'company' => 'Verified Buyer',
                'content' => '"I am genuinely impressed with this jacket. The material is fantastic — it feels durable and high-quality, and the outer shell provides great wind and light water resistance, which is perfect for my morning commute."',
                'image' => $this->filePath('testimonials/avatar-3.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            // Inserted second → middle id → slide 2.
            [
                'name' => 'Evelyn Taylor',
                'company' => 'Verified Buyer',
                'content' => '"The fit is fantastic — I ordered my usual size (Small) and it is just the right length and fitted perfectly without being too tight. The neckline and armholes are cut modestly, which is a huge plus. I am extremely satisfied."',
                'image' => $this->filePath('testimonials/avatar-2.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            // Inserted last → highest id → DESC sort puts it at slide 1.
            [
                'name' => 'Emma Collins',
                'company' => 'Verified Buyer',
                'content' => '"I am extremely satisfied with this T-shirt! The cotton material is softer and more breathable than I expected. After many washes, the shirt still holds its shape very well and does not pill or stretch. I like the product material."',
                'image' => $this->filePath('testimonials/avatar-1.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
