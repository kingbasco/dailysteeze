<?php

namespace Database\Seeders\Themes\HomeJewelry\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\ProductCategory;
use Botble\Slug\Facades\SlugHelper;

/**
 * HomeJewelry — fine jewelry niche covering necklaces, earrings, rings, and diamonds.
 * Five top-level categories drive the homepage `categories-grid` slider via cate-43..47.jpg
 * images downloaded from the home-jewelry.html demo.
 */
class ProductCategorySeeder extends BaseSeeder
{
    public function run(): void
    {
        if (! is_plugin_active('ecommerce')) {
            return;
        }

        // No setBasePath — variant cate-43..47.jpg pre-copied into shared pool to avoid
        // BaseSeeder::filePath() path-mangling bug (preset 5 retro lesson C).

        ProductCategory::query()->truncate();

        foreach ($this->getCategories() as $order => $category) {
            $this->seedCategory($category, $order);
        }
    }

    public function getCategories(): array
    {
        return [
            [
                'name' => 'Necklaces',
                'description' => 'Pendants, link chains, and statement necklaces in 14k and 18k gold.',
                'image' => 'categories/cate-43.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Earrings',
                'description' => 'Studs, drops, and hoops crafted with diamonds, pearls, and precious stones.',
                'image' => 'categories/cate-44.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Bracelets',
                'description' => 'Tennis bracelets, bangles, and link styles for stacking or solo wear.',
                'image' => 'categories/cate-45.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Rings',
                'description' => 'Solitaires, eternity bands, and signet rings for everyday and milestone moments.',
                'image' => 'categories/cate-46.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Diamonds',
                'description' => 'GIA-certified loose stones and pre-set classic silhouettes for collectors.',
                'image' => 'categories/cate-47.jpg',
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
