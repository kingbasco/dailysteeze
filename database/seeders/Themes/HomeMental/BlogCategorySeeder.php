<?php

namespace Database\Seeders\Themes\HomeMental;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;

/**
 * HomeMental — blog categories tuned to mental wellness niche.
 * Drives the homepage `blog-posts` (limit=6) slider via the home-mental.html demo.
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
                'name' => 'Mindful Living',
                'description' => 'Daily practices, breathwork, and habits that help you find calm in everyday moments.',
                'is_default' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Sleep & Recovery',
                'description' => 'Evidence-based guides to better sleep, deep rest, and post-stress recovery.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Nutrition & Supplements',
                'description' => 'Clean nutrition, adaptogens, and the science of how food affects mood.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Movement & Breath',
                'description' => 'Gentle yoga, walking meditations, and breathwork practices for an embodied calm.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Stress Management',
                'description' => 'Tools and frameworks for navigating modern stress with intention and resilience.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
