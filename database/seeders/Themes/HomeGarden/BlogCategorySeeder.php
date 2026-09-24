<?php

namespace Database\Seeders\Themes\HomeGarden;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;

/**
 * HomeGarden — blog categories tuned to the indoor plants & garden niche.
 * Drives the homepage `blog-posts` slider via the home-garden.html demo.
 */
class BlogCategorySeeder extends BaseSeeder
{
    use HasBlogSeeder;

    public function run(): void
    {
        if (! is_plugin_active('blog')) {
            return;
        }

        $this->createBlogCategories($this->getCategories());
    }

    public function getCategories(): array
    {
        return [
            [
                'name' => 'Plant Care',
                'description' => 'Watering, light, and seasonal care notes for thriving houseplants.',
                'is_default' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Indoor Gardening',
                'description' => 'Building urban gardens, balcony jungles, and small-space green sanctuaries.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Plant Health',
                'description' => 'Diagnosing common issues, pests, and root problems before they spread.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Decor with Plants',
                'description' => 'Styling tips, planter pairings, and turning plants into design statements.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Sustainability',
                'description' => 'Composting, peat-free soils, and gardening choices that respect the planet.',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
