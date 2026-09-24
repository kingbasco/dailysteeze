<?php

namespace Database\Seeders\Themes\HomeDecor;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;

/**
 * HomeDecor — blog categories tuned to ergonomic and workspace-design niche.
 * Drives the homepage `blog-posts` slider via the home-decor.html demo.
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
                'description' => 'Posture, joint support, and the science of pain-free desk work.',
                'is_default' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Workspace Design',
                'description' => 'Layouts, lighting, and finishes for inspired and functional offices.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Wellness at Work',
                'description' => 'Movement breaks, eye strain, and habits that protect long-term health.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Buying Guides',
                'description' => 'Chair, desk, and accessory comparisons grounded in real-world testing.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Productivity',
                'description' => 'Workflows and rituals that help you focus deeply and finish well.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
