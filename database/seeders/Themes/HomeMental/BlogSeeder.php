<?php

namespace Database\Seeders\Themes\HomeMental;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;

/**
 * HomeMental — wellness blog posts. The home-mental.html demo only ships three
 * blog images (blog-7..9.jpg), so the six posts cycle through them.
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
                'name' => 'Daily Rituals That Calm an Anxious Mind',
                'description' => 'Five small habits — morning sunlight, breathwork, journaling — that compound into measurable calm.',
                'content' => '<p>The nervous system loves predictability. A morning ritual signals safety to your body before the inbox arrives. Start with two minutes of slow nasal breathing, two pages of writing whatever surfaces, and ten minutes of natural light. Repeat for three weeks before judging the effect.</p><p>The point is not to optimize the ritual — it is to make showing up feel automatic.</p>',
                'image' => $this->filePath('blog/blog-7.jpg'),
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'The Quiet Power of Adaptogens',
                'description' => 'Ashwagandha, rhodiola, and the herbs your grandmother probably already knew about.',
                'content' => '<p>Adaptogens do not blunt stress — they help the body handle it. Ashwagandha (KSM-66) shows the strongest cortisol-lowering data in modern trials. Rhodiola supports endurance under fatigue. Lions mane has emerging cognitive benefits.</p><p>None of these replace sleep, sunlight, or movement. They support a foundation already in place.</p>',
                'image' => $this->filePath('blog/blog-8.jpg'),
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Gentle Mornings: Building a Wake-Up Routine That Sticks',
                'description' => 'A slower start beats a louder alarm. Heres how to redesign the first 60 minutes of your day.',
                'content' => '<p>Morning anxiety often peaks in the first hour. The fix is not motivation — it is friction reduction. Phone in another room. Water by the bed. Coffee timer set the night before. Walk before scroll.</p><p>The cumulative effect of small upstream choices is what most people credit to discipline.</p>',
                'image' => $this->filePath('blog/blog-9.jpg'),
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Why Your Sleep Score Lies (And What to Trust Instead)',
                'description' => 'Smart rings overcount deep sleep. Here is what actually correlates with morning energy.',
                'content' => '<p>Wearable sleep stages are estimates, not measurements. The metric that consistently predicts how you feel: total time asleep, plus consistency of bedtime within a 30-minute window.</p><p>Optimize for boring before optimizing for fancy.</p>',
                'image' => $this->filePath('blog/blog-7.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Magnesium, Glycinate vs Citrate: A Practical Guide',
                'description' => 'Two forms, two purposes. The right one depends on whether you want sleep, regularity, or both.',
                'content' => '<p>Magnesium glycinate is gentler on the gut and supports relaxation and sleep. Citrate has a mild laxative effect and helps with regularity. Oxide is poorly absorbed and largely a waste outside of clinical use.</p><p>Most adults benefit from 200-400mg of glycinate taken in the evening.</p>',
                'image' => $this->filePath('blog/blog-8.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Box Breathing: The Calm-Down Tool That Actually Works',
                'description' => 'Four seconds in, four hold, four out, four hold. The Navy SEAL favorite, explained without the hype.',
                'content' => '<p>Box breathing engages the parasympathetic nervous system within ninety seconds. The mechanism is mechanical: extending the exhale and pausing increases vagal tone, dropping heart rate.</p><p>Use it before a difficult conversation, on a stressful commute, or when winding down before bed.</p>',
                'image' => $this->filePath('blog/blog-9.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
