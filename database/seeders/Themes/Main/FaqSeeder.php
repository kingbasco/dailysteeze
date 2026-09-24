<?php

namespace Database\Seeders\Themes\Main;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Faq\Models\Faq;
use Botble\Faq\Models\FaqCategory;

class FaqSeeder extends BaseSeeder
{
    public function run(): void
    {
        if (! is_plugin_active('faq')) {
            return;
        }

        Faq::query()->truncate();
        FaqCategory::query()->truncate();

        foreach ($this->getCategories() as $order => $categoryData) {
            $category = FaqCategory::query()->create([
                'name' => $categoryData['name'],
                'description' => $categoryData['description'],
                'order' => $order,
                'status' => BaseStatusEnum::PUBLISHED,
            ]);

            foreach ($categoryData['faqs'] as $faq) {
                Faq::query()->create([
                    'question' => $faq['question'],
                    'answer' => $faq['answer'],
                    'category_id' => $category->getKey(),
                    'status' => BaseStatusEnum::PUBLISHED,
                ]);
            }
        }
    }

    public function getCategories(): array
    {
        return [
            [
                'name' => 'Orders & Shipping',
                'description' => 'Everything about placing, tracking, and receiving your order.',
                'faqs' => [
                    [
                        'question' => 'How long does standard shipping take?',
                        'answer' => 'Standard shipping arrives within 3-5 business days for domestic orders and 7-12 business days for international destinations. Express options are available at checkout.',
                    ],
                    [
                        'question' => 'Do you offer free shipping?',
                        'answer' => 'Yes — orders above $99 ship free within the continental US. International free-shipping thresholds vary by destination and are shown at checkout.',
                    ],
                    [
                        'question' => 'How can I track my order?',
                        'answer' => 'You will receive a tracking link by email as soon as your order is dispatched. You can also follow the parcel from your account dashboard under My Orders.',
                    ],
                    [
                        'question' => 'Can I change the shipping address after I place my order?',
                        'answer' => 'Address changes are possible if your order has not yet entered fulfilment. Contact us within two hours of placing the order for the best chance of a successful update.',
                    ],
                ],
            ],
            [
                'name' => 'Returns & Refunds',
                'description' => 'Our 30-day return policy and how to start a return.',
                'faqs' => [
                    [
                        'question' => 'What is your return policy?',
                        'answer' => 'We offer 30 days from delivery to return any unworn item in its original condition. Sale items and intimate apparel are final sale.',
                    ],
                    [
                        'question' => 'How do I start a return?',
                        'answer' => 'Start a return from your account dashboard or email returns@amerce.test with your order number. We will send a prepaid return label for domestic orders.',
                    ],
                    [
                        'question' => 'When will I receive my refund?',
                        'answer' => 'Refunds are processed within 3-5 business days of us receiving your return. The funds typically appear on your statement within an additional 5-7 days, depending on your bank.',
                    ],
                ],
            ],
            [
                'name' => 'Products & Stock',
                'description' => 'Sizing, materials, restocks, and product care.',
                'faqs' => [
                    [
                        'question' => 'How do I find the right size?',
                        'answer' => 'Each product page includes a size chart based on actual garment measurements. If you are between sizes, we generally recommend sizing up for our knitwear and outerwear.',
                    ],
                    [
                        'question' => 'When will sold-out items be restocked?',
                        'answer' => 'Most styles restock within 2-4 weeks. Click the Notify Me button on any sold-out variant to be alerted by email the moment it returns.',
                    ],
                    [
                        'question' => 'Are your products ethically sourced?',
                        'answer' => 'Yes. We work only with manufacturing partners who meet our supplier code of conduct, covering fair wages, safe conditions, and verified material provenance.',
                    ],
                ],
            ],
            [
                'name' => 'Account & Payment',
                'description' => 'Managing your account and accepted payment methods.',
                'faqs' => [
                    [
                        'question' => 'Which payment methods do you accept?',
                        'answer' => 'We accept Visa, Mastercard, American Express, Apple Pay, Google Pay, PayPal, and Klarna for eligible markets.',
                    ],
                    [
                        'question' => 'Is it safe to enter my card details?',
                        'answer' => 'All payments are processed by PCI-DSS Level 1 certified providers using TLS 1.3 encryption. We never store full card numbers on our servers.',
                    ],
                    [
                        'question' => 'How do I reset my password?',
                        'answer' => 'Use the Forgot Password link on the login page. A reset link will be sent to your registered email address and is valid for 30 minutes.',
                    ],
                ],
            ],
        ];
    }
}
