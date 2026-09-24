<?php

namespace Database\Seeders\Themes\HomeBaby\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\ProductCategory;
use Botble\Slug\Facades\SlugHelper;

/**
 * HomeBaby — baby & infant niche categories.
 * Five top-level categories drive the homepage `categories-grid` slider via
 * cate-16..20.jpg images downloaded from the home-baby.html demo. Each root
 * carries sub-categories so the header "Browse by Category" fly-out renders.
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
                'name' => 'Feeding Gear',
                'description' => 'Bottles, bibs, and feeding essentials designed for safe and easy mealtimes.',
                'image' => 'categories/cate-16.jpg',
                'is_featured' => true,
                'children' => [
                    ['name' => 'Bottles & Teats'],
                    ['name' => 'Bibs & Burp Cloths'],
                    ['name' => 'Pacifiers & Soothers'],
                    ['name' => 'Feeding Sets & Utensils'],
                ],
            ],
            [
                'name' => 'Baby Wear',
                'description' => 'Soft cotton onesies, booties, and everyday outfits for delicate baby skin.',
                'image' => 'categories/cate-17.jpg',
                'is_featured' => true,
                'children' => [
                    ['name' => 'Bodysuits & Onesies'],
                    ['name' => 'Booties & Socks'],
                    ['name' => 'Hats & Mittens'],
                    ['name' => 'Sleepwear'],
                ],
            ],
            [
                'name' => 'Play Time',
                'description' => 'Wooden teethers, plush toys, and gentle play companions for early development.',
                'image' => 'categories/cate-18.jpg',
                'is_featured' => true,
                'children' => [
                    ['name' => 'Teethers'],
                    ['name' => 'Plush Toys'],
                    ['name' => 'Activity Gyms'],
                    ['name' => 'Wooden Toys'],
                ],
            ],
            [
                'name' => 'Bath Care',
                'description' => 'Hooded towels, lotions, and bath time essentials that keep skin soft and calm.',
                'image' => 'categories/cate-19.jpg',
                'is_featured' => true,
                'children' => [
                    ['name' => 'Hooded Towels'],
                    ['name' => 'Lotions & Oils'],
                    ['name' => 'Bath Tubs & Seats'],
                    ['name' => 'Washcloths & Sponges'],
                ],
            ],
            [
                'name' => 'Baby Room',
                'description' => 'Cribs, mobiles, sleeping bags, and nursery essentials that shape a soothing space.',
                'image' => 'categories/cate-20.jpg',
                'is_featured' => true,
                'children' => [
                    ['name' => 'Cribs & Bassinets'],
                    ['name' => 'Sleeping Bags'],
                    ['name' => 'Mobiles & Night Lights'],
                    ['name' => 'Nursery Decor'],
                ],
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
