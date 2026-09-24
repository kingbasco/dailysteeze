<?php

namespace Database\Seeders\Themes\HomeCosmetic\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\ProductCollection;

/**
 * HomeCosmetic — beauty/skincare collection cards. Replaces Main's fashion-themed
 * collections via DatabaseSeeder basename-key dedup.
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
        $items = [
            ['name' => 'Glow Essentials',    'description' => 'Brightening serums and tonics for radiant, even-toned skin.', 'image' => 'collection/cls-1.jpg'],
            ['name' => 'Hydration Heroes',   'description' => 'Moisturizers and treatments that lock in lasting comfort.',    'image' => 'collection/cls-2.jpg'],
            ['name' => 'Lip & Color',        'description' => 'Plumping lip masks, glossy finishes, and signature shades.',   'image' => 'collection/cls-3.jpg'],
            ['name' => 'Clean Beauty',       'description' => 'Vegan, cruelty-free formulas with clinically tested actives.', 'image' => 'collection/cls-4.jpg'],
            ['name' => 'Spa Rituals',        'description' => 'At-home spa essentials for unhurried self-care moments.',      'image' => 'collection/cls-5.jpg'],
        ];

        return collect($items)->map(function (array $item, int $i): array {
            $item['image'] = $this->filePath($item['image']);
            $item['is_featured'] = $i < 3;
            $item['status'] = BaseStatusEnum::PUBLISHED;

            return $item;
        })->all();
    }
}
