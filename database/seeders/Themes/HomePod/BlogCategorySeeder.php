<?php

namespace Database\Seeders\Themes\HomePod;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;

/**
 * HomePod — blog categories tuned to the personalized print-on-demand niche.
 * Drives the homepage `blog-posts` slider via the home-pod.html demo.
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
                'name' => 'Gift Ideas',
                'description' => 'Curated gift inspiration for birthdays, weddings, anniversaries, and every milestone.',
                'is_default' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Customization Tips',
                'description' => 'How to design, photograph, and proof a personalized product youll actually love.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Occasions',
                'description' => 'Holiday-by-holiday and milestone-by-milestone guides for thoughtful gifting.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Personalization Trends',
                'description' => 'Whats new in print-on-demand — typography, illustration, and design trends.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Behind the Print',
                'description' => 'A look inside our print process, materials, and quality standards.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
