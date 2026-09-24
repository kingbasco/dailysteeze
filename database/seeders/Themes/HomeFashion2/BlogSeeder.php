<?php

namespace Database\Seeders\Themes\HomeFashion2;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;

/**
 * HomeFashion2 — fashion blog posts. The home-fashion-2.html demo ships zero
 * blog images, so all six posts publish without a featured image.
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
                'name' => 'The Style Edit: Fall Essentials',
                'description' => 'Six pieces that anchor a fall wardrobe without competing with one another.',
                'content' => '<p>Fall dressing rewards restraint. Start with a wool coat that fits across the shoulders, a pair of leather boots that get better with wear, and a knit you reach for twice a week. Add a pleated trouser, a structured tote, and a silk scarf — that is the whole edit.</p><p>Trends are rented. The pieces above are owned.</p>',
                'image' => null,
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Building a Capsule Wardrobe That Actually Works',
                'description' => 'A capsule is a system, not a count. Heres how to build one that survives the season.',
                'content' => '<p>Stop counting hangers. Start counting outfits. A working capsule produces 15-20 looks from 25-30 pieces — every item must combine with at least three others. If a piece only goes with one outfit, it is a costume, not a wardrobe item.</p><p>Edit by use, not by aspiration.</p>',
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Investment Pieces: What Is Actually Worth It',
                'description' => 'Where to spend, where to save, and the four items that earn their cost-per-wear.',
                'content' => '<p>Spend on what touches your skin every day and what holds the shape of an outfit: a tailored coat, leather shoes, a quality bag, and a perfectly-fitted denim. Save on trend layers, accessories with limited combinations, and anything photographed for a single event.</p><p>Cost per wear is the only honest math.</p>',
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'How to Mix Vintage with Modern Without Looking Costumed',
                'description' => 'One vintage piece per outfit. Modern fit. The two rules that keep the look intentional.',
                'content' => '<p>The trick to mixing vintage with modern is committing to one era per outfit. A 70s blouse pairs cleanly with a contemporary trouser; pair it with a 70s flare and it becomes a costume. Let the vintage piece be the loudest voice in the room.</p><p>Keep the silhouette modern. The story is in the fabric.</p>',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Jewelry Layering: A Practical Guide',
                'description' => 'Three lengths, two metals, one statement. The math behind a layered look that lasts the day.',
                'content' => '<p>Stick to three necklace lengths separated by at least two inches. Mix gold and silver with intention — keep one as the dominant tone (60% of the metal), and let the other accent. Coordinate hardware on bags and belts to one of those tones.</p><p>The goal is curated, not crowded.</p>',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Caring for Knitwear So It Lasts More Than One Winter',
                'description' => 'Cold water, fold dont hang, and the cedar block trick that costs less than a coffee.',
                'content' => '<p>Wash knitwear inside-out on a wool cycle, lay flat to dry, and never hang on the shoulder — gravity destroys the silhouette. Store with cedar blocks in a breathable cotton bag. Pill remover on cuffs and elbows once a month keeps fabric looking new for years.</p><p>Good knit habits add seasons of wear.</p>',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
