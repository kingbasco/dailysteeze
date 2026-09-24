<?php

namespace Database\Seeders\Themes\HomePod\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\ProductCategory;
use Botble\Slug\Facades\SlugHelper;

/**
 * HomePod — print-on-demand / personalized gifts niche.
 * Nine top-level categories drive the homepage `categories-grid` slider via
 * cate-7..15.jpg images downloaded from the home-pod.html demo.
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
                'name' => 'Custom T-Shirts',
                'description' => 'Personalized cotton tees with your photos, names, and favorite memories printed in vivid color.',
                'image' => 'categories/pod/cate-7.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Mugs & Drinkware',
                'description' => 'Custom mugs, tumblers, and water bottles printed with photos and one-of-a-kind designs.',
                'image' => 'categories/pod/cate-8.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Wall Art',
                'description' => 'Photo prints, posters, and canvases that turn favorite moments into statement pieces.',
                'image' => 'categories/pod/cate-9.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Phone Cases',
                'description' => 'Slim, drop-tested phone cases with your custom photo or design — for every recent model.',
                'image' => 'categories/pod/cate-10.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Gifts & Occasions',
                'description' => 'Curated gift bundles for birthdays, weddings, anniversaries, and every milestone in between.',
                'image' => 'categories/pod/cate-11.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Personalized Decor',
                'description' => 'Engraved coasters, keepsake boxes, and decor that makes any room feel a little more like home.',
                'image' => 'categories/pod/cate-12.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Tote Bags',
                'description' => 'Heavy-duty cotton totes printed with photos, monograms, or original artwork.',
                'image' => 'categories/pod/cate-13.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Pillows',
                'description' => 'Custom-printed throw pillows that turn the couch or bedroom into a personal gallery.',
                'image' => 'categories/pod/cate-14.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Photo Books',
                'description' => 'Premium hardcover photo books for weddings, travels, and the moments worth keeping in print.',
                'image' => 'categories/pod/cate-15.jpg',
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
