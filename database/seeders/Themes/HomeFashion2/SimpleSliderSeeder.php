<?php

namespace Database\Seeders\Themes\HomeFashion2;

class SimpleSliderSeeder extends \Database\Seeders\Themes\Main\SimpleSliderSeeder
{
    public function getSliders(): array
    {
        // Demo home-fashion-2 hero (lines 1523-1632) sits on a light/white image
        // background (white-left + model-right composition) — text + button must
        // render in DARK on light, not the default white-on-image.
        $slideMeta = [
            'alignment' => 'left',
            'text_color' => 'dark',
            'button_style' => 'pill-dark',
        ];

        return [
            [
                'name' => 'Homepage Hero',
                'key' => 'home-hero',
                'description' => 'Hero slider for the home-fashion-2 preset.',
                'items' => [
                    [
                        'title' => "Find Your\nSignature Style",
                        'description' => null,
                        'image' => $this->filePath('slider/fashion-2/slider-1.jpg'),
                        'link' => '/products',
                        'subtitle' => 'DISCOVER THE ART OF MODERN DRESSING',
                        'button_label' => 'Shop Styles',
                        ...$slideMeta,
                    ],
                    [
                        'title' => "Your Ultimate\nStyle Destination",
                        'description' => null,
                        'image' => $this->filePath('slider/fashion-2/slider-2.jpg'),
                        'link' => '/products',
                        'subtitle' => 'DISCOVER THE ART OF MODERN DRESSING',
                        'button_label' => 'Shop Styles',
                        ...$slideMeta,
                    ],
                    [
                        'title' => "Find Your\nSignature Style",
                        'description' => null,
                        'image' => $this->filePath('slider/fashion-2/slider-3.jpg'),
                        'link' => '/products',
                        'subtitle' => 'DISCOVER THE ART OF MODERN DRESSING',
                        'button_label' => 'Shop Styles',
                        ...$slideMeta,
                    ],
                ],
            ],
        ];
    }
}
