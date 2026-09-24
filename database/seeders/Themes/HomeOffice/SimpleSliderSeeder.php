<?php

namespace Database\Seeders\Themes\HomeOffice;

class SimpleSliderSeeder extends \Database\Seeders\Themes\Main\SimpleSliderSeeder
{
    public function getSliders(): array
    {
        return [
            [
                'name' => 'Homepage Hero',
                'key' => 'home-hero',
                'description' => 'Hero slider for the home-office-equipment preset.',
                'items' => [
                    [
                        'title' => 'Boost Your Work Flow',
                        'description' => null,
                        'image' => $this->filePath('slider/office/slider-1.jpg'),
                        'link' => '/products',
                        'subtitle' => 'UPGRADE YOUR DAILY GRIND',
                        'button_label' => 'Shop Styles',
                        'alignment' => 'center',
                    ],
                    [
                        'title' => 'Work Smarter, Not Harder',
                        'description' => null,
                        'image' => $this->filePath('slider/office/slider-2.jpg'),
                        'link' => '/products',
                        'subtitle' => 'UNLEASH YOUR CREATIVE POTENTIAL',
                        'button_label' => 'Shop Styles',
                        'alignment' => 'center',
                    ],
                    [
                        'title' => 'Design Your Dream Workspace',
                        'description' => null,
                        'image' => $this->filePath('slider/office/slider-3.jpg'),
                        'link' => '/products',
                        'subtitle' => 'MINIMALIST SETUP, MAXIMUM CLARITY',
                        'button_label' => 'Shop Styles',
                        'alignment' => 'center',
                    ],
                    // Slide 4 mirrors HTML's "item 2" repeat at position 4 — adds visual rhythm.
                    [
                        'title' => 'Work Smarter, Not Harder',
                        'description' => null,
                        'image' => $this->filePath('slider/office/slider-2.jpg'),
                        'link' => '/products',
                        'subtitle' => 'UNLEASH YOUR CREATIVE POTENTIAL',
                        'button_label' => 'Shop Styles',
                        'alignment' => 'center',
                    ],
                ],
            ],
        ];
    }
}
