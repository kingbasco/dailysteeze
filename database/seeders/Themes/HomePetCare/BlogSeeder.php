<?php

namespace Database\Seeders\Themes\HomePetCare;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;

/**
 * HomePetCare — pet care blog posts. The home-pet-care.html demo only ships three
 * blog images (blog-13..15.jpg), so the six posts cycle through them.
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
                'name' => 'Keep Pet Calm at the Vet',
                'description' => 'Familiar smells, slow car rides, and reward-based exposure — keys to less stressful visits.',
                'content' => '<p>Vet stress builds long before the appointment. Bring a familiar towel that smells like home, skip the morning meal so treats taste irresistible, and arrive a few minutes early to settle in the parking lot. Reward calm sniffs with high-value treats.</p><p>Cats benefit most from carrier desensitization — leave it out as furniture, not a punishment cue.</p>',
                'image' => $this->filePath('blog/blog-13.jpg'),
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Right Food for Active Dogs',
                'description' => 'Calorie density, protein quality, and how to read a label without falling for marketing.',
                'content' => '<p>Working and active dogs need 1.5-2x the calories of couch companions. Look for at least 25% protein from named animal sources, moderate fat, and controlled carbohydrates. Skip generic terms like "meat meal" without species names.</p><p>Adjust portion size to body condition, not the bag chart.</p>',
                'image' => $this->filePath('blog/blog-14.jpg'),
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Playful Cat Fun',
                'description' => 'Wand toys, food puzzles, and the five-minute hunt sequence cats need every day.',
                'content' => '<p>Cats hunt in short bursts — five to ten minutes of stalk, pounce, and capture. Replicate it with wand toys that move like prey. End each session with a kill the cat can grab, then a small meal — closing the natural hunt cycle.</p><p>Bored cats become anxious cats. Daily play prevents furniture redecorating.</p>',
                'image' => $this->filePath('blog/blog-15.jpg'),
                'is_featured' => true,
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Grooming at Home',
                'description' => 'Brushing routines, nail trims, and ear checks that keep monthly bills smaller.',
                'content' => '<p>Weekly brushing prevents 80% of grooming problems. Pair it with a quick paw and ear check while your pet is relaxed. For nail trims, file little and often instead of long sessions every month.</p><p>Treats during grooming convert tolerance into anticipation.</p>',
                'image' => $this->filePath('blog/blog-13.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Travel Tips for Pets',
                'description' => 'Carrier conditioning, hydration breaks, and the documents you need before you leave.',
                'content' => '<p>For dogs, plan a stop every two hours for water and a sniff. For cats, secure the carrier with a seatbelt and cover it loosely with a familiar blanket. Always carry vaccination records and a recent photo in case of separation.</p><p>Microchip details should be current — the trip is not the time to discover an old phone number.</p>',
                'image' => $this->filePath('blog/blog-14.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Recognizing Pet Stress Signs',
                'description' => 'Subtle body-language cues and what to do before stress becomes behavior.',
                'content' => '<p>Lip licking, yawning, whale eye, and a tucked tail are early stress signals — long before growling or hissing. Remove the trigger, give space, and reward calm. Chronic stress leads to skin issues, GI upset, and reactive behavior.</p><p>Calm pets are not just well behaved; they are physically healthier.</p>',
                'image' => $this->filePath('blog/blog-15.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
