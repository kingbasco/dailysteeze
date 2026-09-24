<?php

namespace Database\Seeders\Themes\HomeBag\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\ProductCategory;
use Botble\Slug\Facades\SlugHelper;

/**
 * HomeBag — bag & accessories niche covering bags, hats, belts, and small leather goods.
 * Six top-level categories drive the homepage `categories-grid` slider via cate-58..63.jpg
 * images downloaded from the home-bag-accessories.html demo.
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
                'name' => 'Bags',
                'description' => 'Totes, hobos, crossbodies, and clutches in soft suede and full-grain leather.',
                'image' => 'categories/cate-58.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Beanie',
                'description' => 'Wool and cashmere beanies in classic ribbed and slouchy fits.',
                'image' => 'categories/cate-59.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Belts',
                'description' => 'Slim and statement belts with brushed brass and antique silver buckles.',
                'image' => 'categories/cate-60.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Jewelry',
                'description' => 'Statement earrings, layered necklaces, and stacking rings for every season.',
                'image' => 'categories/cate-61.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Mittens',
                'description' => 'Cashmere-lined mittens and gloves for cold-weather layering.',
                'image' => 'categories/cate-62.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Shoes',
                'description' => 'Leather boots, loafers, and ankle silhouettes that pair across seasons.',
                'image' => 'categories/cate-63.jpg',
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
