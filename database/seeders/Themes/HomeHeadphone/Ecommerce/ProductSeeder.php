<?php

namespace Database\Seeders\Themes\HomeHeadphone\Ecommerce;

use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Database\Seeders\Traits\HasProductSeeder;
use Botble\Ecommerce\Enums\ProductTypeEnum;
use Botble\Ecommerce\Enums\StockStatusEnum;
use Botble\Ecommerce\Models\Product;
use Illuminate\Support\Arr;

/**
 * HomeHeadphone — premium audio catalog mirroring the home-headphone.html demo.
 * Seven products covering wireless over-ears, ANC travel, gaming, studio, and IEMs.
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

        // No setBasePath — variant images bulk-copied to shared pool's `products/headphone/` (preset 5 retro lessons C+F).

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
                ->map(fn (string $file): ?string => $this->safeFilePath('products/headphone/' . $file))
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
     * Catalog of 7 premium audio products. Each entry's images map to
     * product-N.jpg downloaded from the home-headphone.html demo.
     *
     * @return array<int, array{name:string, description:string, content:string, price:float, sale_price:float, images:array<int,string>}>
     */
    private function getCatalog(): array
    {
        return [
            [
                // §8 "Banner Product Single" hero product — needs the full detail-4
                // gallery set so product-feature-zoom renders its thumbnail strip.
                'name' => 'MH40 Wireless Over-Ear',
                'description' => 'Heritage-styled wireless over-ear with hand-stitched leather and 30 hours of battery.',
                'content' => '<p>40mm Beryllium drivers, USB-C fast charge, and aluminum yokes. A premium daily driver designed to last.</p>',
                'price' => 399.00,
                'sale_price' => 329.00,
                'images' => [
                    'detail-4.jpg', 'detail-4_2.jpg', 'detail-4_3.jpg', 'detail-4_4.jpg',
                    'detail-4_5.jpg', 'detail-4_6.jpg', 'detail-4_7.jpg',
                ],
            ],
            [
                'name' => 'MW75 Active Noise Cancelling',
                'description' => 'Smart adaptive ANC with four mics and head-detection auto-pause for travel and focus.',
                'content' => '<p>Lambskin earpads, sapphire-glass touch panels, and high-resolution aptX Adaptive support.</p>',
                'price' => 599.00,
                'sale_price' => 499.00,
                'images' => ['product-2.jpg'],
            ],
            [
                'name' => 'MG20 Wireless Gaming',
                'description' => 'Low-latency wireless gaming headset with dual-source mixing and detachable boom mic.',
                'content' => '<p>2.4GHz USB dongle plus Bluetooth multipoint. THX Spatial Audio. 22-hour battery, USB-C fast charge.</p>',
                'price' => 449.00,
                'sale_price' => 379.00,
                'images' => ['product-3.jpg'],
            ],
            [
                'name' => 'Studio Reference Pro',
                'description' => 'Closed-back wired studio headphones tuned for accurate mixing and tracking.',
                'content' => '<p>Replaceable cables and earpads. Flat frequency response down to 8Hz. Foldable for travel.</p>',
                'price' => 269.00,
                'sale_price' => 219.00,
                'images' => ['product-4.jpg'],
            ],
            [
                'name' => 'Daily Wireless Earbuds',
                'description' => 'True wireless earbuds with adaptive ANC, IPX5 sweat resistance, and 30 hours total battery.',
                'content' => '<p>Six-mic call clarity, multipoint pairing, and wireless charging case. Three included tip sizes.</p>',
                'price' => 199.00,
                'sale_price' => 149.00,
                'images' => ['product-5.jpg'],
            ],
            [
                'name' => 'Travel ANC Headphone',
                'description' => 'Foldable ANC headphone tuned for long-haul flights and noisy commutes.',
                'content' => '<p>Up to 50 hours of battery, USB-C fast charge, and a hard travel case included.</p>',
                'price' => 349.00,
                'sale_price' => 279.00,
                'images' => ['product-6.jpg'],
            ],
            [
                'name' => 'Audiophile Open-Back',
                'description' => 'Open-back planar magnetic headphones for spacious imaging and detailed listening at home.',
                'content' => '<p>Dual-entry detachable cable. Velour earpads. Includes 1/4" and 3.5mm adapter.</p>',
                'price' => 799.00,
                'sale_price' => 649.00,
                'images' => ['product-7.jpg'],
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
