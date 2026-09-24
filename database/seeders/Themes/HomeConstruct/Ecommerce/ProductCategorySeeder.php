<?php

namespace Database\Seeders\Themes\HomeConstruct\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\ProductCategory;
use Botble\Slug\Facades\SlugHelper;

/**
 * HomeConstruct — construction tools and trade-supply categories.
 * Ten top-level categories drive the homepage `categories-grid` slider via
 * cate-48..57.jpg images downloaded from the home-construction.html demo.
 * Names mirror the demo's `<p class="cate-name">` text verbatim
 * (slides 1-10 in html/home-construction.html) so the categories-grid
 * section matches demo content as well as styling.
 */
class ProductCategorySeeder extends BaseSeeder
{
    public function run(): void
    {
        if (! is_plugin_active('ecommerce')) {
            return;
        }

        // No setBasePath — variant cate-48..57.jpg pre-copied into shared pool to avoid
        // the BaseSeeder variant-basePath bug (broken /storage/users/<absolute>/ keys).
        ProductCategory::query()->truncate();

        foreach ($this->getCategories() as $order => $category) {
            $this->seedCategory($category, $order);
        }
    }

    public function getCategories(): array
    {
        return [
            [
                'name' => 'Power Tools',
                'description' => 'Cordless drills, grinders, and saws built for jobsite reliability.',
                'image' => 'categories/cate-48.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Hand Tools',
                'description' => 'Hammers, wrenches, screwdrivers, and the essentials of every tool belt.',
                'image' => 'categories/cate-49.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Safety Gear',
                'description' => 'Helmets, boots, and high-visibility apparel that meet OSHA standards.',
                'image' => 'categories/cate-50.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Measuring Tools',
                'description' => 'Tape measures, laser levels, and squares for jobsite precision.',
                'image' => 'categories/cate-51.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Cutting Tools',
                'description' => 'Saw blades, snips, and cutting tools engineered for clean breaks.',
                'image' => 'categories/cate-52.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Drilling Tools',
                'description' => 'Drill bits, hammer drills, and impact drivers for any substrate.',
                'image' => 'categories/cate-53.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Fastening Tools',
                'description' => 'Nail guns, staplers, and impact drivers for fast, repeatable assembly.',
                'image' => 'categories/cate-54.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Lifting Gear',
                'description' => 'Hoists, slings, and rigging hardware for safe heavy-load handling.',
                'image' => 'categories/cate-55.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Electrical Tools',
                'description' => 'Multimeters, wire strippers, and testers for clean electrical work.',
                'image' => 'categories/cate-56.jpg',
                'is_featured' => true,
            ],
            [
                'name' => 'Site Equipment',
                'description' => 'Generators, mixers, and jobsite gear that keep the site running.',
                'image' => 'categories/cate-57.jpg',
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
