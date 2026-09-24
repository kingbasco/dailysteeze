<?php

namespace Database\Seeders\Themes\HomeConstruct\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\Brand;

/**
 * HomeConstruct — construction brand strip. Logos match the home-construction.html demo:
 * bohome, living, west-elm, anthro, stanza-2, urban, crate (all .png, downloaded into ../files/brands).
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
                'name' => 'Bohome',
                'website' => 'https://example.com/bohome',
                'logo' => 'bohome.png',
                'description' => 'Construction supplies and fasteners trusted by trade professionals.',
                'is_featured' => true,
            ],
            [
                'name' => 'Living',
                'website' => 'https://example.com/living',
                'logo' => 'living.png',
                'description' => 'Safety gear and PPE that meets the toughest workplace standards.',
                'is_featured' => true,
            ],
            [
                'name' => 'West Elm',
                'website' => 'https://example.com/west-elm',
                'logo' => 'west-elm.png',
                'description' => 'Durable workshop essentials selected for modern builders.',
                'is_featured' => true,
            ],
            [
                'name' => 'Anthro',
                'website' => 'https://example.com/anthro',
                'logo' => 'anthro.png',
                'description' => 'Industrial-grade power tools engineered for daily jobsite use.',
                'is_featured' => true,
            ],
            [
                'name' => 'Stanza',
                'website' => 'https://example.com/stanza',
                'logo' => 'stanza-2.png',
                'description' => 'Precision measuring instruments for builders and contractors.',
            ],
            [
                'name' => 'Urban',
                'website' => 'https://example.com/urban',
                'logo' => 'urban.png',
                'description' => 'Cutting and drilling consumables sourced for trade reliability.',
            ],
            [
                'name' => 'Crate',
                'website' => 'https://example.com/crate',
                'logo' => 'crate.png',
                'description' => 'Heavy-duty hand tools and tool storage built to last.',
            ],
        ];
    }
}
