<?php

namespace Database\Seeders\Themes\HomeJewelry;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;

/**
 * HomeJewelry — fine jewelry blog posts. The home-jewelry.html demo ships
 * four blog images (blog-28..31.jpg), so the six posts cycle through them.
 */
class BlogSeeder extends BaseSeeder
{
    use HasBlogSeeder;

    public function run(): void
    {
        if (! is_plugin_active('blog')) {
            return;
        }

        // No setBasePath — variant blog-28..31.jpg pre-copied to shared pool (preset 5 retro lesson C).

        $this->createBlogPosts($this->getPosts());
    }

    public function getPosts(): array
    {
        return [
            [
                'name' => 'How to Keep Your Jewellery Sparkling',
                'description' => 'A simple at-home routine for cleaning gold, silver, and diamond pieces between professional services.',
                'content' => '<p>Most fine jewelry needs only warm water, a drop of mild soap, and a soft toothbrush. Rinse thoroughly and pat dry with a microfiber cloth. Avoid ultrasonic cleaners on emeralds, opals, and pearls.</p><p>For diamonds and hard stones, a monthly soak keeps brilliance up between annual professional inspections.</p>',
                'image' => $this->filePath('blog/blog-28.jpg'),
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Diamonds for Everyday Wear',
                'description' => 'Bezel settings, low-profile bands, and durable cuts — the smart choices for daily diamond pieces.',
                'content' => '<p>Bezel and channel settings protect stones during daily wear. Round and princess cuts are the most durable. Avoid pavé bands on fingers that bear weight at the gym — small stones loosen over time.</p><p>The best everyday diamond is the one you forget you are wearing.</p>',
                'image' => $this->filePath('blog/blog-29.jpg'),
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Top Gold Pieces for 2026',
                'description' => 'Sculptural cuffs, paperclip chains, and signet rings define the new fine jewelry season.',
                'content' => '<p>Yellow gold continues to dominate over white gold and platinum. Look for sculptural cuffs, irregular paperclip links, and engraved signet silhouettes. Mixed metal stacks pair brushed gold with high-polish silver — the contrast is the point.</p><p>If you only buy one piece, make it a textured cuff. It carries from desk to dinner and reads expensive.</p>',
                'image' => $this->filePath('blog/blog-30.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'A Practical Guide to Investment Jewelry',
                'description' => 'What actually holds value over decades — beyond the marketing language and luxury logos.',
                'content' => '<p>Investment jewelry shares three traits: certified gemstones, established maker, and timeless silhouette. Heritage tennis bracelets, classic solitaires, and Cartier love-style cuffs hold value better than trend pieces.</p><p>Buy quality first, name second, trends never.</p>',
                'image' => $this->filePath('blog/blog-31.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Mixing Metals Tastefully',
                'description' => 'Yellow gold with silver, rose with platinum — combinations that look intentional, not chaotic.',
                'content' => '<p>The trick is repetition. If you pair gold and silver in earrings, repeat the mix in a stacked ring or layered necklace. Two-tone pieces — like a watch with a steel case and gold links — anchor the contrast.</p><p>Skip the "rules" but stick to a palette of two metals max.</p>',
                'image' => $this->filePath('blog/blog-28.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Engagement Ring Buying Tips',
                'description' => 'Carat is overrated, cut is underrated, and certification is non-negotiable. A practical buyers framework.',
                'content' => '<p>Cut quality drives the visible sparkle far more than carat weight. A well-cut 1.0ct outperforms a poorly cut 1.5ct in everyday lighting. Insist on a GIA or AGS certificate. Avoid in-store grading.</p><p>Set a budget before you walk in, and remember: the ring is one purchase, the marriage is the project.</p>',
                'image' => $this->filePath('blog/blog-29.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
