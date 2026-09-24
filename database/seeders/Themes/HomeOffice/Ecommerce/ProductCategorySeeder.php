<?php

namespace Database\Seeders\Themes\HomeOffice\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\ProductCategory;
use Botble\Slug\Facades\SlugHelper;

/**
 * HomeOffice — office equipment & ergonomic workspace niche.
 * Eight top-level categories drive the homepage `categories-grid` slider via
 * cate-1..8.jpg images downloaded from the home-office-equipment.html demo.
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
                'name' => 'Desks',
                'description' => 'Standing desks, writing desks, and compact home-office workstations built to last.',
                'image' => 'categories/office/cate-1.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Chairs',
                'description' => 'Ergonomic office chairs with lumbar, neck, and adjustable armrest support for full work days.',
                'image' => 'categories/office/cate-2.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Keyboards',
                'description' => 'Mechanical and low-profile keyboards engineered for typing comfort and productivity.',
                'image' => 'categories/office/cate-3.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Mouses',
                'description' => 'Silent-switch ergonomic mice with optional buttons and high-DPI sensors for fluid pointer control.',
                'image' => 'categories/office/cate-4.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Monitor Arms',
                'description' => 'Single and dual monitor arms that recover desk space and align screens at eye level.',
                'image' => 'categories/office/cate-5.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Smart Lights',
                'description' => 'Eye-friendly LED desk lamps with circadian-aware tones and integrated wireless charging.',
                'image' => 'categories/office/cate-6.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Storages',
                'description' => 'Filing cabinets, drawer units, and modular shelving that keep your workspace tidy and organized.',
                'image' => 'categories/office/cate-7.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Accessories',
                'description' => 'Cable management, mouse pads, footrests, and the small upgrades that quietly improve every desk.',
                'image' => 'categories/office/cate-8.jpg',
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
