<?php

namespace Database\Seeders\Themes\Main;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;

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
                'description' => 'Outfit ideas, capsule wardrobes, and seasonal trend reports curated by the Amerce editorial team.',
                'is_default' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Product Spotlights',
                'description' => 'Deep dives into materials, craftsmanship, and the stories behind our newest drops.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'How-To & Care',
                'description' => 'Practical guides for caring for your purchases — fabric care, leather conditioning, gadget setup.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Sustainability',
                'description' => 'Articles on circular fashion, ethical sourcing, and the brands moving the industry forward.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Buying Guides',
                'description' => 'Independent comparison guides to help you choose the product that fits your needs and budget.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Inside Amerce',
                'description' => 'Behind-the-scenes news, supplier visits, and updates from the Amerce team.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
