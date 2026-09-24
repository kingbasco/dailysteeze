<?php

namespace Database\Seeders\Themes\HomeDecor\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Ecommerce\Models\ProductCollection;

/**
 * HomeDecor override — home decor & furnishings collections.
 */
class ProductCollectionSeeder extends \Database\Seeders\Themes\Main\Ecommerce\ProductCollectionSeeder
{
    public function getCollections(): array
    {
        return [
            ['name' => 'Living Room',     'description' => 'Sofas, coffee tables, and accents to refresh the heart of the home.', 'image' => 'cls-1.jpg'],
            ['name' => 'Bedroom',         'description' => 'Calm and cozy beds, dressers, and nightstands for quiet retreats.',    'image' => 'cls-10.jpg'],
            ['name' => 'Dining',          'description' => 'Dining tables and chairs to gather everyone around the meal.',         'image' => 'cls-11.jpg'],
            ['name' => 'Lighting',        'description' => 'Lamps, sconces, and pendants to set the perfect mood.',                'image' => 'cls-12.jpg'],
            ['name' => 'Wall Art & Decor', 'description' => 'Prints, mirrors, and wall pieces that complete the space.',            'image' => 'cls-13.jpg'],
            ['name' => 'Rugs',            'description' => 'Soft rugs and runners to ground every room.',                          'image' => 'cls-14.jpg'],
            ['name' => 'Throws & Cushions', 'description' => 'Layer textures and color with curated throws and cushions.',           'image' => 'cls-15.jpg'],
            ['name' => 'Tableware',       'description' => 'Dishes, glassware, and serving pieces for everyday and entertaining.',  'image' => 'cls-16.jpg'],
            ['name' => 'Outdoor & Garden', 'description' => 'Outdoor seating and garden accents for porches and patios.',           'image' => 'cls-17.jpg'],
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
