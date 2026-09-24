<?php

namespace Database\Seeders\Themes\HomeGarden;

use Botble\Base\Enums\BaseStatusEnum;

class TestimonialSeeder extends \Database\Seeders\Themes\Main\TestimonialSeeder
{
    public function getTestimonials(): array
    {
        return [
            [
                'name' => 'Emma Collins',
                'company' => 'Verified Buyer',
                'content' => 'They arrived healthy, and even more beautiful than the photos. I’ve already recommended them to all my friends!',
                'image' => $this->filePath('testimonials/tes-22.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Marcus R.',
                'company' => 'Verified Buyer',
                'content' => 'I’m Seriously Impressed With This Shop. The Packaging Was Secure, The Plant Looked Perfect',
                'image' => $this->filePath('testimonials/tes-23.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Daniel K.',
                'company' => 'Verified Buyer',
                'content' => 'It Brightens Up My Desk And Makes The Whole Room Feel Fresher. I’ll Definitely Be Buying More Soon!',
                'image' => $this->filePath('testimonials/tes-24.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
