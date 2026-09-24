<?php

namespace Database\Seeders\Themes\HomeOrganic;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;

/**
 * HomeOrganic — organic & whole-foods blog posts. The home-organic.html demo
 * ships no blog images, so each post is seeded with image=null.
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
                'name' => 'Whole Food Edit',
                'description' => 'Trim the pantry to whole, single-ingredient staples — a one-week reset for clearer cooking.',
                'content' => '<p>Pull every packaged item with more than five ingredients. Re-stock with grains, legumes, oils, herbs, and a handful of staples you actually use. The grocery bill shrinks; the cooking improves.</p><p>Whole-food cooking is less about restriction than reducing decisions.</p>',
                'image' => null,
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Pantry Reset Made Simple',
                'description' => 'Glass jars, labels, and a once-a-quarter rhythm to keep dry goods fresh and visible.',
                'content' => '<p>Decant grains, flours, and seeds into clear glass with the purchase date written in pencil. Rotate older to the front. Anything older than a year goes — old oils oxidize, old grains taste flat.</p><p>Visible inventory leads to better meals.</p>',
                'image' => null,
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Cooking with Superfoods',
                'description' => 'Why most superfoods belong in the everyday kitchen, not the supplement drawer.',
                'content' => '<p>Spirulina dissolves into pesto. Turmeric warms a soup. Cacao layers into oats. Treat superfoods as ingredients, not pills, and you get real flavor with real nutrition.</p><p>If a powder only ends up in smoothies, it usually ends up in the bin.</p>',
                'image' => null,
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Organic vs Natural',
                'description' => '"Natural" is a marketing word. "Organic" is a regulated standard. Heres how to tell them apart.',
                'content' => '<p>Certified organic means audited soil, no synthetic pesticides, and traceable supply chains. "Natural" can mean anything the brand says it does. Look for the official seal — not the descriptor on the front of the pack.</p><p>The back-of-pack ingredient list is where the truth lives.</p>',
                'image' => null,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Fermented Foods Benefits',
                'description' => 'Sauerkraut, kefir, and miso — a quick guide to choosing live ferments over shelf-stable imposters.',
                'content' => '<p>Live ferments live in the cold section. If it sits on a shelf, it has been pasteurized — meaning the probiotics are gone. Look for cloudy brine, fizzy bubbles, and a "raw" or "unpasteurized" label.</p><p>One spoonful a day is plenty to start.</p>',
                'image' => null,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Seasonal Eating Guide',
                'description' => 'Eat with the calendar — better flavor, lower price, and a smaller environmental footprint.',
                'content' => '<p>Seasonal produce travels less, picks at peak ripeness, and costs less because supply is high. Anchor weekly cooking around two or three peak ingredients and rotate as the season turns.</p><p>The best ingredient is the one growing closest to you, this week.</p>',
                'image' => null,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
