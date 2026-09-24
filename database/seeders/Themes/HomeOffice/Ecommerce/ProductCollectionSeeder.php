<?php

namespace Database\Seeders\Themes\HomeOffice\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Ecommerce\Models\ProductCollection;

/**
 * HomeOffice override — office equipment & gear collections.
 */
class ProductCollectionSeeder extends \Database\Seeders\Themes\Main\Ecommerce\ProductCollectionSeeder
{
    public function getCollections(): array
    {
        return [
            ['name' => 'Desks',           'description' => 'Sit-stand and traditional desks for productive workdays.',     'image' => 'cls-1.jpg'],
            ['name' => 'Office Chairs',   'description' => 'Ergonomic chairs that support every kind of workday.',          'image' => 'cls-10.jpg'],
            ['name' => 'Monitors',        'description' => '4K, ultrawide, and curved displays for serious productivity.',   'image' => 'cls-11.jpg'],
            ['name' => 'Keyboards & Mice', 'description' => 'Mechanical keyboards and precision mice for creators.',         'image' => 'cls-12.jpg'],
            ['name' => 'Audio',           'description' => 'Headphones, mics, and speakers for clear calls and focus.',      'image' => 'cls-13.jpg'],
            ['name' => 'Storage',         'description' => 'Cabinets, shelving, and organizers for tidy workspaces.',        'image' => 'cls-14.jpg'],
            ['name' => 'Lighting',        'description' => 'Task lamps and bias lighting for eye-friendly desks.',           'image' => 'cls-15.jpg'],
            ['name' => 'Tech Accessories', 'description' => 'Hubs, stands, and cables that complete the setup.',              'image' => 'cls-16.jpg'],
            ['name' => 'Conference Gear', 'description' => 'Webcams, conference cams, and speakerphones for hybrid teams.',  'image' => 'cls-17.jpg'],
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
