<?php

namespace Database\Seeders\Themes\Main;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Facades\MetaBox;
use Botble\Base\Supports\BaseSeeder;
use Botble\SimpleSlider\Models\SimpleSlider;
use Botble\SimpleSlider\Models\SimpleSliderItem;

class SimpleSliderSeeder extends BaseSeeder
{
    /**
     * Resolve image paths from the variant's own Themes/<Variant>/files/
     * directory first, then fall back to the shared seeders/files/ pool.
     * This lets HomeMental/SimpleSliderSeeder reference slider/slider-5.jpg
     * without overriding setBasePath() — variants only need to drop their
     * real images into Themes/<Variant>/files/slider/.
     *
     * Variant directory is resolved from the concrete subclass via
     * reflection so this single override serves all variant subclasses.
     */
    protected function filePath(string $path, ?string $basePath = null): string
    {
        if ($basePath !== null || static::class === self::class) {
            return parent::filePath($path, $basePath);
        }

        try {
            $variantDir = dirname((new \ReflectionClass(static::class))->getFileName());
        } catch (\Throwable) {
            return parent::filePath($path);
        }

        $variantBase = $variantDir . '/files';
        $sharedBase  = database_path('seeders/files');

        // BUG WORKAROUND: parent::filePath($path, $variantBase) uses absolute
        // filesystem path as the storage key when basePath != shared pool —
        // produces broken /storage/Users/... URLs. Copy variant file into
        // shared pool first, then resolve through default base.
        if (is_dir($variantBase)
            && file_exists($variantBase . '/' . $path)
            && ! file_exists($sharedBase . '/' . $path)
        ) {
            try {
                $sharedFile = $sharedBase . '/' . $path;
                $sharedDir  = dirname($sharedFile);
                if (! is_dir($sharedDir)) {
                    @mkdir($sharedDir, 0755, true);
                }
                @copy($variantBase . '/' . $path, $sharedFile);
            } catch (\Throwable) {
                // Best-effort.
            }
        }

        return parent::filePath($path);
    }

    public function run(): void
    {
        if (! is_plugin_active('simple-slider')) {
            return;
        }

        SimpleSlider::query()->truncate();
        SimpleSliderItem::query()->truncate();

        foreach ($this->getSliders() as $sliderData) {
            $slider = SimpleSlider::query()->create([
                'name' => $sliderData['name'],
                'key' => $sliderData['key'],
                'description' => $sliderData['description'],
                'status' => BaseStatusEnum::PUBLISHED,
            ]);

            foreach ($sliderData['items'] as $order => $item) {
                $sliderItem = SimpleSliderItem::query()->create([
                    'simple_slider_id' => $slider->getKey(),
                    'title' => $item['title'],
                    'description' => $item['description'],
                    'image' => $item['image'],
                    'link' => $item['link'],
                    'order' => $order,
                    'status' => BaseStatusEnum::PUBLISHED,
                ]);

                // Persist all per-slide metadata used by simple-slider/style-1 blade.
                // Adding a key here makes it available to every variant — no need to
                // override run() in the per-preset seeders.
                $metaKeys = [
                    'subtitle', 'button_label', 'alignment',
                    // Per-preset hero design knobs — matched in the style-1 blade.
                    'text_color',           // 'white' (default) | 'dark'
                    'button_style',         // 'pill-white' | 'pill-dark' | 'animate-dark' | 'outline-white' | 'outline-dark'
                    'title_tag',            // 'p' (default) | 'h1' | 'h2' | 'div'
                    'subtitle_tag',         // 'p' (default) | 'h6'
                    'subtitle_class',       // extra utility classes on .sub-text_sld
                    'heading_class',        // extra utility classes on the .heading wrapper
                    'title_class',          // full utility class set on the title
                    'description_class',    // full utility class set on the description
                    'image_class', 'image_width', 'image_height',
                    'content_container',    // 'yes' (default) | 'no'
                    'slide_wrapper_class',  // extra classes on inner slide div (e.g. 'slider-wrap rounded-20 overflow-hidden')
                    'title_first',          // 'yes' to render title before subtitle/description
                    // style-baby (overlay-graphic) blade — desktop decorative graphic image.
                    'decor_image',          // path to desktop overlay graphic (e.g. item/graphic-item.png)
                ];
                foreach ($metaKeys as $metaKey) {
                    if (! empty($item[$metaKey])) {
                        MetaBox::saveMetaBoxData($sliderItem, $metaKey, $item[$metaKey]);
                    }
                }
            }
        }
    }

    public function getSliders(): array
    {
        // Hero copy mirrors html/home-fashion.html lines 1407-1509 (activewear slideshow).
        return [
            [
                'name' => 'Homepage Hero',
                'key' => 'home-hero',
                'description' => 'Primary hero slider used on the Main homepage.',
                'items' => [
                    [
                        'title' => "Unlock your strength\nand go beyond limits.",
                        'description' => null,
                        'image' => $this->filePath('slider/slider-22.jpg'),
                        'link' => '/products',
                        'subtitle' => 'Elevate Your Game Today',
                        'button_label' => 'Shop Styles',
                        'alignment' => 'center',
                    ],
                    [
                        'title' => "Activewear that\nsupports every move.",
                        'description' => null,
                        'image' => $this->filePath('slider/slider-23.jpg'),
                        'link' => '/products',
                        'subtitle' => 'Move with Confidence',
                        'button_label' => 'Shop Styles',
                        'alignment' => 'center',
                    ],
                    [
                        'title' => "Premium sportswear built\nto power every move.",
                        'description' => null,
                        'image' => $this->filePath('slider/slider-24.jpg'),
                        'link' => '/products',
                        'subtitle' => 'Built for Motion',
                        'button_label' => 'Shop Styles',
                        'alignment' => 'center',
                    ],
                ],
            ],
        ];
    }
}
