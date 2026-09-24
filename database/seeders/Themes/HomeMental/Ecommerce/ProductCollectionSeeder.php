<?php

namespace Database\Seeders\Themes\HomeMental\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Ecommerce\Models\ProductCollection;

/**
 * HomeMental override — keeps the same 9-row order as Main so collection_ids
 * referenced from theme shortcodes (7,8,9) keep working, but rewrites the
 * banner trio (IDs 7,8,9) to the wellness preset's "Rest Better / Nourish /
 * Find Your Calm" cards from html/home-mental.html lines 1688-1775.
 */
class ProductCollectionSeeder extends \Database\Seeders\Themes\Main\Ecommerce\ProductCollectionSeeder
{
    public function getCollections(): array
    {
        return [
            ['name' => 'Daily Wellness',     'description' => 'Everyday essentials for body and mind — supplements, calming teas, and mindful tools.',         'image' => 'cls-1.jpg'],
            ['name' => 'Limited Edition',   'description' => 'Curated wellness drops from trusted makers — once they sell through, they are gone.',              'image' => 'cls-10.jpg'],
            ['name' => 'Best Sellers',      'description' => 'The wellness picks our customers reorder week after week.',                                          'image' => 'cls-11.jpg'],
            ['name' => 'Clean & Mindful',   'description' => 'Products with verified clean sourcing — third-party tested, low-impact, transparent supply chain.', 'image' => 'cls-12.jpg'],
            ['name' => 'Routine Builders',  'description' => 'Stack-ready essentials for morning rituals and evening wind-down.',                                  'image' => 'cls-1.jpg'],
            ['name' => 'Travel & On-the-Go', 'description' => 'Portable wellness for jet lag, long flights, and busy weeks.',                                       'image' => 'cls-10.jpg'],
            ['name' => 'Rest Better, Live <br> Brighter', 'description' => 'Discover calming products for <br> deeper, peaceful sleep.', 'image' => 'banner-1.jpg', 'section' => true],
            ['name' => 'Nourish From <br> Within',        'description' => 'Daily essentials to support <br> energy and balance.',     'image' => 'banner-2.jpg', 'section' => true],
            ['name' => 'Find Your Calm <br> Space',       'description' => 'Mindful pieces that bring ease <br> to every day.',        'image' => 'banner-3.jpg', 'section' => true],
        ];
    }

    public function run(): void
    {
        if (! is_plugin_active('ecommerce')) {
            return;
        }

        ProductCollection::query()->truncate();

        foreach ($this->getCollections() as $i => $item) {
            // Banner trio (IDs 7-9) ships with HomeMental's section/banner-*.jpg;
            // the rest reuse the shared collection/cls-*.jpg pool.
            $folder = ($item['section'] ?? false) ? 'section/' : 'collection/';
            unset($item['section']);

            $item['image'] = $this->filePath($folder . $item['image']);
            $item['is_featured'] = $i < 4;
            $item['status'] = BaseStatusEnum::PUBLISHED;

            ProductCollection::query()->create($item);
        }
    }
}
