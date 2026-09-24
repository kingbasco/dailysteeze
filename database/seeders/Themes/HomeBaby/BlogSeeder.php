<?php

namespace Database\Seeders\Themes\HomeBaby;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;

/**
 * HomeBaby — baby & infant blog posts. The home-baby.html demo only ships three
 * blog images (blog-16..18.jpg), so the six posts cycle through them.
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
                'name' => 'Soothe Baby Before Sleep',
                'description' => 'Predictable cues, dim light, and a quiet voice — the building blocks of an easier bedtime.',
                'content' => '<p>Most babies settle faster when the wind-down begins twenty minutes before the first yawn. Lights low, voices calm, and a consistent sequence — bath, lotion, sleep sack, story — train the nervous system to expect rest.</p><p>Skip the screens. Trade them for skin contact and white noise that mimics the womb.</p>',
                'image' => $this->filePath('blog/blog-16.jpg'),
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Cozy Morning Routine',
                'description' => 'Gentle wake-ups, feeding cues, and warm clothes — building a slow start that babies love.',
                'content' => '<p>Babies regulate by repetition. A predictable morning — diaper, feed, fresh outfit, daylight — anchors the rest of the day. Add a soft song you only sing in the morning to cue the transition.</p><p>The point is not to be early; it is to be unhurried.</p>',
                'image' => $this->filePath('blog/blog-17.jpg'),
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Bonding Through Daily Care',
                'description' => 'Bath time, feeding, and gentle massage — the small moments that wire secure attachment.',
                'content' => '<p>Bonding does not require special activities. The real work happens in the everyday: eye contact during feeds, a slow towel-dry after the bath, a calm voice when changing a diaper.</p><p>Choose presence over performance. Babies are not grading.</p>',
                'image' => $this->filePath('blog/blog-18.jpg'),
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Choosing Babys First Shoes',
                'description' => 'Soft soles, room to wiggle, and why structured shoes can wait until later.',
                'content' => '<p>Pre-walkers do not need rigid shoes. Soft, flexible soles let little feet feel the ground and develop natural arch strength. Look for breathable leather or wool with a snug heel and roomy toe box.</p><p>Save the rugged trainers for confident walkers.</p>',
                'image' => $this->filePath('blog/blog-16.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Safe Sleep Guidelines',
                'description' => 'Back to sleep, firm flat mattress, no loose bedding — a refresher worth re-reading.',
                'content' => '<p>The ABCs of safe sleep: Alone, on the Back, in a Crib. Skip soft toys, blankets, and bumpers in the first year. A correctly fitted sleeping bag replaces every loose layer and keeps temperature steady.</p><p>If anything in the cot moves, it does not belong there.</p>',
                'image' => $this->filePath('blog/blog-17.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Bath Time Made Easy',
                'description' => 'Right water temperature, gentle products, and how to keep bath time short and sweet.',
                'content' => '<p>Bath water should feel warm but not hot — about 37 degrees C. Skip soap until baby is mobile and sticky; plain water and a soft cloth do the job. Wrap straight into a hooded towel for the calmest transition.</p><p>Keep it under ten minutes; baby skin dries quickly.</p>',
                'image' => $this->filePath('blog/blog-18.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
