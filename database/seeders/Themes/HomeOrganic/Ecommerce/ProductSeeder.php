<?php

namespace Database\Seeders\Themes\HomeOrganic\Ecommerce;

use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Database\Seeders\Traits\HasProductSeeder;
use Botble\Ecommerce\Enums\ProductTypeEnum;
use Botble\Ecommerce\Enums\StockStatusEnum;
use Botble\Ecommerce\Models\Product;
use Illuminate\Support\Arr;

/**
 * HomeOrganic — organic & whole-foods catalog mirroring the home-organic.html demo.
 * Ten products covering produce, grains, oils, pantry, and superfoods.
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

        // No setBasePath — variant images bulk-copied into shared pool's `products/organic/`
        // subdir to avoid both (a) BaseSeeder::filePath() path-mangling bug and (b) collision
        // with Main fashion `product-N.jpg` at shared root (preset 4 retro lessons C + F).

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
                ->map(fn (string $file): ?string => $this->safeFilePath('products/organic/' . $file))
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
     * Catalog of 10 organic products. Each entry's images map to product-N.jpg
     * downloaded from the home-organic.html demo.
     *
     * @return array<int, array{name:string, description:string, content:string, price:float, sale_price:float, images:array<int,string>}>
     */
    private function getCatalog(): array
    {
        return [
            [
                'name' => 'Dragon Fruit',
                'description' => 'Vibrant pink-fleshed dragon fruit with a delicate sweetness and crisp bite.',
                'content' => '<p>Hand-picked at peak ripeness from certified organic growers. Rich in vitamin C and antioxidants. Sold by the each.</p>',
                'price' => 15.99,
                'sale_price' => 12.99,
                'images' => ['product-1.jpg', 'product-1_2.jpg'],
            ],
            [
                'name' => 'Shredded Coconut',
                'description' => 'Unsweetened, finely shredded coconut from organically grown trees.',
                'content' => '<p>No sulphites or added sugars. Perfect for granola, baking, and energy bites. 250g resealable pouch.</p>',
                'price' => 19.99,
                'sale_price' => 14.99,
                'images' => ['product-2.jpg', 'product-2_2.jpg'],
            ],
            [
                'name' => 'Wunder Chaga Powder',
                'description' => 'Wild-harvested Siberian chaga, dual-extracted to capture beta-glucans and triterpenes.',
                'content' => '<p>Smooth, lightly bitter taste. Mix into coffee, broth, or smoothies. 100g glass jar.</p>',
                'price' => 59.99,
                'sale_price' => 49.99,
                // §6 banner-product-single uses this product (Wunder Chaga); demo has 3 detail-3*
                // gallery images for vertical thumbs zoom.
                'images' => ['product-3.jpg', 'product-3_2.jpg', 'detail-3.jpg', 'detail-3_2.jpg', 'detail-3_3.jpg'],
            ],
            [
                'name' => 'Blueberry Granola',
                'description' => 'Slow-baked oat granola with wild blueberries, almonds, and pure maple syrup.',
                'content' => '<p>Made in small batches. No refined sugar, palm oil, or preservatives. 500g recyclable pouch.</p>',
                'price' => 25.99,
                'sale_price' => 19.99,
                'images' => ['product-4.jpg', 'product-4_2.jpg'],
            ],
            [
                'name' => 'Dark Choc Almonds',
                'description' => 'Crunchy almonds enrobed in 70% single-origin dark chocolate.',
                'content' => '<p>Organic, fair-trade certified. Naturally gluten-free. 200g resealable bag.</p>',
                'price' => 19.99,
                'sale_price' => 15.99,
                'images' => ['product-5.jpg', 'product-5_2.jpg'],
            ],
            [
                'name' => 'Quinoa Tri-Color',
                'description' => 'Tri-color quinoa blend rinsed and ready — a fluffy, protein-rich grain alternative.',
                'content' => '<p>White, red, and black quinoa from Andean cooperatives. 500g pack. Cooks in 15 minutes.</p>',
                'price' => 22.99,
                'sale_price' => 17.99,
                'images' => ['product-6.jpg', 'product-6_2.jpg'],
            ],
            [
                'name' => 'Cold-Pressed Olive Oil',
                'description' => 'Single-estate extra virgin olive oil with a peppery finish and grassy aroma.',
                'content' => '<p>Harvest-dated. Organic Picual olives. Stored in dark glass to preserve polyphenols. 500ml bottle.</p>',
                'price' => 45.99,
                'sale_price' => 35.99,
                'images' => ['product-7.jpg'],
            ],
            [
                'name' => 'Manuka Honey',
                'description' => 'Raw, unpasteurised Manuka honey graded for natural enzyme activity.',
                'content' => '<p>Sourced from remote New Zealand apiaries. UMF 10+ certified. 250g glass jar.</p>',
                'price' => 89.99,
                'sale_price' => 69.99,
                'images' => ['product-8.jpg'],
            ],
            [
                'name' => 'Spirulina Tablets',
                'description' => 'Blue-green algae compressed without binders — a daily plant-based protein boost.',
                'content' => '<p>Lab-tested for heavy metals. 180 tablets per bottle. Take 4-6 tablets with water before meals.</p>',
                'price' => 39.99,
                'sale_price' => 29.99,
                'images' => ['product-9.jpg'],
            ],
            [
                'name' => 'Organic Turmeric Powder',
                'description' => 'Sun-dried Indian turmeric milled to a fine, deeply pigmented powder.',
                'content' => '<p>Curcumin-rich. Pair with black pepper for absorption. 100g glass jar with measuring spoon.</p>',
                'price' => 19.99,
                'sale_price' => 15.99,
                'images' => ['product-11.jpg', 'product-11_2.jpg'],
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
