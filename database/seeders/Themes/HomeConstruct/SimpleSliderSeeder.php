<?php

namespace Database\Seeders\Themes\HomeConstruct;

class SimpleSliderSeeder extends \Database\Seeders\Themes\Main\SimpleSliderSeeder
{
    public function getSliders(): array
    {
        return [
            [
                'name' => 'Homepage Hero',
                'key' => 'home-hero',
                'description' => 'Hero slider for the home-construction preset.',
                'items' => [
                    [
                        'title' => 'Products Crafted To Withstand Time',
                        'description' => 'Durable materials with reliable performance, helping every build stand stronger, safer, and confidently on schedule.',
                        'image' => $this->filePath('slider/slider-34.jpg'),
                        'link' => '/products',
                        'subtitle' => 'BUILT TO LAST',
                        'button_label' => 'Explore More',
                        'alignment' => 'left',
                        'text_color' => 'dark',
                        'button_style' => 'animate-dark',
                        'subtitle_tag' => 'h6',
                        'subtitle_class' => 'mb-12',
                        'title_tag' => 'div',
                        'title_class' => 'h1 mb-20 cl-text-main',
                        'description_class' => 'text-body-1 mb-32 cl-text-main',
                        'image_class' => 'lazyload scale-item scale-item-1',
                        'image_width' => 1770,
                        'image_height' => 680,
                        'content_container' => 'no',
                        'slide_wrapper_class' => 'slider-wrap rounded-20 overflow-hidden',
                    ],
                    [
                        'title' => 'Electrical Meters Built for the Job',
                        'description' => 'Reliable readings of voltage, current, and more — helping professionals work safer, faster, and with total confidence.',
                        'image' => $this->filePath('slider/slider-35.jpg'),
                        'link' => '/products',
                        'subtitle' => 'PRECISION IN CONTROL',
                        'button_label' => 'Explore More',
                        'alignment' => 'left',
                        'text_color' => 'white',
                        'button_style' => 'animate-dark',
                        'subtitle_tag' => 'h6',
                        'subtitle_class' => 'mb-12',
                        'title_tag' => 'div',
                        'title_class' => 'h1 mb-12',
                        'description_class' => 'text-body-1 mb-32',
                        'image_class' => 'lazyload scale-item scale-item-1',
                        'image_width' => 1770,
                        'image_height' => 680,
                        'content_container' => 'no',
                        'slide_wrapper_class' => 'slider-wrap rounded-20 overflow-hidden',
                    ],
                    [
                        'title' => 'Strong Tools For Serious Work',
                        'description' => 'Durable steel tools delivering strong grip and reliable performance on every job.',
                        'image' => $this->filePath('slider/slider-36.jpg'),
                        'link' => '/products',
                        'subtitle' => 'ENGINEERED FOR CONTROL',
                        'button_label' => 'Explore More',
                        'alignment' => 'left',
                        'text_color' => 'dark',
                        'button_style' => 'animate-dark',
                        'subtitle_tag' => 'h6',
                        'subtitle_class' => 'mb-12',
                        'title_tag' => 'div',
                        'title_class' => 'h1 mb-20 cl-text-main',
                        'description_class' => 'text-body-1 mb-32 cl-text-main',
                        'image_class' => 'lazyload scale-item scale-item-1',
                        'image_width' => 1770,
                        'image_height' => 680,
                        'content_container' => 'no',
                        'slide_wrapper_class' => 'slider-wrap rounded-20 overflow-hidden',
                    ],
                ],
            ],
        ];
    }
}
