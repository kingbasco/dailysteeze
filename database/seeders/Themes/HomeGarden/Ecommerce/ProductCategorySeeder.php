<?php

namespace Database\Seeders\Themes\HomeGarden\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Facades\MetaBox;
use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\ProductCategory;
use Botble\Slug\Facades\SlugHelper;

/**
 * HomeGarden — indoor plants & garden niche categories.
 * Five top-level categories drive the homepage `categories-grid` slider. The
 * home-garden.html demo ships no category images, so each is seeded with image=null.
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
                'name' => 'Plants & Garden',
                'description' => 'Indoor and outdoor plants ready to settle into their next home.',
                'is_featured' => true,
            ],
            [
                'name' => 'Plant Care & Nutrients',
                'description' => 'Fertilizers, soil amendments, and plant tonics for steady, healthy growth.',
                'is_featured' => true,
            ],
            [
                'name' => 'Planters & Pots',
                'description' => 'Ceramic, terracotta, and woven planters that complement every interior.',
                'is_featured' => true,
            ],
            [
                'name' => 'Plant Tools',
                'description' => 'Pruners, watering cans, and trowels designed for daily plant care.',
                'is_featured' => true,
            ],
            [
                'name' => 'Home Decor',
                'description' => 'Botanical-inspired decor — frames, vases, and accents that bring the outside in.',
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

        MetaBox::saveMetaBoxData($category, 'enabled_size_guide', false);

        foreach ($children as $childOrder => $child) {
            $this->seedCategory($child, $childOrder, $category->getKey());
        }
    }
}
