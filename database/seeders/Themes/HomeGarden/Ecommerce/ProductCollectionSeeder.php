<?php

namespace Database\Seeders\Themes\HomeGarden\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Ecommerce\Models\ProductCollection;

/**
 * HomeGarden override — gardening & outdoor collections.
 */
class ProductCollectionSeeder extends \Database\Seeders\Themes\Main\Ecommerce\ProductCollectionSeeder
{
    public function getCollections(): array
    {
        return [
            ['name' => 'Plants & Trees',     'description' => 'Indoor plants, outdoor trees, and seedlings to start your garden.', 'image' => 'cls-1.jpg'],
            ['name' => 'Garden Tools',       'description' => 'Pruners, shovels, and trowels for hands-on gardening.',                'image' => 'cls-10.jpg'],
            ['name' => 'Pots & Planters',    'description' => 'Ceramic, terracotta, and modern planters for every plant.',            'image' => 'cls-11.jpg'],
            ['name' => 'Seeds',              'description' => 'Heirloom, organic, and rare seeds to grow at home.',                    'image' => 'cls-12.jpg'],
            ['name' => 'Outdoor Furniture',  'description' => 'Patio chairs, tables, and loungers for warm-weather gatherings.',       'image' => 'cls-13.jpg'],
            ['name' => 'Lawn Care',          'description' => 'Mowers, edgers, and fertilizers to keep your lawn healthy.',            'image' => 'cls-14.jpg'],
            ['name' => 'Watering & Hoses',   'description' => 'Hoses, sprinklers, and watering cans for every routine.',                'image' => 'cls-15.jpg'],
            ['name' => 'Garden Decor',       'description' => 'Statues, lanterns, and decor to personalize the garden.',                'image' => 'cls-16.jpg'],
            ['name' => 'Greenhouses',        'description' => 'Mini-greenhouses and grow kits for serious cultivators.',                'image' => 'cls-17.jpg'],
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
