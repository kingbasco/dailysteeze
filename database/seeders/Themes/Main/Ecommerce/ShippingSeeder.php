<?php

namespace Database\Seeders\Themes\Main\Ecommerce;

use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Enums\ShippingRuleTypeEnum;
use Botble\Ecommerce\Models\Shipping;
use Botble\Ecommerce\Models\ShippingRule;
use Botble\Ecommerce\Models\ShippingRuleItem;

class ShippingSeeder extends BaseSeeder
{
    public function run(): void
    {
        if (! is_plugin_active('ecommerce')) {
            return;
        }

        Shipping::query()->truncate();
        ShippingRule::query()->truncate();
        ShippingRuleItem::query()->truncate();

        foreach ($this->getShippingZones() as $zone) {
            $shipping = Shipping::query()->create([
                'title' => $zone['title'],
                'country' => $zone['country'] ?? null,
            ]);

            foreach ($zone['rules'] as $rule) {
                ShippingRule::query()->create([
                    'name' => $rule['name'],
                    'shipping_id' => $shipping->getKey(),
                    'type' => $rule['type'],
                    'from' => $rule['from'] ?? 0,
                    'to' => $rule['to'] ?? null,
                    'price' => $rule['price'],
                ]);
            }
        }
    }

    public function getShippingZones(): array
    {
        return [
            [
                'title' => 'Domestic',
                'rules' => [
                    [
                        'name' => 'Free Standard Shipping (orders $99+)',
                        'type' => ShippingRuleTypeEnum::BASED_ON_PRICE,
                        'from' => 99,
                        'to' => null,
                        'price' => 0,
                    ],
                    [
                        'name' => 'Standard (3-5 business days)',
                        'type' => ShippingRuleTypeEnum::BASED_ON_PRICE,
                        'from' => 0,
                        'to' => null,
                        'price' => 7.99,
                    ],
                    [
                        'name' => 'Express (1-2 business days)',
                        'type' => ShippingRuleTypeEnum::BASED_ON_PRICE,
                        'from' => 0,
                        'to' => null,
                        'price' => 19.99,
                    ],
                    [
                        'name' => 'Local Pickup',
                        'type' => ShippingRuleTypeEnum::BASED_ON_PRICE,
                        'from' => 0,
                        'to' => null,
                        'price' => 0,
                    ],
                ],
            ],
            [
                'title' => 'International',
                'rules' => [
                    [
                        'name' => 'International Standard (7-12 days)',
                        'type' => ShippingRuleTypeEnum::BASED_ON_PRICE,
                        'from' => 0,
                        'to' => null,
                        'price' => 24.99,
                    ],
                    [
                        'name' => 'International Express (3-5 days)',
                        'type' => ShippingRuleTypeEnum::BASED_ON_PRICE,
                        'from' => 0,
                        'to' => null,
                        'price' => 49.99,
                    ],
                ],
            ],
        ];
    }
}
