<?php

namespace Database\Seeders\Themes\HomeBag\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Ecommerce\Models\ProductCollection;

/**
 * HomeBag override — bags & accessories collections.
 */
class ProductCollectionSeeder extends \Database\Seeders\Themes\Main\Ecommerce\ProductCollectionSeeder
{
    public function getCollections(): array
    {
        // Order matters — homepage §1 (`collection_ids='1,2,3'`) consumes the first 3
        // entries. Demo home-bag-accessories.html L1320-1389 maps these to:
        //   bag/cls-1.jpg → woman with bucket bag (Handbags)
        //   bag/cls-2.jpg → woman with sunglasses (Belts)
        //   bag/cls-3.jpg → hand with rings    (Jewelry)
        // Paths are namespaced under collection/bag/ to avoid shared-pool collision
        // (memory: `feedback-seeder-shared-pool-category-collision.md` — bare
        // `collection/cls-N.jpg` already exists in public/storage from other themes
        // with fashion art, so BaseSeeder::filePath() short-circuits and never
        // uploads HomeBag's source).
        return [
            ['name' => 'Handbags',         'description' => 'Crossbodies, totes, and shoulder bags for every season.',     'image' => 'bag/cls-1.jpg'],
            ['name' => 'Belts',            'description' => 'Classic dress and casual belts for every wardrobe.',              'image' => 'bag/cls-2.jpg'],
            ['name' => 'Jewelry',          'description' => 'Necklaces, rings, and earrings to layer with every outfit.',      'image' => 'bag/cls-3.jpg'],
            ['name' => 'Backpacks',        'description' => 'Daily commuters and weekend carry-alls built to last.',         'image' => 'cls-10.jpg'],
            ['name' => 'Wallets',          'description' => 'Slim cardholders and bifolds in premium leather.',                'image' => 'cls-11.jpg'],
            ['name' => 'Sunglasses',       'description' => 'Trend-led shades and timeless aviators for any face shape.',     'image' => 'cls-13.jpg'],
            ['name' => 'Watches',          'description' => 'Quartz, automatic, and smart watches with refined finishes.',     'image' => 'cls-14.jpg'],
            ['name' => 'Travel Bags',      'description' => 'Weekenders, duffles, and luggage for every getaway.',             'image' => 'cls-16.jpg'],
            ['name' => 'Hats & Scarves',   'description' => 'Seasonal accessories that complete the look.',                    'image' => 'cls-17.jpg'],
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
