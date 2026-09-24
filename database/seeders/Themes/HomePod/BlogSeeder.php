<?php

namespace Database\Seeders\Themes\HomePod;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;

/**
 * HomePod — print-on-demand blog posts. The home-pod.html demo ships no blog
 * imagery, so all six posts are seeded without images.
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
                'name' => 'Personalized Gifting Made Easy: A Step-by-Step Playbook',
                'description' => 'Five short steps from idea to ordered — without overthinking the design.',
                'content' => '<p>Pick the recipient first, the product second, and the design last. Open with a photo or memory the recipient already loves. Keep type readable; one font, two sizes maximum.</p><p>Order a sample for items you plan to repeat (corporate gifts, wedding favors).</p>',
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Custom Print Tips: Six Habits That Make Designs Look Professional',
                'description' => 'Resolution, bleed, and fonts — small details that separate amateur from polished.',
                'content' => '<p>Always upload at 300dpi or higher. Use full-bleed templates and keep text 1/4 inch from any edge. Avoid licensed fonts you havent purchased commercial use for.</p><p>Print one proof before producing in bulk.</p>',
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Choosing the Right Photo for Your Custom Product',
                'description' => 'High-resolution beats clever every time. Heres what to look for in source photos.',
                'content' => '<p>The best source photos are sharp, well-lit, and high contrast. Smartphone shots from the past two years almost always work. Avoid heavily filtered images and screenshots.</p><p>For canvas and posters, prefer landscape orientations with negative space for typography.</p>',
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Wedding Gift Ideas That Couples Actually Display',
                'description' => 'Custom prints, engraved keepsakes, and the gift styles that survive the move-in declutter.',
                'content' => '<p>Gifts displayed in shared rooms last the longest. Photo books, framed prints of meaningful places, and engraved bar tools tend to make the cut.</p><p>If unsure, send a digital gift card with a curated set of options to choose from.</p>',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Memorable Anniversaries: Gift Ideas By Year',
                'description' => 'A modern take on traditional anniversary themes — without the cliches.',
                'content' => '<p>Year one: paper. A custom poster of the wedding playlist. Year five: wood. An engraved cutting board with the date. Year ten: tin. A printed metal photo with your favorite trip.</p><p>The story matters more than the price tag.</p>',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Print-on-Demand Quality: How We Test Every Product',
                'description' => 'Inks, fabrics, and finishes — what we measure before a product goes live in the catalog.',
                'content' => '<p>Every new product is tested for color accuracy, wash durability, and packaging integrity. We use Pantone-matched inks, lightfast pigments, and reinforced packaging on glassware.</p><p>If a product fails our wear test at six months, it does not enter the catalog.</p>',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
