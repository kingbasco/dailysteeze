<?php

namespace Database\Seeders\Themes\HomeOffice\Ecommerce;

use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Database\Seeders\Traits\HasProductSeeder;
use Botble\Ecommerce\Enums\ProductTypeEnum;
use Botble\Ecommerce\Enums\StockStatusEnum;
use Botble\Ecommerce\Models\Product;
use Illuminate\Support\Arr;

/**
 * HomeOffice — office equipment catalog mirroring the home-office-equipment.html demo.
 * Six products covering chairs, monitor arms, keyboards, and desk accessories.
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
                ->map(fn (string $file): ?string => $this->safeFilePath('products/office/' . $file))
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
     * Catalog of 6 office equipment products. Each entry's images map to
     * product-N.jpg downloaded from the home-office-equipment.html demo.
     *
     * @return array<int, array{name:string, description:string, content:string, price:float, sale_price:float, images:array<int,string>}>
     */
    private function getCatalog(): array
    {
        return [
            [
                'name' => 'Airy Pro Ergonomic Chair',
                'description' => 'Mesh-back ergonomic chair with adaptive lumbar, 4D armrests, and a 12-year warranty.',
                'content' => '<p>Breathable woven mesh, synchro-tilt mechanism, and adjustable seat depth. Rated for users 5\' to 6\'4".</p>',
                'price' => 749.00,
                'sale_price' => 599.00,
                'images' => ['product-1.jpg'],
            ],
            [
                'name' => 'T9 Pro II Dual Monitor Arm',
                'description' => 'Single-monitor arm with full motion adjust, integrated cable management, and a clamp-on base.',
                'content' => '<p>Supports 17-32 inch displays up to 19.8 lbs. VESA 75/100 compatible. Tool-free height adjust.</p>',
                'price' => 199.00,
                'sale_price' => 149.00,
                'images' => ['product-2.jpg'],
            ],
            [
                'name' => 'HyperOne Gen 3 Keyboard',
                'description' => 'Hot-swappable 75% mechanical keyboard with PBT keycaps and tactile linear switches.',
                'content' => '<p>USB-C and Bluetooth multipoint. Per-key RGB. Aluminum top plate. Mac and Windows layouts.</p>',
                'price' => 199.00,
                'sale_price' => 159.00,
                'images' => ['product-3.jpg'],
            ],
            [
                'name' => 'DS02 Monitor Stand',
                'description' => 'Aluminum monitor riser with built-in USB-C hub and integrated wireless charging pad.',
                'content' => '<p>Lifts displays 4.7" off the desk. Three USB-A, one USB-C PD, and a 15W Qi wireless surface.</p>',
                'price' => 159.00,
                'sale_price' => 119.00,
                'images' => ['product-4.jpg'],
            ],
            [
                'name' => 'Ergonomic Mouse Pro',
                'description' => 'Vertical ergonomic mouse with adjustable DPI and silent click — comfortable for long sessions.',
                'content' => '<p>2.4GHz USB-C wireless and Bluetooth. 70-day battery life. Rechargeable, all-day comfort.</p>',
                'price' => 79.99,
                'sale_price' => 59.99,
                'images' => ['product-7.jpg'],
            ],
            [
                'name' => 'LED Desk Lamp Smart',
                'description' => 'Eye-friendly LED desk lamp with circadian color tuning, app control, and a wireless charging base.',
                'content' => '<p>Tunable 2700K-6500K. 1500 lux at desk height. 10W Qi wireless charging built into the base.</p>',
                'price' => 129.00,
                'sale_price' => 99.00,
                'images' => ['product-9.jpg'],
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
