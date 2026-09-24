<?php

namespace Database\Seeders\Themes\HomeSneaker;

use Botble\Base\Enums\BaseStatusEnum;

/**
 * HomeSneaker — 2 lifestyle testimonials matching home-sneaker.html demo
 * (lines 2750-2820). Uses tes-29/30.jpg (345x380 lifestyle photos) for
 * `testimonial-v05` style-card-image-left.
 */
class TestimonialSeeder extends \Database\Seeders\Themes\Main\TestimonialSeeder
{
    public function getTestimonials(): array
    {
        return [
            [
                'name' => 'Emma Roberts',
                'company' => '',
                'content' => '"Lightweight, cushioned, and great grip. Perfect for both gym sessions and running. Totally worth it!"',
                'image' => $this->filePath('testimonials/tes-29.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Daniel Parker',
                'company' => '',
                'content' => '"Sleek design and very breathable. Feels snug without being tight — comfortable even after a full day."',
                'image' => $this->filePath('testimonials/tes-30.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
