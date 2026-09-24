<?php

namespace Database\Seeders\Themes\Main\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\ProductCategory;
use Botble\Slug\Facades\SlugHelper;

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

    /**
     * Top-level categories follow the demo's "Shop By Categories" order so the
     * homepage circular slider can pull the first five by name without hard-coded ids.
     * Mirrors html/home-fashion.html (activewear-focused fashion preset): Yoga,
     * Leggings, Tennis, Gym, Running.
     */
    public function getCategories(): array
    {
        return [
            [
                'name' => 'Yoga',
                'description' => 'Yoga apparel and accessories engineered for breath, balance, and flow.',
                'image' => 'categories/cate-37.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Leggings',
                'description' => 'High-rise compression leggings with four-way stretch and squat-proof fabric.',
                'image' => 'categories/cate-38.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Tennis',
                'description' => 'Court-ready tennis apparel — pleated skirts, polo dresses, performance shorts.',
                'image' => 'categories/cate-39.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Gym',
                'description' => 'Strength-training gear built for weight rooms and high-rep circuits.',
                'image' => 'categories/cate-40.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Running',
                'description' => 'Lightweight running apparel with reflective trims and sweat-wicking knits.',
                'image' => 'categories/cate-41.jpg',
                'is_featured' => true,
            ],
            // Non-featured taxonomy fillers — populate the storefront category tree
            // so variant themes that inherit Main's catalog can still find homes
            // for cross-category products. These do NOT appear on the homepage carousel.
            [
                'name' => 'Outerwear',
                'description' => 'Coats, jackets, and overshirts for every season.',
                'image' => 'categories/cate-1.jpg',
            ],
            [
                'name' => 'Tops & Shirts',
                'description' => 'Tees, button-ups, knits, and blouses cut for everyday wear.',
                'image' => 'categories/cate-2.jpg',
            ],
            [
                'name' => 'Bottoms',
                'description' => 'Trousers, denim, skirts, and shorts in modern silhouettes.',
                'image' => 'categories/cate-3.jpg',
            ],
            [
                'name' => 'Dresses',
                'description' => 'Mini, midi, and maxi dresses for every occasion.',
                'image' => 'categories/cate-4.jpg',
            ],
            [
                'name' => 'Footwear',
                'description' => 'Sneakers, boots, heels, and flats from leading independent makers.',
                'image' => 'categories/cate-5.jpg',
            ],
            [
                'name' => 'Accessories',
                'description' => 'Bags, wallets, belts, and jewelry to finish every look.',
                'image' => 'categories/cate-6.jpg',
            ],
            [
                'name' => 'Beauty & Cosmetics',
                'description' => 'Skincare, fragrance, and color cosmetics from cult-favorite brands.',
                'image' => 'categories/cate-7.jpg',
            ],
            [
                'name' => 'Electronics',
                'description' => 'Headphones, smart home, and personal tech worth keeping.',
                'image' => 'categories/cate-8.jpg',
            ],
            [
                'name' => 'Home & Furniture',
                'description' => 'Living room, bedroom, and dining pieces with sustainable provenance.',
                'image' => 'categories/cate-9.jpg',
            ],
            [
                'name' => 'Sports & Fitness',
                'description' => 'Activewear, yoga gear, and recovery essentials.',
                'image' => 'categories/cate-10.jpg',
            ],
            [
                'name' => 'Jewelry & Watches',
                'description' => 'Fine and demi-fine jewelry, plus mechanical timepieces.',
                'image' => 'categories/cate-11.jpg',
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
