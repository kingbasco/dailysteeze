<?php

namespace Database\Seeders\Themes\HomeBag;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;

/**
 * HomeBag — bag & accessories blog posts. The home-bag-accessories.html demo ships
 * zero blog images, so each post sets `image` to null and relies on placeholder rendering.
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
                'name' => 'The Definitive Bag Care Guide',
                'description' => 'Routine cleaning, deep conditioning, and rotation tips that protect your favorite pieces.',
                'content' => '<p>Wipe down with a soft microfiber after each use. Condition leather every six to eight weeks with a pH-balanced cream. Stuff bags with acid-free tissue when storing and rotate what you carry weekly to let leather rest.</p><p>The biggest enemy of a good bag is humidity. Keep silica packs in the dust bag and avoid plastic storage.</p>',
                'image' => null,
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Curated Bag Edit: Six Silhouettes for Every Day',
                'description' => 'A capsule of crossbody, tote, and clutch shapes that cover work, travel, and evening.',
                'content' => '<p>Six bags handle 95% of carrying needs. A structured tote for work. A soft hobo for weekends. A small crossbody for hands-free errands. A weekender for short trips. A clutch for evening. A backpack for travel days.</p><p>Skip the trend pieces until the rotation is complete.</p>',
                'image' => null,
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Choosing Quality Leather: A Beginners Guide',
                'description' => 'Full-grain, top-grain, and bonded — what each label really means before you buy.',
                'content' => '<p>Full-grain is the strongest, most expensive, and develops the best patina. Top-grain is sanded smooth — uniform but loses character over time. Genuine leather is the lowest tier and bonded leather is essentially leather dust glued together.</p><p>If the price seems too good, the material is probably not what the label claims.</p>',
                'image' => null,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Mixing Textures Like a Pro',
                'description' => 'Suede with smooth leather, raffia with tweed — combinations that feel intentional, not chaotic.',
                'content' => '<p>The trick is contrast plus restraint. Pair a smooth structured bag with a softer, textured outfit. Or anchor a busy print with a quiet leather accessory. Limit yourself to two competing textures within a single look.</p><p>Hardware finishes should match within an outfit — avoid mixing gold and silver in the same head-to-toe edit.</p>',
                'image' => null,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Hardware Trends 2026: What to Buy Now',
                'description' => 'Brushed brass, oxidized silver, and the return of subtle logos define the new accessory season.',
                'content' => '<p>Polished gold is taking a back seat to warmer brushed brass. Silver is leaning oxidized rather than mirror-bright. Logos are smaller, embossed, or hidden inside the lining.</p><p>If you only buy one new piece, make it something with brushed antique hardware — it pairs across seasons and finishes.</p>',
                'image' => null,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Sustainable Accessories: The Brands We Trust',
                'description' => 'Plant-based dyes, deadstock leather, and small-batch production — without the greenwash.',
                'content' => '<p>Look past the marketing. The credible signals are LWG-certified tanneries, transparent sourcing pages, and brands that disclose factory locations. Vegetable-tanned leather, deadstock fabrics, and recycled hardware all matter — but a brand willing to show its work matters most.</p><p>Buying less and choosing well still beats every certificate.</p>',
                'image' => null,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
