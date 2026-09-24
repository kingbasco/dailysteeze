<?php

namespace Database\Seeders\Themes\HomeBag;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;

/**
 * HomeBag — bag & accessories blog categories tuned to leather care, edits, and trends.
 * Drives the homepage `blog-posts` slider via the home-bag-accessories.html demo.
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
                'name' => 'Style Edit',
                'description' => 'Curated bag and accessory edits for every occasion — work, travel, and weekend.',
                'is_default' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Bag Care',
                'description' => 'Cleaning, storage, and conditioning rituals to extend the life of your investment pieces.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Material Guides',
                'description' => 'Suede, full-grain leather, and exotic materials — what to buy and how to maintain it.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Trends',
                'description' => 'Hardware, silhouettes, and color stories shaping each accessory season.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Behind the Brand',
                'description' => 'Workshops, artisans, and origin stories from the brands we carry.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
