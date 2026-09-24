<?php

namespace Database\Seeders\Themes\HomeFashion2\Ecommerce;

use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Database\Seeders\Traits\HasProductSeeder;
use Botble\Ecommerce\Enums\ProductTypeEnum;
use Botble\Ecommerce\Enums\StockStatusEnum;
use Botble\Ecommerce\Models\Product;
use Illuminate\Support\Arr;

/**
 * HomeFashion2 — women's fashion accessories catalog mirroring home-fashion-2.html.
 * Twelve products covering clothing, bags, jewelry, and shoes.
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
                ->map(fn (string $file): ?string => $this->safeFilePath('products/fashion-2/' . $file))
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
     * Catalog of 12 fashion products. Images map to product-N.jpg downloaded
     * from the home-fashion-2.html demo.
     *
     * @return array<int, array{name:string, description:string, content:string, price:float, sale_price:float, images:array<int,string>}>
     */
    private function getCatalog(): array
    {
        return [
            [
                'name' => 'Cotton Tee',
                'description' => 'Soft combed cotton tee with a relaxed silhouette and reinforced neckline.',
                'content' => '<p>100% organic cotton, pre-washed for a lived-in feel. Available in black, ivory, and stone. Garment-dyed with low-impact dyes.</p>',
                'price' => 49.00,
                'sale_price' => 39.00,
                'images' => ['product-1.jpg'],
            ],
            [
                'name' => 'Shopping Bag',
                'description' => 'Structured leather shopping bag with twin top handles and an unlined interior.',
                'content' => '<p>Full-grain Italian leather. Holds a 13-inch laptop, water bottle, and daily essentials. Brass hardware develops a patina over time.</p>',
                'price' => 289.00,
                'sale_price' => 229.00,
                'images' => ['product-2.jpg'],
            ],
            [
                'name' => 'Embossed Wallet',
                'description' => 'Bifold wallet with subtle embossed monogram, six card slots, and a coin pocket.',
                'content' => '<p>Vegetable-tanned leather. RFID-blocking lining. Refined at the edges with hand-painted finish.</p>',
                'price' => 129.00,
                'sale_price' => 99.00,
                'images' => ['product-3.jpg'],
            ],
            [
                'name' => 'Turtleneck Knit',
                'description' => 'Fine-gauge merino turtleneck with a relaxed fit and ribbed trims.',
                'content' => '<p>Extrafine merino wool, machine-washable on the wool cycle. Available in espresso, oat, and storm grey.</p>',
                'price' => 159.00,
                'sale_price' => 119.00,
                'images' => ['product-4.jpg'],
            ],
            [
                'name' => 'Shoulder Bag',
                'description' => 'Slouchy shoulder bag in pebbled leather with a magnetic snap closure.',
                'content' => '<p>Adjustable strap with two carry options. Interior zip pocket and two slip pockets. Made in Spain.</p>',
                'price' => 349.00,
                'sale_price' => 269.00,
                'images' => ['product-5.jpg'],
            ],
            [
                'name' => 'Leather Boots',
                'description' => 'Almond-toe ankle boots on a stacked block heel with a side zip.',
                'content' => '<p>Smooth calfskin upper, leather-lined footbed, and a Vibram rubber sole for traction. Hand-finished in Portugal.</p>',
                'price' => 379.00,
                'sale_price' => 299.00,
                'images' => ['product-6.jpg'],
            ],
            [
                'name' => 'Silk Scarf',
                'description' => 'Hand-rolled mulberry silk scarf with a printed botanical motif.',
                'content' => '<p>90x90cm twill silk. Machine-printed with low-impact dyes. Includes a recycled paper gift sleeve.</p>',
                'price' => 119.00,
                'sale_price' => 89.00,
                'images' => ['product-7.jpg'],
            ],
            [
                'name' => 'Wool Coat',
                'description' => 'Double-breasted wool coat with notched lapels and welt pockets.',
                'content' => '<p>80% wool, 20% cashmere. Cupro lining. Tailored fit through the shoulders with room to layer underneath.</p>',
                'price' => 599.00,
                'sale_price' => 449.00,
                'images' => ['product-8.jpg'],
            ],
            [
                'name' => 'Denim Jacket',
                'description' => 'Classic trucker-style denim jacket in a vintage-blue rigid wash.',
                'content' => '<p>14oz Japanese denim. Selvedge inner seams. Softens with wear and develops natural fades.</p>',
                'price' => 219.00,
                'sale_price' => 169.00,
                'images' => ['product-9.jpg'],
            ],
            [
                'name' => 'Pearl Necklace',
                'description' => 'Freshwater pearl necklace with a 14k gold-fill clasp and 18-inch length.',
                'content' => '<p>Hand-knotted between each pearl. Pearls average 7-8mm. Comes in a velvet pouch with care card.</p>',
                'price' => 189.00,
                'sale_price' => 149.00,
                'images' => ['product-10.jpg'],
            ],
            [
                'name' => 'Mini Crossbody',
                'description' => 'Small leather crossbody with a curb-chain strap and gold-tone hardware.',
                'content' => '<p>Holds a phone, cards, and lipstick. Adjustable strap from 22 to 24 inches. Cotton drill lining.</p>',
                'price' => 259.00,
                'sale_price' => 199.00,
                'images' => ['product-11.jpg'],
            ],
            [
                'name' => 'Cashmere Cardigan',
                'description' => 'Open-front cashmere cardigan with drop shoulders and a relaxed silhouette.',
                'content' => '<p>100% Mongolian cashmere. Two patch pockets. Layer over a tee or under a coat for transitional weather.</p>',
                'price' => 269.00,
                'sale_price' => 209.00,
                'images' => ['product-12.jpg'],
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
