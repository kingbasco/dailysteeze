<?php

namespace Database\Seeders\Themes\HomeSport\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Ecommerce\Models\ProductCollection;

/**
 * HomeSport override — keeps the same 9-row order as Main so collection_ids
 * referenced from the theme's PageSeeder ('1,2,3' hero and '4,5,6' banner-grid)
 * keep working, but rewrites every slot to the sport preset's hero trio
 * (Performance / Precision Gear / Peak Performance) and banner-grid trio
 * (Strength Training / Outdoor Active / Court Sports) from
 * html/home-sport.html lines 1331-1394 and 2168-2237.
 */
class ProductCollectionSeeder extends \Database\Seeders\Themes\Main\Ecommerce\ProductCollectionSeeder
{
    public function getCollections(): array
    {
        return [
            ['name' => 'Performance',         'description' => 'Sport apparel and basics built for daily training — moisture-wicking tees, shorts, and active basics.', 'image' => 'cls-1.jpg'],
            ['name' => 'Precision Gear',      'description' => 'High-performance equipment dialed in for your ultimate game.',                                              'image' => 'cls-10.jpg'],
            ['name' => 'Peak Performance',    'description' => 'Pro-level gear for athletes chasing their best result.',                                                    'image' => 'cls-11.jpg'],
            // §4 Collection trio — names/descriptions/images mirror html/home-sport.html
            // lines 2168-2237 exactly (banner-62/63/64.jpg sport photography, not the
            // generic cls-*.jpg pool). `section => true` routes to the section/ folder.
            ['name' => 'Strength Training Essentials', 'description' => 'Build power and control', 'image' => 'banner-62.jpg', 'section' => true],
            ['name' => 'Outdoor Active Protection Gear', 'description' => 'Move safely outdoors.', 'image' => 'banner-63.jpg', 'section' => true],
            ['name' => 'Court Sports Game Gear', 'description' => 'Play compete enjoy.', 'image' => 'banner-64.jpg', 'section' => true],
            ['name' => 'Best Sellers',        'description' => 'The sport picks our customers reorder season after season.',                                                'image' => 'banner-1.jpg', 'section' => true],
            ['name' => 'New Arrivals',        'description' => 'Fresh drops from the brands powering elite athletes.',                                                      'image' => 'banner-2.jpg', 'section' => true],
            ['name' => 'Featured',            'description' => 'Hand-picked sport essentials our team is training in right now.',                                           'image' => 'banner-3.jpg', 'section' => true],
        ];
    }

    public function run(): void
    {
        if (! is_plugin_active('ecommerce')) {
            return;
        }

        ProductCollection::query()->truncate();

        foreach ($this->getCollections() as $i => $item) {
            // Banner trio (IDs 7-9) ships with section/banner-*.jpg from the
            // shared seeder pool; the rest reuse the shared collection/cls-*.jpg pool.
            $folder = ($item['section'] ?? false) ? 'section/' : 'collection/';
            unset($item['section']);

            $item['image'] = $this->filePath($folder . $item['image']);
            $item['is_featured'] = $i < 4;
            $item['status'] = BaseStatusEnum::PUBLISHED;

            ProductCollection::query()->create($item);
        }
    }
}
