<?php

namespace Database\Seeders\Themes\HomeMental\Ecommerce;

use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Database\Seeders\Traits\HasProductSeeder;
use Botble\Ecommerce\Enums\ProductTypeEnum;
use Botble\Ecommerce\Enums\StockStatusEnum;
use Botble\Ecommerce\Models\Product;
use Botble\Ecommerce\Models\ProductCategory;
use Botble\Ecommerce\Models\ProductVariation;
use Botble\Slug\Models\Slug;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;

/**
 * HomeMental — wellness product catalog mirroring the home-mental.html demo.
 * Nine products covering supplements, calm aids, and recovery essentials.
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

        DB::statement('SET FOREIGN_KEY_CHECKS=0;');
        ProductVariation::query()->delete();
        Product::query()->delete();
        Slug::query()->where('reference_type', Product::class)->delete();
        DB::statement('SET FOREIGN_KEY_CHECKS=1;');

        $catalog = $this->getProducts();

        $this->createProducts($catalog, false);

        $categoryMap = [
            'Daily Greens Powder' => ['Supplements'],
            'Calm Mind Adaptogen Capsules' => ['Supplements'],
            'Sleep Restore Magnesium Drink' => ['Supplements'],
            'Aromatherapy Diffuser' => ['Health Devices'],
            'Mood Support Mushroom Blend' => ['Mind Balance'],
            'Botanical Body Oil' => ['Body Care'],
            'Mindfulness Journal' => ['Mind Balance'],
            'Light Therapy Lamp' => ['Health Devices'],
            'Herbal Recovery Tea' => ['Relaxation'],
        ];

        $categories = ProductCategory::query()
            ->whereIn('name', collect($categoryMap)->flatten()->unique()->all())
            ->get()
            ->keyBy('name');

        foreach ($categoryMap as $productName => $categoryNames) {
            $product = Product::query()->where('name', $productName)->first();
            if (! $product) {
                continue;
            }

            $ids = collect($categoryNames)->map(fn ($name) => $categories->get($name)?->id)->filter()->all();
            $product->categories()->sync($ids);
        }

        $parents = Product::query()
            ->where('is_variation', false)
            ->orderBy('id')
            ->get();

        foreach ($parents as $i => $parent) {
            $entry = $catalog[$i] ?? null;
            if (! $entry || ! array_key_exists('sale_price', $entry)) {
                continue;
            }

            $expected = $entry['sale_price'];
            if ($expected === null) {
                if ($parent->sale_price !== null) {
                    $parent->sale_price = null;
                    $parent->save();
                }
            } elseif ((float) $parent->sale_price !== (float) $expected) {
                $parent->sale_price = $expected;
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
                ->map(fn (string $file): ?string => $this->safeFilePath('products/mental/' . $file))
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
     * Catalog of 9 wellness products. Each entry's images map to product-N.jpg
     * downloaded from the home-mental.html demo.
     *
     * @return array<int, array{name:string, description:string, content:string, price:float, sale_price:float, images:array<int,string>}>
     */
    private function getCatalog(): array
    {
        return [
            [
                'name' => 'Daily Greens Powder',
                'description' => 'Organic super-greens blend with spirulina, chlorella, and adaptogens for daily vitality.',
                'content' => '<p>Plant-based, sugar-free, and packed with 24 nutrient-dense whole foods. Mix one scoop into water or your favorite smoothie each morning.</p>',
                'price' => 49.99,
                'sale_price' => 39.99,
                'images' => ['product-1.jpg'],
            ],
            [
                'name' => 'Calm Mind Adaptogen Capsules',
                'description' => 'Ashwagandha + L-theanine blend formulated to ease stress and support clear focus.',
                'content' => '<p>Vegan capsules combining 600mg KSM-66 ashwagandha with rhodiola and theanine. Take two capsules daily with food.</p>',
                'price' => 39.99,
                'sale_price' => 29.99,
                'images' => ['product-2.jpg'],
            ],
            [
                'name' => 'Sleep Restore Magnesium Drink',
                'description' => 'Magnesium glycinate with chamomile and tart cherry — a calming nightly ritual.',
                'content' => '<p>Mix into warm water 30 minutes before bed. 200mg highly absorbable magnesium per serving. Caffeine-free, non-habit forming.</p>',
                'price' => 34.99,
                'sale_price' => 24.99,
                'images' => ['product-3.jpg'],
            ],
            [
                'name' => 'Aromatherapy Diffuser',
                'description' => 'Ultrasonic ceramic diffuser with seven-color ambient lighting and four-hour run time.',
                'content' => '<p>Whisper-quiet operation. Auto-shutoff. 200ml reservoir covers rooms up to 30sqm. Includes calming starter blend.</p>',
                'price' => 79.99,
                'sale_price' => 59.99,
                'images' => ['product-4.jpg'],
            ],
            [
                'name' => 'Mood Support Mushroom Blend',
                'description' => 'Functional mushroom complex — lions mane, reishi, and cordyceps — for cognitive support.',
                'content' => '<p>Dual-extracted from organic fruiting bodies. 1500mg per serving. Mix into coffee, tea, or smoothies.</p>',
                'price' => 44.99,
                'sale_price' => 34.99,
                'images' => ['product-5.jpg'],
            ],
            [
                'name' => 'Botanical Body Oil',
                'description' => 'Cold-pressed jojoba and squalane infused with lavender and bergamot — calms skin and senses.',
                'content' => '<p>100ml frosted-glass bottle. Apply after showering for soft, hydrated skin and a calming aroma. Cruelty-free.</p>',
                'price' => 54.99,
                'sale_price' => 39.99,
                'images' => ['product-6.jpg'],
            ],
            [
                'name' => 'Mindfulness Journal',
                'description' => 'Guided 12-week journal with daily prompts for gratitude, reflection, and intention setting.',
                'content' => '<p>FSC-certified paper. Linen hardcover. Includes habit tracker, breathing exercises, and weekly reviews.</p>',
                'price' => 29.99,
                'sale_price' => 19.99,
                'images' => ['product-7.jpg'],
            ],
            [
                'name' => 'Light Therapy Lamp',
                'description' => '10,000 lux full-spectrum desk lamp with adjustable warmth and a built-in 30-minute timer.',
                'content' => '<p>Helps regulate circadian rhythm during darker months. UV-filtered. Compact desk footprint and tilt adjustment.</p>',
                'price' => 89.99,
                'sale_price' => 69.99,
                'images' => ['product-8.jpg'],
            ],
            [
                'name' => 'Herbal Recovery Tea',
                'description' => 'Loose-leaf chamomile, valerian, and lemon balm — a nightly cup for unwinding before sleep.',
                'content' => '<p>Organically grown and hand-blended. 50g resealable tin yields 25 servings. Naturally caffeine-free.</p>',
                'price' => 24.99,
                'sale_price' => 18.99,
                'images' => ['product-9.jpg'],
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
