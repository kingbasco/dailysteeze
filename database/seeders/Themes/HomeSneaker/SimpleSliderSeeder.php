<?php

namespace Database\Seeders\Themes\HomeSneaker;

class SimpleSliderSeeder extends \Database\Seeders\Themes\Main\SimpleSliderSeeder
{
    public function getSliders(): array
    {
        return [
            [
                'name' => 'Homepage Hero',
                'key' => 'home-hero',
                'description' => 'Hero slider for the home-sneaker preset.',
                'items' => [
                    [
                        'title' => "Move Smarter &\nStep Further",
                        'description' => null,
                        'image' => $this->filePath('slider/sneaker/slider-1.jpg'),
                        'link' => '/products',
                        'subtitle' => 'WHERE STYLE MEETS MOTION',
                        'button_label' => 'Shop Styles',
                        'alignment' => 'left',
                    ],
                    [
                        'title' => "Refined Shoes\nFor Daily Wear",
                        'description' => null,
                        'image' => $this->filePath('slider/sneaker/slider-2.jpg'),
                        'link' => '/products',
                        'subtitle' => 'BUILT FOR URBAN MOVEMENT',
                        'button_label' => 'Shop Styles',
                        'alignment' => 'left',
                    ],
                    [
                        'title' => "Comfort That\nMoves All Day",
                        'description' => null,
                        'image' => $this->filePath('slider/sneaker/slider-3.jpg'),
                        'link' => '/products',
                        'subtitle' => 'DESIGNED FOR CITY LIFE',
                        'button_label' => 'Shop Styles',
                        'alignment' => 'left',
                    ],
                ],
            ],
        ];
    }
}
