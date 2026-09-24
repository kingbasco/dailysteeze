<?php

namespace Database\Seeders\Themes\Main\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Database\Seeders\Traits\HasProductSeeder;
use Botble\Ecommerce\Enums\ProductTypeEnum;
use Botble\Ecommerce\Enums\StockStatusEnum;
use Botble\Ecommerce\Models\Product;
use Botble\Ecommerce\Models\ProductAttribute;
use Botble\Ecommerce\Models\ProductAttributeSet;
use Botble\Ecommerce\Models\ProductVariation;
use Botble\Ecommerce\Models\ProductVariationItem;
use Botble\Media\Facades\RvMedia;
use Botble\Media\Services\ThumbnailService;
use Illuminate\Support\Arr;
use Illuminate\Support\Collection;

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

        // HasProductSeeder randomly creates variations and either copies the
        // variation's sale_price back to the parent (wiping our catalog price)
        // or — when the catalog omits sale_price — fakers a random one. Restore
        // each parent to the catalog's intent: explicit float overrides faker;
        // explicit null clears the field so the product shows full price.
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

        $this->seedFeaturedVariations();
    }

    /**
     * Replace random variations on the 4 hand-picked demo parents with a
     * Color-only grid that uses the EXACT colors the html/home-fashion.html
     * demo shows on each card (Lyocell→Pink/Brown/Green, Wool Midi→White/
     * Black/Cream, Buttons→Pink/White, linen→Blue/Black). Each color binds
     * to one of the parent's image slots so the visual swatch surfaces
     * the per-color photo via ProductAttributeSet::use_image_from_product_variation.
     *
     * Sizes are intentionally not seeded here — the demo only renders the
     * size strip on Buttons cotton top (XS/S/M) and the rest are color-only.
     * For YAGNI we keep the schema simple; sizes can be added back per-product
     * if needed.
     */
    protected function seedFeaturedVariations(): void
    {
        $colorSet = ProductAttributeSet::query()->where('slug', 'color')->first();

        if (! $colorSet) {
            return;
        }

        // Per-product color set ordered as the demo's `<ul class="product-color_list">`.
        // First entry is the active swatch (renders parent's primary image).
        $featured = [
            'Lyocell wrap top' => ['pink', 'brown', 'green'],
            'Wool Midi Coat' => ['white', 'black', 'cream'],
            'Buttons cotton top' => ['pink', 'white'],
            'linen slim-fit shirt' => ['blue', 'black'],
        ];

        $allColorSlugs = collect($featured)->flatten()->unique()->values()->all();

        $colors = ProductAttribute::query()
            ->where('attribute_set_id', $colorSet->getKey())
            ->whereIn('slug', $allColorSlugs)
            ->get()
            ->keyBy('slug');

        if ($colors->isEmpty()) {
            return;
        }

        $parents = Product::query()
            ->where('is_variation', false)
            ->whereIn('name', array_keys($featured))
            ->get()
            ->keyBy('name');

        foreach ($featured as $productName => $colorSlugs) {
            $parent = $parents->get($productName);
            if (! $parent) {
                continue;
            }

            $orderedColors = collect($colorSlugs)
                ->map(fn (string $slug) => $colors->get($slug))
                ->filter()
                ->values();

            if ($orderedColors->isEmpty()) {
                continue;
            }

            $this->rebuildColorVariations($parent, $colorSet, $orderedColors);
        }

        $this->updateProductVariationsCount();
    }

    /**
     * Wipe a parent's existing variations and rebuild as a Color-only set
     * matching the demo's per-product palette. Each color reuses one of the
     * parent's image slots so the swatch surfaces a distinct photo.
     */
    protected function rebuildColorVariations(
        Product $parent,
        ProductAttributeSet $colorSet,
        Collection $colors,
    ): void {
        $images = collect((array) $parent->images)->filter()->values();
        if ($images->isEmpty()) {
            return;
        }

        $existingVariations = ProductVariation::query()
            ->where('configurable_product_id', $parent->getKey())
            ->get();

        $variationProductIds = $existingVariations->pluck('product_id')->all();
        $variationIds = $existingVariations->pluck('id')->all();

        if (! empty($variationIds)) {
            ProductVariationItem::query()->whereIn('variation_id', $variationIds)->delete();
            ProductVariation::query()->whereIn('id', $variationIds)->delete();
        }

        if (! empty($variationProductIds)) {
            Product::query()->whereIn('id', $variationProductIds)->delete();
        }

        $parent->productAttributeSets()->sync([$colorSet->getKey()]);

        foreach ($colors as $i => $color) {
            $variantImage = $images[$i] ?? $images->first();

            $variation = Product::query()->create([
                'name' => $parent->name,
                'status' => BaseStatusEnum::PUBLISHED,
                'sku' => sprintf('%s-%s', $parent->sku, strtoupper(substr($color->slug, 0, 3))),
                'barcode' => $this->generateUniqueBarcode(),
                'quantity' => $parent->quantity ?: 10,
                'weight' => $parent->weight,
                'height' => $parent->height,
                'wide' => $parent->wide,
                'length' => $parent->length,
                'price' => $parent->price,
                'sale_price' => null,
                'brand_id' => $parent->brand_id,
                'with_storehouse_management' => true,
                'is_variation' => true,
                'images' => json_encode([$variantImage]),
                'product_type' => $parent->product_type,
                'stock_status' => StockStatusEnum::IN_STOCK,
            ]);

            $productVariation = ProductVariation::query()->create([
                'product_id' => $variation->getKey(),
                'configurable_product_id' => $parent->getKey(),
                'is_default' => $i === 0,
            ]);

            ProductVariationItem::query()->create([
                'attribute_id' => $color->getKey(),
                'variation_id' => $productVariation->getKey(),
            ]);
        }
    }

    /**
     * Disable digital products in seeded catalog — Main demos a physical-goods
     * marketplace (fashion / accessories).
     */
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

            $videoMedia = $this->buildVideoMedia($entry['video'] ?? null);

            return array_merge([
                'product_type' => ProductTypeEnum::PHYSICAL,
                'stock_status' => StockStatusEnum::IN_STOCK,
                'image' => $images[0] ?? null,
                'images' => $images,
                'video_media' => $videoMedia,
                // Default to NOT featured. The 4 demo parents override this via
                // `is_featured => true` so `source=featured` on the homepage
                // reliably surfaces them (and only them) with their swatches.
                // Without this default, HasProductSeeder fakes is_featured 50/50,
                // polluting the featured feed with no-swatch products.
                'is_featured' => false,
            ], Arr::except($entry, ['images', 'video']));
        })->all();
    }

    /**
     * Build the plugin's `video_media` JSON shape from a compact catalog hint.
     *
     * Accepts:
     *   int 1|2  — uses bundled MP4 (videos/video-N.mp4 + videos/N.jpg poster)
     *   string   — treated as external URL (YouTube/Vimeo/etc), poster falls back to video-1 thumb
     *   null     — no video
     *
     * Output matches `Botble\Ecommerce\Models\Product::video()`'s expected
     * `video_media` array shape: `[[ ['value'=>fileUrl], ['value'=>extUrl], ['value'=>thumbPath] ]]`.
     */
    private function buildVideoMedia(int|string|null $hint): ?array
    {
        if ($hint === null) {
            return null;
        }

        if (is_int($hint)) {
            $file = $this->safeFilePath(sprintf('products/videos/video-%d.mp4', $hint));
            $thumb = $this->safeFilePath(sprintf('products/videos/%d.jpg', $hint));
            if (! $file) {
                return null;
            }

            return [[
                ['key' => 'file', 'value' => $file],
                ['key' => 'url', 'value' => null],
                ['key' => 'thumbnail', 'value' => $thumb],
            ]];
        }

        // External URL — let the model accessor detect the provider.
        return [[
            ['key' => 'file', 'value' => null],
            ['key' => 'url', 'value' => $hint],
            ['key' => 'thumbnail', 'value' => $this->safeFilePath('products/videos/1.jpg')],
        ]];
    }

    /**
     * Catalog mirrors html/home-fashion.html — first four entries match the
     * "Today's Best Choices" carousel order (Lyocell, Wool Midi Coat, Buttons,
     * linen) with HTML's product-14..17 image set. Remaining entries cover
     * sunglasses, bags, and accessories pulled from shop-full-width.html.
     *
     * @return array<int, array{name:string, description:string, content:string, price:float, sale_price:float, images:array<int,string>}>
     */
    private function getCatalog(): array
    {
        return [
            [
                'name' => 'Lyocell wrap top',
                'description' => 'A cool-touch lyocell wrap top with a soft drape and self-tie waist — versatile from desk to dinner.',
                'content' => '<p>Cut from 100% TENCEL™ lyocell, the wrap top breathes like linen and falls like silk. The deep V neckline and side-tie closure adjust to any waist shape.</p>',
                'price' => 99.99,
                'sale_price' => 69.99,
                'is_featured' => true,
                // 3 colors → 3 distinct images so each swatch surfaces its own photo.
                'images' => ['product-14.jpg', 'product-14_3.jpg', 'product-14_4.jpg'],
                'video' => 1,
            ],
            [
                'name' => 'Wool Midi Coat',
                'description' => 'A midi-length wool coat with welt pockets and a clean notch lapel — a modern outerwear classic.',
                'content' => '<p>Italian wool-blend melton with a soft satin lining. Single-breasted with two-button closure. Falls below the knee for full coverage on cold days.</p>',
                'price' => 25.99,
                'sale_price' => 15.99,
                'is_featured' => true,
                'images' => ['product-15.jpg', 'product-15_4.jpg', 'product-15_3.jpg'],
                'video' => 'https://www.youtube.com/watch?v=6JYIGclVQdw',
            ],
            [
                'name' => 'Buttons cotton top',
                'description' => 'A button-front cotton top with a relaxed fit and mother-of-pearl closures.',
                'content' => '<p>Mid-weight 180 GSM cotton poplin holds its shape across long days. Mother-of-pearl buttons. Slightly cropped hem pairs well with high-rise denim.</p>',
                'price' => 49.99,
                'sale_price' => 29.99,
                'is_featured' => true,
                'images' => ['product-16.jpg', 'product-16_3.jpg'],
            ],
            [
                'name' => 'linen slim-fit shirt',
                'description' => 'A garment-washed linen shirt with a slim cut and rounded hem — equal parts office and weekend.',
                'content' => '<p>European flax woven and finished in Portugal. Stone buttons. Slim through the body without restricting movement.</p>',
                'price' => 79.99,
                'sale_price' => 45.99,
                'is_featured' => true,
                'images' => ['product-17.jpg', 'product-17_3.jpg'],
            ],
            [
                'name' => 'High neck midi wool coat',
                'description' => 'A high-neck wool coat in a soft camel — funnel collar zips fully closed for blustery commutes.',
                'content' => '<p>Brushed wool melton with a recycled-polyester twill lining. Hidden two-way zipper. Fully welt-pocketed at the hip.</p>',
                'price' => 19.99,
                'sale_price' => 9.99,
                'images' => ['product-5.jpg', 'product-5_2.jpg', 'product-5_3.jpg', 'product-5_4.jpg'],
            ],
            [
                'name' => 'Square metallic frame sunglasses',
                'description' => 'Square metallic-frame sunglasses with hand-polished acetate temples and CR-39 lenses.',
                'content' => '<p>Lightweight stainless-steel front. CR-39 polarized lenses block 100% UVA/UVB. Adjustable nose pads. Includes a hard case and microfiber pouch.</p>',
                'price' => 59.99,
                'sale_price' => 34.99,
                'images' => ['product-6.jpg', 'product-6_2.jpg', 'product-6_3.jpg'],
            ],
            [
                'name' => 'Leather shopper bag with stitching',
                'description' => 'A roomy leather shopper with contrast saddle stitching and reinforced corners.',
                'content' => '<p>Vegetable-tanned full-grain leather develops a warm patina with use. Open top with magnetic closure. Suede-lined interior with two slip pockets and one zip.</p>',
                'price' => 39.99,
                'sale_price' => 22.99,
                'images' => ['product-7.jpg', 'product-7_2.jpg', 'product-7_3.jpg', 'product-7_4.jpg'],
            ],
            [
                'name' => 'Leather shopper bag with stitching',
                'description' => 'A larger version of our signature leather shopper — built for laptops, books, and a 16-inch tablet.',
                'content' => '<p>Same vegetable-tanned full-grain leather and saddle-stitched construction, scaled up. Padded interior sleeve fits up to a 16-inch laptop.</p>',
                'price' => 89.99,
                'sale_price' => null,
                'images' => ['product-8.jpg', 'product-8_2.jpg', 'product-8_3.jpg', 'product-8_4.jpg'],
            ],
            [
                'name' => 'Oval shoulder bag',
                'description' => 'A compact oval shoulder bag with a slim leather strap — fits a phone, wallet, and essentials.',
                'content' => '<p>Smooth nappa leather with a polished gold-tone clasp. Adjustable strap. Microsuede-lined interior with a single card slot.</p>',
                'price' => 21.99,
                'sale_price' => 12.99,
                'images' => ['product-9.jpg', 'product-9_2.jpg', 'product-9_3.jpg'],
            ],
            [
                'name' => 'Oval shoulder bag',
                'description' => 'The oval shoulder bag in pebbled black leather — a clean, minimal carry.',
                'content' => '<p>Pebbled grain hides daily wear and tear. Same gold-tone clasp and microsuede lining as the nappa version.</p>',
                'price' => 18.99,
                'sale_price' => null,
                'images' => ['product-10.jpg'],
            ],
            [
                'name' => 'Oval shoulder bag',
                'description' => 'The oval shoulder bag in cream — a versatile neutral that goes with any outfit.',
                'content' => '<p>Cream nappa leather with the same hardware and lining. Spot-clean only — comes with a complimentary leather protector.</p>',
                'price' => 21.99,
                'sale_price' => 12.99,
                'images' => ['product-11.jpg'],
            ],
            [
                'name' => 'Oversized poplin button-up shirt',
                'description' => 'Soft pink poplin shirt with an oversized fit, dropped shoulder seams and a curved hem.',
                'content' => '<p>100% organic cotton poplin. Machine wash cold. Pairs effortlessly with denim, tailored trousers, or layered under a knit. Designed in Barcelona, made in Portugal.</p>',
                'price' => 49.99,
                'sale_price' => 36.75,
                'images' => ['product-12.jpg', 'product-12_2.jpg'],
            ],
            [
                'name' => 'Ribbed halter cami top',
                'description' => 'A ribbed cotton halter cami with adjustable shoulder straps and a cropped, fitted hem.',
                'content' => '<p>Soft-ribbed organic cotton with a touch of elastane for a body-skimming fit. High-neck halter front, scoop back. Available in beige, black, and ivory.</p>',
                'price' => 39.99,
                'sale_price' => 24.99,
                'images' => ['product-1.jpg', 'product-1_2.jpg', 'product-1_3.jpg', 'product-1_4.jpg'],
            ],
            [
                'name' => 'Cropped wool-blend knit sweater',
                'description' => 'A cropped crew-neck sweater in a warm wool blend — slouchy through the body with ribbed hem and cuffs.',
                'content' => '<p>Mid-gauge knit in a wool-merino-cashmere blend. Drop shoulders and dropped sleeves give it an easy oversized line that pairs with anything from denim to tailored trousers.</p>',
                'price' => 79.99,
                'sale_price' => null,
                'images' => ['product-2.jpg', 'product-2_2.jpg', 'product-2_3.jpg'],
                'video' => 2,
            ],
            [
                'name' => 'Garment-washed linen overshirt',
                'description' => 'A relaxed-fit linen overshirt with a clean spread collar and shell buttons — sized to wear over a tee.',
                'content' => '<p>Pure European flax in a 200 GSM weight. Garment-washed for a soft, lived-in hand. Available in olive, navy, and stone.</p>',
                'price' => 69.99,
                'sale_price' => 44.99,
                'images' => ['product-3.jpg', 'product-3_2.jpg', 'product-3_3.jpg', 'product-3_4.jpg'],
            ],
            [
                'name' => 'Funnel-neck wool jacket',
                'description' => 'A short wool jacket with a stand-up funnel collar, snap-button placket, and full-zip closure.',
                'content' => '<p>Charcoal melton wool with a recycled-poly twill lining. Storm-flap front conceals a YKK two-way zip. Sized for layering over a knit or button-up.</p>',
                'price' => 139.99,
                'sale_price' => null,
                'images' => ['product-4.jpg', 'product-4_2.jpg'],
            ],
            // Lookbook section storytelling products — referenced by the
            // home-fashion lookbook-hotspot section to mirror demo's
            // "Train Free Sports Bra" / "NKD High Waisted Shorts" cards.
            // is_featured=false so they don't surface in "Today's Best Choices".
            [
                'name' => 'Train Free Sports Bra',
                'description' => 'Built for speed, comfort, and everyday movement.',
                'content' => '<p>Compression-fit running bra with rope-detail back strap and seamless knit underbust band. Moves with the body and dries fast.</p>',
                'price' => 39.99,
                'sale_price' => 29.99,
                'images' => ['lookbook-prd-1.jpg'],
            ],
            [
                'name' => 'NKD High Waisted Shorts',
                'description' => 'Built for speed, comfort, and everyday movement.',
                'content' => '<p>High-rise running shorts with built-in liner and laser-cut waistband. Hidden zip pocket at the back yoke.</p>',
                'price' => 79.99,
                'sale_price' => 69.99,
                'images' => ['lookbook-prd-2.jpg'],
            ],
        ];
    }

    /**
     * Resolve a file path via BaseSeeder::filePath() but tolerate missing assets.
     * Also backfills thumbnails when the source already exists in storage —
     * BaseSeeder::filePath() short-circuits on existing files and skips the
     * RvMedia upload pipeline that normally generates them.
     */
    private function safeFilePath(string $path): ?string
    {
        try {
            $resolved = $this->filePath($path);
        } catch (\Throwable) {
            return null;
        }

        $this->ensureThumbnails($resolved);

        return $resolved;
    }

    private function ensureThumbnails(string $relativePath): void
    {
        $absolute = public_path('storage/' . $relativePath);
        if (! file_exists($absolute) || ! preg_match('/\.(jpg|jpeg|png|webp)$/i', $relativePath)) {
            return;
        }

        $sizes = RvMedia::getSizes();
        $svc = app(ThumbnailService::class);
        $name = pathinfo($relativePath, PATHINFO_FILENAME);
        $ext = pathinfo($relativePath, PATHINFO_EXTENSION);
        $dir = pathinfo($relativePath, PATHINFO_DIRNAME);

        foreach ($sizes as $size) {
            $thumbName = "{$name}-{$size}.{$ext}";
            if (file_exists(public_path("storage/{$dir}/{$thumbName}"))) {
                continue;
            }
            [$w, $h] = explode('x', $size);

            try {
                $svc->setImage($absolute)
                    ->setSize((int) $w, (int) $h)
                    ->setDestinationPath($dir)
                    ->setFileName($thumbName)
                    ->save();
            } catch (\Throwable) {
                // Best-effort; missing one size shouldn't fail the seed.
            }
        }
    }
}
