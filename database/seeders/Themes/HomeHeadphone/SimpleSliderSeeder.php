<?php

namespace Database\Seeders\Themes\HomeHeadphone;

class SimpleSliderSeeder extends \Database\Seeders\Themes\Main\SimpleSliderSeeder
{
    public function getSliders(): array
    {
        return [
            [
                'name' => 'Homepage Hero',
                'key' => 'home-hero',
                'description' => 'Hero slider for the home-headphone preset.',
                'items' => [
                    [
                        'title' => 'Built For Motion, Ready For Life',
                        'description' => 'Ergonomic design for a perfect, weightless fit, ready to accompany you on every journey.',
                        'image' => $this->filePath('slider/slider-25.jpg'),
                        'link' => '/products',
                        'subtitle' => null,
                        'button_label' => 'Shop Now',
                        'alignment' => 'left',
                    ],
                    [
                        'title' => 'Audio Perfection, Pure Emotion',
                        'description' => 'Experience immersive surround sound, incredible detail, and industry-leading active noise cancellation.',
                        'image' => $this->filePath('slider/slider-26.jpg'),
                        'link' => '/products',
                        'subtitle' => null,
                        'button_label' => 'Shop Now',
                        'alignment' => 'left',
                    ],
                    [
                        'title' => 'Smart Connection, Seamless Life',
                        'description' => 'Automatic pairing, voice control integration, and all-day battery life for your active lifestyle.',
                        'image' => $this->filePath('slider/slider-27.jpg'),
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
