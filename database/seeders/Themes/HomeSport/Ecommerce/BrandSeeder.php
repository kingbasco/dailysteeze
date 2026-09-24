<?php

namespace Database\Seeders\Themes\HomeSport\Ecommerce;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\Brand;

/**
 * HomeSport — sport-and-active brand strip. Logos match the home-sport.html demo:
 * carolin, cheryl, panadoxn, shangxi, textitles, vanfaba (all .png, downloaded into ../files/brands).
 */
class BrandSeeder extends BaseSeeder
{
    public function run(): void
    {
        if (! is_plugin_active('ecommerce')) {
            return;
        }

        // No setBasePath — variant brand logos pre-copied to shared pool (preset 5 retro lesson C).

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
                'description' => 'Performance footwear designed for runners and everyday athletes.',
                'is_featured' => true,
            ],
            [
                'name' => 'Cheryl',
                'website' => 'https://example.com/cheryl',
                'logo' => 'cheryl.png',
                'description' => 'Studio-tested apparel for yoga, pilates, and modern movement practices.',
                'is_featured' => true,
            ],
            [
                'name' => 'Panadoxn',
                'website' => 'https://example.com/panadoxn',
                'logo' => 'panadoxn.png',
                'description' => 'Strength equipment built for at-home training and small-studio gyms.',
                'is_featured' => true,
            ],
            [
                'name' => 'Shangxi',
                'website' => 'https://example.com/shangxi',
                'logo' => 'shangxi.png',
                'description' => 'Recovery and mobility tools trusted by physical therapists and coaches.',
                'is_featured' => true,
            ],
            [
                'name' => 'Textitles',
                'website' => 'https://example.com/textitles',
                'logo' => 'textitles.png',
                'description' => 'Technical sports apparel and base layers for endurance athletes.',
            ],
            [
                'name' => 'Vanfaba',
                'website' => 'https://example.com/vanfaba',
                'logo' => 'vanfaba.png',
                'description' => 'Racquet sports gear and pickleball equipment crafted for competitive play.',
            ],
        ];
    }
}
