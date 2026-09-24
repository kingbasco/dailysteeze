<?php

namespace Database\Seeders\Themes\HomeGarden\Ecommerce;

use Botble\Base\Supports\BaseSeeder;
use FriendsOfBotble\ProductSizeGuide\Models\SizeGuide;
use FriendsOfBotble\ProductSizeGuide\Models\SizeGuideHeader;
use FriendsOfBotble\ProductSizeGuide\Models\SizeGuideRelation;

/**
 * HomeGarden Size Guide Seeder.
 * Truncates size guide data because plants and garden products do not use size charts.
 * This ensures a clean state if switching from a fashion preset.
 */
class SizeGuideSeeder extends BaseSeeder
{
    public function run(): void
    {
        if (! is_plugin_active('fob-product-size-guide')) {
            return;
        }

        SizeGuideRelation::query()->delete();
        SizeGuide::query()->delete();
        SizeGuideHeader::query()->delete();
    }
}
