<?php

namespace Database\Seeders\Themes\HomeOrganic;

use Botble\Base\Enums\BaseStatusEnum;

/**
 * HomeOrganic — 3 lifestyle testimonials matching home-organic.html demo
 * (lines 2510-2649). Uses tes-13/14/15.jpg (410x273 lifestyle photos)
 * instead of Main's small avatar headshots.
 */
class TestimonialSeeder extends \Database\Seeders\Themes\Main\TestimonialSeeder
{
    public function getTestimonials(): array
    {
        return [
            [
                'name' => 'Emily R.',
                'company' => 'Verified Buyer',
                'content' => '“The vegetables are always fresh and full of flavor. You can really taste the difference compared to supermarket produce!”',
                'image' => $this->filePath('testimonials/tes-13.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Sarah',
                'company' => 'Verified Buyer',
                'content' => '“I love knowing my family is eating clean, pesticide-free food. The quality and freshness never disappoint.”',
                'image' => $this->filePath('testimonials/tes-14.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Daniel',
                'company' => 'Verified Buyer',
                'content' => '“Fast delivery, eco-friendly packaging, and everything tastes just like it came straight from the farm.”',
                'image' => $this->filePath('testimonials/tes-15.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
