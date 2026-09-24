<?php

namespace Database\Seeders\Themes\HomeHeadphone\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Ecommerce\Models\ProductCollection;

/**
 * HomeHeadphone override — rewrites the Main 9-row collection set into the
 * 5 audio-niche cards used by html/home-headphone.html lines 2547-2615
 * (Game Mode / Active Life / Explore Your Sound World / Top Sale / Noise Off).
 *
 * IDs 1..5 power the section-banner-collection-v02 grid consumed by the
 * theme's ecommerce-collections shortcode (collection_ids="1,2,3,4,5").
 */
class ProductCollectionSeeder extends \Database\Seeders\Themes\Main\Ecommerce\ProductCollectionSeeder
{
    public function getCollections(): array
    {
        return [
            ['name' => 'Game Mode',                'description' => 'Low-latency gaming headsets tuned for competitive and immersive play.', 'image' => 'banner-42.jpg'],
            ['name' => 'Active Life',              'description' => 'Sweat-resistant earbuds and headphones built for movement.',              'image' => 'banner-43.jpg'],
            ['name' => 'Explore Your Sound World', 'description' => 'Headphones are here for every single moment of your life journey.',     'image' => 'banner-44.jpg'],
            ['name' => 'Top Sale',                 'description' => 'Best-selling audio gear our listeners reorder season after season.',     'image' => 'banner-45.jpg'],
            ['name' => 'Noise Off',                'description' => 'Active noise cancelling headphones for travel, focus, and quiet commutes.', 'image' => 'banner-46.jpg'],
        ];
    }

    public function run(): void
    {
        if (! is_plugin_active('ecommerce')) {
            return;
        }

        ProductCollection::query()->truncate();

        foreach ($this->getCollections() as $i => $item) {
            $item['image'] = $this->filePath('section/' . $item['image']);
            $item['is_featured'] = true;
            $item['status'] = BaseStatusEnum::PUBLISHED;

            ProductCollection::query()->create($item);
        }
    }
}
