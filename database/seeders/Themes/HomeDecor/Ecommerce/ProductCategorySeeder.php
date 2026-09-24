<?php

namespace Database\Seeders\Themes\HomeDecor\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\ProductCategory;
use Botble\Slug\Facades\SlugHelper;

/**
 * HomeDecor — ergonomic and designer office furniture categories.
 * Five top-level categories drive the homepage `categories-grid` slider via
 * cate-27..31.jpg images downloaded from the home-decor.html demo.
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
                'name' => 'Ergonomic Chairs',
                'description' => 'Posture-supporting task chairs designed for hours of focused work.',
                'image' => 'categories/cate-27.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Standing Desks',
                'description' => 'Height-adjustable sit-stand desks engineered for whisper-quiet daily use.',
                'image' => 'categories/cate-28.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Work Essentials',
                'description' => 'Monitor arms, keyboard trays, and accessories that complete a healthy workspace.',
                'image' => 'categories/cate-29.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Home Office Setup',
                'description' => 'Curated furniture and lighting for the modern remote workspace.',
                'image' => 'categories/cate-30.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Gaming Ergonomics',
                'description' => 'Ergonomic gaming chairs and accessories built for long sessions.',
                'image' => 'categories/cate-31.jpg',
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
