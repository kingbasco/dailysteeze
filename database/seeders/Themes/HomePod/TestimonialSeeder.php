<?php

namespace Database\Seeders\Themes\HomePod;

use Botble\Base\Enums\BaseStatusEnum;

/**
 * HomePod — print-on-demand / personalized-gifts customer reviews mirroring
 * html/home-pod.html §9 "Testimonial" (lines 3158-3320). Two "Verified Buyer"
 * cards (Emma Collins, Sophia Ramirez) using the demo's tes-3.jpg / tes-4.jpg
 * photos. Each card pairs with a personalized-gift product mini-card — wired via
 * testimonial_product_ids in PageSeeder.
 *
 * Insertion order is REVERSED from rendering order: the testimonials index
 * sorts `orderByDesc('id')`, so the LAST inserted row becomes slide 1. To
 * render Emma → Sophia (demo order), seed Sophia first, Emma last.
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
                'content' => '"I\'m in love with this custom night light! It\'s the perfect little touch for our holiday decor, and my kids get excited seeing our names lit up every evening. It truly makes our home feel more festive and cozy."',
                'image' => $this->filePath('testimonials/tes-4.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            // Inserted last → highest id → DESC sort puts it at slide 1.
            [
                'name' => 'Emma Collins',
                'company' => 'Verified Buyer',
                'content' => '"My daughter absolutely loves her reindeer mug! The name printing looks perfect, and she uses it every morning for her hot chocolate. It\'s become her favorite little Christmas tradition this year."',
                'image' => $this->filePath('testimonials/tes-3.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
