<?php

namespace Database\Seeders\Themes\HomeBaby;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;

/**
 * HomeBaby — blog categories tuned to the baby & infant niche.
 * Drives the homepage `blog-posts` slider via the home-baby.html demo.
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
                'name' => 'New Parents',
                'description' => 'Guides and reassurance for the first weeks and months with a newborn.',
                'is_default' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Baby Care',
                'description' => 'Daily care, gentle products, and habits that support a healthy little one.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Sleep & Routines',
                'description' => 'Soothing rituals, nap schedules, and tools for calmer nights.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Nutrition',
                'description' => 'Feeding milestones, weaning, and clean nutrition for growing babies.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Safety',
                'description' => 'Practical safety advice, gear checks, and peace-of-mind essentials.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
