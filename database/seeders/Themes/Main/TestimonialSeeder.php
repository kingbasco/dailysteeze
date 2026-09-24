<?php

namespace Database\Seeders\Themes\Main;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Testimonial\Models\Testimonial;

class TestimonialSeeder extends BaseSeeder
{
    public function run(): void
    {
        if (! is_plugin_active('testimonial')) {
            return;
        }

        Testimonial::query()->truncate();

        foreach ($this->getTestimonials() as $testimonial) {
            Testimonial::query()->create($testimonial);
        }
    }

    public function getTestimonials(): array
    {
        return [
            [
                'name' => 'Olivia Carter',
                'company' => 'Editor — Modern Living Magazine',
                'content' => 'The walnut side table has lived in my apartment for three years and looks better than the day it arrived. The construction quality is genuinely heirloom level.',
                'image' => $this->filePath('testimonials/avatar-1.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'James Whitfield',
                'company' => 'Founder — Fieldnotes Studio',
                'content' => 'I have ordered three pairs of the linen trousers across two seasons. The fit is consistent, the fabric breathes beautifully, and the customer service is unmatched.',
                'image' => $this->filePath('testimonials/avatar-2.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Priya Khurana',
                'company' => 'Lead Designer — Studio Eight',
                'content' => 'Amerce is my first stop for thoughtful gifting. The packaging makes every order feel like an occasion and the curation never disappoints.',
                'image' => $this->filePath('testimonials/avatar-3.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Daniel Reyes',
                'company' => 'Photographer',
                'content' => 'Quick shipping, immaculate packaging, and the headphones are easily the best I have owned. Their support team helped me pair them with my mixer in under five minutes.',
                'image' => $this->filePath('testimonials/avatar-4.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Hannah Lindstrom',
                'company' => 'Yoga Instructor',
                'content' => 'The activewear pieces hold up to every class without losing shape. I have washed them seventy times and the fabric still looks brand new.',
                'image' => $this->filePath('testimonials/avatar-5.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Kenji Sato',
                'company' => 'Architect — Tokyo',
                'content' => 'I shipped a coffee table to Tokyo and it arrived perfectly packed with full insurance documentation. International logistics handled flawlessly.',
                'image' => $this->filePath('testimonials/avatar-6.jpg'),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }
}
