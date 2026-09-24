<?php

namespace Database\Seeders\Themes\HomePod\Ecommerce;

use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Database\Seeders\Traits\HasProductSeeder;
use Botble\Ecommerce\Enums\ProductTypeEnum;
use Botble\Ecommerce\Enums\StockStatusEnum;
use Botble\Ecommerce\Models\Product;
use Illuminate\Support\Arr;

/**
 * HomePod — print-on-demand catalog mirroring the home-pod.html demo.
 * Twelve customizable products covering apparel, drinkware, decor, and gifts.
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

            // §7 "What's Hot?" tab pulls source='featured' — HasProductSeeder
            // randomizes is_featured and often leaves <4 featured, which under-fills
            // the 4-up tab swiper. Deterministically feature the first 6 parents so
            // the demo's 4-card row is always satisfied.
            if ($i < 6 && ! $parent->is_featured) {
                $parent->is_featured = true;
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
                ->map(fn (string $file): ?string => $this->safeFilePath('products/personal/' . $file))
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
     * Catalog of 12 print-on-demand products. Each entry's images map to
     * product-N.jpg downloaded from the home-pod.html demo.
     *
     * @return array<int, array{name:string, description:string, content:string, price:float, sale_price:float, images:array<int,string>}>
     */
    private function getCatalog(): array
    {
        return [
            [
                'name' => 'Astronaut Phone Case',
                'description' => 'Drop-tested slim phone case featuring a custom astronaut illustration and your name.',
                'content' => '<p>Polycarbonate shell with TPU bumper. Wireless-charging compatible. Available for iPhone and Pixel models.</p>',
                'price' => 29.99,
                'sale_price' => 22.99,
                'images' => ['product-1.jpg', 'detail-1.jpg', 'detail-1_2.jpg', 'detail-1_3.jpg', 'detail-1_5.jpg', 'detail-1_6.jpg'],
            ],
            [
                'name' => 'Dinosaur Theme Mug',
                'description' => 'Glossy ceramic mug printed with playful dinosaur artwork and a custom name.',
                'content' => '<p>11oz capacity. Microwave and dishwasher safe. Photo-quality print that survives daily use.</p>',
                'price' => 19.99,
                'sale_price' => 14.99,
                'images' => ['product-2.jpg'],
            ],
            [
                'name' => 'Coffee Mug Custom',
                'description' => 'Personalize a 15oz coffee mug with your favorite photo, quote, or monogram.',
                'content' => '<p>Premium ceramic. Dishwasher and microwave safe. Edge-to-edge full-color print.</p>',
                'price' => 22.99,
                'sale_price' => 16.99,
                'images' => ['product-3.jpg'],
            ],
            [
                'name' => 'Egg-Crate Wall Art',
                'description' => 'Statement wall art print with a playful egg-crate motif on archival matte paper.',
                'content' => '<p>Archival inks. Available in 12x18 and 18x24. FSC-certified paper. Frame sold separately.</p>',
                'price' => 39.99,
                'sale_price' => 29.99,
                'images' => ['product-4.jpg'],
            ],
            [
                'name' => 'Photo Candle',
                'description' => 'Soy-blend candle in a frosted glass jar wrapped with your favorite photograph.',
                'content' => '<p>40-hour burn time. Lightly scented or unscented options. Perfect anniversary or memorial gift.</p>',
                'price' => 34.99,
                'sale_price' => 24.99,
                'images' => ['product-5.jpg'],
            ],
            [
                'name' => 'Custom Tee Premium',
                'description' => 'Heavyweight 100% cotton tee printed with your photo, art, or message.',
                'content' => '<p>Pre-shrunk ringspun cotton. Sizes XS-3XL. Direct-to-garment print resists fading wash after wash.</p>',
                'price' => 32.99,
                'sale_price' => 24.99,
                'images' => ['product-6.jpg'],
            ],
            [
                'name' => 'Pet Portrait Print',
                'description' => 'Hand-illustrated portrait of your pet, printed on archival matte paper.',
                'content' => '<p>Send any photo and our illustrators turn it into a stylized portrait. 8x10 and 16x20 sizes.</p>',
                'price' => 49.99,
                'sale_price' => 39.99,
                'images' => ['product-7.jpg'],
            ],
            [
                'name' => 'Family Tote Bag',
                'description' => 'Heavy-duty 12oz cotton tote printed with a custom family monogram or photo.',
                'content' => '<p>Reinforced handles, machine washable. Great as a beach bag, market tote, or daily carry.</p>',
                'price' => 24.99,
                'sale_price' => 17.99,
                'images' => ['product-8.jpg'],
            ],
            [
                'name' => 'Heart Photo Frame',
                'description' => 'Heart-shaped wooden frame with your favorite couple photo printed in soft matte.',
                'content' => '<p>FSC-certified beech wood. Free-standing or wall-mountable. 5x5 print area.</p>',
                'price' => 27.99,
                'sale_price' => 19.99,
                'images' => ['product-9.jpg'],
            ],
            [
                'name' => 'Personalized Pillow',
                'description' => 'Plush throw pillow printed with your photo or design — soft on both sides.',
                'content' => '<p>16x16 polyester cover with feather-blend insert. Removable and machine washable.</p>',
                'price' => 36.99,
                'sale_price' => 27.99,
                'images' => ['product-10.jpg'],
            ],
            [
                'name' => 'Photo Book Mini',
                'description' => 'Compact 5x7 hardcover photo book — ideal for trips, weddings, or year-in-review keepsakes.',
                'content' => '<p>20-100 page options. Premium silk paper. Layflat binding for distortion-free spreads.</p>',
                'price' => 44.99,
                'sale_price' => 34.99,
                'images' => ['product-11.jpg'],
            ],
            [
                'name' => 'Engraved Coaster Set',
                'description' => 'Set of four bamboo coasters laser-engraved with names, dates, or custom artwork.',
                'content' => '<p>FSC-certified bamboo. Cork base protects surfaces. Comes in a kraft gift box ready to give.</p>',
                'price' => 26.99,
                'sale_price' => 19.99,
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
