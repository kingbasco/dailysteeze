<?php

namespace Database\Seeders\Themes\HomePetCare\Ecommerce;

use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Database\Seeders\Traits\HasProductSeeder;
use Botble\Ecommerce\Enums\ProductTypeEnum;
use Botble\Ecommerce\Enums\StockStatusEnum;
use Botble\Ecommerce\Models\Product;
use Illuminate\Support\Arr;

/**
 * HomePetCare — pet care product catalog mirroring the home-pet-care.html demo.
 * Ten products covering nutrition, accessories, grooming, and wellness for cats and dogs.
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
                ->map(fn (string $file): ?string => $this->safeFilePath('products/pet/' . $file))
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
     * Catalog of 10 pet products. Each entry's images map to product-N.jpg
     * downloaded from the home-pet-care.html demo.
     *
     * @return array<int, array{name:string, description:string, content:string, price:float, sale_price:float, images:array<int,string>}>
     */
    private function getCatalog(): array
    {
        return [
            [
                'name' => 'Premium Cat Food',
                'description' => 'Grain-free dry food with real salmon as the first ingredient and added taurine.',
                'content' => '<p>Formulated for adult indoor cats. Crude protein 38% min. Resealable 2.5kg bag. No artificial colors or preservatives.</p>',
                'price' => 39.99,
                'sale_price' => 29.99,
                'images' => ['product-1.jpg'],
            ],
            [
                'name' => 'Dog Chew Toy',
                'description' => 'Heavy-duty rubber chew that bounces, floats, and stands up to power chewers.',
                'content' => '<p>Non-toxic natural rubber. Dishwasher safe. Hollow centre stuffs with treats or peanut butter. Sized small through XL.</p>',
                'price' => 25.00,
                'sale_price' => 18.99,
                'images' => ['product-2.jpg'],
            ],
            [
                // Product 3 powers the homepage Product-Single section
                // (PageSeeder §7 product-feature-zoom). Demo shows it with name
                // "Hammock Cat Tower Grey", regular $98.99 → sale $79.99 (-25%).
                'name' => 'Hammock Cat Tower Grey',
                'description' => 'Three-level cat tower with sisal scratching posts and a cozy plush hideaway. Built from solid pine with a soft plush hammock perch and a removable cushion.',
                'content' => '<p>Particle-board core wrapped in soft plush. 110cm tall with replaceable sisal posts. Easy assembly with included tool.</p>',
                'price' => 98.99,
                'sale_price' => 79.99,
                'images' => ['product-3.jpg'],
            ],
            [
                'name' => 'Allergy Relief Drops',
                'description' => 'Vet-formulated liquid drops with omega-3s and quercetin for itchy, sensitive pets.',
                'content' => '<p>Easy-dose dropper. Add to food or water. Suitable for cats and dogs over 6 months. 60ml bottle.</p>',
                'price' => 34.99,
                'sale_price' => 26.99,
                'images' => ['product-4.jpg'],
            ],
            [
                'name' => 'Vitality Supplements',
                'description' => 'Daily multivitamin chews with glucosamine, omega-3, and probiotics for active dogs.',
                'content' => '<p>Beef-flavored soft chews. 90 chews per tub. Supports joints, coat, and digestion. Made in vet-audited facility.</p>',
                'price' => 44.99,
                'sale_price' => 32.99,
                'images' => ['product-5.jpg'],
            ],
            [
                'name' => 'Dog Harness',
                'description' => 'Padded no-pull harness with reflective trim and twin leash attachment points.',
                'content' => '<p>Breathable mesh padding. Adjustable five-point fit. Sizes XS-XL. Hand-wash cold.</p>',
                'price' => 49.99,
                'sale_price' => 39.99,
                'images' => ['product-6.jpg'],
            ],
            [
                'name' => 'Cat Scratching Post',
                'description' => 'Solid-base sisal scratching post sized for full-stretch scratching.',
                'content' => '<p>70cm tall with weighted MDF base for stability. Replaceable sisal column. Includes a hanging feather toy.</p>',
                'price' => 39.99,
                'sale_price' => 29.99,
                'images' => ['product-7.jpg'],
            ],
            [
                'name' => 'Pet Shampoo',
                'description' => 'Oatmeal and aloe shampoo that cleans without stripping natural oils.',
                'content' => '<p>pH-balanced for cats and dogs. Soap-free. Coconut-derived surfactants. 500ml bottle. Cruelty-free.</p>',
                'price' => 29.99,
                'sale_price' => 22.99,
                'images' => ['product-8.jpg'],
            ],
            [
                'name' => 'Cozy Dog Bed',
                'description' => 'Memory-foam orthopedic bed with a removable, machine-washable cover.',
                'content' => '<p>High-density foam supports senior joints. Sherpa fleece cover. Sizes M-XL. Non-slip base.</p>',
                'price' => 79.99,
                'sale_price' => 64.99,
                'images' => ['product-9.jpg'],
            ],
            [
                'name' => 'Calming Treats',
                'description' => 'Soft chew treats with chamomile and L-theanine for stressful events.',
                'content' => '<p>Drug-free formula. 60 treats per bag. Use during travel, storms, or vet visits. Suitable for dogs over 12 weeks.</p>',
                'price' => 32.99,
                'sale_price' => 24.99,
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
