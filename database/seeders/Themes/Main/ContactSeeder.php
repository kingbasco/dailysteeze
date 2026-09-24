<?php

namespace Database\Seeders\Themes\Main;

use Botble\Base\Supports\BaseSeeder;
use Botble\Contact\Enums\ContactStatusEnum;
use Botble\Contact\Models\Contact;

class ContactSeeder extends BaseSeeder
{
    public function run(): void
    {
        if (! is_plugin_active('contact')) {
            return;
        }

        Contact::query()->truncate();

        foreach ($this->getContacts() as $contact) {
            Contact::query()->create($contact);
        }
    }

    public function getContacts(): array
    {
        return [
            [
                'name' => 'Sophia Bennett',
                'email' => 'sophia.bennett@example.com',
                'phone' => '+1-415-555-0142',
                'address' => '124 Folsom Street, San Francisco, CA',
                'subject' => 'Question about international shipping rates',
                'content' => 'Hi team — could you tell me whether you ship to Singapore and what the typical delivery window is for the spring outerwear collection? Many thanks.',
                'status' => ContactStatusEnum::READ,
            ],
            [
                'name' => 'Marcus Tan',
                'email' => 'marcus.tan@example.com',
                'phone' => '+44-20-7946-0312',
                'address' => '47 Hatton Garden, London EC1N',
                'subject' => 'Wholesale enquiry — boutique partnership',
                'content' => 'Good morning. I run a curated mens boutique in central London. We would love to discuss stocking a small selection of your accessories range. Could you send over your wholesale lookbook and minimum order quantities?',
                'status' => ContactStatusEnum::UNREAD,
            ],
            [
                'name' => 'Elena Rodriguez',
                'email' => 'elena.rodriguez@example.com',
                'phone' => '+34-93-555-0188',
                'address' => 'Carrer de Mallorca 287, Barcelona',
                'subject' => 'Order #AM-10458 — color confirmation',
                'content' => 'Could you confirm the exact shade of the walnut side table I ordered last week? I want to make sure it matches the rest of my living room before it ships.',
                'status' => ContactStatusEnum::READ,
            ],
        ];
    }
}
