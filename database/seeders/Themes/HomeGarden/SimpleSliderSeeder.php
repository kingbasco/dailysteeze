<?php

namespace Database\Seeders\Themes\HomeGarden;

class SimpleSliderSeeder extends \Database\Seeders\Themes\Main\SimpleSliderSeeder
{
    public function getSliders(): array
    {
        return [
            [
                'name' => 'Homepage Hero',
                'key' => 'home-hero',
                'description' => 'Hero slider for the home-garden preset.',
                'items' => [
                    [
                        'title' => "Find Quiet\nWith Plants",
                        'description' => 'Beautiful foliage, crafted planters, and must-have tools that help you build a relaxing green sanctuary indoors.',
                        'image' => $this->filePath('slider/slider-31.jpg'),
                        'link' => '/products',
                        'subtitle' => 'LIMITED TIME SAVINGS',
                        'button_label' => 'View All Products',
                        'alignment' => 'left',
                        'decor_image' => $this->filePath('item/garden-item-1.png'),
                    ],
                    [
                        'title' => "Refresh Your\nHome Garden",
                        'description' => 'Lush plant varieties and modern accessories designed to elevate your indoor garden with ease and charm.',
                        'image' => $this->filePath('slider/slider-32.jpg'),
                        'link' => '/products',
                        'subtitle' => 'SPECIAL SEASON OFFER',
                        'button_label' => 'Explore Collection',
                        'alignment' => 'left',
                        'decor_image' => $this->filePath('item/garden-item-1.png'),
                    ],
                    [
                        'title' => "Fresh Indoor\nPlants Arrive",
                        'description' => 'Curated houseplants, stylish pots, and soothing greenery — perfect pieces to brighten any living space.',
                        'image' => $this->filePath('slider/slider-33.jpg'),
                        'link' => '/products',
                        'subtitle' => 'GREEN LIVING DEALS',
                        'button_label' => 'Shop Indoor Plants',
                        'alignment' => 'left',
                        'decor_image' => $this->filePath('item/garden-item-1.png'),
                    ],
                ],
            ],
        ];
    }
}
