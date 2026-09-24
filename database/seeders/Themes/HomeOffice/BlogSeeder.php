<?php

namespace Database\Seeders\Themes\HomeOffice;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;

/**
 * HomeOffice — office equipment blog posts. Images cycle through three workspace
 * photos (blog-42/43/44) sourced from html/assets/images/blog/.
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
                'name' => 'Five Productivity Must-Haves for the Modern Home Office',
                'description' => 'A short list of upgrades that pay back the investment within a few weeks.',
                'content' => '<p>The five highest-impact upgrades, in order: a chair that fits, a monitor at eye level, a second screen, a tactile keyboard, and quiet from a closed door.</p><p>Every other gadget is downstream of those five.</p>',
                'image' => $this->filePath('blog/blog-42.jpg'),
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Goodbye Back Pain: A Practical Ergonomics Reset',
                'description' => 'Chair height, monitor height, and the 20-8-2 rule that keeps you moving every hour.',
                'content' => '<p>Set chair height so your knees are slightly below your hips. Position the top of your monitor at eye level. Stand up every 20 minutes and walk for two minutes every hour.</p><p>None of this is negotiable if your back already hurts.</p>',
                'image' => $this->filePath('blog/blog-44.jpg'),
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Build Your Workspace on a Budget Without Cutting Corners',
                'description' => 'Where to spend, where to save, and the items that look identical at half the price.',
                'content' => '<p>Spend on chairs and keyboards — youll feel both for years. Save on monitor arms, desk pads, and lights, where the budget brands have caught up.</p><p>Buy used for desks. Their resale is poor and the build quality is excellent.</p>',
                'image' => $this->filePath('blog/blog-43.jpg'),
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'The Complete Ergonomic Setup Guide',
                'description' => 'A measured, room-by-room walkthrough for sitting, standing, and screen positioning.',
                'content' => '<p>Sit with your feet flat. Elbows at 90-100 degrees. Wrists neutral at the keyboard. Eye-line at the top quarter of your monitor. Use a footrest if your feet dont reach the floor.</p><p>Recheck your setup quarterly. Things drift faster than you think.</p>',
                'image' => $this->filePath('blog/blog-44.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Standing Desk Adoption: From Day One to Habit',
                'description' => 'How to ramp up time on your feet without burning out or developing new aches.',
                'content' => '<p>Start with 15 minutes of standing per hour for week one. Add five minutes per week. After a month, aim for 50/50. Anti-fatigue mats help more than people expect.</p><p>Vary your posture throughout the day. The best position is your next position.</p>',
                'image' => $this->filePath('blog/blog-43.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Cable Management Tips That Actually Hold Up Long-Term',
                'description' => 'Reusable solutions that survive moves, hardware swaps, and quarterly tidies.',
                'content' => '<p>Group cables by purpose, not by color. Use velcro ties (not zip ties) so you can re-route. Mount a cable tray under the desk and label any USB youll touch monthly.</p><p>Done well, you should not need to redo this for years.</p>',
                'image' => $this->filePath('blog/blog-42.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
