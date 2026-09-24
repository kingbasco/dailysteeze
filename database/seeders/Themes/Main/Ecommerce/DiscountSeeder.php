<?php

namespace Database\Seeders\Themes\Main\Ecommerce;

use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Enums\DiscountTargetEnum;
use Botble\Ecommerce\Enums\DiscountTypeEnum;
use Botble\Ecommerce\Enums\DiscountTypeOptionEnum;
use Botble\Ecommerce\Models\Discount;

class DiscountSeeder extends BaseSeeder
{
    public function run(): void
    {
        if (! is_plugin_active('ecommerce')) {
            return;
        }

        Discount::query()->truncate();

        $now = $this->now();

        foreach ($this->getDiscounts() as $discount) {
            Discount::query()->create([
                'type' => $discount['type'] ?? DiscountTypeEnum::COUPON,
                'title' => $discount['title'],
                'code' => $discount['code'] ?? null,
                'description' => $discount['description'] ?? null,
                'start_date' => $now->clone()->subDay(),
                'end_date' => $discount['end_days'] ? $now->clone()->addDays($discount['end_days']) : null,
                'type_option' => $discount['type_option'],
                'value' => $discount['value'],
                'target' => $discount['target'] ?? DiscountTargetEnum::ALL_ORDERS,
                'min_order_price' => $discount['min_order_price'] ?? 0,
                'quantity' => $discount['quantity'] ?? null,
                'can_use_with_promotion' => $discount['can_use_with_promotion'] ?? false,
                'can_use_with_flash_sale' => $discount['can_use_with_flash_sale'] ?? false,
                'display_at_checkout' => $discount['display_at_checkout'] ?? true,
            ]);
        }
    }

    public function getDiscounts(): array
    {
        return [
            [
                'title' => 'Welcome 10% Off',
                'code' => 'WELCOME10',
                'description' => 'A welcome discount for first-time shoppers — 10% off any order.',
                'type_option' => DiscountTypeOptionEnum::PERCENTAGE,
                'value' => 10,
                'end_days' => 60,
                'display_at_checkout' => true,
            ],
            [
                'title' => 'Free Shipping Over $50',
                'code' => 'FREESHIP',
                'description' => 'Free shipping on any order $50 or above.',
                'type_option' => DiscountTypeOptionEnum::SHIPPING,
                'value' => 100,
                'min_order_price' => 50,
                'end_days' => null,
                'display_at_checkout' => true,
            ],
            [
                'title' => 'Spring Sale — $25 Off',
                'code' => 'SPRING25',
                'description' => 'A flat $25 off orders over $150.',
                'type_option' => DiscountTypeOptionEnum::AMOUNT,
                'value' => 25,
                'min_order_price' => 150,
                'end_days' => 30,
                'quantity' => 500,
            ],
            [
                'title' => 'VIP Member 20% Off',
                'code' => 'VIP20',
                'description' => 'Exclusive 20% off for newsletter subscribers.',
                'type_option' => DiscountTypeOptionEnum::PERCENTAGE,
                'value' => 20,
                'end_days' => 90,
                'min_order_price' => 100,
                'can_use_with_flash_sale' => false,
            ],
            [
                'title' => 'Bundle & Save $50',
                'code' => 'BUNDLE50',
                'description' => 'Save $50 when you spend $300 or more.',
                'type_option' => DiscountTypeOptionEnum::AMOUNT,
                'value' => 50,
                'min_order_price' => 300,
                'end_days' => 45,
            ],
        ];
    }
}
