<?php

namespace Database\Seeders\Themes\HomeBag\Ecommerce;

use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Database\Seeders\Traits\HasProductSeeder;
use Botble\Ecommerce\Enums\ProductTypeEnum;
use Botble\Ecommerce\Enums\StockStatusEnum;
use Botble\Ecommerce\Models\Product;
use Illuminate\Support\Arr;

/**
 * HomeBag — bag & accessories catalog mirroring the home-bag-accessories.html demo.
 * Ten products covering totes, beanies, belts, jewelry, mittens, and shoes.
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
                ->map(fn (string $file): ?string => $this->safeFilePath('products/bag/' . $file))
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
     * Catalog of 10 bag & accessory products. Each entry's images map to
     * product-N.jpg downloaded from the home-bag-accessories.html demo.
     *
     * @return array<int, array{name:string, description:string, content:string, price:float, sale_price:float, images:array<int,string>}>
     */
    private function getCatalog(): array
    {
        return [
            [
                'name' => 'Suede Tote Bag',
                'description' => 'Oversized suede tote with twin top handles, magnetic snap, and an unlined interior.',
                'content' => '<p>Brushed suede in espresso. Holds a 15-inch laptop, day binder, and water bottle. Brass feet protect the base from wear.</p>',
                'price' => 99.99,
                'sale_price' => 69.99,
                'images' => ['product-1.jpg'],
            ],
            [
                'name' => 'Suede Mini Bag',
                'description' => 'Petite suede shoulder bag with a curb-chain strap and tonal flap closure.',
                'content' => '<p>Holds a phone, cards, and lipstick. Adjustable chain strap from 22 to 24 inches. Cotton drill lining.</p>',
                'price' => 49.99,
                'sale_price' => 29.99,
                'images' => ['product-2.jpg'],
            ],
            [
                'name' => 'Mini Sue Crossbody Bag',
                'description' => 'Smooth leather crossbody with adjustable strap, gold-tone hardware, and three card slots.',
                'content' => '<p>Italian full-grain leather. Hand-painted edges. Pairs with everyday and dressed-up looks.</p>',
                'price' => 25.99,
                'sale_price' => 15.99,
                'images' => ['product-3.jpg'],
            ],
            [
                'name' => 'Shearling-Suede Tote Bag',
                'description' => 'Plush shearling-trimmed suede tote with twin top handles and a roomy interior.',
                'content' => '<p>Soft suede body with cozy shearling collar. Magnetic snap closure. Fits a 13-inch laptop and daily essentials.</p>',
                'price' => 79.99,
                'sale_price' => 45.99,
                'images' => ['product-4.jpg'],
            ],
            [
                'name' => 'Small Nappa Leather Pouch With Button',
                'description' => 'Compact nappa leather pouch with a magnetic button closure and slim card slots.',
                'content' => '<p>Soft nappa leather. Hand-stitched edges. Holds cards, cash, and a phone.</p>',
                'price' => 19.99,
                'sale_price' => 9.99,
                'images' => ['product-5.jpg'],
            ],
            [
                'name' => 'Long Leaf Shaped Earrings',
                'description' => 'Sculpted leaf-shaped drop earrings in polished gold-tone finish.',
                'content' => '<p>Lightweight cast brass with hypoallergenic posts. Hand-finished. Comes in a velvet pouch.</p>',
                'price' => 59.99,
                'sale_price' => 34.99,
                'images' => ['product-6.jpg'],
            ],
            [
                'name' => 'Leather Crossbody Bag',
                'description' => 'Smooth leather crossbody with adjustable strap, gold-tone hardware, and three card slots.',
                'content' => '<p>Italian full-grain leather. Hand-painted edges. Pairs with everyday and dressed-up looks.</p>',
                'price' => 39.99,
                'sale_price' => 22.99,
                'images' => ['product-7.jpg'],
            ],
            [
                'name' => 'Suede Bowling Bag',
                'description' => 'Soft-structured bowling silhouette in pebbled suede with a top zip and side handles.',
                'content' => '<p>Generous interior with one zip pocket and two slip pockets. Holds a tablet, planner, and overnight basics.</p>',
                'price' => 99.99,
                'sale_price' => 67.99,
                'images' => ['product-8.jpg'],
            ],
            [
                'name' => 'Cashmere Mittens',
                'description' => 'Cashmere-lined mittens with a leather palm and elasticated wrist for cold-weather days.',
                'content' => '<p>100% Mongolian cashmere lining. Lambskin palm for grip and durability. Sized unisex.</p>',
                'price' => 89.00,
                'sale_price' => 59.00,
                'images' => ['product-9.jpg'],
            ],
            [
                'name' => 'Embossed Wallet',
                'description' => 'Bifold leather wallet with subtle embossed monogram, six card slots, and a coin pocket.',
                'content' => '<p>Vegetable-tanned leather. RFID-blocking lining. Hand-painted edges and bar-tacked stress points.</p>',
                'price' => 99.00,
                'sale_price' => 69.00,
                'images' => ['product-10.jpg'],
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
