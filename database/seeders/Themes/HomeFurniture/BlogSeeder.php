<?php

namespace Database\Seeders\Themes\HomeFurniture;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;

/**
 * HomeFurniture — designer-furniture blog posts. The home-furniture.html demo
 * ships four blog images (blog-38..41.jpg), so the six posts cycle through them.
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
                'name' => 'How Furniture Shapes Living',
                'description' => 'A few well-chosen pieces do more for a home than a roomful of compromises.',
                'content' => '<p>The objects you live with shape mood, ritual, and habit. A solid dining table draws meals back to one place. A reading chair near a window invents an hour of quiet. A bed thats actually comfortable changes the way you wake up.</p><p>Buy slowly. Buy once. Live well.</p>',
                'image' => $this->filePath('blog/blog-38.jpg'),
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Calm Spaces with Natural Materials',
                'description' => 'Wood, linen, stone, wool — the timeless palette your nervous system already trusts.',
                'content' => '<p>Synthetic finishes look right in photographs but feel wrong in person. Natural materials bring imperfection, texture, and warmth that no laminate matches. Layer wood with linen, stone with wool — the room exhales.</p><p>The most timeless interiors are often the most material-honest ones.</p>',
                'image' => $this->filePath('blog/blog-39.jpg'),
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'The Mid-Century Modern Edit',
                'description' => 'Clean lines, organic curves, and the design movement that refuses to age.',
                'content' => '<p>Mid-century works because it solved problems still worth solving — small spaces, mixed function, mass production with craft sensibility. Look for tapered legs, walnut and teak tones, and silhouettes that feel light without being flimsy.</p><p>Mix one statement mid-century piece with quieter modern surroundings — that is where the style sings.</p>',
                'image' => $this->filePath('blog/blog-40.jpg'),
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Caring for Wood Furniture',
                'description' => 'Dust, condition, and the cardinal sins that ruin solid-wood pieces.',
                'content' => '<p>Dust weekly with a soft cloth. Condition oiled finishes once a season with pure tung or hardwax oil. Keep wood out of direct sun and away from heat vents — the two biggest enemies of long-term beauty.</p><p>Avoid silicone-based polishes; they build up and prevent future refinishing.</p>',
                'image' => $this->filePath('blog/blog-41.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Small Space Solutions',
                'description' => 'Studios and one-bedrooms can feel generous — with the right rules.',
                'content' => '<p>Choose furniture that earns its footprint twice: storage ottomans, drop-leaf tables, sleeper sofas. Lift sightlines with leggy pieces. Reflect light with mirrors opposite windows. Stick to a tight palette so the eye keeps traveling.</p><p>Small spaces fail when they are over-furnished, not under-decorated.</p>',
                'image' => $this->filePath('blog/blog-38.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Investing in Heirloom Pieces',
                'description' => 'When fast furniture costs more — and how to know what is worth saving up for.',
                'content' => '<p>Buy heirloom for the things that anchor a room: dining tables, beds, sofas, lighting. Save on accents, smaller pieces, and items prone to redecorating. Solid hardwood, joinery you can see, and natural fibers are markers of pieces designed to last decades.</p><p>The math always favors quality once you account for replacement cycles.</p>',
                'image' => $this->filePath('blog/blog-39.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
