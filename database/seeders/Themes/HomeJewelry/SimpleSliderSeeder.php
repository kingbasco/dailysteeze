<?php

namespace Database\Seeders\Themes\HomeJewelry;

class SimpleSliderSeeder extends \Database\Seeders\Themes\Main\SimpleSliderSeeder
{
    public function getSliders(): array
    {
        return [
            [
                'name' => 'Homepage Hero',
                'key' => 'home-hero',
                'description' => 'Hero slider for the home-jewelry preset.',
                'items' => [
                    [
                        'title' => "Jewelry Crafted To\nCapture Attention",
                        'description' => 'Modern silhouettes with brilliant shine, making any outfit feel richer.',
                        'image' => $this->filePath('slider/slider-28.jpg'),
                        'link' => '/products',
                        // Eyebrow above the title — mirrors html/home-jewelry.html L1615.
                        'subtitle' => 'LUXURY IN MOTION',
                        'button_label' => 'Shop Styles',
                        'alignment' => 'left',
                        // Demo uses dark text on light bg + dark pill (jewelry HTML).
                        'text_color' => 'dark',
                        'button_style' => 'pill-dark',
                    ],
                    [
                        'title' => "Elegant Pieces\nDesigned To Last",
                        'description' => 'Hand-finished details bringing refined radiance, perfect for every occasion.',
                        'image' => $this->filePath('slider/slider-29.jpg'),
                        'link' => '/products',
                        // Mirrors html/home-jewelry.html L1649.
                        'subtitle' => 'DEFINE YOUR STYLE',
                        'button_label' => 'Shop Styles',
                        'alignment' => 'left',
                        // Demo uses dark text on light bg + dark pill (jewelry HTML).
                        'text_color' => 'dark',
                        'button_style' => 'pill-dark',
                    ],
                    [
                        'title' => "Signature Pieces\nMade To Impress",
                        'description' => 'Elegant pieces designed to glow effortlessly, enhancing every look.',
                        'image' => $this->filePath('slider/slider-30.jpg'),
                        'link' => '/products',
                        // Mirrors html/home-jewelry.html L1683.
                        'subtitle' => 'SHINE WITH PURPOSE',
                        'button_label' => 'Shop Styles',
                        'alignment' => 'left',
                        // Demo uses dark text on light bg + dark pill (jewelry HTML).
                        'text_color' => 'dark',
                        'button_style' => 'pill-dark',
                    ],
                ],
            ],
        ];
    }
}
