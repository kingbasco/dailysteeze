<?php

namespace Database\Seeders\Themes\Main\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\ProductAttribute;
use Botble\Ecommerce\Models\ProductAttributeSet;
use Illuminate\Support\Str;

class ProductAttributeSetSeeder extends BaseSeeder
{
    public function run(): void
    {
        if (! is_plugin_active('ecommerce')) {
            return;
        }

        ProductAttributeSet::query()->truncate();
        ProductAttribute::query()->truncate();

        foreach ($this->getAttributeSets() as $order => $set) {
            $attributeSet = ProductAttributeSet::query()->create([
                'title' => $set['title'],
                'slug' => Str::slug($set['title']),
                'display_layout' => $set['display_layout'],
                'is_searchable' => true,
                'is_comparable' => true,
                'is_use_in_product_listing' => true,
                // For visual swatches we render the variation's product image
                // instead of a flat color chip — matches html demo where each
                // color is shown as the product photo for that color.
                'use_image_from_product_variation' => $set['use_image_from_product_variation'] ?? false,
                'order' => $order,
                'status' => BaseStatusEnum::PUBLISHED,
            ]);

            foreach ($set['attributes'] as $attrOrder => $attribute) {
                ProductAttribute::query()->create([
                    'title' => $attribute['title'],
                    'slug' => Str::slug($attribute['title']),
                    'color' => $attribute['color'] ?? null,
                    'order' => $attrOrder,
                    'attribute_set_id' => $attributeSet->getKey(),
                    'is_default' => $attrOrder === 0,
                ]);
            }
        }
    }

    public function getAttributeSets(): array
    {
        return [
            [
                'title' => 'Color',
                'display_layout' => 'visual',
                'use_image_from_product_variation' => true,
                'attributes' => [
                    ['title' => 'Black',  'color' => '#000000'],
                    ['title' => 'White',  'color' => '#FFFFFF'],
                    ['title' => 'Beige',  'color' => '#D6BFA0'],
                    ['title' => 'Olive',  'color' => '#6B7843'],
                    ['title' => 'Navy',   'color' => '#10243F'],
                    ['title' => 'Burgundy', 'color' => '#7B1F2B'],
                    ['title' => 'Charcoal', 'color' => '#374049'],
                    ['title' => 'Cream',   'color' => '#F1E8D7'],
                    // Demo home-fashion palette — `bg-peach-blush`, `bg-rose-taupe`,
                    // `bg-sage-gray`, `bg-sky-blue` from html/home-fashion.html.
                    ['title' => 'Pink',   'color' => '#F2C2BB'],
                    ['title' => 'Brown',  'color' => '#905D5D'],
                    ['title' => 'Green',  'color' => '#B2BD9F'],
                    ['title' => 'Blue',   'color' => '#87CEEB'],
                ],
            ],
            [
                'title' => 'Size',
                'display_layout' => 'text',
                'attributes' => [
                    ['title' => 'XS'],
                    ['title' => 'S'],
                    ['title' => 'M'],
                    ['title' => 'L'],
                    ['title' => 'XL'],
                    ['title' => 'XXL'],
                ],
            ],
            [
                'title' => 'Material',
                'display_layout' => 'text',
                'attributes' => [
                    ['title' => 'Cotton'],
                    ['title' => 'Linen'],
                    ['title' => 'Wool'],
                    ['title' => 'Tencel'],
                    ['title' => 'Recycled Polyester'],
                    ['title' => 'Full-Grain Leather'],
                ],
            ],
        ];
    }
}
