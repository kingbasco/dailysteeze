<?php

namespace Database\Seeders\Themes\HomeBaby;

class SimpleSliderSeeder extends \Database\Seeders\Themes\Main\SimpleSliderSeeder
{
    public function getSliders(): array
    {
        return [
            [
                'name' => 'Homepage Hero',
                'key' => 'home-hero',
                'description' => 'Hero slider for the home-baby preset.',
                'items' => [
                    [
                        'title' => "Play & Learn\nTogether",
                        'description' => null,
                        'image' => $this->filePath('slider/slider-7.jpg'),
                        'link' => '/products',
                        'subtitle' => 'SALE UP TO 50% OFF',
                        'button_label' => 'View All Products',
                        'alignment' => 'left',
                        'decor_image' => $this->filePath('item/graphic-item.png'),
                    ],
                    [
                        'title' => "Little Bites,\nBig Smiles",
                        'description' => null,
                        'image' => $this->filePath('slider/slider-8.jpg'),
                        'link' => '/products',
                        'subtitle' => 'SALE UP TO 50% OFF',
                        'button_label' => 'View All Products',
                        'alignment' => 'left',
                        'decor_image' => $this->filePath('item/graphic-item.png'),
                    ],
                    [
                        'title' => "Cuteness,\nComfy & Cozy",
                        'description' => null,
                        'image' => $this->filePath('slider/slider-9.jpg'),
                        'link' => '/products',
                        'subtitle' => 'SALE UP TO 50% OFF',
                        'button_label' => 'View All Products',
                        'alignment' => 'left',
                        'decor_image' => $this->filePath('item/graphic-item.png'),
                    ],
                ],
            ],
        ];
    }
}
