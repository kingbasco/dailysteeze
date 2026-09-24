<?php

namespace Database\Seeders\Themes\HomeFurniture;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;

/**
 * HomeFurniture — blog categories tuned to designer-furniture niche.
 * Drives the homepage `blog-posts` slider via the home-furniture.html demo.
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
                'name' => 'Style Inspiration',
                'description' => 'Mood boards, palette stories, and rooms that show whats possible.',
                'is_default' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Care & Maintenance',
                'description' => 'How to keep wood, leather, and upholstery looking their best for decades.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Buying Guides',
                'description' => 'Sofa, mattress, and dining-table comparisons grounded in real-world testing.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Behind the Craft',
                'description' => 'Workshop visits, maker profiles, and the people behind your favorite pieces.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Spaces',
                'description' => 'Real homes, real apartments — design ideas you can actually use.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
