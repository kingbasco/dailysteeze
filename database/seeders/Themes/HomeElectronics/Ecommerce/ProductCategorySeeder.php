<?php

namespace Database\Seeders\Themes\HomeElectronics\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\ProductCategory;
use Botble\Slug\Facades\SlugHelper;

/**
 * HomeElectronics — consumer electronics niche.
 * Eight top-level categories drive the homepage `categories-grid` slider via
 * cate-1..8.jpg images downloaded from the home-electronics.html demo.
 * Names mirror the demo's `<h6 class="cate_name">` text verbatim
 * (slides 1-8 in html/home-electronics.html lines 1454-1577) so the
 * categories-grid section matches demo content as well as styling.
 */
class ProductCategorySeeder extends BaseSeeder
{
    public function run(): void
    {
        if (! is_plugin_active('ecommerce')) {
            return;
        }

        $this->setBasePath(dirname(__DIR__) . '/files');

        ProductCategory::query()->truncate();

        foreach ($this->getCategories() as $order => $category) {
            $this->seedCategory($category, $order);
        }
    }

    public function getCategories(): array
    {
        return [
            [
                'name' => 'Learn More',
                'description' => 'Featured electronics curation — explore the latest gear, accessories, and gadgets.',
                'image' => 'categories/cate-1.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Smart Watches',
                'description' => 'Fitness trackers, smartwatches, and wearables that pair with your daily routine.',
                'image' => 'categories/cate-2.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'EarPhone',
                'description' => 'True wireless earbuds and in-ear monitors with rich sound and long battery life.',
                'image' => 'categories/cate-3.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Headphone',
                'description' => 'Over-ear, on-ear, and active noise-cancelling headphones for everyday and studio listening.',
                'image' => 'categories/cate-4.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Speaker',
                'description' => 'Portable Bluetooth speakers and home audio for room-filling sound anywhere.',
                'image' => 'categories/cate-5.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Smart Lamp',
                'description' => 'Wi-Fi smart lighting with adjustable warmth, color, and voice-assistant integration.',
                'image' => 'categories/cate-6.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Cable',
                'description' => 'USB-C, Lightning, and braided charging cables built to last.',
                'image' => 'categories/cate-7.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Accessories',
                'description' => 'Phone stands, hubs, sleeves, and everyday-carry essentials for your gear.',
                'image' => 'categories/cate-8.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Mouse',
                'description' => 'Computer mice and pointer accessories for daily workstations.',
                'is_featured' => false,
            ],
            [
                'name' => 'Keyboard',
                'description' => 'Keyboard accessories and creator desk essentials.',
                'is_featured' => false,
            ],
            [
                'name' => 'Mousepad',
                'description' => 'Desk mats, charging pads, and workspace surfaces.',
                'is_featured' => false,
            ],
            [
                'name' => 'Networking',
                'description' => 'Connected smart-home and networking accessories.',
                'is_featured' => false,
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
