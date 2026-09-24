<?php

namespace Database\Seeders\Themes\HomeFurniture\Ecommerce;

use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Database\Seeders\Traits\HasProductSeeder;
use Botble\Ecommerce\Enums\ProductTypeEnum;
use Botble\Ecommerce\Enums\StockStatusEnum;
use Botble\Ecommerce\Models\Product;
use Illuminate\Support\Arr;

/**
 * HomeFurniture — designer furniture catalog mirroring the home-furniture.html demo.
 * Ten products across living, dining, bedroom, and lighting categories.
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
                ->map(fn (string $file): ?string => $this->safeFilePath('products/' . $file))
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
     * Catalog of 10 designer-furniture products mapped to product-1..10.jpg.
     *
     * @return array<int, array{name:string, description:string, content:string, price:float, sale_price:float, images:array<int,string>}>
     */
    private function getCatalog(): array
    {
        return [
            [
                'name' => 'Imola Armchair',
                'description' => 'Sculptural lounge armchair upholstered in boucle with solid oak base.',
                'content' => '<p>FSC-certified oak frame with high-resilience foam and natural latex cushioning. Designed for living rooms that earn second looks.</p>',
                'price' => 1299.00,
                'sale_price' => 999.00,
                'images' => ['product-1.jpg'],
            ],
            [
                'name' => 'Expose Side Table',
                'description' => 'Sculpted side table with travertine top and powder-coated steel base.',
                'content' => '<p>Each travertine slab is unique — natural veining and subtle tonal variations are the signature of the piece.</p>',
                'price' => 459.00,
                'sale_price' => 379.00,
                'images' => ['product-2.jpg'],
            ],
            [
                'name' => 'Element Nightstand',
                'description' => 'Two-drawer walnut nightstand with soft-close hardware and brass pulls.',
                'content' => '<p>Solid walnut throughout, hand-rubbed finish, and dovetailed drawers. Designed to age into a richer patina over decades.</p>',
                'price' => 729.00,
                'sale_price' => 599.00,
                'images' => ['product-3.jpg'],
            ],
            [
                'name' => 'Bukowski Lounge Chair',
                'description' => 'Cantilevered lounge chair in saddle leather over a stainless-steel frame.',
                'content' => '<p>Inspired by mid-century icons, hand-stitched edges and full-grain Italian leather make this a future heirloom.</p>',
                'price' => 1899.00,
                'sale_price' => 1499.00,
                'images' => ['product-4.jpg'],
            ],
            [
                'name' => 'Stockholm Pendant',
                'description' => 'Sculptural pendant lamp in hand-blown amber glass and matte-black hardware.',
                'content' => '<p>Direct-wire installation, dimmable, and works beautifully solo or in clusters above a dining table.</p>',
                'price' => 389.00,
                'sale_price' => 319.00,
                'images' => ['product-5.jpg'],
            ],
            [
                'name' => 'Modular Storage Cube',
                'description' => 'Stackable storage cube in solid ash with optional drop-front doors.',
                'content' => '<p>Configure as a single unit or stack into shelving — modular hardware lets the system grow with your space.</p>',
                'price' => 269.00,
                'sale_price' => 219.00,
                'images' => ['product-6.jpg'],
            ],
            [
                'name' => 'King Platform Bed',
                'description' => 'Low-profile platform bed with upholstered linen headboard and oak frame.',
                'content' => '<p>Slat foundation supports any mattress without a box spring. Linen cover removes for cleaning.</p>',
                'price' => 1599.00,
                'sale_price' => 1299.00,
                'images' => ['product-7.jpg'],
            ],
            [
                'name' => 'Dining Table Oak',
                'description' => 'Solid white-oak extending dining table seats six to ten with center leaf.',
                'content' => '<p>Trestle base provides ample knee room. Hand-finished surface is treated with natural oil — easy to refresh year over year.</p>',
                'price' => 1899.00,
                'sale_price' => 1499.00,
                'images' => ['product-8.jpg'],
            ],
            [
                'name' => 'Velvet Sofa 3-Seater',
                'description' => 'Tailored three-seat sofa in deep emerald velvet with brass tapered legs.',
                'content' => '<p>Kiln-dried hardwood frame, sinuous spring suspension, and feather-wrapped cushions. White-glove delivery included.</p>',
                'price' => 1799.00,
                'sale_price' => 1399.00,
                'images' => ['product-9.jpg'],
            ],
            [
                'name' => 'Bookshelf Tall',
                'description' => 'Floor-to-ceiling bookshelf in solid walnut with adjustable shelving.',
                'content' => '<p>Eight adjustable shelves and reinforced anchor points. Each shelf supports up to 50 pounds of books and objects.</p>',
                'price' => 169.00,
                'sale_price' => 129.00,
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
