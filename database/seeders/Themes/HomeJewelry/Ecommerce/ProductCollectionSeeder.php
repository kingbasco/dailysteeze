<?php

namespace Database\Seeders\Themes\HomeJewelry\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\ProductCollection;

/**
 * HomeJewelry — 7 jewelry collections mirroring home-jewelry.html:
 *   IDs 1-3: "Section Collection" 3-card row (cls-27..29.jpg)
 *           — Shine Jewellery Collection / Luxury Gems Big Sale / Fresh Sparkle
 *   IDs 4-7: "Banner Collection" accordion-tabs (accordion-cls.jpg)
 *           — Elegant Gold / Sparkling Diamond / Chic Silver / Gemstone
 */
class ProductCollectionSeeder extends BaseSeeder
{
    public function run(): void
    {
        if (! is_plugin_active('ecommerce')) {
            return;
        }

        // No setBasePath — variant cls-27..29.jpg + accordion-cls.jpg pre-copied to shared
        // pool to avoid path-mangling bug (preset 5 retro lesson C).

        ProductCollection::query()->truncate();

        foreach ($this->getCollections() as $collection) {
            ProductCollection::query()->create($collection);
        }
    }

    public function getCollections(): array
    {
        $items = [
            [
                'name' => 'Shine Jewellery Collection',
                'description' => 'Polished pieces curated to catch the light from every angle.',
                'image' => 'collection/cls-27.jpg',
            ],
            [
                'name' => 'Luxury Gems Big Sale',
                'description' => 'Limited-time savings on rare gemstones and statement settings.',
                'image' => 'collection/cls-28.jpg',
            ],
            [
                'name' => 'Fresh Sparkle New Arrivals',
                'description' => 'The latest drops from our jewelers — designed for everyday wear.',
                'image' => 'collection/cls-29.jpg',
            ],
            [
                'name' => 'Elegant Gold Essentials',
                'description' => 'Timeless 14k and 18k gold pieces that anchor any jewelry wardrobe.',
                'image' => 'section/accordion-cls.jpg',
            ],
            [
                'name' => 'Sparkling Diamond Favorites',
                'description' => 'Dazzling diamond pieces that capture light beautifully, adding timeless elegance for special occasions or everyday sophisticated style.',
                'image' => 'section/accordion-cls.jpg',
            ],
            [
                'name' => 'Chic Silver Designs',
                'description' => 'Sterling silver with a modern edge — minimalist links, bold cuffs, and sculptural rings.',
                'image' => 'section/accordion-cls.jpg',
            ],
            [
                'name' => 'Gemstone Statement Pieces',
                'description' => 'Saturated stones in cocktail rings, drop earrings, and pendant necklaces ready to make an entrance.',
                'image' => 'section/accordion-cls.jpg',
            ],
        ];

        return collect($items)->map(function (array $item, int $i): array {
            $item['image'] = $this->filePath($item['image']);
            $item['is_featured'] = $i < 3;
            $item['status'] = BaseStatusEnum::PUBLISHED;

            return $item;
        })->all();
    }
}
