<?php

namespace Database\Seeders\Themes\HomePod\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Ecommerce\Models\ProductCollection;

/**
 * HomePod override — replaces Main fashion collections with print-on-demand
 * themed promo content. IDs 4-8 power the §6 `ecommerce-collections
 * style-banner-grid-quad` 1+2+2 grid per html/home-pod.html (lines 2158-2233):
 * collection 4 = the "Save 25% Today" portrait hero, collections 5-8 = the four
 * `box-image_v03` promo cards ("Up To 35% Off" … "Limited Time Offer").
 */
class ProductCollectionSeeder extends \Database\Seeders\Themes\Main\Ecommerce\ProductCollectionSeeder
{
    public function getCollections(): array
    {
        return [
            ['name' => 'Custom T-Shirts',        'description' => 'Personalize cotton tees with your photos, names, and stories.',     'image' => 'cls-1.jpg'],
            ['name' => 'Mugs & Drinkware',       'description' => 'Custom mugs and tumblers printed with your favorite designs.',       'image' => 'cls-10.jpg'],
            ['name' => 'Wall Art Print',         'description' => 'Photo prints and posters that turn moments into statement pieces.',  'image' => 'cls-11.jpg'],
            // id 4 — §6 hero card (portrait: "Save 25% Today" + "T-Shirts, Hoodies & More").
            ['name' => 'Save 25% Today',             'description' => 'T-Shirts, Hoodies & More',  'image' => 'pod-hero-save25.jpg'],
            // ids 5-8 — §6 promo cards (box-image_v03, demo cate-12..15 art).
            ['name' => 'Up To 35% Off',              'description' => '',  'image' => 'pod-promo-12.jpg'],
            ['name' => 'Free Shipping On All Orders', 'description' => '',  'image' => 'pod-promo-13.jpg'],
            ['name' => 'Free Gift With Purchase',    'description' => '',  'image' => 'pod-promo-14.jpg'],
            ['name' => 'Limited Time Offer',         'description' => '',  'image' => 'pod-promo-15.jpg'],
            ['name' => 'Pet Portraits',          'description' => 'Hand-illustrated portraits of your pets on archival paper.',           'image' => 'cls-17.jpg'],
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
