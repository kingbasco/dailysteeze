<?php

namespace Database\Seeders\Themes\HomeDecor;

class SimpleSliderSeeder extends \Database\Seeders\Themes\Main\SimpleSliderSeeder
{
    public function getSliders(): array
    {
        return [
            [
                'name' => 'Homepage Hero',
                'key' => 'home-hero',
                'description' => 'Hero slider for the home-decor preset.',
                'items' => [
                    [
                        'title' => "Office decor that\nsparks creativity.",
                        'description' => null,
                        'image' => $this->filePath('slider/slider-13.jpg'),
                        'link' => '/products',
                        'subtitle' => 'Elevate Your Workspace',
                        'button_label' => 'Explore Collection',
                        'alignment' => 'left',
                        // Demo §1: white text on dark left panel + solid white pill button
                        // `tf-btn btn-white style-2` (default branch of style-split's button map).
                        'text_color' => 'white',
                        'button_style' => 'pill-white',
                    ],
                    [
                        'title' => "Small details, big\ninspiration.",
                        'description' => null,
                        'image' => $this->filePath('slider/slider-14.jpg'),
                        'link' => '/products',
                        'subtitle' => 'Creative Desk Accents',
                        'button_label' => 'Explore Collection',
                        'alignment' => 'left',
                        // Demo §1: white text on dark left panel + solid white pill button
                        // `tf-btn btn-white style-2` (default branch of style-split's button map).
                        'text_color' => 'white',
                        'button_style' => 'pill-white',
                    ],
                    [
                        'title' => "Stay focused and\ninspired every day.",
                        'description' => null,
                        'image' => $this->filePath('slider/slider-15.jpg'),
                        'link' => '/products',
                        'subtitle' => 'Inspire Your Workspace',
                        'button_label' => 'Explore Collection',
                        'alignment' => 'left',
                        // Demo §1: white text on dark left panel + solid white pill button
                        // `tf-btn btn-white style-2` (default branch of style-split's button map).
                        'text_color' => 'white',
                        'button_style' => 'pill-white',
                    ],
                ],
            ],
        ];
    }
}
