<?php

namespace Database\Seeders\Themes\HomeSneaker;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;

/**
 * HomeSneaker — sneaker blog posts. The home-sneaker.html demo ships
 * three blog images (blog-45..47.jpg), so the six posts cycle through them.
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
                'name' => 'Choosing the Right Shoes for All-Day Comfort',
                'description' => 'Last shape, foam density, and arch support — the three variables that decide daily wearability.',
                'content' => '<p>Comfort is not about thicker foam. The wrong last shape will hurt your feet faster than firm cushioning ever will. Measure both feet at the end of the day, size up to the larger one, and prioritize last shape over brand loyalty.</p><p>If a shoe needs a break-in period, it is the wrong shoe.</p>',
                'image' => $this->filePath('blog/blog-45.jpg'),
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Inside Modern Athletic Shoe Tech',
                'description' => 'PEBA foams, carbon plates, and rocker geometry — what actually drives the speed gains.',
                'content' => '<p>Super shoes work through three mechanisms: highly resilient foam that returns more energy per stride, a carbon plate that stiffens the midsole, and a rocker geometry that smooths transition. Remove any one variable and the gains shrink.</p><p>For most runners, a daily trainer with one of these three is enough. Stack all three only for race day.</p>',
                'image' => $this->filePath('blog/blog-46.jpg'),
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Traction & Cushioning: A Practical Buyers Guide',
                'description' => 'Outsole patterns, heel-to-toe drop, and stack height — what the spec sheet really tells you.',
                'content' => '<p>For wet pavement, look for siped rubber and continuous outsole coverage. For trails, check lug depth — 3-4mm handles most off-road. Heel-to-toe drop affects stride mechanics: lower drops favor forefoot landing, higher drops cushion heel strikers.</p><p>Stack height alone is a poor indicator. Foam compound matters more.</p>',
                'image' => $this->filePath('blog/blog-47.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Lacing Techniques for a Better Fit',
                'description' => 'Heel lock, runners loop, and skip lacing — small adjustments that fix big fit issues.',
                'content' => '<p>The runners loop fixes heel slippage in seconds — most modern shoes ship with the extra eyelet for it. Skip lacing relieves pressure across a high arch. Window lacing creates space for a wide forefoot.</p><p>Spend ten minutes adjusting before you return a shoe. Most fit complaints are lacing problems.</p>',
                'image' => $this->filePath('blog/blog-45.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Trail vs Road Running Shoes: Which to Buy First',
                'description' => 'Outsole grip, rock plate, and upper durability — the case for owning one or both.',
                'content' => '<p>Road shoes on a trail wear quickly and slip on technical terrain. Trail shoes on the road feel firm and reduce energy return. If you split your miles 70/30 between surfaces, own a pair of each. Below 70% trail mileage, a hybrid like a "door-to-trail" shoe is enough.</p><p>Pick based on actual usage, not aspirational mileage.</p>',
                'image' => $this->filePath('blog/blog-46.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'How to Clean White Sneakers Without Damaging Them',
                'description' => 'Microfiber, mild soap, and a soft brush — the boring routine that beats every miracle product.',
                'content' => '<p>Skip the bleach. Mix a teaspoon of mild detergent into warm water, work it in with a soft brush, then wipe down with a clean microfiber. For stubborn stains on canvas, a paste of baking soda and water lifts most marks.</p><p>Air-dry away from direct sunlight. Stuff with paper to maintain shape.</p>',
                'image' => $this->filePath('blog/blog-47.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
