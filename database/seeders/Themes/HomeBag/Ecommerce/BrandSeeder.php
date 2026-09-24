<?php

namespace Database\Seeders\Themes\HomeBag\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\Brand;

/**
 * HomeBag — boutique accessory brand strip. Logos match the home-bag-accessories.html
 * demo: carolin, cheryl, panadoxn, shangxi, textitles, vanfaba (all .png, downloaded
 * into ../files/brands).
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
                'name' => 'Carolin',
                'website' => 'https://example.com/carolin',
                'logo' => 'carolin.png',
                'description' => 'Boutique handbag atelier crafting structured leathers in small batches.',
                'is_featured' => true,
            ],
            [
                'name' => 'Cheryl',
                'website' => 'https://example.com/cheryl',
                'logo' => 'cheryl.png',
                'description' => 'Italian artisan leather goods with hand-finished edges and brushed-brass hardware.',
                'is_featured' => true,
            ],
            [
                'name' => 'Panadoxn',
                'website' => 'https://example.com/panadoxn',
                'logo' => 'panadoxn.png',
                'description' => 'Modern minimalist accessories — quiet silhouettes in vegetable-tanned leather.',
                'is_featured' => true,
            ],
            [
                'name' => 'Shangxi',
                'website' => 'https://example.com/shangxi',
                'logo' => 'shangxi.png',
                'description' => 'Heritage leather house known for embossed wallets and structured totes.',
                'is_featured' => true,
            ],
            [
                'name' => 'Textitles',
                'website' => 'https://example.com/textitles',
                'logo' => 'textitles.png',
                'description' => 'Soft suede and woven textiles for everyday hobo and shoulder bag silhouettes.',
            ],
            [
                'name' => 'Vanfaba',
                'website' => 'https://example.com/vanfaba',
                'logo' => 'vanfaba.png',
                'description' => 'Statement jewelry, belts, and small leather goods that finish a look.',
            ],
        ];
    }
}
