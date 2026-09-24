<?php

namespace Database\Seeders\Themes\HomeSport;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;

/**
 * HomeSport — blog categories tuned to the active-lifestyle and sports niche.
 * Drives the homepage `blog-posts` slider via the home-sport.html demo.
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
                'name' => 'Training',
                'description' => 'Programs, sets, and progressions for runners, lifters, and weekend athletes.',
                'is_default' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Recovery',
                'description' => 'Sleep, mobility, and active recovery practices that keep you in the game.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Gear Reviews',
                'description' => 'Honest takes on shoes, apparel, and training equipment — tested under load.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Lifestyle',
                'description' => 'Habits, mindset, and stories from athletes balancing real life and the work.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Sports News',
                'description' => 'Updates from the worlds of running, racquet sports, and emerging fitness movements.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
