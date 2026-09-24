<?php

namespace Database\Seeders\Themes\HomeAuto\Ecommerce;

use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Database\Seeders\Traits\HasProductSeeder;
use Botble\Ecommerce\Enums\ProductTypeEnum;
use Botble\Ecommerce\Enums\StockStatusEnum;
use Botble\Ecommerce\Models\Product;
use Illuminate\Support\Arr;

/**
 * HomeAuto — automotive parts catalog mirroring the home-auto.html demo.
 * Ten products covering brakes, filters, lighting, and hydraulics.
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
                ->map(fn (string $file): ?string => $this->safeFilePath('products/auto/' . $file))
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
     * Catalog of 10 automotive products mapped to product-1..10.jpg.
     *
     * @return array<int, array{name:string, description:string, content:string, price:float, sale_price:float, images:array<int,string>}>
     */
    private function getCatalog(): array
    {
        return [
            [
                'name' => 'Dash Camera Pro',
                'description' => '1440p front + rear dash cam with parking mode and built-in GPS logging.',
                'content' => '<p>Records every drive in razor-sharp 1440p with night-vision sensors front and back. 24-hour parking surveillance and Wi-Fi app pairing included.</p>',
                'price' => 199.00,
                'sale_price' => 159.00,
                'images' => ['product-1.jpg'],
            ],
            [
                'name' => 'Projector Headlights',
                'description' => 'Plug-and-play LED projector headlight pair with sequential turn signals.',
                'content' => '<p>DOT-compliant LED projector assembly with halo daytime running lights. Direct-fit replacement, no wiring harness modifications required.</p>',
                'price' => 299.00,
                'sale_price' => 249.00,
                'images' => ['product-2.jpg'],
            ],
            [
                'name' => 'Cylinder Head Gasket',
                'description' => 'Multi-layer steel cylinder head gasket engineered for high-compression engines.',
                'content' => '<p>OE-grade MLS construction resists thermal cycling and combustion pressure. Ships with torque sequence guide.</p>',
                'price' => 89.00,
                'sale_price' => 69.00,
                'images' => ['product-3.jpg'],
            ],
            [
                'name' => 'Alloy Sport Wheel',
                'description' => '18-inch lightweight alloy wheel with gunmetal finish and forged construction.',
                'content' => '<p>Reduces unsprung weight by 22 percent versus stock. Hub-centric design, includes center cap and valve stem.</p>',
                'price' => 269.00,
                'sale_price' => 219.00,
                'images' => ['product-4.jpg'],
            ],
            [
                'name' => 'Brake Pad Set Premium',
                'description' => 'Low-dust ceramic brake pads with stainless shims for quiet, confident stopping.',
                'content' => '<p>Front pad set engineered for daily driving and spirited use. Reduces brake dust by up to 80 percent compared to OE pads.</p>',
                'price' => 79.00,
                'sale_price' => 59.00,
                'images' => ['product-5.jpg'],
            ],
            [
                'name' => 'Cabin Air Filter',
                'description' => 'Activated-carbon cabin filter that traps allergens, dust, and exhaust odors.',
                'content' => '<p>Three-layer filtration captures particles down to 0.3 microns. Recommended replacement every 15,000 miles.</p>',
                'price' => 35.00,
                'sale_price' => 25.00,
                'images' => ['product-6.jpg'],
            ],
            [
                'name' => 'Performance Oil Filter',
                'description' => 'High-flow synthetic-media oil filter rated for extended drain intervals.',
                'content' => '<p>Anti-drainback valve and silicone gasket ensure cold-start protection. Compatible with synthetic and conventional oils.</p>',
                'price' => 29.00,
                'sale_price' => 25.00,
                'images' => ['product-7.jpg'],
            ],
            [
                'name' => 'LED Headlight Bulb',
                'description' => '10,000 lumen pair of LED conversion bulbs with whisper-quiet cooling fans.',
                'content' => '<p>6500K daylight color temperature, plug-and-play install, CANBus compatible on most vehicles. 50,000 hour lifespan.</p>',
                'price' => 89.00,
                'sale_price' => 69.00,
                'images' => ['product-8.jpg'],
            ],
            [
                'name' => 'Brake Disc Vented',
                'description' => 'Cross-drilled and slotted vented brake rotor for cooler, more consistent braking.',
                'content' => '<p>Anti-corrosion zinc coating and balanced construction. Ships as a single rotor; order in pairs for axle service.</p>',
                'price' => 129.00,
                'sale_price' => 99.00,
                'images' => ['product-9.jpg'],
            ],
            [
                'name' => 'Power Steering Pump',
                'description' => 'Remanufactured power steering pump tested to OE specifications.',
                'content' => '<p>Includes new reservoir, pulley, and seal kit. 2-year unlimited mileage warranty.</p>',
                'price' => 219.00,
                'sale_price' => 179.00,
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
