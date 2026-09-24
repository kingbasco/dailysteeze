<?php

namespace Database\Seeders\Themes\HomeFurniture\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\ProductCollection;

/**
 * HomeFurniture — collection cards for the homepage Featured Collection (§5)
 * and any banner-split tiles. Mirrors html/home-furniture.html demo (lines
 * 1655-1700-ish): 3-up swiper of `box-image_v06 style-2 hover-img` cards
 * using cls-1/2/3.jpg furniture lifestyle imagery.
 *
 * Replaces Main\ProductCollectionSeeder via DatabaseSeeder basename-key dedup.
 * Uses shared seeders/files/ pool (lessons learned: don't `setBasePath` outside it).
 */
class ProductCollectionSeeder extends BaseSeeder
{
    public function run(): void
    {
        if (! is_plugin_active('ecommerce')) {
            return;
        }

        ProductCollection::query()->truncate();

        foreach ($this->getCollections() as $collection) {
            ProductCollection::query()->create($collection);
        }
    }

    public function getCollections(): array
    {
        // Furniture-themed collection trio shown in §5 ("Featured Collection").
        // Names align with the demo's three lifestyle stills.
        $items = [
            // cls-1..3 namespaced under collection/furniture/ to avoid shared-pool
            // collision (CDP baseline 2026-05-15: shared pool had 9-19KB fashion art,
            // HomeFurniture source was 50-150KB furniture rooms). cls-4/5 stay on
            // shared pool since variant only ships 3 source files.
            ['name' => 'Modern Living Room',  'description' => 'Sofas, accent chairs, and tables curated for the way you live now.', 'image' => 'collection/furniture/cls-1.jpg'],
            ['name' => 'Calm Bedroom',        'description' => 'Beds, nightstands, and storage built for restful sleep and quiet mornings.', 'image' => 'collection/furniture/cls-2.jpg'],
            ['name' => 'Workspace Essentials', 'description' => 'Desks, lighting, and seating for a focused, design-forward home office.', 'image' => 'collection/furniture/cls-3.jpg'],
            ['name' => 'Storage & Organization', 'description' => 'Shelving and storage that double as design statements.', 'image' => 'collection/cls-4.jpg'],
            ['name' => 'Tables & Surfaces',   'description' => 'Coffee tables, side tables, and surfaces for every room.', 'image' => 'collection/cls-5.jpg'],
        ];

        return collect($items)->map(function (array $item, int $i): array {
            $item['image'] = $this->filePath($item['image']);
            $item['is_featured'] = $i < 3;
            $item['status'] = BaseStatusEnum::PUBLISHED;

            return $item;
        })->all();
    }
}
