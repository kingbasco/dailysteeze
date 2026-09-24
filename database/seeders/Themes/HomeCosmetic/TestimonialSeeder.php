<?php

namespace Database\Seeders\Themes\HomeCosmetic;

use Botble\Base\Enums\BaseStatusEnum;

/**
 * HomeCosmetic — beauty-customer reviews mirroring html/home-cosmetic.html §8
 * "Testimonial" (lines 2345-2415). Two "Verified Buyer" cards (Olivia Brooks,
 * Sophia Ramirez) using the demo's tes-11.jpg / tes-12.jpg photos. Each card
 * pairs with a cosmetic product mini-card — wired via testimonial_product_ids
 * in PageSeeder.
 *
 * Insertion order is REVERSED from rendering order: the testimonials index
 * sorts `orderByDesc('id')`, so the LAST inserted row becomes slide 1. To
 * render Olivia → Sophia (demo order), seed Sophia first, Olivia last.
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
                'content' => '"My skin has never looked this even. Two weeks in and the glow is real — friends keep asking what changed about my routine."',
                'image' => $this->filePath('testimonials/tes-12.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            // Inserted last → highest id → DESC sort puts it at slide 1.
            [
                'name' => 'Olivia Brooks',
                'company' => 'Verified Buyer',
                'content' => '"Lightweight, never greasy, and it absorbs in seconds. This serum earned a permanent spot on my shelf — I already repurchased twice."',
                'image' => $this->filePath('testimonials/tes-11.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
