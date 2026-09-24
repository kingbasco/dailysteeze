<?php

namespace Database\Seeders\Themes\HomeAuto;

class SimpleSliderSeeder extends \Database\Seeders\Themes\Main\SimpleSliderSeeder
{
    /**
     * Hero copy mirrors html/home-auto.html lines 1418+:
     *   slide 1: subtitle "STRONG GRIP, SMOOTH RIDE", h1 "Enhanced Traction for Stability"
     *   slide 2: subtitle "POWER UP YOUR ENGINE", "Reliable High Quality Engine for Power"
     *   slide 3: subtitle "POWER UP YOUR ENGINE", "Smooth Performance, Every Mile"
     * Layout: container-bound, light cream bg → dark text + dark pill button + dots only
     * (no external arrow nav). The `text_color` / `button_style` / `title_tag` / `heading_class` /
     * `subtitle_class` per-slide metadata is consumed by simple-slider/style-1.blade.php.
     */
    public function getSliders(): array
    {
        return [
            [
                'name' => 'Homepage Hero',
                'key' => 'home-hero',
                'description' => 'Hero slider for the home-auto preset.',
                'items' => [
                    [
                        'title' => "Enhanced\nTraction for\nStability",
                        'description' => null,
                        'image' => $this->filePath('slider/slider-10.jpg'),
                        'link' => '/products',
                        'subtitle' => 'STRONG GRIP, SMOOTH RIDE',
                        'button_label' => 'Shop Now',
                        'alignment' => 'left',
                        // Demo uses dark text on cream bg + dark pill + h1 heading.
                        'text_color' => 'dark',
                        'button_style' => 'pill-dark',
                        'title_tag' => 'h1',
                        'subtitle_class' => 'fw-semibold mb-8',
                        'title_class' => 'none',
                        'heading_class' => 'mb-xl-32',
                    ],
                    [
                        'title' => "Reliable High\nQuality Engine\nfor Power",
                        'description' => null,
                        'image' => $this->filePath('slider/slider-11.jpg'),
                        'link' => '/products',
                        'subtitle' => 'POWER UP YOUR ENGINE',
                        'button_label' => 'Shop Now',
                        'alignment' => 'left',
                        'text_color' => 'dark',
                        'button_style' => 'pill-dark',
                        'title_tag' => 'p',
                        'subtitle_class' => 'fw-semibold mb-8',
                        'title_class' => 'h1 fw-medium',
                        'heading_class' => 'mb-xl-32',
                    ],
                    [
                        'title' => "Smooth\nPerformance,\nEvery Mile",
                        'description' => null,
                        'image' => $this->filePath('slider/slider-12.jpg'),
                        'link' => '/products',
                        'subtitle' => 'POWER UP YOUR ENGINE',
                        'button_label' => 'Shop Now',
                        'alignment' => 'left',
                        'text_color' => 'dark',
                        'button_style' => 'pill-dark',
                        'title_tag' => 'p',
                        'subtitle_class' => 'fw-semibold mb-8',
                        'title_class' => 'h1 fw-medium',
                        'heading_class' => 'mb-xl-32',
                    ],
                ],
            ],
        ];
    }
}
