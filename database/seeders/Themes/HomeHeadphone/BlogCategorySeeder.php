<?php

namespace Database\Seeders\Themes\HomeHeadphone;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;

/**
 * HomeHeadphone — blog categories tuned to the premium audio niche.
 * Drives the homepage `blog-posts` slider via the home-headphone.html demo.
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
                'name' => 'Audio Tech',
                'description' => 'Drivers, codecs, and the engineering behind how todays headphones actually sound.',
                'is_default' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Buying Guides',
                'description' => 'Recommendations for first-time buyers, upgraders, and audiophiles.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Listening Tips',
                'description' => 'Practical tips for safer, longer, and more enjoyable listening sessions.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Reviews',
                'description' => 'Long-term reviews and comparisons across price tiers and listening styles.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Music Culture',
                'description' => 'Interviews and features for the people who love the music as much as the gear.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
