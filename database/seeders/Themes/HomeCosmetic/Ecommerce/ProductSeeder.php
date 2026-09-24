<?php

namespace Database\Seeders\Themes\HomeCosmetic\Ecommerce;

use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Database\Seeders\Traits\HasProductSeeder;
use Botble\Ecommerce\Enums\ProductTypeEnum;
use Botble\Ecommerce\Enums\StockStatusEnum;
use Botble\Ecommerce\Models\Product;
use Illuminate\Support\Arr;

/**
 * HomeCosmetic — beauty & cosmetics catalog mirroring the home-cosmetic.html demo.
 * Six products covering complexion, lip, fragrance-adjacent, and skincare.
 *
 * Inherits the parent sale_price restoration hack from Main\ProductSeeder —
 * HasProductSeeder wipes seeded prices when generating random variations.
 */
class ProductSeeder extends BaseSeeder
{
    use HasProductSeeder;

    public function run(): void
    {
        if (! is_plugin_active('ecommerce')) {
            return;
        }

        // setBasePath() to a variant pool triggers BaseSeeder::filePath() path-mangling
        // bug (storage URLs become /storage/Users/.../variant/files/...). Variant images
        // were copied to the shared `database/seeders/files/products/` pool, so we let
        // the default base path resolve them cleanly.

        $catalog = $this->getProducts();

        $this->createProducts($catalog);

        $parents = Product::query()
            ->where('is_variation', false)
            ->orderBy('id')
            ->get();

        foreach ($parents as $i => $parent) {
            $entry = $catalog[$i] ?? null;
            if ($entry && isset($entry['sale_price']) && (float) $parent->sale_price !== (float) $entry['sale_price']) {
                $parent->sale_price = $entry['sale_price'];
                $parent->save();
            }
        }
    }

    protected function hasDigitalProducts(): bool
    {
        return false;
    }

    public function getProducts(): array
    {
        return collect($this->getCatalog())->map(function (array $entry): array {
            $images = collect($entry['images'] ?? [])
                ->map(fn (string $file): ?string => $this->safeFilePath('products/' . $file))
                ->filter()
                ->values()
                ->all();

            return array_merge([
                'product_type' => ProductTypeEnum::PHYSICAL,
                'stock_status' => StockStatusEnum::IN_STOCK,
                'image' => $images[0] ?? null,
                'images' => $images,
            ], Arr::except($entry, ['images']));
        })->all();
    }

    /**
     * Catalog of 6 cosmetic products. Each entry's images map to product-N.jpg
     * downloaded from the home-cosmetic.html demo.
     *
     * @return array<int, array{name:string, description:string, content:string, price:float, sale_price:float, images:array<int,string>}>
     */
    private function getCatalog(): array
    {
        // Image paths use the `cosmetic/` subdir of the shared products pool.
        // Product 1 (the §6 product-feature-zoom target) gets 5 single/detail-2*.jpg
        // images so the homepage thumbs+zoom gallery has 5 slides matching the demo.
        return [
            [
                'name' => 'Pillow talk plump effect lip',
                'description' => 'Creamy satin-finish lipstick in a flattering nude pink that suits every skin tone.',
                'content' => '<p>Long-wearing, hydrating formula with vitamin E and shea butter. Refillable bullet. Cruelty-free and vegan.</p>',
                'price' => 89.99,
                'sale_price' => 69.99,
                'images' => ['single/detail-2.jpg', 'single/detail-2_2.jpg', 'single/detail-2_3.jpg', 'single/detail-2_4.jpg', 'single/detail-2_5.jpg'],
            ],
            [
                'name' => 'Origins',
                'description' => 'Origins Ginger Burst savory hand & body wash with energizing botanical extracts.',
                'content' => '<p>Sulfate-free formula with ginger root, citrus peel, and aloe. 250ml pump bottle. Suitable for daily use.</p>',
                'price' => 49.99,
                'sale_price' => 29.99,
                'images' => ['cosmetic/product-2.jpg', 'cosmetic/product-2_2.jpg', 'cosmetic/product-2_3.jpg'],
            ],
            [
                'name' => 'Vanish Airbrush Pressed Powder',
                'description' => 'Featherweight pressed powder that blurs pores and locks makeup in place with an airbrushed finish.',
                'content' => '<p>Talc-free, finely milled. Eight shades for buildable, natural finish. Includes a vegan kabuki puff.</p>',
                'price' => 25.99,
                'sale_price' => 15.99,
                'images' => ['cosmetic/product-3.jpg', 'cosmetic/product-3_2.jpg'],
            ],
            [
                'name' => 'Supremya Baume',
                'description' => 'Rich overnight balm formulated to nourish and renew while you sleep.',
                'content' => '<p>Squalane, ceramides, and a peptide complex. 50ml glass jar with bamboo applicator. Massage in circular motions before bed.</p>',
                'price' => 79.99,
                'sale_price' => 45.99,
                'images' => ['cosmetic/product-4.jpg', 'cosmetic/product-4_2.jpg'],
            ],
            [
                'name' => 'Hydrating Serum',
                'description' => 'Hyaluronic acid serum that plumps, hydrates, and smooths fine lines on contact.',
                'content' => '<p>Five molecular weights of hyaluronic acid. Fragrance-free. 30ml bottle with airless pump.</p>',
                'price' => 49.99,
                'sale_price' => 39.99,
                'images' => ['cosmetic/product-5.jpg', 'cosmetic/product-5_2.jpg'],
            ],
            [
                'name' => 'Daily Sunscreen Light',
                'description' => 'Mineral SPF 50 sunscreen that finishes invisibly under makeup or alone.',
                'content' => '<p>Non-comedogenic. Reef-safe zinc oxide. 50ml tube. Reapply every two hours of sun exposure.</p>',
                'price' => 29.99,
                'sale_price' => 23.99,
                'images' => ['cosmetic/product-6.jpg', 'cosmetic/product-6_2.jpg', 'cosmetic/product-6_3.jpg'],
            ],
        ];
    }

    private function safeFilePath(string $path): ?string
    {
        try {
            return $this->filePath($path);
        } catch (\Throwable) {
            return null;
        }
    }
}
