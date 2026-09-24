<?php

namespace Database\Seeders\Themes\HomeAuto;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;

/**
 * HomeAuto — blog categories tuned to the automotive-parts niche.
 * Drives the homepage `blog-posts` slider via the home-auto.html demo.
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
                'name' => 'Maintenance',
                'description' => 'Service intervals, fluids, and routine care that keep your vehicle running.',
                'is_default' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Performance',
                'description' => 'Power upgrades, tuning, and drive-feel modifications backed by data.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'DIY Repair',
                'description' => 'Step-by-step guides for at-home repairs and weekend wrenching projects.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Buying Guides',
                'description' => 'OEM versus aftermarket, trim comparisons, and upgrade decisions explained.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Detailing',
                'description' => 'Wash, polish, and protect — keep your ride looking factory-fresh.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
