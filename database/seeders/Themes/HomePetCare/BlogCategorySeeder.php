<?php

namespace Database\Seeders\Themes\HomePetCare;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;

/**
 * HomePetCare — blog categories tuned to the pet care niche.
 * Drives the homepage `blog-posts` slider via the home-pet-care.html demo.
 */
class BlogCategorySeeder extends BaseSeeder
{
    use HasBlogSeeder;

    public function run(): void
    {
        if (! is_plugin_active('blog')) {
            return;
        }

        $this->createBlogCategories($this->getCategories());
    }

    public function getCategories(): array
    {
        return [
            [
                'name' => 'Pet Health',
                'description' => 'Preventive care, supplements, and signs to watch for at every life stage.',
                'is_default' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Nutrition',
                'description' => 'Food choices, feeding schedules, and ingredients that fuel a long, healthy life.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Training',
                'description' => 'Positive-reinforcement training tips for puppies, kittens, and seasoned pets.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Pet Lifestyle',
                'description' => 'Travel, play, grooming, and the small joys of life with a four-legged friend.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Vet Tips',
                'description' => 'Practical advice from veterinary professionals on common questions and concerns.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
