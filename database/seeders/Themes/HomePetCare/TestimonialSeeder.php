<?php

namespace Database\Seeders\Themes\HomePetCare;

use Botble\Base\Enums\BaseStatusEnum;

/**
 * HomePetCare — pet-themed customer reviews mirroring html/home-pet-care.html
 * §8 (lines 2674-2740). Two "Verified Buyer" cards (Emma Collins, Daniel Parker)
 * using the demo's tes-5.jpg / tes-6.jpg photos.
 */
class TestimonialSeeder extends \Database\Seeders\Themes\Main\TestimonialSeeder
{
    public function getTestimonials(): array
    {
        return [
            [
                'name' => 'Emma Collins',
                'company' => 'Verified Buyer',
                'content' => 'Absolutely love this pet bed! My dog jumps on it the second he sees it. It\'s soft, durable, and looks so cute in my living room. Totally worth every cent!',
                'image' => $this->filePath('testimonials/tes-5.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Daniel Parker',
                'company' => 'Verified Buyer',
                'content' => 'This cat toy is a total hit! My kitty won\'t stop playing — she\'s running, jumping, and having the best time. Keeps her active and happy all day long!',
                'image' => $this->filePath('testimonials/tes-6.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
