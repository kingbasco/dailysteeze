<?php

namespace Database\Seeders\Themes\HomeHeadphone;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;

/**
 * HomeHeadphone — premium audio blog posts. The home-headphone.html demo only
 * ships three blog images (blog-25..27.jpg), so the six posts cycle through them.
 */
class BlogSeeder extends BaseSeeder
{
    use HasBlogSeeder;

    public function run(): void
    {
        if (! is_plugin_active('blog')) {
            return;
        }

        // No setBasePath — variant blog images pre-copied to shared pool (preset 5 retro lesson C).

        $this->createBlogPosts($this->getPosts());
    }

    public function getPosts(): array
    {
        return [
            [
                'name' => 'ANC Tech Explained: How Modern Headphones Cancel the World',
                'description' => 'Feedforward, feedback, and hybrid ANC — what each means and where it actually shines.',
                'content' => '<p>Active noise cancellation works by generating an inverse waveform in real time. Hybrid ANC uses both interior and exterior mics, which improves performance across more frequencies.</p><p>Look for adaptive ANC if you mix commutes, offices, and flights — fixed-mode ANC over-cancels in quiet rooms and creates pressure feel.</p>',
                'image' => $this->filePath('blog/blog-25.jpg'),
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Wireless Earbuds Buying Guide for 2026',
                'description' => 'Fit, codecs, mic quality, and battery — a no-hype buyers checklist.',
                'content' => '<p>Buy for fit first, sound second, codecs third. Try the included tip sizes for a full day each. Test calls in a noisy room before keeping them.</p><p>If you switch between iPhone and Mac often, multipoint pairing matters more than codec support.</p>',
                'image' => $this->filePath('blog/blog-26.jpg'),
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Battery Life Tips That Actually Extend Listening Hours',
                'description' => 'Volume, codec, and storage habits that double the practical life of any wireless headphone.',
                'content' => '<p>Listening at 60% volume rather than 80% can extend battery by 30-40%. Storing headphones at 50% charge prolongs cell life. Disable LDAC and aptX HD when youre on calls or podcasts.</p><p>Treat the case like a battery bank, not a holster — leave it plugged in nightly.</p>',
                'image' => $this->filePath('blog/blog-27.jpg'),
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Codec Wars: aptX vs LDAC vs AAC, Decoded',
                'description' => 'You probably do not need lossless. Heres what each codec is actually doing under the hood.',
                'content' => '<p>AAC is iPhone-native and excellent. LDAC supports up to 990kbps but drops connection when range or congestion is poor. aptX Adaptive is the best balance for Android users.</p><p>The recording quality of your source matters far more than the codec.</p>',
                'image' => $this->filePath('blog/blog-25.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Open-Back vs Closed-Back: Which Is Right For You?',
                'description' => 'Soundstage, isolation, and use-case — picking the right type for your room and habits.',
                'content' => '<p>Open-back headphones win for soundstage and natural decay but leak both ways. Closed-back wins for travel, shared spaces, and tracking sessions.</p><p>If you only buy one pair, closed-back is the more practical choice.</p>',
                'image' => $this->filePath('blog/blog-26.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Studio vs Audiophile: Two Different Goals, Two Different Tunings',
                'description' => 'Reference flat is not the same as enjoyable, and thats by design.',
                'content' => '<p>Studio headphones aim for accuracy — they should make a bad recording sound bad. Audiophile tunings enhance the listening experience with bass extension, treble air, and a wider stage.</p><p>Pick the tuning that matches what you actually do for hours each week.</p>',
                'image' => $this->filePath('blog/blog-27.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
