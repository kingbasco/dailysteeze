<?php

namespace Database\Seeders\Themes\HomeElectronics;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;

/**
 * HomeElectronics — blog categories tuned to the consumer electronics niche.
 * Drives the homepage `blog-posts` slider via the home-electronics.html demo.
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
                'name' => 'New Releases',
                'description' => 'Hands-on first looks and launch coverage of the latest gadgets and gear.',
                'is_default' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Tech Reviews',
                'description' => 'In-depth, no-hype reviews of phones, audio, wearables, and creator gear.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Smart Home',
                'description' => 'Practical guides for building and automating a smarter, calmer home.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Buying Guides',
                'description' => 'Buying advice that compares specs, value, and real-world use.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Lifestyle',
                'description' => 'Tips and rituals for using technology with intention every day.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
