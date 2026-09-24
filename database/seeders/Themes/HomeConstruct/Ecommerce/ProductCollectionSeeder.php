<?php

namespace Database\Seeders\Themes\HomeConstruct\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Ecommerce\Models\ProductCollection;

/**
 * HomeConstruct override — construction & tools collections.
 */
class ProductCollectionSeeder extends \Database\Seeders\Themes\Main\Ecommerce\ProductCollectionSeeder
{
    public function getCollections(): array
    {
        return [
            ['name' => 'Power Tools',         'description' => 'Drills, saws, and grinders engineered for daily jobsite use.',     'image' => 'cls-1.jpg'],
            ['name' => 'Hand Tools',          'description' => 'Hammers, wrenches, and pliers built tough for any project.',        'image' => 'cls-10.jpg'],
            ['name' => 'Safety Gear',         'description' => 'Helmets, gloves, and PPE that meets the toughest standards.',       'image' => 'cls-11.jpg'],
            ['name' => 'Hardware & Fasteners', 'description' => 'Bolts, nails, screws, and brackets sourced for trade reliability.', 'image' => 'cls-12.jpg'],
            ['name' => 'Measuring',           'description' => 'Levels, tape measures, and lasers for precision every time.',       'image' => 'cls-13.jpg'],
            ['name' => 'Cutting & Drilling',  'description' => 'Saw blades, drill bits, and abrasives built to last.',              'image' => 'cls-14.jpg'],
            ['name' => 'Workwear',            'description' => 'Boots, gloves, and durable workwear for the trades.',                'image' => 'cls-15.jpg'],
            ['name' => 'Site Equipment',      'description' => 'Generators, ladders, and scaffolding to keep work moving.',          'image' => 'cls-16.jpg'],
            ['name' => 'Tool Storage',        'description' => 'Tool boxes, cabinets, and chests for serious organization.',         'image' => 'cls-17.jpg'],
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
