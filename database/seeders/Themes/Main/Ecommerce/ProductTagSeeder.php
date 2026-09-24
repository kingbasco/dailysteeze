<?php

namespace Database\Seeders\Themes\Main\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\ProductTag;

class ProductTagSeeder extends BaseSeeder
{
    public function run(): void
    {
        if (! is_plugin_active('ecommerce')) {
            return;
        }

        ProductTag::query()->truncate();

        foreach ($this->getTags() as $name) {
            ProductTag::query()->create([
                'name' => $name,
                'description' => sprintf('Products tagged with %s.', $name),
                'status' => BaseStatusEnum::PUBLISHED,
            ]);
        }
    }

    public function getTags(): array
    {
        return [
            'Cotton',
            'Linen',
            'Wool',
            'Leather',
            'Tencel',
            'Recycled',
            'Made in Portugal',
            'Made in Italy',
            'Hand-Crafted',
            'Vegan',
            'Limited Run',
            'Best Seller',
            'New Arrival',
            'Editor Pick',
            'Eco-Friendly',
        ];
    }
}
