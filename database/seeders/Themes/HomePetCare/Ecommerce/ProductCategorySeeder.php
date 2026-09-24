<?php

namespace Database\Seeders\Themes\HomePetCare\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\ProductCategory;
use Botble\Slug\Facades\SlugHelper;

/**
 * HomePetCare — pet care niche categories.
 * Seven top-level categories drive the homepage `categories-grid` slider via
 * cate-6..12.png images downloaded from the home-pet-care.html demo.
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
                'name' => 'Nutrition',
                'description' => 'Premium kibble, wet food, and treats formulated for every life stage.',
                'image' => 'categories/cate-6.png',
                'is_featured' => true,
            ],
            [
                'name' => 'Accessories',
                'description' => 'Collars, leashes, and bowls that combine durability with everyday comfort.',
                'image' => 'categories/cate-7.png',
                'is_featured' => true,
            ],
            [
                'name' => 'Apparel',
                'description' => 'Soft sweaters, raincoats, and cozy layers for pets who feel the chill.',
                'image' => 'categories/cate-8.png',
                'is_featured' => true,
            ],
            [
                'name' => 'Toys',
                'description' => 'Chew toys, plush companions, and enrichment puzzles that keep play meaningful.',
                'image' => 'categories/cate-9.png',
                'is_featured' => true,
            ],
            [
                'name' => 'Grooming',
                'description' => 'Shampoos, brushes, and tools that keep coats clean and skin healthy.',
                'image' => 'categories/cate-10.png',
                'is_featured' => true,
            ],
            [
                'name' => 'Health & Wellness',
                'description' => 'Supplements, dental care, and calming aids backed by veterinary research.',
                'image' => 'categories/cate-11.png',
                'is_featured' => true,
            ],
            [
                'name' => 'Travel',
                'description' => 'Carriers, harnesses, and travel essentials for stress-free adventures.',
                'image' => 'categories/cate-12.png',
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
