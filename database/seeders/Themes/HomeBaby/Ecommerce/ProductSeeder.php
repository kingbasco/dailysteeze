<?php

namespace Database\Seeders\Themes\HomeBaby\Ecommerce;

use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Database\Seeders\Traits\HasProductSeeder;
use Botble\Ecommerce\Enums\ProductTypeEnum;
use Botble\Ecommerce\Enums\StockStatusEnum;
use Botble\Ecommerce\Models\Product;
use Illuminate\Support\Arr;

/**
 * HomeBaby — baby & infant product catalog mirroring the home-baby.html demo.
 * Ten products covering feeding, wear, play, bath, and sleep essentials.
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
                ->map(fn (string $file): ?string => $this->safeFilePath('products/baby/' . $file))
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
     * Catalog of 10 baby products. Each entry's images map to product-N.jpg
     * downloaded from the home-baby.html demo.
     *
     * @return array<int, array{name:string, description:string, content:string, price:float, sale_price:float, images:array<int,string>}>
     */
    private function getCatalog(): array
    {
        return [
            [
                'name' => 'Merino Wool Knit Booties with Drawstring – Snug Comfort for Newborns',
                'description' => 'Soft merino wool booties that keep tiny feet warm without overheating.',
                'content' => '<p>Naturally breathable merino lining with elasticated cuffs. Machine washable on a gentle cycle. Sizes 0-12 months.</p>',
                'price' => 39.99,
                'sale_price' => 29.99,
                'images' => ['product-1.jpg'],
            ],
            [
                'name' => 'Soft Cotton Dribble Bibs 3 Pack – Gentle Protection for Little Messes',
                'description' => 'Three-pack of organic cotton dribble bibs with adjustable nickel-free snaps.',
                'content' => '<p>Triple-layered absorbent core with a waterproof inner barrier. OEKO-TEX certified prints. Fits 3-24 months.</p>',
                'price' => 34.99,
                'sale_price' => 24.99,
                'images' => ['product-2.jpg'],
            ],
            [
                'name' => 'Cozy Bunny Hooded Towel for Newborns and Toddlers',
                'description' => 'Plush bamboo-cotton hooded towel that keeps baby cozy after every bath.',
                'content' => '<p>500gsm bamboo-cotton terry. Generous 90x90cm size. Soft hood with embroidered ear detail. Hypoallergenic and chlorine-free.</p>',
                'price' => 49.99,
                'sale_price' => 39.99,
                'images' => ['product-3.jpg'],
            ],
            [
                'name' => "MUSHIE Frigg Baby's First Pacifier Floral Heart | Kido Bebe",
                'description' => 'One-piece medical-grade silicone pacifier shaped to support natural latch.',
                'content' => '<p>BPA, BPS, PVC, and phthalate-free. Symmetrical orthodontic shape. Boil-sterilizable and dishwasher safe.</p>',
                'price' => 19.99,
                'sale_price' => 14.99,
                'images' => ['product-4.jpg'],
            ],
            [
                'name' => 'Baby Glass Bottle Set 4oz with Latex Nipple – Blush Pink for Little Moments',
                'description' => 'Twin-pack borosilicate glass bottles with anti-colic silicone teats.',
                'content' => '<p>Heat-shock resistant glass with a soft silicone sleeve. Wide-neck design for easy cleaning. 240ml capacity.</p>',
                'price' => 59.99,
                'sale_price' => 49.99,
                'images' => ['product-5.jpg'],
            ],
            [
                'name' => 'Silicone Fork and Spoon Set – Perfect for Self-Feeding Babies',
                'description' => 'Organic cotton sleeping bag with TOG 2.5 rating for cooler nights.',
                'content' => '<p>GOTS-certified outer with hypoallergenic fill. Two-way zip for easy nappy changes. Sizes 0-6, 6-18, and 18-36 months.</p>',
                'price' => 89.99,
                'sale_price' => 69.99,
                'images' => ['product-6.jpg'],
            ],
            [
                'name' => 'Teal Blue 5 Pack Baby Bodysuits – 100% Cotton for Everyday Comfort',
                'description' => 'GOTS-certified organic cotton onesie with envelope shoulders for easy dressing.',
                'content' => '<p>Soft single-jersey knit. Nickel-free press studs. Machine washable. Available in newborn through 18 months.</p>',
                'price' => 22.99,
                'sale_price' => 16.99,
                'images' => ['product-7.jpg'],
            ],
            [
                'name' => 'White Delicate Double Pom Baby Hat – Soft & Cozy Warmth for Little Heads',
                'description' => 'Beech wood teether finished with food-grade beeswax, sized for tiny hands.',
                'content' => '<p>Sustainably harvested European beech. Naturally antibacterial. Pair with a silicone clip to keep it close to baby.</p>',
                'price' => 19.99,
                'sale_price' => 14.99,
                'images' => ['product-8.jpg'],
            ],
            [
                'name' => 'Frigg Moon Natural Rubber Baby Pacifier Gentle Comfort',
                'description' => 'Fragrance-free lotion with oat extract and shea butter for sensitive baby skin.',
                'content' => '<p>Dermatologist-tested. No parabens, sulphates, or synthetic fragrance. 200ml pump bottle.</p>',
                'price' => 24.99,
                'sale_price' => 18.99,
                'images' => ['product-9.jpg'],
            ],
            [
                'name' => 'Little Dine Wooden High Chair Elegant Comfort for Tiny Foodies',
                'description' => 'Hand-knit organic cotton plush companion sized perfectly for little arms.',
                'content' => '<p>Hypoallergenic recycled fill. Embroidered facial details — no small parts. Surface washable.</p>',
                'price' => 44.99,
                'sale_price' => 34.99,
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
