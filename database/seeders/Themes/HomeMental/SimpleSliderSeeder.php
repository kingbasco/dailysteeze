<?php

namespace Database\Seeders\Themes\HomeMental;

class SimpleSliderSeeder extends \Database\Seeders\Themes\Main\SimpleSliderSeeder
{
    public function getSliders(): array
    {
        return [
            [
                'name' => 'Homepage Hero',
                'key' => 'home-hero',
                'description' => 'Hero slider for the home-mental wellness preset.',
                'items' => [
                    [
                        'title' => "Nourish Your Body &\nElevate Your Mind",
                        'description' => 'Discover wellness essentials packed with vitamins and nutrients to keep your body balanced and energy high every day.',
                        'image' => $this->filePath('slider/slider-4.jpg'),
                        'link' => '/products',
                        'subtitle' => null,
                        'button_label' => 'Shop Styles',
                        'alignment' => 'left',
                        'title_first' => 'yes',
                        'title_tag' => 'h1',
                        'title_class' => 'h1 fw-medium mb-15',
                        'subtitle_class' => 'text-body-1',
                    ],
                    [
                        'title' => "Track Your Vital Health\nwith Smart Devices",
                        'description' => 'Discover easy-to-use tools that help you monitor health data, stay consistent, and build a stronger daily routine.',
                        'image' => $this->filePath('slider/slider-5.jpg'),
                        'link' => '/products',
                        'subtitle' => null,
                        'button_label' => 'Shop Styles',
                        'alignment' => 'left',
                        'title_first' => 'yes',
                        'title_tag' => 'p',
                        'title_class' => 'h1 fw-medium mb-15',
                        'subtitle_class' => 'text-body-1',
                    ],
                    [
                        'title' => "Expert Advice to\nBalance Body & Mind",
                        'description' => 'Get personalized guidance that helps you stay mindful, feel lighter, and achieve a healthier everyday life.',
                        'image' => $this->filePath('slider/slider-6.jpg'),
                        'link' => '/products',
                        'subtitle' => null,
                        'button_label' => 'Shop Styles',
                        'alignment' => 'left',
                        'title_first' => 'yes',
                        'title_tag' => 'p',
                        'title_class' => 'h1 fw-medium mb-15',
                        'subtitle_class' => 'text-body-1',
                    ],
                ],
            ],
        ];
    }
}
