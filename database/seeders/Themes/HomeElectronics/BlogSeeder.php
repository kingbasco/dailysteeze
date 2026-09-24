<?php

namespace Database\Seeders\Themes\HomeElectronics;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;

/**
 * HomeElectronics — consumer electronics blog posts. The home-electronics.html
 * demo only ships three blog images (blog-10..12.jpg), so the six posts cycle
 * through them.
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
                'name' => 'Daily Tech Rituals: Five Habits That Keep You Out of Notification Hell',
                'description' => 'Small calibrations to your phone, watch, and home setup that save hours every week.',
                'content' => '<p>Most digital overload is downstream of defaults. Turning notifications off by category (not by app), batching email twice a day, and parking the phone outside the bedroom are the three changes with the highest payoff.</p><p>The point is to make distraction the exception, not the rule.</p>',
                'image' => $this->filePath('blog/blog-10.jpg'),
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'The Smart Home Edit: What Actually Pays Off in 2026',
                'description' => 'Skip the hype. These four categories — lighting, locks, hubs, and cameras — earn their keep.',
                'content' => '<p>Smart bulbs and lock automations save the most time. Add a hub before the fifth device or run-time issues will compound. Skip novelty kitchen gear unless it survives the kitchen-island test for a month.</p><p>Buy slow. Standardize on one ecosystem when possible.</p>',
                'image' => $this->filePath('blog/blog-11.jpg'),
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Choosing the Right Earbuds for Your Ears (and Your Day)',
                'description' => 'Active noise cancelling, transparency mode, codec support — what matters and what does not.',
                'content' => '<p>Fit beats specs. If the seal is wrong, every other feature fails. Try the included tip sizes for a full day each before judging. Transparency mode is more useful than ANC for most desk-bound listeners.</p><p>Battery life numbers assume mid-volume — real-world use is typically 70-80% of the rated time.</p>',
                'image' => $this->filePath('blog/blog-12.jpg'),
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Wireless Charging Demystified: Wattage, Coils, and Real Speeds',
                'description' => 'Why a 15W pad rarely delivers 15W, and how to choose one that does what it advertises.',
                'content' => '<p>Wireless charging speed depends on alignment, case material, and thermals. MagSafe-style magnetic alignment delivers measurably more consistent speeds than coil-only pads.</p><p>If charging speed matters, plug in. Wireless wins for convenience, not for raw watts.</p>',
                'image' => $this->filePath('blog/blog-10.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Home Automation 101: Routines That Actually Run',
                'description' => 'A starter playbook of automations every household will use within a week.',
                'content' => '<p>Start with three: a goodnight routine that turns off lights and sets the thermostat, a morning routine tied to sunrise, and a leaving-home routine triggered by your phone leaving Wi-Fi range.</p><p>Add automations only when you find yourself doing the same tap-tap-tap twice in one day.</p>',
                'image' => $this->filePath('blog/blog-11.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Phone Photography Tips That Beat the Default Camera App',
                'description' => 'Three settings, two habits, and one accessory that quietly upgrade every photo you take.',
                'content' => '<p>Lock exposure on your subjects face, shoot in the apps highest-quality format, and use the volume button as a shutter to keep the phone steady. A small magnetic tripod handles the rest.</p><p>The biggest improvement is editing — even ten seconds of contrast and crop transform a shot.</p>',
                'image' => $this->filePath('blog/blog-12.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
