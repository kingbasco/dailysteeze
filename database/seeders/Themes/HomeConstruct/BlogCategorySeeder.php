<?php

namespace Database\Seeders\Themes\HomeConstruct;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;

/**
 * HomeConstruct — blog categories tuned to construction-trade niche.
 * Drives the homepage `blog-posts` slider via the home-construction.html demo.
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
                'name' => 'Safety',
                'description' => 'OSHA standards, PPE selection, and habits that prevent jobsite injuries.',
                'is_default' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Tools & Equipment',
                'description' => 'In-depth reviews and care guides for the tools you rely on every day.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Techniques',
                'description' => 'Trade-tested methods for cutting, drilling, fastening, and finishing.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Project Guides',
                'description' => 'Step-by-step walkthroughs for common construction and remodel projects.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Trade News',
                'description' => 'Industry updates, code changes, and material trends for the trades.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
