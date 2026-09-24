<?php

namespace Database\Seeders\Themes\HomeSneaker\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\ProductCategory;
use Botble\Slug\Facades\SlugHelper;

/**
 * HomeSneaker — sneaker niche covering outdoor, gym, road, speed, and lifestyle.
 * Five top-level categories drive the homepage `categories-grid` slider via cate-1..5.jpg
 * images downloaded from the home-sneaker.html demo.
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
                'name' => 'Outdoor Shoes',
                'description' => 'Trail and hiking shoes engineered for grip, stability, and rugged terrain.',
                'image' => 'categories/sneaker/cate-1.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Gym Shoes',
                'description' => 'Cross-trainers and lifting shoes with stable bases and lateral support.',
                'image' => 'categories/sneaker/cate-2.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Road Shoes',
                'description' => 'Daily trainers tuned for pavement, with cushioned midsoles and durable outsoles.',
                'image' => 'categories/sneaker/cate-3.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Speed Shoes',
                'description' => 'Carbon-plated racers and tempo shoes built for personal records and race days.',
                'image' => 'categories/sneaker/cate-4.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Lifestyle Shoes',
                'description' => 'Heritage silhouettes and modern court shoes that pair with daily wear.',
                'image' => 'categories/sneaker/cate-5.jpg',
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
