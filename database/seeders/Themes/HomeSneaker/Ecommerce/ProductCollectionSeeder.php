<?php

namespace Database\Seeders\Themes\HomeSneaker\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Ecommerce\Models\ProductCollection;

/**
 * HomeSneaker override — replaces Main fashion collections with sneaker-themed
 * promo content. IDs 1+2 power the §4 `ecommerce-collections style-banner-grid`
 * 2-up banner row (BIG SEASON SALE / SALE OFF UP TO 50%) per
 * html/home-sneaker.html lines 2020-2050.
 *
 * Overrides Main's run() to resolve `image` field with `collection/` subdir
 * prefix — Main's run() stores raw filenames which RvMedia can't find at
 * /storage/ root. (Same fix-pattern as preset 7 HomeSport's CollectionSeeder.)
 */
class ProductCollectionSeeder extends \Database\Seeders\Themes\Main\Ecommerce\ProductCollectionSeeder
{
    public function getCollections(): array
    {
        return [
            ['name' => 'BIG SEASON SALE',     'description' => 'SALE OFF UP TO 50% — Limited time only on top performance shoes.', 'image' => 'cls-1.jpg'],
            ['name' => 'SALE OFF UP TO 50%',  'description' => 'Big season sale — get the latest sneaker styles at unbeatable prices.', 'image' => 'cls-10.jpg'],
            ['name' => 'New Arrivals',        'description' => 'Fresh drops from the brands powering elite athletes.',                'image' => 'cls-11.jpg'],
            ['name' => 'Featured',            'description' => 'Hand-picked sneaker essentials our team is wearing right now.',       'image' => 'cls-12.jpg'],
            ['name' => 'Best Sellers',        'description' => 'The sneaker picks our customers reorder season after season.',        'image' => 'cls-13.jpg'],
            ['name' => 'Performance',         'description' => 'Built for daily training — moisture-wicking, supportive, durable.',  'image' => 'cls-14.jpg'],
            ['name' => 'Shop Men',            'description' => 'Athletic sneakers for men — running, training, lifestyle.',           'image' => 'cls-6.jpg'],
            ['name' => 'Shop Women',          'description' => 'Athletic sneakers for women — running, training, lifestyle.',         'image' => 'cls-7.jpg'],
            ['name' => 'Shop Essentials',     'description' => 'Daily-wear sneakers built to last beyond the trend cycle.',           'image' => 'cls-8.jpg'],
        ];
    }

    public function run(): void
    {
        if (! is_plugin_active('ecommerce')) {
            return;
        }

        ProductCollection::query()->truncate();

        foreach ($this->getCollections() as $i => $item) {
            $item['image'] = $this->filePath('collection/' . $item['image']);
            $item['is_featured'] = $i < 4;
            $item['status'] = BaseStatusEnum::PUBLISHED;
            ProductCollection::query()->create($item);
        }
    }
}
