<?php

namespace Database\Seeders\Themes\HomeMental\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\Brand;

/**
 * HomeMental — wellness brand strip. Logos match the home-mental.html demo:
 * findr, intdeco, modave, sopify, vanfava (all .png, downloaded into ../files/brands).
 */
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
                'name' => 'Findr',
                'website' => 'https://example.com/findr',
                'logo' => 'findr.png',
                'description' => 'Adaptogenic blends and clean supplements for everyday calm.',
                'is_featured' => true,
            ],
            [
                'name' => 'Intdeco',
                'website' => 'https://example.com/intdeco',
                'logo' => 'intdeco.png',
                'description' => 'Calming home accents and mindful living essentials.',
                'is_featured' => true,
            ],
            [
                'name' => 'Modave',
                'website' => 'https://example.com/modave',
                'logo' => 'modave.png',
                'description' => 'Botanical wellness skincare and body care, crafted in small batches.',
                'is_featured' => true,
            ],
            [
                'name' => 'Sopify',
                'website' => 'https://example.com/sopify',
                'logo' => 'sopify.png',
                'description' => 'Smart wellness devices designed for daily mindfulness practice.',
                'is_featured' => true,
            ],
            [
                'name' => 'Vanfava',
                'website' => 'https://example.com/vanfava',
                'logo' => 'vanfava.png',
                'description' => 'Plant-based superfoods and clean nutrition essentials.',
                'is_featured' => true,
            ],
        ];
    }
}
