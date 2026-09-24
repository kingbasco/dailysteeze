<?php

namespace Database\Seeders\Themes\HomeCosmetic;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;

/**
 * HomeCosmetic — beauty & cosmetics blog posts. The home-cosmetic.html demo only
 * ships two blog images (blog-23..24.jpg), so the six posts cycle through them.
 */
class BlogSeeder extends BaseSeeder
{
    use HasBlogSeeder;

    public function run(): void
    {
        if (! is_plugin_active('blog')) {
            return;
        }

        // setBasePath() to a variant pool triggers BaseSeeder::filePath() path-mangling
        // bug. Variant blog images already mirrored to shared `database/seeders/files/blog/`
        // pool — let default base path resolve them cleanly.

        $this->createBlogPosts($this->getPosts());
    }

    public function getPosts(): array
    {
        return [
            [
                'name' => 'Makeup Made Easy',
                'description' => 'A five-product routine that flatters every face — and takes under three minutes.',
                'content' => '<p>Tinted moisturizer, cream blush, brow gel, mascara, lip balm. The five-product face skips the production and looks great in any light. Apply with fingers; the warmth blends pigments better than any brush.</p><p>The most flattering makeup is usually the least applied.</p>',
                'image' => $this->filePath('blog/blog-23.jpg'),
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Glow Edit for Radiant Skin',
                'description' => 'Hydration, exfoliation, and the SPF habit that does more for glow than any highlighter.',
                'content' => '<p>Real glow comes from healthy skin, not strobing. The trio that delivers: a humectant serum, gentle weekly exfoliation, and daily SPF. Skip the rest until those are non-negotiable.</p><p>Highlighter on dehydrated skin reads as oil, not light.</p>',
                'image' => $this->filePath('blog/blog-24.jpg'),
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Skincare Layering Order',
                'description' => 'Thinnest to thickest, water before oil — a quick guide to making products work harder.',
                'content' => '<p>The order matters. Cleanser, toner, serum, eye cream, moisturizer, oil, sunscreen. Wait 30-60 seconds between layers so each absorbs. Sunscreen always last in the morning.</p><p>Layering is the difference between products that work and products that pill.</p>',
                'image' => $this->filePath('blog/blog-23.jpg'),
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Choosing Foundation for Your Tone',
                'description' => 'Undertone test, jawline match, and why store lighting deceives almost everyone.',
                'content' => '<p>Test foundation along the jawline — never the wrist or back of the hand. Step outside to evaluate. Pick the shade that disappears, not the one that looks pretty in the bottle.</p><p>Undertone matters more than depth: warm, cool, or neutral, then shade.</p>',
                'image' => $this->filePath('blog/blog-24.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Anti-Aging Essentials',
                'description' => 'Retinoids, peptides, and SPF — the three actives with the strongest evidence.',
                'content' => '<p>Retinoids remain the gold standard. Peptides support collagen synthesis. Daily broad-spectrum SPF outranks both — UV is the largest extrinsic factor in skin aging.</p><p>Marketing changes; the active ingredient list does not.</p>',
                'image' => $this->filePath('blog/blog-23.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Clean Beauty Explained',
                'description' => '"Clean" is not regulated — but here are the three questions to ask before buying.',
                'content' => '<p>Is the brand transparent about every ingredient? Is the manufacturer audited? Are claims backed by data, not vibes? Three yeses earn the shelf space.</p><p>Clean does not mean better — it means accountable.</p>',
                'image' => $this->filePath('blog/blog-24.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
