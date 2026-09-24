<?php

namespace Database\Seeders\Themes\HomeOrganic;

class SimpleSliderSeeder extends \Database\Seeders\Themes\Main\SimpleSliderSeeder
{
    public function getSliders(): array
    {
        return [
            [
                'name' => 'Homepage Hero',
                'key' => 'home-hero',
                'description' => 'Hero slider for the home-organic preset.',
                'items' => [
                    [
                        'title' => "Organic Greens for\na Healthier You",
                        'description' => 'Farm fresh vegetables packed with vitamins, flavor, and natural energy.',
                        'image' => $this->filePath('slider/organic/slider-19.jpg'),
                        'link' => '/products',
                        'subtitle' => null,
                        'button_label' => 'Shop Now',
                        'alignment' => 'left',
                    ],
                    [
                        'title' => "Fresh from Nature,\nGrown with Care",
                        'description' => 'Discover organic care that\'s gentle, effective, and planet-friendly.',
                        'image' => $this->filePath('slider/organic/slider-20.jpg'),
                        'link' => '/products',
                        'subtitle' => null,
                        'button_label' => 'Shop Now',
                        'alignment' => 'left',
                    ],
                    [
                        'title' => "Eat Clean, Live\nGreen, Stay Strong",
                        'description' => 'Pesticide-free produce for a healthier you.',
                        'image' => $this->filePath('slider/organic/slider-21.jpg'),
                        'link' => '/products',
                        'subtitle' => null,
                        'button_label' => 'Shop Now',
                        'alignment' => 'left',
                    ],
                ],
            ],
        ];
    }
}
