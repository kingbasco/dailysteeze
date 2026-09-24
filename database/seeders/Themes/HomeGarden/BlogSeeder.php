<?php

namespace Database\Seeders\Themes\HomeGarden;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;

/**
 * HomeGarden — indoor plants & garden blog posts. The home-garden.html demo only
 * ships three blog images (blog-32..34.jpg), so the six posts cycle through them.
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
                'name' => 'Mindfulness With Plants',
                'description' => 'Watering as ritual, leaf-wiping as meditation — a slower way to live with plants.',
                'content' => '<p>Plant care rewards attention. A weekly check — soil moisture, leaf colour, new growth — is also a check-in with yourself. Five minutes of slow observation beats an hour of frantic intervention.</p><p>Plants thrive on consistency. So do most things worth caring for.</p>',
                'image' => $this->filePath('blog/blog-32.jpg'),
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Calm Green Spaces',
                'description' => 'Designing a small indoor garden that lowers heart rate the moment you walk in.',
                'content' => '<p>Cluster plants by humidity and light needs — calatheas, ferns, and prayer plants thrive together. Add a small water feature or a textured rug. Soft greens at eye level and trailing plants overhead.</p><p>Calm spaces are designed, not stumbled upon.</p>',
                'image' => $this->filePath('blog/blog-33.jpg'),
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Happier Mind Habits',
                'description' => 'Why caring for plants is one of the most reliable mood-lifters research has measured.',
                'content' => '<p>Studies on horticultural therapy show consistent reductions in cortisol and improvements in mood after even brief plant interactions. The mechanism is simple: tending to a living thing pulls attention out of your head.</p><p>One plant on the desk is a small intervention with surprising returns.</p>',
                'image' => $this->filePath('blog/blog-34.jpg'),
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Indoor Plant Light Guide',
                'description' => 'Bright indirect, low light, and direct sun — what each label actually means.',
                'content' => '<p>Bright indirect = within a metre of a sunny window but not in the beam. Medium = across the room from that window. Low = a few metres from any window or against a north wall. Direct sun = unfiltered through glass for 4+ hours.</p><p>Match the plant to the light, not the other way around.</p>',
                'image' => $this->filePath('blog/blog-32.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Repotting 101',
                'description' => 'When to repot, how to size up, and the fresh-soil habit that resets growth every year.',
                'content' => '<p>Repot when roots circle the bottom of the pot or grow out the drainage holes. Move up one pot size — too large traps moisture. Refresh soil annually even when the pot stays the same.</p><p>Spring is the easiest time. Plants are entering active growth and bounce back fastest.</p>',
                'image' => $this->filePath('blog/blog-33.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Pest-Free Houseplants',
                'description' => 'Spider mites, scale, and fungus gnats — how to spot them early and stop the spread.',
                'content' => '<p>Inspect new plants under the leaves before bringing them home. Quarantine for two weeks. At the first sign of pests, isolate, prune affected leaves, and treat with neem or insecticidal soap weekly until clear.</p><p>Healthy plants resist pests; stressed plants invite them.</p>',
                'image' => $this->filePath('blog/blog-34.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
