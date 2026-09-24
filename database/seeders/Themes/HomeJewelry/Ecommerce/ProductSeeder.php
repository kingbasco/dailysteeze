<?php

namespace Database\Seeders\Themes\HomeJewelry\Ecommerce;

use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Database\Seeders\Traits\HasProductSeeder;
use Botble\Ecommerce\Enums\ProductTypeEnum;
use Botble\Ecommerce\Enums\StockStatusEnum;
use Botble\Ecommerce\Models\Product;
use Illuminate\Support\Arr;

/**
 * HomeJewelry — fine jewelry catalog mirroring the home-jewelry.html demo.
 * Eight products covering bangles, necklaces, earrings, pendants, and rings.
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

        // No setBasePath — variant images bulk-copied into shared pool's `products/jewelry/`
        // subdir to avoid path-mangling bug + Main fashion `product-N.jpg` collision (preset 5 retro lessons C + F).

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
                ->map(fn (string $file): ?string => $this->safeFilePath('products/jewelry/' . $file))
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
     * Catalog of 8 fine jewelry products. Each entry's images map to product-N.jpg
     * downloaded from the home-jewelry.html demo.
     *
     * @return array<int, array{name:string, description:string, content:string, price:float, sale_price:float, images:array<int,string>}>
     */
    private function getCatalog(): array
    {
        return [
            [
                'name' => 'Tiffany Lock Bangle',
                'description' => 'Heritage padlock-clasp bangle in 18k yellow gold with a hinged opening.',
                'content' => '<p>Hand-finished 18k gold. Hinged open-and-close lock mechanism. Available in 60mm and 65mm sizes. Comes in a hand-stamped jewelry pouch.</p>',
                'price' => 1299.00,
                'sale_price' => 999.00,
                'images' => ['product-1.jpg'],
            ],
            [
                'name' => 'Link Necklace Gold',
                'description' => 'Polished paperclip-link necklace in 14k yellow gold with an 18-inch length.',
                'content' => '<p>Solid 14k gold links, lobster clasp closure. Layers well with shorter pendants or solo against an open neckline.</p>',
                'price' => 599.00,
                'sale_price' => 449.00,
                'images' => ['product-2.jpg'],
            ],
            [
                'name' => 'Elsa Drop Earrings',
                'description' => 'Sculptural teardrop earrings in 14k gold with a high-polish curved silhouette.',
                'content' => '<p>Hypoallergenic posts. 1-inch drop. Light enough for everyday wear. Designed by an in-house atelier in Florence.</p>',
                'price' => 199.00,
                'sale_price' => 149.00,
                'images' => ['product-3.jpg'],
            ],
            [
                'name' => 'Diamond Pendant',
                'description' => 'Bezel-set 0.25ct round brilliant diamond pendant on a delicate gold chain.',
                'content' => '<p>GIA-certified G/SI1 stone. Solid 14k yellow gold bezel and 16-inch box chain with adjustable 18-inch loop.</p>',
                'price' => 899.00,
                'sale_price' => 699.00,
                'images' => ['product-4.jpg'],
            ],
            [
                'name' => 'Gold Tennis Bracelet',
                'description' => 'Classic tennis bracelet with prong-set 1.5ct total diamond weight in 14k white gold.',
                'content' => '<p>Hand-set round brilliant diamonds, F/G color, VS clarity. Double-locking safety clasp. Sized 7 inches with sizing service available.</p>',
                'price' => 1199.00,
                'sale_price' => 949.00,
                'images' => ['product-5.jpg'],
            ],
            [
                'name' => 'Pearl Drop Earrings',
                'description' => 'Hand-set freshwater pearl drops with a 14k gold-fill post and an articulated link.',
                'content' => '<p>8-9mm AA-grade pearls. 1.5-inch drop. Pairs with everyday and formal looks. Comes in a velvet pouch with a polishing cloth.</p>',
                'price' => 129.00,
                'sale_price' => 89.00,
                'images' => ['product-6.jpg'],
            ],
            [
                'name' => 'Solitaire Ring',
                'description' => 'Six-prong 0.5ct round brilliant solitaire in 18k white gold with a knife-edge band.',
                'content' => '<p>GIA-certified F/VS2 diamond. Cathedral-set in solid 18k white gold. Available in sizes 4-9 with complimentary resizing.</p>',
                'price' => 1299.00,
                'sale_price' => 1099.00,
                'images' => ['product-7.jpg'],
            ],
            [
                'name' => 'Eternity Band',
                'description' => 'Channel-set diamond eternity band with 1.0ct total weight in 14k yellow gold.',
                'content' => '<p>Round brilliant diamonds set continuously around the band. F/G color, VS clarity. 2.5mm wide. Sized at order.</p>',
                'price' => 999.00,
                'sale_price' => 799.00,
                'images' => ['product-8.jpg'],
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
