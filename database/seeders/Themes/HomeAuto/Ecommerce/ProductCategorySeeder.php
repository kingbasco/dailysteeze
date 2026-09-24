<?php

namespace Database\Seeders\Themes\HomeAuto\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\ProductCategory;
use Botble\Slug\Facades\SlugHelper;

/**
 * HomeAuto — automotive parts and accessories niche categories.
 * Six top-level categories drive the homepage `categories-grid` slider via
 * cate-21..26.jpg images downloaded from the home-auto.html demo.
 */
class ProductCategorySeeder extends BaseSeeder
{
    public function run(): void
    {
        if (! is_plugin_active('ecommerce')) {
            return;
        }

        ProductCategory::query()->truncate();

        foreach ($this->getCategories() as $order => $category) {
            $this->seedCategory($category, $order);
        }
    }

    public function getCategories(): array
    {
        return [
            [
                'name' => 'Brake Pads',
                'description' => 'Premium ceramic and semi-metallic brake pads for confident stopping power.',
                'image' => 'categories/cate-21.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Air Filters',
                'description' => 'Performance and OEM-grade engine air filters for cleaner intake and efficiency.',
                'image' => 'categories/cate-22.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Brake Rotors',
                'description' => 'Vented and slotted brake discs engineered for heat dissipation and durability.',
                'image' => 'categories/cate-23.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Brake Hydraulics',
                'description' => 'Power steering pumps, master cylinders, and hydraulic components built to last.',
                'image' => 'categories/cate-24.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Oil Filters',
                'description' => 'High-flow oil filtration for extended engine life and peak performance.',
                'image' => 'categories/cate-25.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Lighting',
                'description' => 'LED bulbs, projector headlights, and accessory lighting for visibility and style.',
                'image' => 'categories/cate-26.jpg',
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
