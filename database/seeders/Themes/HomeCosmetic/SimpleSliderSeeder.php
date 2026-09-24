<?php

namespace Database\Seeders\Themes\HomeCosmetic;

class SimpleSliderSeeder extends \Database\Seeders\Themes\Main\SimpleSliderSeeder
{
    public function getSliders(): array
    {
        return [
            [
                'name' => 'Homepage Hero',
                'key' => 'home-hero',
                'description' => 'Hero slider for the home-cosmetic preset.',
                'items' => [
                    [
                        'title' => "Reveal Your\nTimeless Beauty",
                        'description' => 'Where science meets nature for your finest skin.',
                        'image' => $this->filePath('slider/slider-16.jpg'),
                        'link' => '/products',
                        'subtitle' => null,
                        'button_label' => 'Shop Now',
                        'alignment' => 'center',
                        // Demo uses white pill button (tf-btn btn-white, cosmetic HTML line 1390).
                        'text_color' => 'dark',
                        'button_style' => 'pill-white',
                        // HTML uses `cl-text-2` color utility on the eyebrow.
                        'subtitle_class' => 'cl-text-2',
                    ],
                    [
                        'title' => "Where Science\nMeets Beauty",
                        'description' => 'Skincare that reveals your timeless glow.',
                        'image' => $this->filePath('slider/slider-17.jpg'),
                        'link' => '/products',
                        'subtitle' => null,
                        'button_label' => 'Shop Now',
                        'alignment' => 'center',
                        // Demo uses white pill button (tf-btn btn-white, cosmetic HTML line 1390).
                        'text_color' => 'dark',
                        'button_style' => 'pill-white',
                        // HTML uses `cl-text-2` color utility on the eyebrow.
                        'subtitle_class' => 'cl-text-2',
                    ],
                    [
                        'title' => "Beauty That Empowers\nEvery Moment",
                        'description' => 'Cosmetics that enhance your confidence.',
                        'image' => $this->filePath('slider/slider-18.jpg'),
                        'link' => '/products',
                        'subtitle' => null,
                        'button_label' => 'Shop Now',
                        'alignment' => 'center',
                        // Demo uses white pill button (tf-btn btn-white, cosmetic HTML line 1390).
                        'text_color' => 'dark',
                        'button_style' => 'pill-white',
                        // HTML uses `cl-text-2` color utility on the eyebrow.
                        'subtitle_class' => 'cl-text-2',
                    ],
                ],
            ],
        ];
    }
}
