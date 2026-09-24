<?php

namespace Database\Seeders\Themes\Main\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\ProductLabel;

class ProductLabelSeeder extends BaseSeeder
{
    public function run(): void
    {
        if (! is_plugin_active('ecommerce')) {
            return;
        }

        ProductLabel::query()->truncate();

        foreach ($this->getLabels() as $label) {
            ProductLabel::query()->create($label);
        }
    }

    public function getLabels(): array
    {
        return [
            ['name' => 'Hot', 'color' => '#F0460E', 'text_color' => '#FFFFFF', 'status' => BaseStatusEnum::PUBLISHED],
            ['name' => 'New', 'color' => '#22C55E', 'text_color' => '#FFFFFF', 'status' => BaseStatusEnum::PUBLISHED],
            ['name' => 'Sale', 'color' => '#EF4444', 'text_color' => '#FFFFFF', 'status' => BaseStatusEnum::PUBLISHED],
            ['name' => 'Best Seller', 'color' => '#1E1E1E', 'text_color' => '#FFFFFF', 'status' => BaseStatusEnum::PUBLISHED],
            ['name' => 'Limited', 'color' => '#7B1F2B', 'text_color' => '#FFFFFF', 'status' => BaseStatusEnum::PUBLISHED],
            ['name' => 'Eco', 'color' => '#6B7843', 'text_color' => '#FFFFFF', 'status' => BaseStatusEnum::PUBLISHED],
        ];
    }
}
