<?php

namespace Database\Seeders\Themes\Main\Ecommerce;

use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Enums\SpecificationAttributeFieldType;
use Botble\Ecommerce\Models\Product;
use Botble\Ecommerce\Models\SpecificationAttribute;
use Botble\Ecommerce\Models\SpecificationGroup;
use Botble\Ecommerce\Models\SpecificationTable;
use Illuminate\Support\Facades\DB;

/**
 * Seeds the Product Specifications feature so the "Product Specification" tab
 * renders on every product detail page (mirrors the shofy theme demo).
 *
 * Layout:
 *   Specification Table  → "Default Specifications"
 *     ├── Group: Material & Composition
 *     │     ├── Composition (text)
 *     │     ├── Origin      (text)
 *     │     └── Care        (text)
 *     └── Group: Product Details
 *           ├── Designed In  (text)
 *           ├── Warranty     (text)
 *           └── Made From Recycled Materials (checkbox)
 *
 * Every published, non-variation product is wired to this table and given
 * sensible default pivot values so the tab is never empty.
 */
class SpecificationSeeder extends BaseSeeder
{
    public function run(): void
    {
        if (! is_plugin_active('ecommerce')) {
            return;
        }

        // Feature flag — turn the tab on globally.
        setting()->set(['ecommerce_enable_product_specification' => '1'])->save();

        // Wipe prior seed data (idempotent).
        DB::table('ec_product_specification_attribute')->truncate();
        DB::table('ec_specification_table_group')->truncate();
        SpecificationAttribute::query()->delete();
        SpecificationTable::query()->delete();
        SpecificationGroup::query()->delete();

        $materialGroup = SpecificationGroup::query()->create([
            'name' => 'Material & Composition',
            'description' => 'Fibre breakdown, origin and care guidance.',
        ]);

        $detailsGroup = SpecificationGroup::query()->create([
            'name' => 'Product Details',
            'description' => 'Provenance, warranty and sustainability.',
        ]);

        $attrs = [
            'composition' => SpecificationAttribute::query()->create([
                'group_id' => $materialGroup->getKey(),
                'name' => 'Composition',
                'type' => SpecificationAttributeFieldType::TEXT,
                'default_value' => '55% Polyester, 30% Acrylic, 13% Polyamide, 2% Elastane',
            ]),
            'origin' => SpecificationAttribute::query()->create([
                'group_id' => $materialGroup->getKey(),
                'name' => 'Origin',
                'type' => SpecificationAttributeFieldType::TEXT,
                'default_value' => 'Made in Portugal',
            ]),
            'care' => SpecificationAttribute::query()->create([
                'group_id' => $materialGroup->getKey(),
                'name' => 'Care',
                'type' => SpecificationAttributeFieldType::TEXT,
                'default_value' => 'Machine wash cold. Tumble dry low. Do not bleach.',
            ]),
            'designed_in' => SpecificationAttribute::query()->create([
                'group_id' => $detailsGroup->getKey(),
                'name' => 'Designed In',
                'type' => SpecificationAttributeFieldType::TEXT,
                'default_value' => 'Barcelona, Spain',
            ]),
            'warranty' => SpecificationAttribute::query()->create([
                'group_id' => $detailsGroup->getKey(),
                'name' => 'Warranty',
                'type' => SpecificationAttributeFieldType::TEXT,
                'default_value' => '12 months manufacturer warranty',
            ]),
            'recycled' => SpecificationAttribute::query()->create([
                'group_id' => $detailsGroup->getKey(),
                'name' => 'Made From Recycled Materials',
                'type' => SpecificationAttributeFieldType::CHECKBOX,
                'default_value' => '1',
            ]),
        ];

        $table = SpecificationTable::query()->create([
            'name' => 'Default Specifications',
            'description' => 'Default specification layout applied to all products.',
        ]);

        $table->groups()->attach([
            $materialGroup->getKey() => ['order' => 0],
            $detailsGroup->getKey() => ['order' => 1],
        ]);

        $products = Product::query()
            ->where('is_variation', 0)
            ->select(['id'])
            ->get();

        // Use DB::table() (no model events) — Botble's Product model fires
        // saved hooks that cascade to variations and require non-null name,
        // which our $select(['id']) projection deliberately doesn't load.
        DB::table('ec_products')
            ->where('is_variation', 0)
            ->update(['specification_table_id' => $table->getKey()]);

        foreach ($products as $product) {
            $order = 0;
            foreach ($attrs as $attribute) {
                DB::table('ec_product_specification_attribute')->insert([
                    'product_id' => $product->getKey(),
                    'attribute_id' => $attribute->getKey(),
                    'value' => $attribute->default_value,
                    'hidden' => false,
                    'order' => $order++,
                ]);
            }
        }
    }
}
