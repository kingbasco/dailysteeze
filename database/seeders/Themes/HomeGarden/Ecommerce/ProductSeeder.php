<?php

namespace Database\Seeders\Themes\HomeGarden\Ecommerce;

use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Database\Seeders\Traits\HasProductSeeder;
use Botble\Ecommerce\Enums\ProductTypeEnum;
use Botble\Ecommerce\Enums\StockStatusEnum;
use Botble\Ecommerce\Models\Product;
use Illuminate\Support\Arr;

/**
 * HomeGarden — indoor plants catalog mirroring the home-garden.html demo.
 * Ten popular houseplants for shelves, floors, and statement corners.
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
                ->map(fn (string $file): ?string => $this->safeFilePath('products/garden/' . $file))
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
     * Catalog of 10 houseplants. Each entry's images map to product-N.jpg
     * downloaded from the home-garden.html demo.
     *
     * @return array<int, array{name:string, description:string, content:string, price:float, sale_price:float, images:array<int,string>}>
     */
    private function getCatalog(): array
    {
        return [
            [
                'name' => 'Epipremnum Aureum',
                'description' => 'Trailing golden pothos — easy care, low light tolerant, and forgiving of busy schedules.',
                'content' => '<p>Ships in a 14cm nursery pot. Loves bright indirect light. Water when the top 2cm of soil is dry.</p>',
                'price' => 24.99,
                'sale_price' => 18.99,
                'images' => ['product-1.jpg'],
            ],
            [
                'name' => 'Monstera Deliciosa',
                'description' => 'Iconic split-leaf monstera that adds dramatic structure to any room.',
                'content' => '<p>Ships in a 17cm nursery pot. Bright indirect light. Water deeply when the soil dries out, then drain fully.</p>',
                'price' => 49.99,
                'sale_price' => 39.99,
                'images' => ['product-2.jpg'],
            ],
            [
                'name' => 'Hoya Carnosa',
                'description' => 'Wax-leaved trailing hoya that rewards patient care with sweetly scented blooms.',
                'content' => '<p>Ships in a 12cm nursery pot. Bright light, snug pot, sparing water. Allow to dry between waterings.</p>',
                'price' => 29.99,
                'sale_price' => 22.99,
                'images' => ['product-3.jpg'],
            ],
            [
                'name' => 'Anthurium Hybrid',
                'description' => 'Glossy heart-shaped leaves and bold red spathes — a long-flowering tabletop favorite.',
                'content' => '<p>Ships in a 14cm nursery pot. Bright indirect light, high humidity. Water when the top inch of soil dries.</p>',
                'price' => 34.99,
                'sale_price' => 27.99,
                'images' => ['../single/detail-10.jpg', '../single/detail-10_1.jpg', '../single/detail-10_2.jpg', '../single/detail-10_3.jpg', '../single/detail-10_4.jpg'],
            ],
            [
                'name' => 'Snake Plant',
                'description' => 'Architectural sansevieria that thrives on neglect — perfect for low-light corners.',
                'content' => '<p>Ships in a 14cm nursery pot. Tolerates low light. Water sparingly — every 3-4 weeks is enough.</p>',
                'price' => 27.99,
                'sale_price' => 19.99,
                'images' => ['product-5.jpg'],
            ],
            [
                'name' => 'Fiddle Leaf Fig',
                'description' => 'Sculptural fiddle-leaf fig with broad violin-shaped leaves — a true statement plant.',
                'content' => '<p>Ships in a 24cm nursery pot. Loves consistent bright indirect light. Avoid drafts and over-watering.</p>',
                'price' => 79.99,
                'sale_price' => 59.99,
                'images' => ['product-6.jpg'],
            ],
            [
                'name' => 'ZZ Plant',
                'description' => 'Glossy zamioculcas that handles drought, dim rooms, and travel schedules with ease.',
                'content' => '<p>Ships in a 14cm nursery pot. Tolerates low light. Water only when soil is fully dry.</p>',
                'price' => 32.99,
                'sale_price' => 24.99,
                'images' => ['product-7.jpg'],
            ],
            [
                'name' => 'Spider Plant',
                'description' => 'Cheerful arching spider plant that produces baby plantlets along trailing stems.',
                'content' => '<p>Ships in a 12cm nursery pot. Bright indirect light. Keep evenly moist; tolerates the occasional dry spell.</p>',
                'price' => 19.99,
                'sale_price' => 14.99,
                'images' => ['product-8.jpg'],
            ],
            [
                'name' => 'Calathea Orbifolia',
                'description' => 'Round silvery-striped leaves that fold up at night — a true prayer-plant favorite.',
                'content' => '<p>Ships in a 14cm nursery pot. Medium indirect light, high humidity. Use distilled or rainwater for best results.</p>',
                'price' => 39.99,
                'sale_price' => 29.99,
                'images' => ['product-9.jpg'],
            ],
            [
                'name' => 'Pothos Marble Queen',
                'description' => 'Variegated marble queen pothos — creamy white and green leaves that brighten any shelf.',
                'content' => '<p>Ships in a 12cm nursery pot. Bright indirect light keeps variegation strong. Water when the top inch of soil dries.</p>',
                'price' => 26.99,
                'sale_price' => 19.99,
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
