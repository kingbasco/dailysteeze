<?php

namespace Database\Seeders\Themes\HomeElectronics\Ecommerce;

use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Database\Seeders\Traits\HasProductSeeder;
use Botble\Ecommerce\Enums\ProductTypeEnum;
use Botble\Ecommerce\Enums\StockStatusEnum;
use Botble\Ecommerce\Models\Product;
use Botble\Ecommerce\Models\ProductCategory;
use Illuminate\Support\Arr;

/**
 * HomeElectronics — consumer electronics catalog mirroring the home-electronics.html demo.
 * Ten products covering audio, wearables, smart home, and creator gear.
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

        $this->setBasePath(dirname(__DIR__) . '/files');

        $rawCatalog = $this->getCatalog();
        $catalog = $this->getProducts();

        $this->createProducts($catalog);

        $parents = Product::query()
            ->where('is_variation', false)
            ->orderBy('id')
            ->get();

        $catalogByName = collect($rawCatalog)->keyBy('name');

        foreach ($parents as $parent) {
            $entry = $catalogByName->get($parent->name);
            if ($entry && isset($entry['sale_price']) && (float) $parent->sale_price !== (float) $entry['sale_price']) {
                $parent->sale_price = $entry['sale_price'];
                $parent->save();
            }

            if ($entry && ! empty($entry['categories'])) {
                $categoryIds = ProductCategory::query()
                    ->whereIn('name', $entry['categories'])
                    ->pluck('id')
                    ->all();

                if ($categoryIds) {
                    $parent->categories()->sync($categoryIds);
                }
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
            ], Arr::except($entry, ['images', 'categories']));
        })->all();
    }

    /**
     * Catalog of 10 consumer electronics products. Each entry's images map to
     * product-N.jpg downloaded from the home-electronics.html demo.
     *
     * @return array<int, array{name:string, description:string, content:string, price:float, sale_price:float, images:array<int,string>}>
     */
    private function getCatalog(): array
    {
        return [
            [
                'name' => 'iPhone 17 Pro Max',
                'description' => 'Flagship smartphone with titanium frame, ProMotion display, and pro-grade triple camera.',
                'content' => '<p>6.9" Super Retina XDR display, A19 Pro chip, and 5x optical zoom. Built to capture, edit, and stream from anywhere.</p>',
                'price' => 1299.00,
                'sale_price' => 1199.00,
                'images' => ['product-1.jpg'],
                'categories' => ['Headphone'],
            ],
            [
                'name' => 'Apple Watch S10',
                'description' => 'Always-on retina display with the most advanced sensors for fitness and health.',
                'content' => '<p>ECG, blood oxygen, and sleep tracking. Aluminum case, 41mm and 45mm options, 18-hour battery.</p>',
                'price' => 429.00,
                'sale_price' => 379.00,
                'images' => ['product-2.jpg'],
                'categories' => ['Mouse'],
            ],
            [
                'name' => 'Wireless Charging Pad',
                'description' => 'Qi-certified 15W fast wireless charger with anti-slip silicone surface.',
                'content' => '<p>Compatible with iPhone, AirPods, and Android phones. USB-C input. Slim aluminum body.</p>',
                'price' => 49.99,
                'sale_price' => 34.99,
                'images' => ['product-3.jpg'],
                'categories' => ['Keyboard'],
            ],
            [
                'name' => 'Pro Earbuds Gen 4',
                'description' => 'Adaptive ANC, spatial audio, and 30 hours total playback with the included charging case.',
                'content' => '<p>IPX4 sweat resistance. Dual-mic noise reduction for clearer calls. USB-C and wireless charging.</p>',
                'price' => 249.00,
                'sale_price' => 199.00,
                'images' => ['product-4.jpg'],
                'categories' => ['Headphone'],
            ],
            [
                'name' => 'Smart Speaker Mini',
                'description' => 'Compact smart speaker with 360-degree sound and built-in voice assistant.',
                'content' => '<p>Wi-Fi and Bluetooth multiroom audio. Alexa, Google, and AirPlay 2 support. Tap-to-pair pairing.</p>',
                'price' => 99.00,
                'sale_price' => 79.00,
                'images' => ['product-5.jpg'],
                'categories' => ['Networking'],
            ],
            [
                'name' => 'Smart Lamp WiFi',
                'description' => 'Dimmable Wi-Fi smart lamp with 16 million colors and scheduling via the companion app.',
                'content' => '<p>Works with Alexa and Google Assistant. Voice and app control. Energy-efficient LED.</p>',
                'price' => 89.99,
                'sale_price' => 64.99,
                'images' => ['product-6.jpg'],
                'categories' => ['Networking'],
            ],
            [
                'name' => 'USB-C Cable Pro',
                'description' => 'Braided 100W USB-C to USB-C cable rated for 30,000+ bend cycles.',
                'content' => '<p>Supports PD fast charging and 10Gbps data transfer. Available in 1m and 2m lengths.</p>',
                'price' => 29.99,
                'sale_price' => 19.99,
                'images' => ['product-7.jpg'],
                'categories' => ['Cable'],
            ],
            [
                'name' => 'Action Camera 4K',
                'description' => 'Pocket-sized 4K60 action camera with HyperSmooth stabilization and waterproof body.',
                'content' => '<p>Records to microSD up to 512GB. Live streaming, voice control, and a 2-inch front display.</p>',
                'price' => 399.00,
                'sale_price' => 329.00,
                'images' => ['product-8.jpg'],
                'categories' => ['Mousepad'],
            ],
            [
                'name' => 'Tablet Pro 11',
                'description' => '11-inch Liquid Retina tablet with M-series chip — ideal for sketching, notes, and streaming.',
                'content' => '<p>Apple Pencil and Magic Keyboard compatible. 128GB-2TB. All-day battery and Touch ID.</p>',
                'price' => 899.00,
                'sale_price' => 799.00,
                'images' => ['product-9.jpg'],
                'categories' => ['Keyboard'],
            ],
            [
                'name' => 'Magnetic Phone Stand',
                'description' => 'MagSafe-compatible aluminum stand with weighted base and tilt adjustment.',
                'content' => '<p>Holds your phone at the perfect angle for FaceTime, recipes, or charging. Aluminum and silicone build.</p>',
                'price' => 39.99,
                'sale_price' => 29.99,
                'images' => ['product-10.jpg'],
                'categories' => ['Mousepad'],
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
