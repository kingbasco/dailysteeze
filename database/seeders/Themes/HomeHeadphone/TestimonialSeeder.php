<?php

namespace Database\Seeders\Themes\HomeHeadphone;

use Botble\Base\Enums\BaseStatusEnum;

/**
 * HomeHeadphone — audio-buyer reviews mirroring html/home-headphone.html §9
 * "Section Testimonials" (lines 3277-3435). Three "Verified Buyer" cards over a
 * full-bleed `tes-21.jpg` banner. The `style-v01-banner` card (`testimonial-v01
 * style-7`) renders no avatar — the `image` field is unused on render; each card
 * instead pairs with a product mini-card wired via `testimonial_product_ids` in
 * PageSeeder.
 *
 * Insertion order is REVERSED from rendering order: the testimonials index sorts
 * `orderByDesc('id')`, so the LAST inserted row becomes slide 1. To render
 * Sophia → Emma → Daniel (demo order), seed Daniel first, Sophia last.
 */
class TestimonialSeeder extends \Database\Seeders\Themes\Main\TestimonialSeeder
{
    public function getTestimonials(): array
    {
        return [
            // Inserted first → lowest id → DESC sort puts it at slide 3.
            [
                'name' => 'Daniel Reyes',
                'company' => 'Verified Buyer',
                'content' => '"Battery life is the real story here — I get through a full week of commutes on a single charge, and the quick-charge top-up genuinely lasts all day. The fit stays comfortable hours into a session."',
                'image' => $this->filePath('testimonials/avatar-3.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            // Inserted second → middle id → slide 2.
            [
                'name' => 'Emma Collins',
                'company' => 'Verified Buyer',
                'content' => '"The active noise cancellation is on another level. It smooths out the drone of a plane cabin completely, and switching to transparency mode for announcements is seamless. Easily the best pair I have owned."',
                'image' => $this->filePath('testimonials/avatar-2.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            // Inserted last → highest id → DESC sort puts it at slide 1.
            [
                'name' => 'Sophia Ramirez',
                'company' => 'Verified Buyer',
                'content' => '"With a dead-gorgeous design built from anodized aluminum, lambskin, and titanium, the MH40 looks and feels different from the monolithic plastic shells of most rivals. The sound is warm, detailed, and effortless."',
                'image' => $this->filePath('testimonials/avatar-1.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
