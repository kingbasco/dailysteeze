<?php

namespace Database\Seeders\Themes\HomeCosmetic;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;

/**
 * HomeCosmetic — blog categories tuned to the beauty & cosmetics niche.
 * Drives the homepage `blog-posts` slider via the home-cosmetic.html demo.
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
                'name' => 'Skincare',
                'description' => 'Routines, ingredients, and ritual deep-dives for healthier, brighter skin.',
                'is_default' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Makeup',
                'description' => 'Application techniques, palette curation, and clean-pigment product picks.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Fragrance',
                'description' => 'Note breakdowns, layering tips, and finding a signature scent.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Beauty Tips',
                'description' => 'Daily beauty habits, tools, and small upgrades that elevate the routine.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Trends',
                'description' => 'What is shifting in beauty — sustainability, science, and seasonal looks.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
