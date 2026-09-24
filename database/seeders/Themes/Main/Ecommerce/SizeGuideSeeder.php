<?php

namespace Database\Seeders\Themes\Main\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\ProductCategory;
use Botble\Setting\Facades\Setting;
use FriendsOfBotble\ProductSizeGuide\Models\SizeGuide;
use FriendsOfBotble\ProductSizeGuide\Models\SizeGuideHeader;
use FriendsOfBotble\ProductSizeGuide\Models\SizeGuideRelation;
use Illuminate\Support\Facades\DB;

/**
 * Seeds the FOB Product Size Guide plugin so the "Size Guide" link in the
 * product detail page opens a populated chart matching the demo at
 * https://tfamerce.vercel.app/product-countdown-timer.html (Image #28).
 *
 * Layout:
 *   - 1 SizeGuideHeader per column (Size, US, Bust, Waist, Low Hip)
 *   - 1 SizeGuide row "Default Size Chart" with XS-XXL rows
 *   - 1 SizeGuideRelation per top-level clothing category so all products
 *     under those categories inherit the guide via the plugin's resolution
 *     chain (product → category → brand).
 */
class SizeGuideSeeder extends BaseSeeder
{
    public function run(): void
    {
        if (! is_plugin_active('fob-product-size-guide') || ! is_plugin_active('ecommerce')) {
            return;
        }

        // Wipe prior seed data (idempotent).
        SizeGuideRelation::query()->delete();
        SizeGuide::query()->delete();
        SizeGuideHeader::query()->delete();

        // Default headers — slugs become the keys stored in SizeGuide.table_headers.
        $headers = [
            ['slug' => 'size', 'name' => 'Size', 'order' => 0],
            ['slug' => 'us', 'name' => 'US', 'order' => 1],
            ['slug' => 'bust', 'name' => 'Bust', 'order' => 2],
            ['slug' => 'waist', 'name' => 'Waist', 'order' => 3],
            ['slug' => 'low-hip', 'name' => 'Low Hip', 'order' => 4],
        ];

        foreach ($headers as $h) {
            SizeGuideHeader::query()->create([
                'slug' => $h['slug'],
                'name' => $h['name'],
                'category' => 'general',
                'order' => $h['order'],
                'status' => BaseStatusEnum::PUBLISHED,
            ]);
        }

        // Body data — values lifted directly from the html demo's Size Chart.
        $sizeGuide = SizeGuide::query()->create([
            'name' => 'Default Size Chart',
            // Each tip uses an <h6> label + <p> body so the modal stack
            // renders as "Bust\nMeasure around …" — matching the html demo
            // (no leading colon).
            'description' => '<h6>Bust</h6><p>Measure around the fullest part of your bust.</p>'
                . '<h6>Waist</h6><p>Measure around the narrowest part of your torso.</p>'
                . '<h6>Low Hip</h6><p>With your feet together measure around the fullest part of your hips/rear.</p>',
            'image' => null,
            'table_headers' => array_column($headers, 'slug'),
            'table_rows' => [
                ['XS', '2', '32', '24 - 25', '33 - 34'],
                ['S', '4', '34 - 35', '26 - 27', '35 - 26'],
                ['M', '6', '36 - 37', '28 - 29', '38 - 40'],
                ['L', '8', '38 - 29', '30 - 31', '42 - 44'],
                ['XL', '10', '40 - 41', '32 - 33', '45 - 47'],
                ['XXL', '12', '42 - 43', '34 - 35', '48 - 50'],
            ],
            'status' => BaseStatusEnum::PUBLISHED,
            'order' => 0,
        ]);

        // Attach the guide to every product category so every product
        // inherits it (resolution chain: product → category → brand).
        // Includes nested categories — the plugin walks all of a product's
        // categories, the first match wins. DB::table avoids the BaseModel
        // author-scope on insert.
        // Attach the guide only to fashion/clothing-related categories.
        // Other categories (Electronics, Home, Garden) will not have a guide assigned.
        $categoryIds = ProductCategory::query()
            ->whereIn('name', [
                'Yoga', 'Leggings', 'Tennis', 'Gym', 'Running',
                'Outerwear', 'Tops & Shirts', 'Bottoms', 'Dresses', 'Footwear',
            ])
            ->pluck('id');

        $rows = $categoryIds->map(fn ($id) => [
            'size_guide_id' => $sizeGuide->getKey(),
            'reference_id' => $id,
            'reference_type' => 'category',
            'created_at' => now(),
            'updated_at' => now(),
        ])->all();

        if ($rows) {
            DB::table('fob_product_size_guide_relations')->insert($rows);
        }

        // Render the guide as a popup modal (matches the HTML demo at
        // html/product-detail.html#findSize). The plugin defaults to 'inline'
        // which dumps the full table between variant pickers and the quantity
        // row — too bulky for the detail page. The theme already wires the
        // trigger above the size attribute (see
        // views/ecommerce/attributes/swatches-renderer.blade.php) and renders
        // the modal via THEME_FRONT_FOOTER when this is 'popup'.
        Setting::set('product_size_guide_display_mode', 'popup');
        Setting::save();
    }
}
