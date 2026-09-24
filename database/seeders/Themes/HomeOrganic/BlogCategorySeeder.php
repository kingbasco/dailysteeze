<?php

namespace Database\Seeders\Themes\HomeOrganic;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;

/**
 * HomeOrganic — blog categories tuned to the organic & whole-foods niche.
 * Drives the homepage `blog-posts` slider via the home-organic.html demo.
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
                'name' => 'Whole Foods',
                'description' => 'Cooking, sourcing, and storing minimally processed foods that nourish.',
                'is_default' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Superfoods',
                'description' => 'Spirulina, chaga, and the plants with outsized nutritional density.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Organic Living',
                'description' => 'Reducing pesticide load, supporting regenerative growers, and small daily swaps.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Recipes',
                'description' => 'Plant-forward recipes built around seasonal, certified-organic ingredients.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Nutrition Science',
                'description' => 'Evidence-based nutrition without the hype — what current research actually shows.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
