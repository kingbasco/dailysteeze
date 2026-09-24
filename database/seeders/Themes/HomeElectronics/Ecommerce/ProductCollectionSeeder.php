<?php

namespace Database\Seeders\Themes\HomeElectronics\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\ProductCollection;

/**
 * HomeElectronics — collection cards for the homepage.
 *
 * Mirrors html/home-electronics.html sections 2 & 3:
 *   1. Hear True Freedom in Every Beat (slider-1.jpg) — large hero, §2 left
 *   2. Desktop Sound (cls-9.jpg)        — §2 right top
 *   3. Smart Watch (cls-10.jpg)         — §2 right bottom
 *   4. Table Lamp Sale (cls-11.jpg)     — §3 left
 *   5. Hear Every Detail (cls-12.jpg)   — §3 right
 *
 * Replaces Main\ProductCollectionSeeder via DatabaseSeeder basename-key dedup.
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
        // Hero name carries `<br>` so the partial renders the demo's two-line h1.
        // `slider/electronics/slider-1.jpg` is the demo's earbuds hero image
        // (the bare `slider/slider-1.jpg` resolves to a fashion model in the
        // shared pool — wrong for electronics).
        $items = [
            ['name' => 'Hear True Freedom in <br> Every Beat', 'description' => 'Experience true wireless sound with deep bass, crystal clarity, and seamless connection made for music.', 'image' => 'slider/electronics/slider-1.jpg'],
            ['name' => 'Desktop Sound',     'description' => 'Up to 50% Off Bestsellers.', 'image' => 'collection/cls-9.jpg'],
            ['name' => 'Smart Watch',       'description' => 'Up to 25% Off Bestsellers.', 'image' => 'collection/cls-10.jpg'],
            ['name' => 'Table Lamp Sale',   'description' => 'Up to 50% Off Bestsellers.', 'image' => 'collection/cls-11.jpg'],
            ['name' => 'Hear Every Detail', 'description' => 'Power, comfort, clarity.',   'image' => 'collection/cls-12.jpg'],
        ];

        return collect($items)->map(function (array $item): array {
            $item['image'] = $this->filePath($item['image']);
            $item['is_featured'] = true;
            $item['status'] = BaseStatusEnum::PUBLISHED;

            return $item;
        })->all();
    }
}
