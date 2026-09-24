<?php

namespace Database\Seeders\Themes\HomeSneaker\Ecommerce;

use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Database\Seeders\Traits\HasProductSeeder;
use Botble\Ecommerce\Enums\ProductTypeEnum;
use Botble\Ecommerce\Enums\StockStatusEnum;
use Botble\Ecommerce\Models\Product;
use Illuminate\Support\Arr;

/**
 * HomeSneaker — sneaker catalog mirroring the home-sneaker.html demo.
 * Ten products covering trail, gym, road, racing, and lifestyle silhouettes.
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

        // No setBasePath — variant images bulk-copied to shared pool's `products/sneaker/` (preset 5 retro lessons C+F).

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
                ->map(fn (string $file): ?string => $this->safeFilePath('products/sneaker/' . $file))
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
     * Catalog of 10 sneakers. Each entry's images map to product-N.jpg downloaded
     * from the home-sneaker.html demo.
     *
     * @return array<int, array{name:string, description:string, content:string, price:float, sale_price:float, images:array<int,string>}>
     */
    private function getCatalog(): array
    {
        return [
            [
                'name' => 'Men Sports Shoes with Mesh upper',
                'description' => 'Breathable mesh trainer with a cushioned midsole and a durable rubber outsole.',
                'content' => '<p>Engineered mesh upper, EVA midsole, and a high-abrasion outsole. Sized true to fit. Pairs with daily training and treadmill miles.</p>',
                'price' => 89.00,
                'sale_price' => 69.00,
                'images' => ['product-1.jpg'],
            ],
            [
                'name' => 'Sneakersy Niskie',
                'description' => 'Low-top sneaker with a clean leather upper, padded collar, and minimal branding.',
                'content' => '<p>Full-grain leather, foam-cushioned tongue, and a vulcanized rubber outsole. The everyday lifestyle shoe — one pair you can dress up or down.</p>',
                'price' => 129.00,
                'sale_price' => 99.00,
                'images' => ['product-2.jpg'],
            ],
            [
                'name' => 'RED TAPE Men Flat Sneakers',
                'description' => 'Flat-soled lifestyle sneaker with a soft leather upper and a low-profile silhouette.',
                'content' => '<p>Pebbled leather, suede heel patch, and a flat rubber sole. Pairs with denim, chinos, and tailored trousers.</p>',
                'price' => 79.00,
                'sale_price' => 59.00,
                'images' => ['product-3.jpg'],
            ],
            [
                'name' => 'Men Flat Sneakers',
                'description' => 'Versatile trainer with a knit upper, foam midsole, and slip-on construction.',
                'content' => '<p>Stretch knit upper for sock-like fit. Compression-molded EVA midsole. The travel-day shoe — security-line friendly and good for long walks.</p>',
                'price' => 99.00,
                'sale_price' => 79.00,
                'images' => ['product-4.jpg'],
            ],
            [
                'name' => 'Ultimashow 2.0 Mer Lace-Up Sneakers',
                'description' => 'Aggressive trail shoe with 4mm lugs, a rock plate, and a reinforced toe cap.',
                'content' => '<p>Vibram Megagrip outsole, EVA midsole, and a TPU rock plate. Handles muddy descents, rocky climbs, and technical terrain.</p>',
                'price' => 169.00,
                'sale_price' => 139.00,
                'images' => ['product-5.jpg'],
            ],
            [
                'name' => 'Men Panelled Athleisure Shoes',
                'description' => 'Heritage low-top court silhouette in white leather with tonal stitching.',
                'content' => '<p>Smooth leather upper, padded collar, and a herringbone rubber outsole. The minimalist white sneaker that pairs with everything.</p>',
                'price' => 109.00,
                'sale_price' => 89.00,
                'images' => ['product-6.jpg'],
            ],
            [
                'name' => 'Up Casual Shoes with Rubber Sole',
                'description' => 'Carbon-plated racing shoe with a PEBA foam midsole and a curved rocker geometry.',
                'content' => '<p>Full-length carbon plate. PEBA-blend foam returns 80%+ energy. Designed for half-marathon to marathon race days.</p>',
                'price' => 199.00,
                'sale_price' => 169.00,
                'images' => ['product-7.jpg'],
            ],
            [
                'name' => 'Men Flat Low',
                'description' => 'Leather walking sneaker with a cushioned footbed and a flexible rubber outsole.',
                'content' => '<p>Soft leather upper with stretch panels at the ankle. Removable insole for orthotics. The all-day commuter shoe.</p>',
                'price' => 119.00,
                'sale_price' => 89.00,
                'images' => ['product-8.jpg'],
            ],
            [
                'name' => 'Men Casual Shoes with PU Upper',
                'description' => 'Tennis-inspired court shoe with lateral support, a cushioned midfoot, and a herringbone outsole.',
                'content' => '<p>Synthetic leather upper with TPU overlays. Wraparound midsole for stability through quick lateral cuts. Multi-court outsole.</p>',
                'price' => 129.00,
                'sale_price' => 99.00,
                'images' => ['product-9.jpg'],
            ],
            [
                'name' => 'Men Duramo',
                'description' => 'Classic running silhouette with a suede-and-mesh upper and a foam-cushioned heel.',
                'content' => '<p>Suede overlays on a breathable mesh base. EVA midsole with a visible air unit at the heel. The lifestyle classic that started it all.</p>',
                'price' => 49.00,
                'sale_price' => 39.00,
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
