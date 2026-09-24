<?php

namespace Database\Seeders\Themes\HomeOrganic\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\ProductCategory;
use Botble\Slug\Facades\SlugHelper;

/**
 * HomeOrganic — organic & whole-foods niche categories.
 * Five top-level categories drive the homepage `categories-grid` slider via
 * cate-32..36.jpg images downloaded from the home-organic.html demo.
 */
class ProductCategorySeeder extends BaseSeeder
{
    public function run(): void
    {
        if (! is_plugin_active('ecommerce')) {
            return;
        }

        // No setBasePath — variant cate-32..36.jpg pre-copied into shared pool to avoid
        // BaseSeeder::filePath() path-mangling bug (preset 4 retro lesson C).

        ProductCategory::query()->truncate();

        foreach ($this->getCategories() as $order => $category) {
            $this->seedCategory($category, $order);
        }
    }

    public function getCategories(): array
    {
        return [
            [
                'name' => 'Fresh From Nature',
                'description' => 'Seasonal fruits, vegetables, and ferments harvested from certified organic farms.',
                'image' => 'categories/organic/cate-32.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Grains & Superfoods',
                'description' => 'Ancient grains, sprouted seeds, and superfoods grown without synthetic inputs.',
                'image' => 'categories/organic/cate-33.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Pure Organic Oils',
                'description' => 'Cold-pressed oils, vinegars, and dressings extracted with patient, low-heat methods.',
                'image' => 'categories/organic/cate-34.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Pantry Essentials',
                'description' => 'Organic flours, sweeteners, and pantry staples for everyday clean cooking.',
                'image' => 'categories/organic/cate-35.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Herbs & Spices',
                'description' => 'Single-origin herbs and spices dried gently to keep aromatic oils intact.',
                'image' => 'categories/organic/cate-36.jpg',
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
