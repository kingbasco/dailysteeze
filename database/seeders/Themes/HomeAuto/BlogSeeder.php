<?php

namespace Database\Seeders\Themes\HomeAuto;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;

/**
 * HomeAuto — automotive blog posts. The home-auto.html demo ships four
 * blog images (blog-19..22.jpg), so the six posts cycle through them.
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
                'name' => 'Maintenance Schedule Made Simple',
                'description' => 'A no-jargon breakdown of what to service every 5k, 30k, and 60k miles.',
                'content' => '<p>Owners manuals can be intimidating. Here is the short version: change oil and rotate tires every 5,000 miles, replace cabin and engine air filters every 15,000-30,000 miles, flush coolant and brake fluid every 30,000 miles, and inspect timing belts and serpentine belts every 60,000 miles.</p><p>Stick to this calendar and most modern vehicles will run reliably past 200,000 miles.</p>',
                'image' => $this->filePath('blog/blog-19.jpg'),
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'OEM vs Aftermarket Parts: When Each Wins',
                'description' => 'Cost, fitment, and warranty trade-offs for the parts you actually replace.',
                'content' => '<p>OEM parts win on guaranteed fitment and dealer warranty support. Reputable aftermarket brands often beat OEM on cost, and in performance categories like brakes and suspension they frequently outperform stock.</p><p>The rule of thumb: stick OEM for safety-critical fluid and electrical components, go aftermarket for wear items and performance upgrades.</p>',
                'image' => $this->filePath('blog/blog-20.jpg'),
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'How to Choose the Right Brake Pads',
                'description' => 'Ceramic, semi-metallic, or organic — match the compound to how you actually drive.',
                'content' => '<p>Ceramic pads are quiet and low-dust, ideal for daily commuting. Semi-metallic delivers stronger initial bite and tolerates heat — pick these for towing or spirited driving. Organic pads are gentler on rotors but wear faster.</p><p>Whatever you choose, replace pads in axle pairs and bed them in with a 30-30-30 procedure for full performance.</p>',
                'image' => $this->filePath('blog/blog-21.jpg'),
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Diagnose Engine Issues at Home',
                'description' => 'A simple OBD-II reader and three checks that catch 80 percent of problems.',
                'content' => '<p>A $25 Bluetooth OBD-II reader paired with a free phone app reveals stored trouble codes and live sensor data. Combine that with a visual inspection for leaks, a listen for unusual noises at idle, and a check of fluid levels and you have caught most issues before they become expensive.</p>',
                'image' => $this->filePath('blog/blog-22.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Detailing Tips for Resale Value',
                'description' => 'Twenty dollars in supplies and one Saturday can add hundreds to your trade-in.',
                'content' => '<p>Skip the dealer detail package. A clay bar, polish, and ceramic spray sealant restore most paintwork in a few hours. Steam-clean carpets, condition leather, and replace cabin filters for a like-new interior.</p><p>Buyers pay more for a car that smells and feels cared for — even when the mileage is identical.</p>',
                'image' => $this->filePath('blog/blog-19.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Tire Rotation 101',
                'description' => 'Pattern, frequency, and why the four-tire shuffle keeps your tread even.',
                'content' => '<p>Front tires wear faster on most vehicles due to steering and braking forces. A 5,000-mile rotation in a forward cross or rearward cross pattern equalizes wear and can extend tire life by 25 percent.</p><p>Always check tire pressure after rotation and re-torque lug nuts after the first 50 miles.</p>',
                'image' => $this->filePath('blog/blog-20.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
