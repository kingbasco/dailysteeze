<?php

namespace Database\Seeders\Themes\HomeMental\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\ProductCategory;
use Botble\Slug\Facades\SlugHelper;

/**
 * HomeMental — wellness/mental-health niche categories.
 * Five top-level categories drive the homepage `categories-grid` (limit=5) slider
 * via cate-1..5.png images downloaded from the home-mental.html demo.
 * Names + ordering mirror the demo's `<h6 class="cate_name">` text verbatim
 * (slides 2-6 in html/home-mental.html lines 1565-1685; slide 1 is the
 * "Sale Off" CTA card rendered by the partial, not a real category).
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
                'name' => 'Relaxation',
                'description' => 'Aromatherapy, meditation aids, and stress-relief essentials for daily decompression.',
                'image' => 'categories/cate-1.png',
                'is_featured' => true,
                'children' => [
                    [
                        'name' => 'Sleep & Recovery',
                        'children' => [
                            ['name' => 'Guided Meditation'],
                            ['name' => 'Deep Breathing'],
                            ['name' => 'Progressive Relaxation'],
                            ['name' => 'Calming Sounds'],
                        ],
                    ],
                    [
                        'name' => 'Stress Management Tools',
                        'children' => [
                            ['name' => 'Daily Stress Log'],
                            ['name' => 'Mood Tracker'],
                            ['name' => 'Stress-Level Quiz'],
                        ],
                    ],
                    [
                        'name' => 'Emotional Support Tips',
                        'children' => [
                            ['name' => 'Coping Methods'],
                            ['name' => 'Emotional Awareness'],
                            ['name' => 'Reset Routines'],
                            ['name' => 'Grounding Practices'],
                        ],
                    ],
                ],
            ],
            [
                'name' => 'Supplements',
                'description' => 'Daily greens, adaptogens, and mood-support supplements crafted with clean ingredients.',
                'image' => 'categories/cate-2.png',
                'is_featured' => true,
                'children' => [
                    [
                        'name' => 'Natural Remedies',
                        'children' => [
                            ['name' => 'Herbal Teas'],
                            ['name' => 'Aromatherapy Oils'],
                            ['name' => 'Calming Supplements'],
                            ['name' => 'Sleep-Friendly Herbs'],
                        ],
                    ],
                    [
                        'name' => 'Lifestyle Adjustments',
                        'children' => [
                            ['name' => 'Sleep Hygiene'],
                            ['name' => 'Workload Balancing'],
                            ['name' => 'Break Scheduling'],
                            ['name' => 'Digital Detox'],
                        ],
                    ],
                ],
            ],
            [
                'name' => 'Health Devices',
                'description' => 'Smart trackers, light therapy lamps, and wellness gadgets that work with your routine.',
                'image' => 'categories/cate-3.png',
                'is_featured' => true,
            ],
            [
                'name' => 'Body Care',
                'description' => 'Botanical body oils, balms, and skincare formulated to nourish and calm.',
                'image' => 'categories/cate-4.png',
                'is_featured' => true,
            ],
            [
                'name' => 'Mind Balance',
                'description' => 'Journals, breathwork tools, and mindfulness practices for inner balance.',
                'image' => 'categories/cate-5.png',
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
