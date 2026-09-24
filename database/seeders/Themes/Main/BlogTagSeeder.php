<?php

namespace Database\Seeders\Themes\Main;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;

class BlogTagSeeder extends BaseSeeder
{
    use HasBlogSeeder;

    public function run(): void
    {
        if (! is_plugin_active('blog')) {
            return;
        }

        $this->createBlogTags($this->getTags());
    }

    public function getTags(): array
    {
        $names = [
            'Trends', 'Styling Tips', 'Sustainable',
            'New Arrivals', 'Limited Edition', 'Behind the Scenes',
            'Buyer Guide', 'Care Tips', 'Capsule Wardrobe',
            'Material Stories', 'Holiday Gifting', 'Editor Picks',
        ];

        return collect($names)->map(fn (string $name): array => [
            'name' => $name,
            'description' => sprintf('Articles tagged with %s.', $name),
            'status' => BaseStatusEnum::PUBLISHED,
        ])->all();
    }
}
