<?php

namespace Database\Seeders\Themes\Main\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\Brand;

class BrandSeeder extends BaseSeeder
{
    public function run(): void
    {
        if (! is_plugin_active('ecommerce')) {
            return;
        }

        Brand::query()->truncate();

        foreach ($this->getBrands() as $order => $brand) {
            Brand::query()->create([
                'name' => $brand['name'],
                'website' => $brand['website'],
                'logo' => $this->filePath('brands/' . $brand['logo']),
                'description' => $brand['description'],
                'order' => $order,
                'is_featured' => $brand['is_featured'] ?? false,
                'status' => BaseStatusEnum::PUBLISHED,
            ]);
        }
    }

    public function getBrands(): array
    {
        return [
            [
                'name' => 'Anthro',
                'website' => 'https://example.com/anthro',
                'logo' => 'anthro.png',
                'description' => 'Eclectic apparel and home goods inspired by global craftsmanship traditions.',
                'is_featured' => true,
            ],
            [
                'name' => 'Anvouge',
                'website' => 'https://example.com/anvouge',
                'logo' => 'anvouge.png',
                'description' => 'Modern fashion essentials cut from sustainable fibers.',
                'is_featured' => true,
            ],
            [
                'name' => 'Bohome',
                'website' => 'https://example.com/bohome',
                'logo' => 'bohome.png',
                'description' => 'Bohemian-inspired homewares and textiles for the relaxed modern home.',
                'is_featured' => true,
            ],
            [
                'name' => 'Carolin',
                'website' => 'https://example.com/carolin',
                'logo' => 'carolin.png',
                'description' => 'Demi-fine jewelry made by hand in small Italian ateliers.',
                'is_featured' => true,
            ],
            [
                'name' => 'Cheryl',
                'website' => 'https://example.com/cheryl',
                'logo' => 'cheryl.png',
                'description' => 'Bold prints and silhouettes for the contemporary woman.',
            ],
            [
                'name' => 'Crate',
                'website' => 'https://example.com/crate',
                'logo' => 'crate.png',
                'description' => 'Mid-century-inspired furniture built to last generations.',
                'is_featured' => true,
            ],
            [
                'name' => 'Findr',
                'website' => 'https://example.com/findr',
                'logo' => 'findr.png',
                'description' => 'Audio gear engineered for studio-grade clarity in everyday environments.',
            ],
            [
                'name' => 'Intdeco',
                'website' => 'https://example.com/intdeco',
                'logo' => 'intdeco.png',
                'description' => 'Interior accents that bridge minimalism and warmth.',
            ],
            [
                'name' => 'Modave',
                'website' => 'https://example.com/modave',
                'logo' => 'modave.png',
                'description' => 'Performance activewear made with recycled high-stretch knits.',
            ],
            [
                'name' => 'Panadoxn',
                'website' => 'https://example.com/panadoxn',
                'logo' => 'panadoxn.png',
                'description' => 'Botanical skincare formulated by clinical herbalists.',
            ],
            [
                'name' => 'Shangxi',
                'website' => 'https://example.com/shangxi',
                'logo' => 'shangxi.png',
                'description' => 'Heritage tea, ceramics, and meditation accessories.',
            ],
            [
                'name' => 'Sopify',
                'website' => 'https://example.com/sopify',
                'logo' => 'sopify.png',
                'description' => 'Smart home devices designed for renters and travelers.',
            ],
        ];
    }
}
