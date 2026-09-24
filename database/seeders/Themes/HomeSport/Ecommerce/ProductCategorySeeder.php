<?php

namespace Database\Seeders\Themes\HomeSport\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\ProductCategory;
use Botble\Slug\Facades\SlugHelper;

/**
 * HomeSport — sports and active-lifestyle categories.
 * Five top-level categories drive the homepage `categories-grid` slider.
 * The home-sport.html demo ships no category images, so each entry has image=null.
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
                'name' => 'Running Shoes',
                'description' => 'Cushioned trainers and lightweight racers for every distance.',
                'is_featured' => true,
            ],
            [
                'name' => 'Hand Weights',
                'description' => 'Dumbbells, kettlebells, and grip-friendly weights for at-home strength work.',
                'is_featured' => true,
            ],
            [
                'name' => 'Sports Apparel',
                'description' => 'Performance shorts, tops, and layering pieces engineered for movement.',
                'is_featured' => true,
            ],
            [
                'name' => 'Yoga Mats',
                'description' => 'High-grip yoga and pilates mats for studio and home practice.',
                'is_featured' => true,
            ],
            [
                'name' => 'Pickleball',
                'description' => 'Paddles, balls, and pickleball gear for the fastest-growing sport.',
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
