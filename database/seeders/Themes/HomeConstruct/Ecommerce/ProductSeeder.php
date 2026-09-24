<?php

namespace Database\Seeders\Themes\HomeConstruct\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Database\Seeders\Traits\HasProductSeeder;
use Botble\Ecommerce\Enums\ProductTypeEnum;
use Botble\Ecommerce\Enums\StockStatusEnum;
use Botble\Ecommerce\Models\Product;
use Botble\Ecommerce\Models\ProductVariation;
use Botble\Ecommerce\Models\ProductVariationItem;
use Illuminate\Support\Arr;

/**
 * HomeConstruct — construction tools catalog mirroring the home-construction.html demo.
 * Ten products covering power tools, safety gear, and measuring essentials.
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

        // Rebuild variations for the featured product (used in product-feature-zoom
        // shortcode on homepage) so every color×size combination is valid.
        if ($parents->isNotEmpty()) {
            $this->rebuildFeaturedProductVariations($parents->first());
        }
    }

    /**
     * Delete random variations created by HasProductSeeder and replace with a
     * complete color×size matrix so swatch switching never hits "Please select
     * attributes" on the homepage showcase.
     */
    protected function rebuildFeaturedProductVariations(Product $parent): void
    {
        // Color IDs: Black(1), White(2), Navy(5) — three construction-appropriate colors.
        $colorIds = [1, 2, 5];
        // Size IDs: XL(17), XXL(18).
        $sizeIds = [17, 18];

        // Remove existing random variations for this product.
        $existingVariationIds = ProductVariation::query()
            ->where('configurable_product_id', $parent->id)
            ->pluck('id', 'product_id');

        if ($existingVariationIds->isNotEmpty()) {
            ProductVariationItem::query()->whereIn('variation_id', $existingVariationIds->values())->delete();
            ProductVariation::query()->whereIn('id', $existingVariationIds->values())->delete();
            Product::query()->whereIn('id', $existingVariationIds->keys())->delete();
        }

        // Attach attribute sets (Color=1, Size=2) to the parent.
        $parent->productAttributeSets()->sync([1, 2]);

        $isFirst = true;
        $j = 1;

        foreach ($colorIds as $colorId) {
            foreach ($sizeIds as $sizeId) {
                $variation = Product::query()->create([
                    'name' => $parent->name,
                    'status' => BaseStatusEnum::PUBLISHED,
                    'sku' => $parent->sku . '-V' . $j,
                    'barcode' => $this->generateUniqueBarcode(),
                    'quantity' => $parent->quantity,
                    'weight' => $parent->weight,
                    'height' => $parent->height,
                    'wide' => $parent->wide,
                    'length' => $parent->length,
                    'price' => $parent->price,
                    'sale_price' => $parent->sale_price,
                    'brand_id' => $parent->brand_id,
                    'with_storehouse_management' => true,
                    'is_variation' => true,
                    'images' => json_encode($parent->images),
                    'product_type' => $parent->product_type,
                ]);

                $pv = ProductVariation::query()->create([
                    'product_id' => $variation->getKey(),
                    'configurable_product_id' => $parent->getKey(),
                    'is_default' => $isFirst,
                ]);

                ProductVariationItem::query()->insert([
                    ['attribute_id' => $colorId, 'variation_id' => $pv->id],
                    ['attribute_id' => $sizeId, 'variation_id' => $pv->id],
                ]);

                if ($isFirst) {
                    $parent->update(['sku' => $variation->sku, 'sale_price' => $variation->sale_price]);
                    $isFirst = false;
                }

                $j++;
            }
        }

        // Update variations count.
        $parent->update([
            'variations_count' => ProductVariation::query()
                ->where('configurable_product_id', $parent->id)
                ->count(),
        ]);
    }

    protected function hasDigitalProducts(): bool
    {
        return false;
    }

    public function getProducts(): array
    {
        return collect($this->getCatalog())->map(function (array $entry): array {
            $images = collect($entry['images'] ?? [])
                ->map(fn (string $file): ?string => $this->safeFilePath('products/construction/' . $file))
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
     * Catalog of 10 construction-trade products mapped to product-1..10.jpg.
     *
     * @return array<int, array{name:string, description:string, content:string, price:float, sale_price:float, images:array<int,string>}>
     */
    private function getCatalog(): array
    {
        return [
            [
                'name' => 'Angle Grinder Pro',
                'description' => '7-inch heavy-duty angle grinder with paddle switch and tool-free guard adjustment.',
                'content' => '<p>15-amp motor delivers 8,500 RPM under load. Anti-vibration handle and overload protection extend tool life on demanding jobs.</p>',
                'price' => 199.00,
                'sale_price' => 159.00,
                'images' => ['product-1.jpg', 'product-2.jpg', 'product-3.jpg', 'product-4.jpg', 'product-5.jpg'],
            ],
            [
                'name' => 'Hammer Drill 18V',
                'description' => 'Cordless brushless hammer drill with three-mode selector and LED worklight.',
                'content' => '<p>Drives, drills, and hammers concrete to 1/2 inch. Ships with two 4Ah batteries, fast charger, and contractor case.</p>',
                'price' => 299.00,
                'sale_price' => 249.00,
                'images' => ['product-2.jpg'],
            ],
            [
                'name' => 'Circular Saw Cordless',
                'description' => '7-1/4 inch brushless circular saw with magnesium shoe and rafter hook.',
                'content' => '<p>Rip-cuts 2x material at full bevel. Electric brake stops the blade in under two seconds. Battery sold separately.</p>',
                'price' => 269.00,
                'sale_price' => 219.00,
                'images' => ['product-3.jpg'],
            ],
            [
                'name' => 'Impact Driver Set',
                'description' => 'Compact 18V impact driver with three-speed control and 30-piece bit assortment.',
                'content' => '<p>1,800 in-lb torque drives lag bolts and ledger screws without pre-drilling. Includes 1/4 inch hex chuck and belt clip.</p>',
                'price' => 229.00,
                'sale_price' => 189.00,
                'images' => ['product-4.jpg'],
            ],
            [
                'name' => 'Safety Helmet',
                'description' => 'ANSI Z89-rated hard hat with adjustable ratchet suspension and chin strap.',
                'content' => '<p>UV-stable HDPE shell rated for Type 1 Class C impact and electrical hazards. Sweat-wicking brow pad included.</p>',
                'price' => 49.00,
                'sale_price' => 39.00,
                'images' => ['product-5.jpg'],
            ],
            [
                'name' => 'Tape Measure 25ft',
                'description' => 'Heavy-duty 25-foot tape measure with magnetic hook and rubberized case.',
                'content' => '<p>Three-rivet hook withstands repeated drops. Standout to 11 feet, dual metric and imperial markings.</p>',
                'price' => 39.00,
                'sale_price' => 29.00,
                'images' => ['product-6.jpg'],
            ],
            [
                'name' => 'Steel Toe Boots',
                'description' => 'Waterproof leather work boots with composite toe and slip-resistant outsole.',
                'content' => '<p>ASTM F2413 rated. Removable cushioned insole and reinforced ankle support for ten-hour shifts.</p>',
                'price' => 219.00,
                'sale_price' => 179.00,
                'images' => ['product-7.jpg'],
            ],
            [
                'name' => 'Tool Belt Heavy',
                'description' => 'Full-grain leather framers belt with 16 pockets and reinforced double-stitching.',
                'content' => '<p>Adjustable padded suspenders distribute weight across the shoulders. Built to last decades on the jobsite.</p>',
                'price' => 149.00,
                'sale_price' => 119.00,
                'images' => ['product-8.jpg'],
            ],
            [
                'name' => 'Laser Level',
                'description' => 'Self-leveling cross-line laser with 100-foot range and magnetic mount.',
                'content' => '<p>Class II laser with green diode for daylight visibility. IP54 rated, runs ten hours on AA batteries.</p>',
                'price' => 399.00,
                'sale_price' => 329.00,
                'images' => ['product-9.jpg'],
            ],
            [
                'name' => 'Wet/Dry Vacuum',
                'description' => '12-gallon contractor wet/dry vac with HEPA filtration and hose-tracking caddy.',
                'content' => '<p>6.5 peak HP motor and stainless tank. Tool-triggered auto-start outlet and 25-foot hose included.</p>',
                'price' => 249.00,
                'sale_price' => 199.00,
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
