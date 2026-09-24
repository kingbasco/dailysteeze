<?php

namespace Database\Seeders\Themes\Main\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\FlashSale;
use Botble\Ecommerce\Models\Product;

class FlashSaleSeeder extends BaseSeeder
{
    public function run(): void
    {
        if (! is_plugin_active('ecommerce')) {
            return;
        }

        FlashSale::query()->truncate();

        foreach ($this->getFlashSales() as $sale) {
            $flashSale = FlashSale::query()->create([
                'name' => $sale['name'],
                'end_date' => now()->addDays($sale['ends_in_days']),
                'status' => BaseStatusEnum::PUBLISHED,
            ]);

            $productIds = Product::query()
                ->where('is_variation', false)
                ->wherePublished()
                ->inRandomOrder()
                ->limit($sale['product_count'])
                ->pluck('id', 'price');

            $sync = [];
            foreach ($productIds as $price => $productId) {
                $sync[$productId] = [
                    'price' => max(0, round((float) $price * (1 - $sale['discount_percent'] / 100), 2)),
                    'quantity' => $sale['quantity_per_product'],
                    'sold' => 0,
                ];
            }

            if ($sync) {
                $flashSale->products()->sync($sync);
            }
        }
    }

    public function getFlashSales(): array
    {
        return [
            [
                'name' => '48-Hour Flash Sale',
                'ends_in_days' => 2,
                'product_count' => 12,
                'discount_percent' => 30,
                'quantity_per_product' => 50,
            ],
            [
                'name' => 'Weekend Doorbusters',
                'ends_in_days' => 5,
                'product_count' => 8,
                'discount_percent' => 25,
                'quantity_per_product' => 75,
            ],
        ];
    }
}
