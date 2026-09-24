<?php

namespace Database\Seeders\Themes\HomeJewelry;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;

/**
 * HomeJewelry — fine jewelry blog categories tuned to care, investment, and trends.
 * Drives the homepage `blog-posts` slider via the home-jewelry.html demo.
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
                'name' => 'Care & Cleaning',
                'description' => 'Polishing, storage, and at-home rituals that keep gold, silver, and diamonds at their best.',
                'is_default' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Investment Pieces',
                'description' => 'Heritage motifs, certified diamonds, and jewelry built to outlast every trend cycle.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Style Inspiration',
                'description' => 'Layering, stacking, and pairing tips for everyday and occasion looks.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Trends',
                'description' => 'Yellow gold, mixed metals, and the silhouettes shaping each fine jewelry season.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Buyer Guides',
                'description' => 'Carat, cut, color, and clarity — practical guidance for jewelry purchases that matter.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
