<?php

namespace Database\Seeders\Themes\HomeBaby;

use Botble\Base\Enums\BaseStatusEnum;

/**
 * HomeBaby — baby-parent customer reviews mirroring html/home-baby.html §8
 * "Testimonial" (lines 5324-5531). Four "Verified Buyer" cards (Emma Collins,
 * Michael Carter, Olivia Brooks, Daniel Walker) using the demo's
 * avatar-4..7.jpg photos. Each card pairs with a baby product mini-card —
 * wired via testimonial_product_ids in PageSeeder.
 *
 * Insertion order is REVERSED from rendering order: the testimonials index
 * sorts `orderByDesc('id')`, so the LAST inserted row becomes slide 1. To
 * render Emma → Michael → Olivia → Daniel (demo order), seed them reversed.
 */
class TestimonialSeeder extends \Database\Seeders\Themes\Main\TestimonialSeeder
{
    public function getTestimonials(): array
    {
        return [
            // Inserted first → lowest id → DESC sort puts it at slide 4.
            [
                'name' => 'Daniel Walker',
                'company' => 'Verified Buyer',
                'content' => '"Delivery was fast, packaging absolutely adorable, product quality truly amazing, every little detail felt genuinely cared for."',
                'image' => $this->filePath('testimonials/avatar-7.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Olivia Brooks',
                'company' => 'Verified Buyer',
                'content' => '"Everything feels carefully designed, beautifully made, and filled with genuine care. You can tell parents built this brand with heart."',
                'image' => $this->filePath('testimonials/avatar-6.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Michael Carter',
                'company' => 'Verified Buyer',
                'content' => '"Finally found bottles that don\'t leak, clean easily, save time, and make feeding so much simpler. Total lifesaver for busy parents!"',
                'image' => $this->filePath('testimonials/avatar-5.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            // Inserted last → highest id → DESC sort puts it at slide 1.
            [
                'name' => 'Emma Collins',
                'company' => 'Verified Buyer',
                'content' => '"The baby onesies are incredibly soft, super cozy, and gentle on delicate skin — my newborn sleeps so peacefully now!"',
                'image' => $this->filePath('testimonials/avatar-4.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
