<?php

namespace Database\Seeders\Themes\HomeSport\Ecommerce;

use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Database\Seeders\Traits\HasProductSeeder;
use Botble\Ecommerce\Enums\ProductTypeEnum;
use Botble\Ecommerce\Enums\StockStatusEnum;
use Botble\Ecommerce\Models\Product;
use Illuminate\Support\Arr;

/**
 * HomeSport — sport and active-lifestyle catalog mirroring the home-sport.html demo.
 * Ten products covering footwear, weights, recovery, and racquet sports.
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

        // No setBasePath — variant images bulk-copied into shared pool's `products/sport/`
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
                ->map(fn (string $file): ?string => $this->safeFilePath('products/sport/' . $file))
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
     * Catalog of 10 sport and active-lifestyle products mapped to product-1..10.jpg.
     *
     * @return array<int, array{name:string, description:string, content:string, price:float, sale_price:float, images:array<int,string>}>
     */
    private function getCatalog(): array
    {
        // Slots 1-8 mirror the "Performance Starts Here" carousel in
        // html/home-sport.html (lines 1458-2160). Slots 9-10 stay sport-themed
        // recovery/resistance picks since the HTML carousel only lists 8.
        return [
            [
                'name' => "Men's Running JF190.1 Grip White",
                'description' => 'Lightweight neutral trainer with responsive foam midsole and breathable mesh upper in clean white.',
                'content' => '<p>Engineered for daily mileage, the JF190.1 balances cushion with energy return. Recycled-plastic upper, 8mm drop, suitable for road and groomed paths.</p>',
                'price' => 99.99,
                'sale_price' => 69.99,
                'images' => ['product-1.jpg'],
            ],
            [
                'name' => 'Set Of 2 3kg Hand Weights',
                'description' => 'Vinyl-coated 3kg dumbbell pair with hexagonal anti-roll heads. Sold as a matched set of two.',
                'content' => '<p>Comfortable contoured grip, ideal for HIIT, sculpting, and rehab work. Hex heads keep the weights stable on any flat surface.</p>',
                'price' => 49.99,
                'sale_price' => 29.99,
                'images' => ['product-2.jpg'],
            ],
            [
                'name' => 'Tennis Ball With Elastic String',
                'description' => 'Solo trainer tennis ball tethered with an elastic cord — practice strokes anywhere.',
                'content' => '<p>Felt-covered ball with a high-tension elastic return. Great for grooving forehands, backhands, and serves without a partner or court.</p>',
                'price' => 25.99,
                'sale_price' => 15.99,
                'images' => ['product-3.jpg'],
            ],
            [
                'name' => 'Pickleball Racket - Kuikma Open Blue',
                'description' => 'Tournament-ready pickleball paddle with graphite face and honeycomb polymer core.',
                'content' => '<p>USAPA-approved, 8oz playing weight, perforated cushion grip for sweaty conditions. Great for control and finesse play.</p>',
                'price' => 79.99,
                'sale_price' => 45.99,
                // 4-image gallery — feeds the §8 product-feature-zoom (style-3-pdp) thumbnail strip.
                'images' => ['product-4.jpg', 'product-4_2.jpg', 'product-4_3.jpg', 'product-4_4.jpg'],
            ],
            [
                'name' => "Men's Sports T-Shirt - Dry Brown",
                'description' => 'Sweat-wicking active tee in dry brown — quick-dry knit with mesh side panels.',
                'content' => '<p>Lightweight polyester blend keeps you cool through long sets. Flatlock seams reduce chafe and the dropped hem stays put through every rep.</p>',
                'price' => 19.99,
                'sale_price' => 9.99,
                'images' => ['product-5.jpg'],
            ],
            [
                'name' => "Women's Thin and Light Sports Shorts Black",
                'description' => 'Featherweight running shorts with built-in liner and zippered key pocket.',
                'content' => '<p>4-way stretch fabric, breathable mesh inner brief, and reflective hits for low-light visibility. Cut for natural stride and fast pace.</p>',
                'price' => 59.99,
                'sale_price' => 34.99,
                'images' => ['product-6.jpg'],
            ],
            [
                'name' => '4mm Ultra Grip Yoga Mat - Blue Grip',
                'description' => 'Eco-friendly natural rubber yoga mat with non-slip top texture in calm blue.',
                'content' => '<p>4mm thick for joint cushion without losing floor feel. PVC-free, latex-free, and biodegradable. Carrying strap included.</p>',
                'price' => 39.99,
                'sale_price' => 22.99,
                'images' => ['product-7.jpg'],
            ],
            [
                'name' => '20L Sports Bag - Gray',
                'description' => 'Compact 20L gym duffel in gray with ventilated shoe compartment and reinforced straps.',
                'content' => '<p>Fits a full gym kit plus shoes. Zippered side pockets, water-resistant base panel, and a padded shoulder strap.</p>',
                'price' => 99.99,
                'sale_price' => 67.99,
                'images' => ['product-8.jpg'],
            ],
            [
                'name' => 'Resistance Bands Set',
                'description' => 'Five-band stackable resistance set with handles, ankle straps, and door anchor.',
                'content' => '<p>Combine bands for up to 150lb resistance. Carry bag and printed exercise guide included.</p>',
                'price' => 59.00,
                'sale_price' => 39.00,
                'images' => ['product-9.jpg'],
            ],
            [
                'name' => 'Foam Roller Pro',
                'description' => 'High-density 24-inch foam roller with textured surface for deep tissue work.',
                'content' => '<p>EVA construction holds shape under repeated heavy use. Targets quads, glutes, IT band, and upper back.</p>',
                'price' => 59.00,
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
