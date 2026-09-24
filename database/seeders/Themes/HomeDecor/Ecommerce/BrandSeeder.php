<?php

namespace Database\Seeders\Themes\HomeDecor\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\Brand;

/**
 * HomeDecor — ergonomic furniture brand strip. Logos match the home-decor.html demo
 * §5 brand marquee (lines 1952-1989): bohome, living, west-elm, anthro, stanza,
 * urban, crate (7 brands, all .png in ../files/brands).
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
                'name' => 'Anthro',
                'website' => 'https://example.com/anthro',
                'logo' => 'anthro.png',
                'description' => 'Designer ergonomic chairs that pair posture science with refined form.',
                'is_featured' => true,
            ],
            [
                'name' => 'Bohome',
                'website' => 'https://example.com/bohome',
                'logo' => 'bohome.png',
                'description' => 'Sit-stand desks and elegant office furniture for the modern home workspace.',
                'is_featured' => true,
            ],
            [
                'name' => 'Crate',
                'website' => 'https://example.com/crate',
                'logo' => 'crate.png',
                'description' => 'Designer office storage and curated workspace accessories.',
                'is_featured' => true,
            ],
            [
                'name' => 'Living',
                'website' => 'https://example.com/living',
                'logo' => 'living.png',
                'description' => 'Refined home-office furniture crafted for everyday comfort.',
                'is_featured' => true,
            ],
            [
                'name' => 'West Elm',
                'website' => 'https://example.com/west-elm',
                'logo' => 'west-elm.png',
                'description' => 'Modern furniture and home goods crafted for contemporary living.',
                'is_featured' => true,
            ],
            [
                'name' => 'Stanza',
                'website' => 'https://example.com/stanza',
                'logo' => 'stanza.png',
                'description' => 'Premium task chairs engineered for long productive sessions.',
            ],
            [
                'name' => 'Urban',
                'website' => 'https://example.com/urban',
                'logo' => 'urban.png',
                'description' => 'Modular workspace systems with a clean architectural aesthetic.',
            ],
        ];
    }
}
