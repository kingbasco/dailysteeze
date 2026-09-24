<?php

namespace Database\Seeders\Themes\HomePetCare\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Ecommerce\Models\ProductCollection;

/**
 * HomePetCare override — pet-niche collections replacing Main fashion entries.
 * Powers PageSeeder §2 banner-collection block + §-anywhere ecommerce-collections shortcodes.
 */
class ProductCollectionSeeder extends \Database\Seeders\Themes\Main\Ecommerce\ProductCollectionSeeder
{
    /**
     * Collection #1, #2, #3 power the homepage banner-collection block
     * (style-banner-split-v04). Names + descriptions + image filenames mirror
     * html/home-pet-care.html lines 1370-1441 verbatim:
     *   #1 hero (col-left)   = banner-15.jpg, "Everything Your Pet Deserves"
     *   #2 side top          = cls-18.jpg, "Cat Feast"
     *   #3 side bottom       = cls-17.jpg, "Pet Fashion"
     * Image paths can include a folder prefix (e.g. `section/banner-15.jpg`);
     * paths without `/` default to the `collection/` subfolder.
     */
    public function getCollections(): array
    {
        return [
            ['name' => 'Everything Your Pet Deserves', 'description' => 'Experience true wireless sound with deep bass, crystal clarity.',      'image' => 'section/banner-15.jpg'],
            ['name' => 'Cat Feast',                    'description' => 'Healthy, tasty meals for cats',                                          'image' => 'cls-18.jpg'],
            ['name' => 'Pet Fashion',                  'description' => 'Cute outfits for every pet',                                             'image' => 'cls-17.jpg'],
            ['name' => 'Toy & Playtime',               'description' => 'Durable toys built for tug, fetch, and pounce — in every size.',       'image' => 'cls-10.jpg'],
            ['name' => 'Grooming & Care',              'description' => 'Shampoos, brushes, and nail kits for at-home grooming made easy.',     'image' => 'cls-11.jpg'],
            ['name' => 'Treats & Snacks',              'description' => 'Reward-worthy treats your pets will sit, stay, and beg for.',          'image' => 'cls-12.jpg'],
            ['name' => 'Pet Health Hub',               'description' => 'Vitamins, dental care, and wellness picks recommended by vets.',       'image' => 'cls-13.jpg'],
            ['name' => 'Travel & Outdoor',             'description' => 'Carriers, leashes, and harnesses for adventures big and small.',       'image' => 'cls-14.jpg'],
            ['name' => 'Small Pets & Birds',           'description' => 'Cozy habitats and nutrition for hamsters, rabbits, birds, and more.',  'image' => 'cls-15.jpg'],
        ];
    }

    public function run(): void
    {
        if (! is_plugin_active('ecommerce')) {
            return;
        }

        ProductCollection::query()->truncate();

        foreach ($this->getCollections() as $i => $item) {
            // Allow per-row folder override (e.g. section/banner-15.jpg) — bare
            // filenames default to the collection/ subfolder.
            $rel = str_contains($item['image'], '/') ? $item['image'] : 'collection/' . $item['image'];
            $item['image'] = $this->filePath($rel);
            $item['is_featured'] = $i < 4;
            $item['status'] = BaseStatusEnum::PUBLISHED;
            ProductCollection::query()->create($item);
        }
    }
}
