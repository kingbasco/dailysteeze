<?php

namespace Database\Seeders\Themes\HomeFashion2;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;

/**
 * HomeFashion2 — blog categories tuned to the women's fashion accessories niche.
 * Drives the homepage `blog-posts` slider via the home-fashion-2.html demo.
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
                'name' => 'Style Guides',
                'description' => 'Editor-led notes on outfit composition, color, and seasonal layering.',
                'is_default' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Trend Watch',
                'description' => 'What is rising on the runway and reaching everyday wardrobes this season.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Wardrobe Building',
                'description' => 'Capsule strategy, investment pieces, and how to make a small wardrobe go further.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Care & Maintenance',
                'description' => 'How to wash, store, and extend the life of knitwear, leather, and silk.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Editor Picks',
                'description' => 'Curated finds, behind-the-piece stories, and craft notes from the team.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
