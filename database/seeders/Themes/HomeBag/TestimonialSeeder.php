<?php

namespace Database\Seeders\Themes\HomeBag;

use Botble\Base\Enums\BaseStatusEnum;

/**
 * HomeBag — bag & accessories customer reviews mirroring html/home-bag-accessories.html
 * §9 "Customer Say!" (lines 2751-2861). Two "Verified Buyer" cards (Emma Collins,
 * Sophia Ramirez) using the demo's tes-25.jpg / tes-26.jpg lifestyle photos. Each
 * card pairs with a bag product mini-card — wired via testimonial_product_ids in
 * PageSeeder.
 *
 * Insertion order is REVERSED from rendering order: the testimonials index sorts
 * `orderByDesc('id')`, so the LAST inserted row becomes slide 1. To render
 * Emma → Sophia (demo order), seed Sophia first, Emma last.
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
                'content' => '"I\'m in love with this leather crossbody! It\'s the perfect little touch for everyday outfits, and I get compliments every time I carry it. The full-grain leather has aged beautifully — it just keeps getting better."',
                'image' => $this->filePath('testimonials/tes-26.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            // Inserted last → highest id → DESC sort puts it at slide 1.
            [
                'name' => 'Emma Collins',
                'company' => 'Verified Buyer',
                'content' => '"This suede bowling bag is an game-changer for everyday carry. The suede material feels incredibly luxurious and soft to the touch, instantly elevating any outfit."',
                'image' => $this->filePath('testimonials/tes-25.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
