<?php

namespace Database\Seeders\Themes\HomeSneaker;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;

/**
 * HomeSneaker — sneaker blog categories tuned to performance, releases, and care.
 * Drives the homepage `blog-posts` slider via the home-sneaker.html demo.
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
                'name' => 'Performance',
                'description' => 'Running, training, and court reviews backed by miles, drops, and gym sessions.',
                'is_default' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Style',
                'description' => 'Lifestyle silhouettes, color stories, and outfit edits that pair sneakers with daily wear.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Care Guide',
                'description' => 'Cleaning, deodorizing, and storage tips that keep every pair looking new.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'New Releases',
                'description' => 'Drop calendars, collaboration recaps, and the silhouettes worth the queue.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Athletic Tech',
                'description' => 'Foam compounds, plate stiffness, and the engineering behind modern performance shoes.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
