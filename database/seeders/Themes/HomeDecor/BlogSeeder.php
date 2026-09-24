<?php

namespace Database\Seeders\Themes\HomeDecor;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;

/**
 * HomeDecor — ergonomic-workspace blog posts. The home-decor.html demo ships no
 * blog images, so every post intentionally has image=null.
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
                'name' => 'The Ergonomic Setup Guide That Actually Works',
                'description' => 'Eyes, elbows, hips, and feet — the four landmarks for a pain-free desk.',
                'content' => '<p>Position the top of your monitor at or just below eye level, an arm-length away. Elbows fall at a 90-degree angle, wrists neutral. Hips slightly above knees. Feet flat on the floor or a footrest. Adjust once, then leave it alone.</p><p>Most desk pain is the cumulative effect of small misalignments — fix the geometry and the body relaxes.</p>',
                'image' => null,
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Posture Throughout the Day',
                'description' => 'Static is the enemy. The best posture is your next posture.',
                'content' => '<p>Sitting still is harder on the body than moving through varied positions. Alternate sitting and standing every 30-45 minutes. Take a two-minute walk every hour. Do a shoulder reset between meetings.</p><p>The goal is not perfect posture — it is frequent enough movement that no single position holds long enough to cause strain.</p>',
                'image' => null,
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Standing Desk Adoption Without Burnout',
                'description' => 'Most people stand too much in week one and abandon by week three. Heres the ramp.',
                'content' => '<p>Start with 15 minutes standing for every hour seated. Add five minutes per week. After six weeks you will comfortably alternate 30/30. Use a balance board or anti-fatigue mat to keep weight shifting.</p><p>Treat standing like a new exercise — progressive overload, not maximum effort.</p>',
                'image' => null,
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Five Chair Buying Mistakes',
                'description' => 'A $200 mistake that adds up to neck pain — and how to avoid it.',
                'content' => '<p>Buyers fixate on aesthetics, ignore lumbar adjustability, and skip the seat-pan depth check. Always test the chair seated for thirty minutes. Confirm tilt tension fits your weight. Insist on a multi-year warranty on cylinders and casters.</p><p>The cheapest chair you keep replacing always costs more than the right one once.</p>',
                'image' => null,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Lighting Your Workspace',
                'description' => 'Eye fatigue is mostly a lighting problem — not a screen problem.',
                'content' => '<p>Combine ambient lighting at 300 lux with a focused task light at 500 lux on your work surface. Avoid placing your monitor directly in front of a bright window. Match color temperature to time of day — warmer evening, cooler daytime.</p><p>Your eyes adapt to balance, not brightness. Aim for even, glare-free illumination.</p>',
                'image' => null,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Cable Management Tips That Last',
                'description' => 'A clean desk is a calm desk. A few rules that survive real life.',
                'content' => '<p>Run power and data along the back of the desk inside a single channel. Use velcro ties — never zip ties — for cables you ever change. Label both ends. Mount surge protectors under the desk to keep cords short.</p><p>Spend an hour once and the next five years are dramatically easier.</p>',
                'image' => null,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
