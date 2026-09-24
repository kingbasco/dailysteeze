<?php

namespace Database\Seeders\Themes\HomeDecor\Ecommerce;

use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Database\Seeders\Traits\HasProductSeeder;
use Botble\Ecommerce\Enums\ProductTypeEnum;
use Botble\Ecommerce\Enums\StockStatusEnum;
use Botble\Ecommerce\Models\Product;
use Illuminate\Support\Arr;

/**
 * HomeDecor — ergonomic furniture catalog mirroring the home-decor.html demo.
 * Six products covering chairs, desks, and supportive office accessories.
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
                ->map(fn (string $file): ?string => $this->safeFilePath('products/decor/' . $file))
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
     * Catalog of 6 ergonomic-office products mapped to product-1..6.jpg.
     *
     * @return array<int, array{name:string, description:string, content:string, price:float, sale_price:float, images:array<int,string>}>
     */
    private function getCatalog(): array
    {
        return [
            [
                'name' => 'Paris',
                'description' => 'Mesh-back ergonomic task chair with adjustable lumbar and 4D armrests.',
                'content' => '<p>Synchronous tilt mechanism, breathable mesh back, and seven-point adjustability. Holds up to 300 pounds and ships fully assembled.</p>',
                'price' => 89.99,
                'sale_price' => 69.99,
                'images' => ['product-1.jpg'],
            ],
            [
                'name' => 'Very Conference',
                'description' => 'Bonded leather guest chair with stainless base and contoured seat foam.',
                'content' => '<p>Polished aluminum frame and recoil tilt for natural sitting motion. Stackable design saves storage space.</p>',
                'price' => 99.99,
                'sale_price' => 79.99,
                'images' => ['product-2.jpg'],
            ],
            [
                'name' => 'Madrid',
                'description' => 'Whisper-quiet electric sit-stand desk with three-stage motor and memory presets.',
                'content' => '<p>Anti-collision sensor and four programmable height presets. Solid bamboo top, 60 x 30 inches. Lifts up to 220 pounds.</p>',
                'price' => 69.99,
                'sale_price' => 49.99,
                'images' => ['product-3.jpg'],
            ],
            [
                'name' => 'Poppy with Tablet',
                'description' => 'Mobile training chair with built-in tablet arm and contoured ergonomic seat.',
                'content' => '<p>Swivel-mounted writing tablet, padded contoured back, and dual-wheel casters. Stackable design saves storage space in classrooms and shared offices.</p>',
                'price' => 79.99,
                'sale_price' => 59.99,
                'images' => ['product-4.jpg'],
            ],
            [
                'name' => 'Footrest Adjustable',
                'description' => 'Tilting ergonomic footrest with non-slip surface and ten-position height range.',
                'content' => '<p>Reduces lower back strain at any desk. Compact storage when not in use. Supports natural posture during long shifts.</p>',
                'price' => 39.99,
                'sale_price' => 29.99,
                'images' => ['product-5.jpg'],
            ],
            [
                'name' => 'Lumbar Support Cushion',
                'description' => 'Memory-foam lumbar pillow with breathable mesh cover and adjustable strap.',
                'content' => '<p>Encourages natural spinal alignment in any chair. Removable cover machine-washes cold. Universal fit for office, car, or sofa.</p>',
                'price' => 29.99,
                'sale_price' => 19.99,
                'images' => ['product-6.jpg'],
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
