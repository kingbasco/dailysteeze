<?php

namespace Database\Seeders\Themes\HomeFurniture\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\ProductCategory;
use Botble\Slug\Facades\SlugHelper;

/**
 * HomeFurniture — designer furniture and home staples categories.
 * Six top-level categories drive the homepage `categories-grid` slider via
 * cate-1..6.jpg images downloaded from the home-furniture.html demo.
 */
class ProductCategorySeeder extends BaseSeeder
{
    public function run(): void
    {
        if (! is_plugin_active('ecommerce')) {
            return;
        }

        // Use shared seeders/files/ pool (NOT variant HomeFurniture/files). BaseSeeder::filePath()
        // can't strip the variant absolute path from the storage key — when basePath points to
        // a variant pool, RvMedia uploads with a broken `/users/<absolute>/...` folder key.
        // The namespaced cate-*.jpg sources are pre-copied into seeders/files/categories/furniture/
        // (kept in version control alongside variant files).

        ProductCategory::query()->truncate();

        foreach ($this->getCategories() as $order => $category) {
            $this->seedCategory($category, $order);
        }
    }

    public function getCategories(): array
    {
        return [
            [
                'name' => 'New Arrivals',
                'description' => 'The latest releases from our designer roster — fresh forms and finishes.',
                'image' => 'categories/furniture/cate-1.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Sofas',
                'description' => 'Two- and three-seat sofas, modular sectionals, and statement loveseats.',
                'image' => 'categories/furniture/cate-2.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Chairs',
                'description' => 'Lounge chairs, accent seats, and dining chairs sourced from artisan makers.',
                'image' => 'categories/furniture/cate-3.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Tables',
                'description' => 'Dining tables, coffee tables, and side tables in wood, stone, and steel.',
                'image' => 'categories/furniture/cate-4.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Beds',
                'description' => 'Platform beds, upholstered headboards, and bedroom anchor pieces.',
                'image' => 'categories/furniture/cate-5.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Storage',
                'description' => 'Shelving, sideboards, and credenzas crafted to organize beautifully.',
                'image' => 'categories/furniture/cate-6.jpg',
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
