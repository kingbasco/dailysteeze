<?php

namespace Database\Seeders\Themes\HomeSport;

use Botble\Base\Enums\BaseStatusEnum;

/**
 * HomeSport — sport-themed customer reviews mirroring html/home-sport.html
 * §9 Testimonial (lines 2714-2870). Two "Verified Buyer" cards (Emma Collins,
 * Sophia Ramirez) using the demo's tes-27.jpg / tes-28.jpg photos. Each card
 * pairs with a sport product mini-card — wired via testimonial_product_ids in
 * PageSeeder.
 *
 * Insertion order is REVERSED from rendering order: testimonials index sorts
 * `orderByDesc('id')` so the LAST inserted row becomes slide 1. To render
 * Emma → Sophia (demo order), seed Sophia first then Emma.
 */
class TestimonialSeeder extends \Database\Seeders\Themes\Main\TestimonialSeeder
{
    public function getTestimonials(): array
    {
        return [
            // Inserted first → lowest id → DESC sort puts it at slide 2.
            [
                'name' => 'Sophia Ramirez',
                'company' => 'Verified Buyer',
                'content' => '"I\'m in love with this custom night light! It\'s the perfect little touch for our holiday decor, and my kids get excited seeing our names lit up every evening."',
                'image' => $this->filePath('testimonials/tes-28.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            // Inserted last → highest id → DESC sort puts it at slide 1.
            [
                'name' => 'Emma Collins',
                'company' => 'Verified Buyer',
                'content' => '"This suede bowling bag is an game-changer for everyday carry. The suede material feels incredibly luxurious and soft to the touch, instantly elevating any outfit."',
                'image' => $this->filePath('testimonials/tes-27.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
