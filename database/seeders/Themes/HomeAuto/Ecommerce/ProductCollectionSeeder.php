<?php

namespace Database\Seeders\Themes\HomeAuto\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Ecommerce\Models\ProductCollection;

/**
 * HomeAuto override — automotive-niche collections replacing Main fashion entries.
 */
class ProductCollectionSeeder extends \Database\Seeders\Themes\Main\Ecommerce\ProductCollectionSeeder
{
    public function getCollections(): array
    {
        return [
            ['name' => 'Performance Parts',     'description' => 'High-performance upgrades engineered for power and precision on every road.', 'image' => 'cls-1.jpg'],
            ['name' => 'Engine & Drivetrain',   'description' => 'Pistons, belts, and gaskets — OEM-grade essentials for every powertrain.',     'image' => 'cls-10.jpg'],
            ['name' => 'Suspension & Brakes',   'description' => 'Shocks, struts, rotors, and pads to keep every drive smooth and safe.',         'image' => 'cls-11.jpg'],
            ['name' => 'Tires & Wheels',        'description' => 'Track-tested tires and alloy wheels built for grip, balance, and style.',       'image' => 'cls-12.jpg'],
            ['name' => 'Lighting & Electrical', 'description' => 'LED headlights, fog kits, and harnesses for visibility and reliability.',       'image' => 'cls-13.jpg'],
            ['name' => 'Tools & Garage',        'description' => 'Repair kits, lifts, and tool sets for every wrench-day in your garage.',         'image' => 'cls-14.jpg'],
            ['name' => 'Interior & Comfort',    'description' => 'Seat covers, mats, and accessories to refine every mile inside the cabin.',     'image' => 'cls-15.jpg'],
            ['name' => 'Body & Exterior',       'description' => 'Spoilers, bumpers, and protective film for a track-ready exterior.',           'image' => 'cls-16.jpg'],
            ['name' => 'Fluids & Maintenance',  'description' => 'Premium oils, filters, and additives keeping your engine in peak shape.',       'image' => 'cls-17.jpg'],
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
