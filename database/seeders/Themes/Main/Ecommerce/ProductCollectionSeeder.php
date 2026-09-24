<?php

namespace Database\Seeders\Themes\Main\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\ProductCollection;

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
        // Order matters: IDs 1..6 stay generic for variant themes; IDs 7..9
        // are the demo's banner trio (Shop Women / Men / Essentials) consumed
        // by the ecommerce-collections style-banner-grid on the Main homepage.
        $items = [
            ['name' => 'Spring Essentials',  'description' => 'Lightweight layers, fluid silhouettes, and the colors driving this seasons mood boards.', 'image' => 'cls-1.jpg'],
            ['name' => 'Limited Edition',    'description' => 'One-time runs from independent makers. Once they sell through, they are gone.',           'image' => 'cls-10.jpg'],
            ['name' => 'Best Sellers',       'description' => 'The pieces our customers reorder season after season.',                                     'image' => 'cls-11.jpg'],
            ['name' => 'Sustainable Picks',  'description' => 'Products with a verified sustainability story — recycled materials, low-impact dyes, or fair-wage manufacturing.', 'image' => 'cls-12.jpg'],
            ['name' => 'Workwear',           'description' => 'Tailored basics ready for the office, the studio, and everything in between.',              'image' => 'cls-1.jpg'],
            ['name' => 'Weekend',            'description' => 'Off-duty essentials that elevate the simplest jeans-and-tee uniform.',                       'image' => 'cls-10.jpg'],
            ['name' => 'Shop Women',         'description' => 'Curated wardrobes for every season — dresses, layering pieces, and weekend staples.',        'image' => 'cls-6.jpg'],
            ['name' => 'Shop Men',           'description' => 'Tailored essentials and modern basics — built to last beyond the trend cycle.',               'image' => 'cls-7.jpg'],
            ['name' => 'Shop Essentials',    'description' => 'The everyday pieces our customers reorder — denim, knits, and timeless outerwear.',          'image' => 'cls-8.jpg'],
        ];

        return collect($items)->map(function (array $item, int $i): array {
            $item['image'] = $this->filePath('collection/' . $item['image']);
            $item['is_featured'] = $i < 4;
            $item['status'] = BaseStatusEnum::PUBLISHED;

            return $item;
        })->all();
    }
}
