<?php

namespace Database\Seeders\Themes\Main;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;

/**
 * Fashion-focused posts mirroring html/blog.html (Main preset is the fashion
 * variant: capsule wardrobes, bags, accessories, sustainable fabrics, etc.).
 * Image filenames map 1:1 to database/seeders/files/blog/blog-{1..10}.jpg —
 * those source files are pulled directly from tfamerce.vercel.app/assets/images/blog/.
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
                'name' => 'How to Build a Capsule Wardrobe That Fits Your Lifestyle',
                'description' => 'Learn the art of mixing timeless basics with statement pieces for effortless, everyday style.',
                'content' => '<p>A capsule wardrobe is built on a tight palette of pieces that play well together. Start with a statement outerwear piece — a rich fur or wool coat — and let it anchor a season of looks. From there, layer in neutral knits, tailored trousers, and a single pair of go-everywhere boots.</p><p>The trick is choosing items that serve at least three different occasions. A great coat earns its keep on commutes, dinners, and lazy Sunday walks alike.</p>',
                'image' => $this->filePath('blog/blog-1.jpg'),
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'The Investment Bag: Why a Quality Handbag Pays for Itself',
                'description' => 'A deep dive into woven leather, structured silhouettes, and the bags worth saving for.',
                'content' => '<p>A well-made handbag is one of the rare fashion purchases that genuinely improves with age. Hand-woven full-grain leather develops a patina you simply cannot fake, and the structured silhouette holds its shape through decades of use.</p><p>Cost per wear on a quality bag, calculated across ten years of daily carry, almost always beats fast fashion alternatives.</p>',
                'image' => $this->filePath('blog/blog-2.jpg'),
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Why Accessories Define More Than Just Your Outfit',
                'description' => 'Explore how small details like jewelry and bags can transform your entire look.',
                'content' => '<p>Statement earrings, a sculptural necklace, a single perfectly chosen ring — accessories carry an outsized share of the styling work. The same black slip dress reads boho with hammered gold hoops, dressed-up with diamond studs, or downtown-cool with a stack of silver cuffs.</p><p>Build a small collection of pieces in different metals and silhouettes, and you have ten outfits in three.</p>',
                'image' => $this->filePath('blog/blog-3.jpg'),
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'From Work to Weekend: Outfits That Do It All',
                'description' => 'Find versatile looks that transition seamlessly from office hours to after-hours fun.',
                'content' => '<p>The most useful pieces in any wardrobe are those that travel between contexts without missing a beat. A linen overshirt in a warm earth tone reads polished over a tee for a midweek meeting, then loosens up perfectly for Friday evening drinks.</p><p>Look for relaxed tailoring, natural fibers, and colors slightly off the corporate-blue defaults.</p>',
                'image' => $this->filePath('blog/blog-4.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'The Secret to Effortless Elegance in Every Season',
                'description' => 'Discover key layering techniques and fabric choices that keep you chic year-round.',
                'content' => '<p>Effortless elegance comes from a small set of decisions, not a large wardrobe. Choose pieces in natural fibers — cashmere, mohair, real fur or its high-quality alternatives — and let texture do the visual heavy lifting.</p><p>A cropped fur jacket layered over a fine ribbed knit is the kind of pairing that looks composed in any season, in almost any city.</p>',
                'image' => $this->filePath('blog/blog-5.jpg'),
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Sustainable Fashion Choices That Never Go Out of Style',
                'description' => 'Learn how to shop smarter with eco-friendly pieces that look good and do good.',
                'content' => '<p>Sustainable fashion is no longer about compromise. Linen-blend utility dresses, recycled-leather belt details, and plant-dyed fabrics offer the kind of considered style that improves with each wear and washes cleanly into your existing wardrobe.</p><p>Buy fewer pieces, choose better fibers, and let your closet quietly outlast every micro-trend.</p>',
                'image' => $this->filePath('blog/blog-6.jpg'),
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Must-Have Wardrobe Staples for Every Season',
                'description' => 'The 10 timeless basics every closet needs — and how to wear each one beyond the obvious.',
                'content' => '<p>A ribbed sage tank, a perfect white tee, a tonal slip dress — staples are the connective tissue of a wardrobe. Choose them in colors slightly off white and slightly off black: sage, ecru, charcoal, oat. They photograph better, they age better, and they layer better.</p>',
                'image' => $this->filePath('blog/blog-7.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Essential Styling Rules Every Woman Should Know',
                'description' => 'Proportion, palette, and the small tailoring tweaks that make ready-to-wear look custom.',
                'content' => '<p>The two rules that quietly do the most work: balance volume with structure, and keep your color story under three shades. A boxy waistcoat over a column skirt is a master class in proportion. Tonal dressing in warm sand and chocolate reads more expensive than any logo ever could.</p>',
                'image' => $this->filePath('blog/blog-8.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Mastering Color Palettes for a Modern Wardrobe',
                'description' => 'Understand how to blend tones and textures to express your personality through fashion.',
                'content' => '<p>The best dressers know their palette. Stick to a tight family of warm whites, creams, and bone tones and you will rarely make a wrong choice. Add a single statement color twice a year — a clay red, a deep olive — and let everything else relate to your base.</p><p>Texture, not contrast, is what keeps a tonal outfit from going flat.</p>',
                'image' => $this->filePath('blog/blog-9.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Modern Accessories That Instantly Elevate Your Look',
                'description' => 'A scarf at the neck, a structured belt, a single bold ring — small pieces, big impact.',
                'content' => '<p>The fastest wardrobe upgrade is rarely a new dress. A pussy-bow blouse in burnished copper, a silk scarf knotted just so, or a slim-belted waist over wide trousers can shift an outfit from forgettable to photographed.</p><p>Build a small toolkit of statement accessories and rotate them — your wardrobe will feel three times its size.</p>',
                'image' => $this->filePath('blog/blog-10.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
