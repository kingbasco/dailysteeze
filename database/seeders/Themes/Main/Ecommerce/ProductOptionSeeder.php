<?php

namespace Database\Seeders\Themes\Main\Ecommerce;

use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\GlobalOption;
use Botble\Ecommerce\Models\GlobalOptionValue;
use Botble\Ecommerce\Option\OptionType\Dropdown;
use Botble\Ecommerce\Option\OptionType\Field;
use Botble\Ecommerce\Option\OptionType\RadioButton;
use Illuminate\Support\Facades\DB;

class ProductOptionSeeder extends BaseSeeder
{
    public function run(): void
    {
        if (! is_plugin_active('ecommerce')) {
            return;
        }

        DB::table('ec_global_options')->truncate();
        DB::table('ec_global_option_value')->truncate();
        DB::table('ec_options')->truncate();
        DB::table('ec_option_value')->truncate();

        foreach ($this->getOptions() as $option) {
            $globalOption = GlobalOption::query()->create([
                'name' => $option['name'],
                'option_type' => $option['option_type'],
                'required' => $option['required'],
            ]);

            foreach ($option['values'] as $value) {
                GlobalOptionValue::query()->create([
                    'option_id' => $globalOption->getKey(),
                    'option_value' => $value['option_value'],
                    'affect_price' => $value['affect_price'] ?? 0,
                    'affect_type' => $value['affect_type'] ?? 0,
                    'order' => $value['order'] ?? 0,
                ]);
            }
        }
    }

    public function getOptions(): array
    {
        return [
            [
                'name' => 'Gift Wrapping',
                'option_type' => Dropdown::class,
                'required' => false,
                'values' => [
                    ['option_value' => 'No gift wrap', 'affect_price' => 0, 'order' => 0],
                    ['option_value' => 'Standard kraft wrap', 'affect_price' => 4.99, 'order' => 1],
                    ['option_value' => 'Premium silk-ribbon wrap', 'affect_price' => 9.99, 'order' => 2],
                ],
            ],
            [
                'name' => 'Engraving',
                'option_type' => Field::class,
                'required' => false,
                'values' => [
                    ['option_value' => 'Up to 20 characters', 'affect_price' => 14.99, 'order' => 0],
                ],
            ],
            [
                'name' => 'Extended Warranty',
                'option_type' => RadioButton::class,
                'required' => false,
                'values' => [
                    ['option_value' => 'Standard 1-year warranty', 'affect_price' => 0, 'order' => 0],
                    ['option_value' => '2-year extended warranty', 'affect_price' => 29.99, 'order' => 1],
                    ['option_value' => '3-year premium care', 'affect_price' => 59.99, 'order' => 2],
                ],
            ],
        ];
    }
}
