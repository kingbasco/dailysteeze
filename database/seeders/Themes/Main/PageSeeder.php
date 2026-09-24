<?php

namespace Database\Seeders\Themes\Main;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Ecommerce\Models\Product;
use Botble\Ecommerce\Models\ProductCategory;
use Botble\Ecommerce\Models\ProductCollection;
use Botble\Media\Models\MediaFile;
use Botble\Page\Database\Traits\HasPageSeeder;
use Botble\Page\Models\Page;
use Botble\Setting\Facades\Setting;
use Botble\Shortcode\Facades\Shortcode;
use Botble\Slug\Facades\SlugHelper;

class PageSeeder extends BaseSeeder
{
    use HasPageSeeder;

    public function run(): void
    {
        $this->truncatePages();

        // Seed standard CMS pages first so the homepage can reference them.
        $this->createPages($this->getStaticPages());

        // Homepage uses the dedicated template-method content so variants only
        // override getHomepageContent().
        $homepage = Page::query()->updateOrCreate(
            ['name' => 'Homepage'],
            [
                'content' => $this->getHomepageContent(),
                'template' => 'homepage',
                'status' => BaseStatusEnum::PUBLISHED,
                'description' => 'Amerce — multi-purpose ecommerce homepage demo.',
            ],
        );

        SlugHelper::createSlug($homepage);

        if (function_exists('theme_option')) {
            theme_option('homepage_id', $homepage->id);
            Setting::set('show_on_front', $homepage->id);

            // Wire the Blog landing page so /blog renders the post loop.
            // Without this, plugins/blog HookServiceProvider::getBlogPageId()
            // returns null and the page shows static content with no posts.
            $blogPage = Page::query()->where('name', 'Blog')->first();
            if ($blogPage) {
                theme_option('blog_page_id', $blogPage->id);
                Setting::set('blog_page_id', $blogPage->id);
            }

            Setting::save();
        }
    }

    /**
     * Variant PageSeeders OVERRIDE this method to swap the homepage shortcode
     * payload without re-implementing run(), seedStaticPages(), or theme_option
     * boilerplate.
     *
     * Mirrors html/home-fashion.html section-for-section (8 sections, demo-verbatim).
     * Sections previously seeded that are NOT in demo (dropped 2026-05-08 per Phase-03 audit):
     *   - "New Arrivals" ecommerce-products (demo only has one Today's Best Choices block)
     *   - site-features Box Icon row (demo has no trust-strip on home-fashion)
     *
     *   1. simple-slider          — Hero slider (demo §1 `tf-slideshow style-2`, line 1407)
     *   2. ecommerce-products     — Today's Best Choices (demo §2 "Today")
     *   3. categories-grid        — Shop By Categories   (demo §3 "Category")
     *   4. banner-products-composite — Weekly Top Highlights (demo §4 "banner-highlight")
     *   5. lookbook-hotspot       — section-lookbook
     *   6. testimonials           — section-testimonials ("What Our Customers Say")
     *   7. parallax-banner        — Elevate Your Workout Style (demo §7 "banner")
     *   8. image-gallery          — Follow Us On Instagram (demo §8 "Gallery")
     */
    protected function getHomepageContent(): string
    {
        $categoryIds = $this->resolveCategoryIds([
            'Yoga', 'Leggings', 'Tennis', 'Gym', 'Running',
        ]);

        return htmlentities(implode(PHP_EOL, [
            // 1. Hero slider (demo §1 `tf-slideshow style-2 tf-btn-swiper-main hover-sw-nav`)
            Shortcode::generateShortcode('simple-slider', [
                'key' => 'home-hero',
                'style' => 'style-1',
                'is_autoplay' => 'yes',
                'autoplay_speed' => 3000,
                'show_arrows' => 'yes',
                'show_dots' => 'yes',
            ]),

            // 2. Today's Best Choices (demo §2) — `source=featured` surfaces the
            // 4 demo parents (Lyocell wrap top, Wool Midi Coat, Buttons cotton top,
            // linen slim-fit shirt) which carry per-product Color variations and
            // therefore render the demo's color-swatch row under each card.
            Shortcode::generateShortcode('ecommerce-products', [
                'style' => 'style-slider',
                'title' => 'Today\'s Best Choices',
                'subtitle' => 'Discover today\'s standout sportswear picks.',
                'source' => 'featured',
                'limit' => 4,
                'items_per_row' => 4,
            ]),

            // 3. Shop By Categories — vertical card slider matching demo's
            // `category-v03 style-3 hover-img4` markup. 5 activewear categories.
            Shortcode::generateShortcode('categories-grid', [
                'style' => 'style-card-vertical',
                'title' => 'Shop By Categories',
                'subtitle' => 'Explore essential activewear collections for every workout style.',
                'category_ids' => $categoryIds,
                'limit' => 5,
                'show_count' => 'no',
            ]),

            // 4. Weekly Top Highlights — banner LEFT + 2x2 product grid RIGHT
            // (HTML pos 4: section-banner-highlight). Uses the new
            // banner-products-composite shortcode that mirrors the demo's
            // 2-column row markup.
            Shortcode::generateShortcode('banner-products-composite', [
                'title' => 'Weekly Top Highlights',
                'subtitle' => 'Fresh styles and must-have picks curated for your week.',
                'image' => $this->safeFilePath('section/banner-39.jpg'),
                'overline' => 'Built for every move.',
                'heading' => 'Gear Up For <br> Greatness',
                'button_text' => 'Shop Now',
                'button_url' => '/products',
                'source' => 'featured',
                'limit' => 4,
            ]),

            // 5. Lookbook — single banner with pin dots that drive a left-side
            // bundle-hover-item product carousel (HTML pos 5: section-lookbook-hover-v02).
            // Demo references the activewear lifestyle banner banner-lookbook-11.jpg
            // and storytelling products "Train Free Sports Bra" + "NKD High Waisted
            // Shorts" (added by ProductSeeder) with custom overlines.
            (function () {
                $sportsBraId  = optional(Product::query()
                    ->where('name', 'Train Free Sports Bra')->first())->id;
                $shortsId     = optional(Product::query()
                    ->where('name', 'NKD High Waisted Shorts')->first())->id;

                return Shortcode::generateShortcode('lookbook-hotspot', [
                    'style' => 'style-v4-carousel',
                    'image' => $this->safeFilePath('section/banner-lookbook-11.jpg'),
                    'quantity' => 2,
                    // Pin coordinates approximate demo position3/position2 — the theme JS
                    // ties pin#N → carousel slide N-1 via data-slide.
                    'x_percent_1' => 38, 'y_percent_1' => 42,
                    'product_id_1' => $sportsBraId, 'column_1' => 1,
                    'overline_1' => 'Run Ready Bra',
                    'x_percent_2' => 64, 'y_percent_2' => 70,
                    'product_id_2' => $shortsId,    'column_2' => 1,
                    'overline_2' => 'Run Ready Shorts',
                ]);
            })(),

            // 6. Customer Say! — reuse the demo testimonial helper
            $this->heroTestimonialsShortcode(),

            // 7. Activewear banner (HTML pos 7: banner-v01) — full-width hero + looping marquee ribbon
            Shortcode::generateShortcode('parallax-banner', [
                'style' => 'style-1',
                'image' => $this->safeFilePath('section/banner-40.jpg'),
                'heading' => 'Elevate Your <br> Workout Style',
                'subheading' => 'Premium activewear crafted for comfort, <br> performance, and confidence.',
                'button_text' => 'Shop Styles',
                'button_url' => '/products',
                'text_alignment' => 'left',
                'marquee_text' => 'NEW SEASON PICKS, TRENDING STYLES, LIMITED DROPS',
            ]),

            // 8. Follow Us On Instagram — uses gallery-37..41.jpg (demo's
            // activewear set from html/home-fashion.html line 2787+).
            Shortcode::generateShortcode('image-gallery', [
                'style' => 'style-default',
                'title' => 'Follow Us On Instagram',
                'subtitle' => '@Amerce',
                'quantity' => 5,
                'image_1' => $this->safeFilePath('gallery/gallery-37.jpg'),
                'link_1' => '/products',
                'image_2' => $this->safeFilePath('gallery/gallery-38.jpg'),
                'link_2' => '/products',
                'image_3' => $this->safeFilePath('gallery/gallery-39.jpg'),
                'link_3' => '/products',
                'image_4' => $this->safeFilePath('gallery/gallery-40.jpg'),
                'link_4' => '/products',
                'image_5' => $this->safeFilePath('gallery/gallery-41.jpg'),
                'link_5' => '/products',
            ]),
        ]), ENT_NOQUOTES, 'UTF-8');
    }

    /**
     * Variants reuse this static page set — only the homepage shortcode payload
     * differs across presets.
     */
    public function getStaticPages(): array
    {
        return [
            [
                'name' => 'About',
                'description' => 'About Amerce — our story, sourcing standards, and the people behind every product.',
                // All bespoke pages use the generic `landing` layout. Page
                // content is composed from individual shortcodes — each
                // section is admin-editable via the visual builder.
                'template' => 'landing',
                'content' => $this->aboutPageContent(),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Contact',
                'description' => 'Reach the Amerce customer support and partnerships teams.',
                // Slug `contact-us` triggers the bespoke contact view in
                // page.blade.php — kept because the contact form needs theme
                // option data (store_phone, store_email, store_address, …).
                'template' => 'landing',
                'content' => '',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'FAQ',
                'description' => 'Frequently asked questions about orders, shipping, returns, and account management.',
                'template' => 'landing',
                'content' => $this->faqPageContent(),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Privacy Policy',
                'description' => 'How Amerce collects, uses, and protects your personal information.',
                'template' => 'landing',
                'content' => $this->termPageContent('Privacy Policy', $this->privacyTermItems()),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Terms & Conditions',
                'description' => 'The legal terms governing your use of the Amerce store.',
                'template' => 'landing',
                'content' => $this->termPageContent('Terms & Conditions', $this->termsTermItems()),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Returns & Refunds',
                'description' => 'Our 30-day return policy and the step-by-step return process.',
                'template' => 'landing',
                'content' => $this->termPageContent('Returns & Refunds', $this->returnsTermItems()),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Shipping',
                'description' => 'Domestic and international shipping options, lead times, and rates.',
                'template' => 'landing',
                'content' => $this->termPageContent('Shipping', $this->shippingTermItems()),
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            [
                'name' => 'Our Stores',
                'description' => 'Visit Amerce in person — flagship locations and partner boutiques worldwide.',
                // Slug `our-stores` triggers the bespoke our-store view —
                // kept because the store grid pulls from theme_option.
                'template' => 'landing',
                'content' => '',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            // Blog landing page — referenced by Journal > All Posts menu item.
            // Without this page the catchall slug route 404s on /blog.
            [
                'name' => 'Blog',
                'description' => 'Style guides, product spotlights, and stories from the Amerce team.',
                'template' => 'default',
                'content' => '<div class="container py-5"><h1>Journal</h1><p>Browse our latest stories — style guides, product spotlights, sustainability deep-dives, and more.</p></div>',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            // Careers landing page — referenced by About > Careers menu item.
            [
                'name' => 'Careers',
                'description' => 'Open roles and what it is like to work at Amerce.',
                'template' => 'default',
                'content' => '<div class="container py-5"><h1>Careers at Amerce</h1><p>We are a small, distributed team building a more thoughtful kind of retail. We hire across product, engineering, supply chain, and customer experience.</p><p>Open roles are posted to our company LinkedIn page. To apply, send a short note and your resume to <a href="mailto:careers@amerce.test">careers@amerce.test</a>.</p></div>',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
            // Sustainability landing page — referenced by footer COMPANY column.
            [
                'name' => 'Sustainability',
                'description' => 'How Amerce sources responsibly and reduces its environmental footprint.',
                'template' => 'default',
                'content' => '<div class="container py-5"><h1>Sustainability at Amerce</h1><p>Every product carries a story. We work directly with mills and ateliers, prioritise recycled and traceable materials, and ship in plastic-free packaging.</p><p>Our 2026 goal: 90% of materials with a verified chain of custody, and a transparent annual impact report.</p></div>',
                'status' => BaseStatusEnum::PUBLISHED,
            ],
        ];
    }

    /**
     * Build a list of shortcode attributes from a tab-style array.
     * Each row in $rows is a flat assoc array; the helper flattens it into
     * `quantity` + `{field}_{N}` keys that ShortcodeTabsField expects.
     */
    protected function tabAttributes(array $rows): array
    {
        $attrs = ['quantity' => count($rows)];
        foreach ($rows as $i => $row) {
            $n = $i + 1;
            foreach ($row as $field => $value) {
                $attrs["{$field}_{$n}"] = $value;
            }
        }

        return $attrs;
    }

    /** Composes the About page content from page-banner + 4 section shortcodes. */
    protected function aboutPageContent(): string
    {
        $statRows = [
            ['value' => '8.2k', 'animate_to' => '',  'suffix' => '',  'label' => 'Products Available', 'desc' => 'We offer a wide selection of high-quality products to meet every need.'],
            ['value' => '',     'animate_to' => 10,  'suffix' => 'k', 'label' => 'Happy Customers',    'desc' => 'Serving over 10,000 delighted customers who trust us for quality and service.'],
            ['value' => '',     'animate_to' => 96,  'suffix' => '',  'label' => 'Partner Brand',      'desc' => 'Our top-brand partnerships bring a trusted collection for your store and home.'],
            ['value' => '',     'animate_to' => 16,  'suffix' => 'k', 'label' => 'Products For Sale',  'desc' => 'That\'s why we strive to offer a diverse range of products that cater to all styles.'],
        ];

        $faqRows = [
            ['title' => 'Introduction',       'body' => 'Welcome to Amerce Store, your premier destination for fashion-forward clothing and accessories. We pride ourselves on offering a curated selection of rare and beautiful items sourced both locally and globally.'],
            ['title' => 'Our Vision',         'body' => 'We envision a world where thoughtful design meets everyday life — pieces that age gracefully, partners we trust, and customers we treat as people, not transactions.'],
            ['title' => 'What Sets Us Apart', 'body' => 'Independently audited suppliers, hand-checked products, and a 30-day no-questions return policy backed by a human customer support team.'],
            ['title' => 'Our Commitment',     'body' => 'Quality goods, transparent supply chains, and fair labor — every order, every time.'],
        ];

        $tesRows = [
            ['image' => $this->safeFilePath('testimonials/tes-1.jpg'), 'name' => 'Emma Collins',   'text' => '"Totally obsessed with this outfit! The fit is perfect, the fabric feels premium, and I\'ve been getting compliments non-stop. It instantly lifts my confidence — such a great find!"'],
            ['image' => $this->safeFilePath('testimonials/tes-2.jpg'), 'name' => 'Sophia Ramirez', 'text' => '"I\'m amazed by how comfortable yet stylish this piece is. It pairs effortlessly with everything, and the quality really stands out. Definitely becoming my go-to for everyday looks!"'],
        ];

        $teamRows = [
            ['image' => $this->safeFilePath('member/member-1.jpg'), 'name' => 'Annette Black',    'role' => 'Founder/CEO',   'social_links' => ''],
            ['image' => $this->safeFilePath('member/member-2.jpg'), 'name' => 'Brooklyn Simmons', 'role' => 'Manager',       'social_links' => ''],
            ['image' => $this->safeFilePath('member/member-3.jpg'), 'name' => 'Jane Cooper',      'role' => 'Sales Director', 'social_links' => ''],
            ['image' => $this->safeFilePath('member/member-4.jpg'), 'name' => 'Lisa Bonet',       'role' => 'Sales Director', 'social_links' => ''],
        ];

        return implode(PHP_EOL, [
            Shortcode::generateShortcode('page-banner', [
                'heading' => 'About Us',
                'subtitle' => 'With over 15 years of experience, we craft timeless collections that transcend<br class="d-none d-lg-block">trends and inspire lasting elegance.',
            ]),
            Shortcode::generateShortcode('stats-counter', array_merge([
                'hero_image' => $this->safeFilePath('section/s-contact-1.jpg'),
                'heading' => 'Design, attention to detail & efficiency to delight the world',
                'description' => 'From the moment it is conceived to the moment it is worn, every one of our garments follows this path. We could do it at a fast pace. However, at Amerce, we choose to take care of all those who are walking this path with us.',
            ], $this->tabAttributes($statRows))),
            Shortcode::generateShortcode('image-accordion', array_merge([
                'image' => $this->safeFilePath('section/s-contact-2.jpg'),
                'heading' => 'Offering Rare And Beautiful Items Worldwide',
            ], $this->tabAttributes($faqRows))),
            Shortcode::generateShortcode('about-testimonials', array_merge([
                'heading' => 'Customer Say!',
                'subtitle' => 'Our customers adore our products, and we constantly aim to delight them.',
            ], $this->tabAttributes($tesRows))),
            Shortcode::generateShortcode('about-team', array_merge([
                'heading' => 'Meet Our Teams',
                'subtitle' => 'Experts committed to excellence in every detail.',
            ], $this->tabAttributes($teamRows))),
        ]);
    }

    /** Composes the FAQ page content from page-banner + faq-page. */
    protected function faqPageContent(): string
    {
        $rows = [
            ['category' => 'My Account',          'category_id' => 'myAccount',       'question' => '1. What can I do if I forgot my password?', 'answer' => 'Use the "Forgot password" link on the sign-in page. We will email you a one-time link to set a new password — it expires in 30 minutes for security.'],
            ['category' => 'My Account',          'category_id' => 'myAccount',       'question' => '2. How do I update my email address?',      'answer' => 'Sign in, open Account → Settings, and change the email field. We send a confirmation email to the new address; the change takes effect once you click that link.'],
            ['category' => 'My Account',          'category_id' => 'myAccount',       'question' => '3. Can I delete my account?',              'answer' => 'Yes. From Account → Settings, scroll to Delete account. We retain order history for tax/legal reasons but personal contact details are removed within 30 days.'],
            ['category' => 'Orders & Purchases',  'category_id' => 'ordersPurchases', 'question' => '1. How do I place an order?',              'answer' => 'Add items to your cart, click checkout, choose a shipping method, then enter your payment details. You will receive an order confirmation email immediately.'],
            ['category' => 'Orders & Purchases',  'category_id' => 'ordersPurchases', 'question' => '2. Can I edit or cancel an order?',         'answer' => 'Orders can be edited or cancelled from your account dashboard within 1 hour of placement. After that the warehouse has begun picking and we cannot intercept.'],
            ['category' => 'Orders & Purchases',  'category_id' => 'ordersPurchases', 'question' => '3. What payment methods are accepted?',     'answer' => 'We accept Visa, Mastercard, American Express, Apple Pay, Google Pay, and PayPal. All transactions use TLS 1.3 encryption.'],
            ['category' => 'Returns & Refunds',   'category_id' => 'returnsRefunds',  'question' => '1. What is the return window?',             'answer' => '30 days from delivery for any unworn item in original condition. Sale items, intimate apparel, and final-sale flash sale purchases are excluded.'],
            ['category' => 'Returns & Refunds',   'category_id' => 'returnsRefunds',  'question' => '2. How do I start a return?',               'answer' => 'Open the order in your account dashboard and click "Start return". We email a prepaid label for domestic orders within one business day.'],
            ['category' => 'Returns & Refunds',   'category_id' => 'returnsRefunds',  'question' => '3. When will I see my refund?',             'answer' => 'Refunds are processed within 3-5 business days of us receiving the return. Bank posting times vary; allow up to 10 business days for the credit to appear.'],
            ['category' => 'Shipping & Tracking', 'category_id' => 'shippingTracking', 'question' => '1. How long does shipping take?',           'answer' => 'Domestic standard ships in 3-5 business days. Express in 1-2. International standard takes 7-12 business days; express options are available at checkout.'],
            ['category' => 'Shipping & Tracking', 'category_id' => 'shippingTracking', 'question' => '2. How do I track my order?',              'answer' => 'A tracking link is included in your shipment confirmation email. You can also see status from Account → Orders → Track.'],
            ['category' => 'Shipping & Tracking', 'category_id' => 'shippingTracking', 'question' => '3. Do you ship internationally?',           'answer' => 'Yes — to most countries. Duties and taxes are pre-paid at checkout for select destinations; otherwise the courier may collect them on delivery.'],
            ['category' => 'Fees & Billing',      'category_id' => 'feesBilling',     'question' => '1. Are duties and taxes included?',         'answer' => 'Domestic prices include sales tax shown at checkout. International orders to supported destinations include duties and taxes; otherwise the courier collects on delivery.'],
            ['category' => 'Fees & Billing',      'category_id' => 'feesBilling',     'question' => '2. Why was I charged twice?',               'answer' => 'You likely see a temporary authorization hold plus the actual charge. The authorization drops off in 3-5 business days. Email billing@amerce.test if you still see two charges after that.'],
            ['category' => 'Other Topic',         'category_id' => 'otherTopic',      'question' => '1. Do you have physical stores?',           'answer' => 'Yes — visit our Stores page for a list of flagship and partner locations.'],
            ['category' => 'Other Topic',         'category_id' => 'otherTopic',      'question' => '2. How can I contact customer support?',    'answer' => 'Email hello@amerce.test or use the contact form. We reply within one business day.'],
        ];

        return implode(PHP_EOL, [
            Shortcode::generateShortcode('page-banner', [
                'heading' => 'FAQs',
                'subtitle' => "Got questions? We've got answers! Browse our FAQs to find information on orders, shipping,<br class=\"d-none d-lg-block\">returns, and more. If you need further assistance, feel free to contact our team.",
            ]),
            Shortcode::generateShortcode('faq-page', array_merge([
                'sidebar_image' => $this->safeFilePath('section/banner-12.jpg'),
                'sidebar_title' => 'Save 25% <br class="d-none d-sm-block">Today',
                'sidebar_subtitle' => 'T-Shirts, Hoodies & More',
                'sidebar_cta' => 'View More',
                'sidebar_url' => '/products',
            ], $this->tabAttributes($rows))),
        ]);
    }

    /** Composes a Privacy/Terms/Returns/Shipping page from page-banner + term-content. */
    protected function termPageContent(string $heading, array $items): string
    {
        return implode(PHP_EOL, [
            Shortcode::generateShortcode('page-banner', ['heading' => $heading]),
            Shortcode::generateShortcode('term-content', $this->tabAttributes($items)),
        ]);
    }

    protected function privacyTermItems(): array
    {
        return [
            ['title' => '1. Information We Collect',          'body' => '<p class="term-text cl-text-2">When you visit the Site, we automatically collect certain information about your device — web browser, IP address, time zone, and some of the cookies installed on your device. As you browse, we also collect data about the pages or products you view, what referred you to the Site, and how you interact with it. We refer to this as "Device Information".</p><p class="term-text cl-text-2">When you make a purchase or attempt to purchase through the Site, we collect your name, billing address, shipping address, and payment information (including card number, email address, and phone number). We refer to this as "Order Information".</p>'],
            ['title' => '2. How We Use Your Information',     'body' => '<p class="term-text cl-text-2">We use Order Information to fulfil orders placed through the Site (process payment, arrange shipping, provide invoices and order confirmations). We use it to communicate with you, screen orders for fraud, and — in line with your preferences — share marketing about products you may like.</p><p class="term-text cl-text-2">We use Device Information to screen for fraud and to improve the Site through analytics about how customers browse and interact with us.</p>'],
            ['title' => '3. Sharing Your Personal Information', 'body' => '<p class="term-text cl-text-2">We share Personal Information with third-party service providers who help us run the Site. We may also share information to comply with applicable laws, respond to a subpoena or lawful request, or otherwise protect our rights.</p>'],
            ['title' => '4. Data Retention',                   'body' => '<p class="term-text cl-text-2">When you place an order, we maintain the Order Information for our records unless and until you ask us to delete it.</p>'],
            ['title' => '5. Your Rights',                      'body' => '<p class="term-text cl-text-2">You can request access, correction, or deletion of any personal data we hold about you. Email privacy@amerce.test from the address on file and we will respond within 30 days.</p>'],
            ['title' => '6. Cookies',                          'body' => '<p class="term-text cl-text-2">Cookies are used to keep your cart between visits, remember your preferences, and measure aggregate traffic. You can disable cookies in your browser, though some Site features may stop working.</p>'],
            ['title' => '7. Changes',                          'body' => '<p class="term-text cl-text-2">We may update this policy from time to time to reflect changes to our practices or for operational, legal, or regulatory reasons. The latest version will always be on this page.</p>'],
        ];
    }

    protected function termsTermItems(): array
    {
        return [
            ['title' => '1. Acceptance of Terms',     'body' => '<p class="term-text cl-text-2">By accessing or using the Amerce store you agree to these terms. We reserve the right to update them with reasonable notice; the latest version is always available on this page.</p>'],
            ['title' => '2. Orders & Payment',        'body' => '<p class="term-text cl-text-2">All prices are in USD unless otherwise stated. We accept the payment methods displayed at checkout. An order becomes binding once you receive an order confirmation email.</p>'],
            ['title' => '3. Shipping',                'body' => '<p class="term-text cl-text-2">Shipping options, lead times, and rates are listed on our Shipping page. Risk passes to you on delivery.</p>'],
            ['title' => '4. Returns',                 'body' => '<p class="term-text cl-text-2">You have 30 days from delivery to return any unworn item for a refund. See our Returns &amp; Refunds page for the full process.</p>'],
            ['title' => '5. Intellectual Property',   'body' => '<p class="term-text cl-text-2">All content on the Site — text, photography, logos, code — is owned by Amerce or its licensors and may not be reproduced without written permission.</p>'],
            ['title' => '6. Limitation of Liability', 'body' => '<p class="term-text cl-text-2">To the maximum extent permitted by law, Amerce is not liable for indirect or consequential damages arising from use of the Site or the products purchased through it.</p>'],
            ['title' => '7. Governing Law',           'body' => '<p class="term-text cl-text-2">These terms are governed by the laws of the State of New York. Any dispute will be resolved in the state or federal courts located in New York County.</p>'],
        ];
    }

    protected function returnsTermItems(): array
    {
        return [
            ['title' => '1. Returns',                 'body' => '<p class="term-text cl-text-2">We want you to be completely satisfied with your purchase. If for any reason you are not, you may return any unworn item within 30 days of receiving your order for a refund or exchange. Items must be in original packaging and the same condition as you received them.</p>'],
            ['title' => '2. How to Start a Return',   'body' => '<p class="term-text cl-text-2">Open the order in your account dashboard and click "Start return", or email returns@amerce.test with your order number. We will send a prepaid return label for domestic orders within one business day.</p>'],
            ['title' => '3. Refunds',                 'body' => '<p class="term-text cl-text-2">Refunds are processed within 3-5 business days of us receiving the return and applied to the original payment method. Bank posting times vary; allow up to 10 business days for the credit to appear.</p>'],
            ['title' => '4. Exclusions',              'body' => '<p class="term-text cl-text-2">Sale items, intimate apparel, and final-sale flash sale purchases are excluded from returns. Personalised or made-to-order items are also non-returnable unless faulty.</p>'],
            ['title' => '5. Damaged or Faulty Items', 'body' => '<p class="term-text cl-text-2">If your order arrives damaged or faulty, email us within 7 days with photos. We will replace the item or issue a full refund — including any return shipping cost — at our expense.</p>'],
            ['title' => '6. International Returns',   'body' => '<p class="term-text cl-text-2">International customers are responsible for return shipping unless the item is faulty. We do not refund original shipping or duty charges on international returns.</p>'],
        ];
    }

    protected function shippingTermItems(): array
    {
        return [
            ['title' => '1. Shipping Methods',       'body' => '<p class="term-text cl-text-2">We offer the following shipping methods for domestic and international orders: standard ground, expedited 2-day, and priority overnight (where available).</p>'],
            ['title' => '2. Domestic Rates',         'body' => '<p class="term-text cl-text-2">Standard ground is free on orders over $99. Express 1-2 day shipping is $19.99 flat. Priority overnight is calculated by weight at checkout.</p>'],
            ['title' => '3. International',          'body' => '<p class="term-text cl-text-2">We ship to most countries. International standard shipping is $24.99 with 7-12 business day delivery. Express options appear at checkout. Duties and taxes are pre-paid for select destinations; otherwise the courier collects them on delivery.</p>'],
            ['title' => '4. Processing Time',        'body' => '<p class="term-text cl-text-2">Orders placed before 2pm EST on business days ship the same day. Orders placed after 2pm or on weekends/holidays ship the next business day.</p>'],
            ['title' => '5. Tracking',               'body' => '<p class="term-text cl-text-2">A tracking link is included in your shipment confirmation email. You can also see live status from Account → Orders → Track.</p>'],
            ['title' => '6. Lost or Stuck Shipments', 'body' => '<p class="term-text cl-text-2">If a tracking number has not updated for more than 7 business days, email shipping@amerce.test. We will open an investigation with the carrier and either refund or reship the order at our expense.</p>'],
        ];
    }

    /**
     * Reusable "Customer Say!" testimonial shortcode used by the Main homepage
     * and any variant that wants the image #8 layout. Variants call
     * $this->heroTestimonialsShortcode() to inherit the same demo data.
     */
    protected function heroTestimonialsShortcode(): string
    {
        // Mirrors html/home-fashion.html line 2628-2740 — `testimonial-v01 style-6
        // hover-img4` 4-up swiper of square-image-on-top cards. Copy + tes-16..19
        // images match the demo source.
        return Shortcode::generateShortcode('testimonials', [
            'style' => 'style-image-card',
            'title' => 'What Our Customers Say',
            'subtitle' => 'Real feedback from those who train, move, and live in our gear.',
            'autoplay' => 'yes',
            'quantity' => 4,
            'avatar_1' => $this->safeFilePath('testimonials/tes-16.jpg'),
            'name_1' => 'Jenna L.',
            'role_1' => 'Yoga Instructor',
            'rating_1' => 5,
            'content_1' => '"Super comfortable and breathable — perfect for my daily workouts."',
            'avatar_2' => $this->safeFilePath('testimonials/tes-17.jpg'),
            'name_2' => 'Jenna L.',
            'role_2' => 'Yoga Instructor',
            'rating_2' => 5,
            'content_2' => '"The fit is amazing. Stylish, flexible, and great for the gym."',
            'avatar_3' => $this->safeFilePath('testimonials/tes-18.jpg'),
            'name_3' => 'Jenna L.',
            'role_3' => 'Yoga Instructor',
            'rating_3' => 5,
            'content_3' => '"Quality is top-notch. I feel more confident every time I wear it."',
            'avatar_4' => $this->safeFilePath('testimonials/tes-19.jpg'),
            'name_4' => 'Jenna L.',
            'role_4' => 'Yoga Instructor',
            'rating_4' => 5,
            'content_4' => '"Love the fabric! Lightweight and moves with me during every session."',
        ]);
    }

    /**
     * Resolve a path via filePath() but tolerate missing assets so the
     * homepage shortcode payload always renders during seeding.
     *
     * Prefers the variant's own Themes/<Variant>/files/ directory when the
     * file exists there; otherwise falls back to the default
     * database/seeders/files/ pool. Variant directory is resolved from the
     * concrete subclass via reflection so a single override works for all
     * 20 variant PageSeeders without per-class boilerplate.
     */
    protected function safeFilePath(string $path): ?string
    {
        // BaseSeeder::filePath() short-circuits when source already exists in
        // storage from a prior seed — but media_files may have been truncated
        // by prepareRun(), leaving the source orphaned (no media_files row,
        // no -WxH thumbnails). Pre-emptively remove the orphan so the parent
        // takes its upload path, which registers + thumbnails.
        $this->purgeOrphanedStorageFile($path);

        $variantBase = $this->variantBasePath();
        $sharedBase  = database_path('seeders/files');

        // BUG WORKAROUND: BaseSeeder::filePath($path, $variantBase) only strips
        // database/seeders/files/ from the storage key — when basepath is the
        // variant pool, the $path stays as an absolute filesystem path (e.g.
        // /Users/foo/.../Themes/HomeX/files/section/banner.jpg) and uploads
        // produce broken /storage/Users/... URLs. Instead: copy the variant
        // file into the shared pool first, then resolve normally.
        if ($variantBase
            && file_exists($variantBase . '/' . $path)
            && ! file_exists($sharedBase . '/' . $path)
        ) {
            try {
                $sharedFile = $sharedBase . '/' . $path;
                $sharedDir  = dirname($sharedFile);
                if (! is_dir($sharedDir)) {
                    @mkdir($sharedDir, 0755, true);
                }
                @copy($variantBase . '/' . $path, $sharedFile);
            } catch (\Throwable) {
                // Best-effort copy; fall through to normal resolution.
            }
        }

        try {
            return $this->filePath($path);
        } catch (\Throwable) {
            return null;
        }
    }

    /**
     * If the storage path exists but no media_files row references it, the
     * file is orphaned (left from a prior seed before media_files got
     * truncated). Delete it so BaseSeeder::filePath() takes the RvMedia
     * upload branch — which creates the media_files row AND generates the
     * -WxH thumbnail variants the partials depend on.
     */
    private function purgeOrphanedStorageFile(string $path): void
    {
        try {
            $storage = $this->getMediaStorage();
            if (! $storage->exists($path)) {
                return;
            }
            $registered = MediaFile::query()->where('url', $path)->exists();
            if (! $registered) {
                $storage->delete($path);
            }
        } catch (\Throwable) {
            // Best-effort.
        }
    }

    /**
     * Resolve the absolute path to the concrete subclass's `files/` sibling.
     * Returns null when running as the Main\PageSeeder itself (no variant
     * override needed) or when the variant has no `files/` folder.
     */
    protected function variantBasePath(): ?string
    {
        if (static::class === self::class) {
            return null;
        }

        try {
            $variantDir = dirname((new \ReflectionClass(static::class))->getFileName());
        } catch (\Throwable) {
            return null;
        }

        $variantBase = $variantDir . '/files';

        return is_dir($variantBase) ? $variantBase : null;
    }

    /**
     * Resolve category names → comma-separated id list, preserving the input order
     * so `categories-grid` renders the demo's "Shop By Categories" sequence.
     */
    protected function resolveCategoryIds(array $names): string
    {
        if (! is_plugin_active('ecommerce') || ! class_exists(ProductCategory::class)) {
            return '';
        }

        $rows = ProductCategory::query()
            ->whereIn('name', $names)
            ->pluck('id', 'name');

        $ids = [];
        foreach ($names as $name) {
            if (isset($rows[$name])) {
                $ids[] = (int) $rows[$name];
            }
        }

        return implode(',', $ids);
    }

    /**
     * Same as resolveCategoryIds() but for ProductCollection — used by the
     * "Shop Women / Shop Men / Shop Essentials" banner-grid trio on the
     * Main homepage.
     */
    protected function resolveCollectionIds(array $names): string
    {
        if (! is_plugin_active('ecommerce') || ! class_exists(ProductCollection::class)) {
            return '';
        }

        $rows = ProductCollection::query()
            ->whereIn('name', $names)
            ->pluck('id', 'name');

        $ids = [];
        foreach ($names as $name) {
            if (isset($rows[$name])) {
                $ids[] = (int) $rows[$name];
            }
        }

        return implode(',', $ids);
    }
}
