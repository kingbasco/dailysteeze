<?php

namespace Database\Seeders\Themes\HomeCosmetic\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\ProductCategory;
use Botble\Slug\Facades\SlugHelper;

/**
 * HomeCosmetic — beauty & cosmetics niche categories.
 * Five top-level categories drive the homepage `categories-grid` slider. The
 * home-cosmetic.html demo ships no category images, so each is seeded with image=null.
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
                'name' => 'Skincare',
                'description' => 'Cleansers, serums, and creams formulated for every skin concern and condition.',
                'is_featured' => true,
            ],
            [
                'name' => 'Makeup',
                'description' => 'Lip, eye, and complexion essentials with clean pigments and buildable finishes.',
                'is_featured' => true,
            ],
            [
                'name' => 'Fragrance',
                'description' => 'Eau de parfums, body mists, and home scents crafted from refined ingredients.',
                'is_featured' => true,
            ],
            [
                'name' => 'Haircare',
                'description' => 'Shampoos, masks, and styling tools that restore shine and respect scalp health.',
                'is_featured' => true,
            ],
            [
                'name' => 'Body Care',
                'description' => 'Body lotions, scrubs, and bath rituals for soft, glowing skin head to toe.',
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
