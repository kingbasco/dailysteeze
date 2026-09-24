<?php

namespace Database\Seeders\Themes\HomeBag;

class SimpleSliderSeeder extends \Database\Seeders\Themes\Main\SimpleSliderSeeder
{
    public function getSliders(): array
    {
        return [
            [
                'name' => 'Homepage Hero',
                'key' => 'home-hero',
                'description' => 'Hero slider for the home-bag-accessories preset.',
                'items' => [
                    [
                        'title' => "Jacquard Bucket\nBag With Logo",
                        'description' => null,
                        'image' => $this->filePath('collection/cls-1.jpg'),
                        'link' => '/products',
                        'subtitle' => null,
                        'button_label' => 'Shop Now',
                        'alignment' => 'center',
                    ],
                    [
                        'title' => "Leather Belt\nWith Oval Buckle",
                        'description' => null,
                        'image' => $this->filePath('collection/cls-2.jpg'),
                        'link' => '/products',
                        'subtitle' => null,
                        'button_label' => 'Shop Now',
                        'alignment' => 'center',
                    ],
                    [
                        'title' => "Latest Jewelry\nDrops",
                        'description' => null,
                        'image' => $this->filePath('collection/cls-3.jpg'),
                        'link' => '/products',
                        'subtitle' => null,
                        'button_label' => 'Shop Now',
                        'alignment' => 'center',
                    ],
                ],
            ],
        ];
    }
}
