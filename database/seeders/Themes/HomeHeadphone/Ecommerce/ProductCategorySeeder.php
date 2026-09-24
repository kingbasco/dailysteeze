<?php

namespace Database\Seeders\Themes\HomeHeadphone\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\ProductCategory;
use Botble\Slug\Facades\SlugHelper;

/**
 * HomeHeadphone — premium wireless audio niche.
 * Five top-level categories. The home-headphone.html demo ships no category
 * imagery, so categories are seeded with image=null.
 */
class ProductCategorySeeder extends BaseSeeder
{
    public function run(): void
    {
        if (! is_plugin_active('ecommerce')) {
            return;
        }

        // No setBasePath — variant images pre-copied to shared pool (preset 5 retro lesson C).

        ProductCategory::query()->truncate();

        foreach ($this->getCategories() as $order => $category) {
            $this->seedCategory($category, $order);
        }
    }

    public function getCategories(): array
    {
        return [
            [
                'name' => 'Wireless Over-Ear',
                'description' => 'Premium over-ear headphones with rich, full-range sound and all-day comfort.',
                'is_featured' => true,
            ],
            [
                'name' => 'Gaming Headsets',
                'description' => 'Low-latency wireless and wired headsets tuned for competitive and immersive play.',
                'is_featured' => true,
            ],
            [
                'name' => 'ANC Headphones',
                'description' => 'Active noise cancelling headphones for travel, focus, and quieter daily commutes.',
                'is_featured' => true,
            ],
            [
                'name' => 'Wired Studio',
                'description' => 'Reference-grade wired studio headphones for mixing, mastering, and critical listening.',
                'is_featured' => true,
            ],
            [
                'name' => 'In-Ear Monitors',
                'description' => 'IEMs with balanced armatures and dynamic drivers for stage and audiophile listening.',
                'is_featured' => true,
            ],
        ];
    }

    private function seedCategory(array $data, int $order, int $parentId = 0): void
    {
        $children = $data['children'] ?? [];
        unset($data['children']);

        $category = ProductCategory::query()->create([
            'name' => $data['name'],
            'description' => $data['description'] ?? null,
            'image' => isset($data['image']) ? $this->filePath($data['image']) : null,
            'parent_id' => $parentId,
            'order' => $order,
            'is_featured' => $data['is_featured'] ?? false,
            'status' => BaseStatusEnum::PUBLISHED,
        ]);

        SlugHelper::createSlug($category);

        foreach ($children as $childOrder => $child) {
            $this->seedCategory($child, $childOrder, $category->getKey());
        }
    }
}
