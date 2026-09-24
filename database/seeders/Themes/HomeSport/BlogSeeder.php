<?php

namespace Database\Seeders\Themes\HomeSport;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;

/**
 * HomeSport — sport and active-lifestyle blog posts. The home-sport.html demo
 * ships no blog images, so every post intentionally has image=null.
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
                'name' => 'Recovery Routines That Actually Work',
                'description' => 'Cold plunges trend, but sleep and mobility do the heavy lifting.',
                'content' => '<p>The science is dull but conclusive: seven to nine hours of sleep, five minutes of mobility daily, and one to two harder protein-forward meals on training days handle 80 percent of recovery for most athletes.</p><p>Save the gadgets for after the basics are non-negotiable.</p>',
                'image' => null,
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Build a Routine That Sticks',
                'description' => 'Forget motivation. The athletes who keep showing up have engineered the friction out.',
                'content' => '<p>Lay out clothes the night before. Stack workouts to a fixed cue (after morning coffee, before lunch). Track streaks visibly. Reward consistency, not intensity.</p><p>The boring habits are the ones that compound.</p>',
                'image' => null,
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'How to Pick the Right Yoga Mat',
                'description' => 'Thickness, grip, and material — what to optimize for based on your practice.',
                'content' => '<p>Vinyasa and power flows benefit from grippier 3-5mm mats. Restorative and yin sessions feel better on 6-8mm cushion. Natural rubber grips best when wet but weighs more; PU and TPE are lighter for travel.</p><p>Buy once for your primary practice, then add a travel mat if needed.</p>',
                'image' => null,
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Strength Training Basics',
                'description' => 'Five lifts, three sets, twice a week — and you covered the fundamentals.',
                'content' => '<p>Squat, hinge, push, pull, carry. Build the program around these movement patterns and adjust load over months, not weeks. Add accessories only after the foundation is solid.</p><p>The simpler the program, the more consistently it actually gets done.</p>',
                'image' => null,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Pickleball for Beginners',
                'description' => 'Picking a paddle, learning the kitchen rule, and avoiding the most common faults.',
                'content' => '<p>Start with a midweight composite paddle (7.5-8.0oz). Learn the non-volley zone (kitchen) rule first — it changes positioning and shot selection. Drill the dink before chasing aggressive returns.</p><p>The faster path to better is fewer power shots and more shot placement.</p>',
                'image' => null,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Hydration During Workouts',
                'description' => 'Plain water is fine for an hour. After that, electrolytes start to matter.',
                'content' => '<p>For sessions under 60 minutes, sip plain water as needed. Above 60 minutes — especially in heat — replace sodium and potassium with an electrolyte mix or salt-forward snack.</p><p>Most cramping is a sodium issue, not a magnesium issue.</p>',
                'image' => null,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
