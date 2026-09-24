<?php

namespace Database\Seeders\Themes\HomeOffice;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;

/**
 * HomeOffice — blog categories tuned to the office equipment & ergonomic workspace niche.
 * Drives the homepage `blog-posts` slider via the home-office-equipment.html demo.
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
                'name' => 'Ergonomics',
                'description' => 'Posture, monitor height, and movement — the small adjustments that protect your body at the desk.',
                'is_default' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Productivity',
                'description' => 'Workflows, focus rituals, and software tips that turn busy days into productive ones.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Workspace Design',
                'description' => 'Layouts, lighting, and design ideas for home offices that feel calm and look great.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Buying Guides',
                'description' => 'No-hype recommendations for chairs, desks, monitors, and the gear worth saving up for.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Wellness at Work',
                'description' => 'Mental health, breaks, and recovery practices for sustainable work-from-anywhere days.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
