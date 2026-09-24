<?php

namespace Database\Seeders\Themes\HomeFashion2\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Ecommerce\Models\ProductCollection;

/**
 * HomeFashion2 override — minimalist fashion collections.
 */
class ProductCollectionSeeder extends \Database\Seeders\Themes\Main\Ecommerce\ProductCollectionSeeder
{
    public function getCollections(): array
    {
        return [
            ['name' => 'New Arrivals',     'description' => 'Fresh drops curated each week.',                        'image' => 'cls-1.jpg'],
            ['name' => 'Best Sellers',     'description' => 'Pieces our community keeps coming back for.',            'image' => 'cls-10.jpg'],
            ['name' => 'Limited Edition',  'description' => 'Exclusive drops once they sell out, they are gone.',     'image' => 'cls-11.jpg'],
            ['name' => 'Outerwear',        'description' => 'Coats, jackets, and layering essentials for any season.', 'image' => 'cls-12.jpg'],
            ['name' => 'Knitwear',         'description' => 'Soft sweaters and cardigans for cooler days.',           'image' => 'cls-13.jpg'],
            ['name' => 'Bottoms',          'description' => 'Denim, trousers, and skirts for everyday wear.',         'image' => 'cls-14.jpg'],
            ['name' => 'Footwear',         'description' => 'Boots, sneakers, and heels to complete the look.',       'image' => 'cls-15.jpg'],
            ['name' => 'Accessories',      'description' => 'Bags, scarves, and finishing touches.',                  'image' => 'cls-16.jpg'],
            ['name' => 'Sale',             'description' => 'End-of-season prices on customer favorites.',            'image' => 'cls-17.jpg'],
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
