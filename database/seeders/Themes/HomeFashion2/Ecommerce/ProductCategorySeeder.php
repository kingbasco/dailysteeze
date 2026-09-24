<?php

namespace Database\Seeders\Themes\HomeFashion2\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\ProductCategory;
use Botble\Slug\Facades\SlugHelper;

/**
 * HomeFashion2 — women's fashion accessories niche.
 * Five top-level categories drive the homepage `categories-grid` slider via
 * cate-1..5.jpg images downloaded from the home-fashion-2.html demo.
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
            // The 5 homepage-slider categories use the demo's portrait art
            // (categories/fashion-2/cate-N.jpg = 800×1066). The generic
            // categories/cate-N.jpg files are 500×500 square and render short
            // in the `category-v06` card (image height follows source aspect).
            [
                'name' => 'Clothing',
                'description' => 'Cotton tees, knits, coats, and seasonal staples for the modern wardrobe.',
                'image' => 'categories/fashion-2/cate-1.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Jewelry',
                'description' => 'Pearl, gold, and statement pieces curated for everyday elegance.',
                'image' => 'categories/fashion-2/cate-2.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Shoes',
                'description' => 'Leather boots, loafers, and heels that pair with every season.',
                'image' => 'categories/fashion-2/cate-3.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Bags',
                'description' => 'Shoulder bags, totes, and crossbody silhouettes crafted from premium leather.',
                'image' => 'categories/fashion-2/cate-4.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Wallets',
                'description' => 'Embossed wallets, cardholders, and coin purses for refined daily carry.',
                'image' => 'categories/fashion-2/cate-5.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Accessories',
                'description' => 'Silk scarves, belts, and finishing touches that elevate any outfit.',
            ],
            [
                'name' => 'Outerwear',
                'description' => 'Wool coats, denim jackets, and layering essentials for transitional weather.',
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
