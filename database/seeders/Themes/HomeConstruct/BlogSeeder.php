<?php

namespace Database\Seeders\Themes\HomeConstruct;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;

/**
 * HomeConstruct — blog posts mirror html/home-construction.html, including the
 * pet-demo copy that ships with the construction template.
 */
class BlogSeeder extends BaseSeeder
{
    use HasBlogSeeder;

    public function run(): void
    {
        if (! is_plugin_active('blog')) {
            return;
        }

        $this->createBlogPosts($this->getPosts());
    }

    public function getPosts(): array
    {
        return [
            [
                'name' => 'How To Keep Your Pet Calm And Happy At Home',
                'description' => 'Simple daily routines to ease anxiety, strengthen trust, and create a peaceful bond between you.',
                'content' => '<p>Simple routines, predictable feeding times, and a quiet retreat help pets feel secure at home. Gentle play and positive reinforcement build trust while reducing daily stress.</p>',
                'image' => $this->filePath('blog/blog-35.jpg'),
                'is_featured' => true,
                'created_at' => '2026-08-13 09:00:00',
                'updated_at' => '2026-08-13 09:00:00',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Choosing The Right Food For Your Active, Growing Dog',
                'description' => 'A complete guide to balanced nutrition, portion control, taste preferences, and how to support energy.',
                'content' => '<p>Active dogs need balanced meals with the right protein, fat, and portion size. Track energy levels, weight, and digestion to adjust food choices as they grow.</p>',
                'image' => $this->filePath('blog/blog-36.jpg'),
                'is_featured' => true,
                'created_at' => '2026-08-15 09:00:00',
                'updated_at' => '2026-08-15 09:00:00',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Why Your Playful Cat Needs More Fun Every Day',
                'description' => 'Discover how regular play improves health, strengthens your bond, and keeps your cat curious.',
                'content' => '<p>Short play sessions sharpen instincts, prevent boredom, and support healthy movement. Rotate toys often and end each session with calm affection.</p>',
                'image' => $this->filePath('blog/blog-37.jpg'),
                'is_featured' => true,
                'created_at' => '2026-08-18 09:00:00',
                'updated_at' => '2026-08-18 09:00:00',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
