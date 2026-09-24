<?php

namespace Database\Seeders\Themes\Main;

use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Models\Post;
use Botble\Ecommerce\Models\Product;
use Botble\Menu\Database\Traits\HasMenuSeeder;
use Botble\Slug\Models\Slug;

class MenuSeeder extends BaseSeeder
{
    use HasMenuSeeder;

    public function run(): void
    {
        $this->createMenus($this->getMenus());
    }

    /**
     * Build a path from a Slug row's prefix + key (e.g. "products/widget-1").
     * Avoids the `slugable` morphOne relation which is resolved via the slug
     * package's app->booted() callback and isn't reliably available inside
     * seeders.
     */
    protected function buildSlugUrl(?Slug $slug, string $fallback): string
    {
        if (! $slug || ! $slug->key) {
            return $fallback;
        }

        return '/' . ltrim(trim(($slug->prefix ?: '') . '/' . $slug->key, '/'), '/');
    }

    /**
     * Resolve the first published product's canonical URL so the demo menu can
     * showcase product detail layouts on a real product slug — works for every
     * home preset because each variant's ProductSeeder runs before MenuSeeder.
     * Falls back to /products if no product is published yet.
     */
    protected function firstProductUrl(): string
    {
        if (! is_plugin_active('ecommerce') || ! class_exists(Product::class)) {
            return '/products';
        }

        $productId = Product::query()
            ->wherePublished()
            ->where('is_variation', 0)
            ->oldest('id')
            ->value('id');

        if (! $productId) {
            return '/products';
        }

        $slug = Slug::query()
            ->where('reference_type', Product::class)
            ->where('reference_id', $productId)
            ->first();

        return $this->buildSlugUrl($slug, '/products');
    }

    /**
     * Build a slug-based shared compare URL: /compare/slug-a-vs-slug-b-vs-slug-c.
     * The ecommerce plugin's CompareController@indexBySlugs renders a transient
     * comparison from the slugs without mutating the visitor's compare cart —
     * ideal for the demo menu and matches the shareable-link UX used by shofy.
     * Falls back to /compare if no products are seeded yet.
     */
    protected function compareDemoUrl(int $count = 3): string
    {
        if (! is_plugin_active('ecommerce') || ! class_exists(Product::class)) {
            return '/compare';
        }

        $productIds = Product::query()
            ->wherePublished()
            ->where('is_variation', 0)
            ->oldest('id')
            ->limit($count)
            ->pluck('id');

        if ($productIds->count() < 2) {
            return '/compare';
        }

        $slugs = Slug::query()
            ->where('reference_type', Product::class)
            ->whereIn('reference_id', $productIds)
            ->pluck('key')
            ->filter()
            ->values();

        // Plugin route requires at least 2 slugs joined by `-vs-` (regex `.*-vs-.*`).
        if ($slugs->count() < 2) {
            return '/compare';
        }

        return '/compare/' . $slugs->implode('-vs-');
    }

    /**
     * Resolve the first published post's canonical URL for the Blog Single demo entry.
     * Falls back to /blog if no post exists yet.
     */
    protected function firstPostUrl(): string
    {
        if (! is_plugin_active('blog') || ! class_exists(Post::class)) {
            return '/blog';
        }

        $postId = Post::query()
            ->wherePublished()
            ->oldest('id')
            ->value('id');

        if (! $postId) {
            return '/blog';
        }

        $slug = Slug::query()
            ->where('reference_type', Post::class)
            ->where('reference_id', $postId)
            ->first();

        return $this->buildSlugUrl($slug, '/blog');
    }

    public function getMenus(): array
    {
        $productUrl = $this->firstProductUrl();
        $postUrl = $this->firstPostUrl();
        $compareUrl = $this->compareDemoUrl();

        return [
            [
                'name' => 'Main Menu',
                'location' => 'main-menu',
                'items' => [
                    [
                        'title' => 'Home',
                        'url' => 'https://amerce.botble.com',
                        'css_class' => 'has-mega-menu',
                        'children' => [
                            ['title' => 'Main Demo', 'url' => 'https://amerce.botble.com'],
                            ['title' => 'Home Mental', 'url' => 'https://amerce-mental.botble.com'],
                            ['title' => 'Home Electronics', 'url' => 'https://amerce-electronics.botble.com'],
                            ['title' => 'Home POD', 'url' => 'https://amerce-pod.botble.com'],
                            ['title' => 'Home Pet Care', 'url' => 'https://amerce-pet-care.botble.com'],
                            ['title' => 'Home Baby', 'url' => 'https://amerce-baby.botble.com'],
                            ['title' => 'Home Auto', 'url' => 'https://amerce-auto.botble.com'],
                            ['title' => 'Home Decor', 'url' => 'https://amerce-decor.botble.com'],
                            ['title' => 'Home Cosmetic', 'url' => 'https://amerce-cosmetic.botble.com'],
                            ['title' => 'Home Organic', 'url' => 'https://amerce-organic.botble.com'],
                            ['title' => 'Home Fashion', 'url' => 'https://amerce-fashion.botble.com'],
                            ['title' => 'Home Headphone', 'url' => 'https://amerce-headphone.botble.com'],
                            ['title' => 'Home Jewelry', 'url' => 'https://amerce-jewelry.botble.com'],
                            ['title' => 'Home Garden', 'url' => 'https://amerce-garden.botble.com'],
                            ['title' => 'Home Construct', 'url' => 'https://amerce-construct.botble.com'],
                            ['title' => 'Home Furniture', 'url' => 'https://amerce-furniture.botble.com'],
                            ['title' => 'Home Fashion 2', 'url' => 'https://amerce-fashion-2.botble.com'],
                            ['title' => 'Home Bag', 'url' => 'https://amerce-bag.botble.com'],
                            ['title' => 'Home Sport', 'url' => 'https://amerce-sport.botble.com'],
                            ['title' => 'Home Office', 'url' => 'https://amerce-office.botble.com'],
                            ['title' => 'Home Sneaker', 'url' => 'https://amerce-sneaker.botble.com'],
                        ],
                    ],

                    [
                        'title' => 'Shop',
                        'url' => '/products',
                        'css_class' => 'has-mega-menu',
                        'children' => [
                            // Sidebar / container variants. Default entry omits ?layout= so it
                            // renders theme_option('ecommerce_shop_layout').
                            ['title' => 'Shop Layout', 'url' => '#', 'children' => [
                                ['title' => 'Default', 'url' => '/products'],
                                ['title' => 'Left Sidebar', 'url' => '/products?layout=left-sidebar'],
                                ['title' => 'Right Sidebar', 'url' => '/products?layout=right-sidebar'],
                                ['title' => 'Full Width', 'url' => '/products?layout=full-width'],
                                ['title' => 'Sub Collection', 'url' => '/products?layout=sub-collection'],
                                ['title' => 'Collection List', 'url' => '/collections'],
                            ]],
                            // Card view mode. Same `?layout=` query — values don't overlap with
                            // the sidebar set above. Default entry omits the param.
                            ['title' => 'View Style', 'url' => '#', 'children' => [
                                ['title' => 'Default', 'url' => '/products'],
                                ['title' => 'Grid View', 'url' => '/products?layout=grid'],
                                ['title' => 'List View', 'url' => '/products?layout=list'],
                            ]],
                            ['title' => 'Browse', 'url' => '#', 'children' => [
                                ['title' => 'All Products', 'url' => '/products'],
                                ['title' => 'New Arrivals', 'url' => '/products?source=latest'],
                                ['title' => 'Best Sellers', 'url' => '/products?sort=best-seller'],
                                ['title' => 'Featured', 'url' => '/products?source=featured'],
                                ['title' => 'On Sale', 'url' => '/products?on_sale=1'],
                            ]],
                        ],
                    ],

                    [
                        'title' => 'Product',
                        'url' => $productUrl,
                        'css_class' => 'has-mega-menu',
                        'children' => [
                            // Real product URL resolved at seed time from the first published
                            // product, so each home preset showcases its OWN demo product. The
                            // ?layout= overrides on product.blade.php drive gallery / description
                            // variants. Default entry omits ?layout= so it renders the admin-
                            // selected gallery / description style.
                            ['title' => 'Product Layout', 'url' => '#', 'children' => [
                                ['title' => 'Default', 'url' => $productUrl],
                                ['title' => 'Right Thumbnail', 'url' => $productUrl . '?layout=right-thumbnail'],
                                ['title' => 'Bottom Thumbnail', 'url' => $productUrl . '?layout=bottom-thumbnail'],
                                ['title' => 'Product Grid', 'url' => $productUrl . '?layout=grid'],
                                ['title' => 'Product Grid 2', 'url' => $productUrl . '?layout=grid-2'],
                                ['title' => 'Product Stacked', 'url' => $productUrl . '?layout=stacked'],
                                ['title' => 'Description Accordion', 'url' => $productUrl . '?layout=description-accordion'],
                            ]],
                        ],
                    ],

                    [
                        'title' => 'Blog',
                        'url' => '/blog',
                        'children' => [
                            ['title' => 'Blog', 'url' => '/blog'],
                            // Real post URL resolved at seed time so the demo lands on an actual
                            // published post (the first one). Each variant's BlogSeeder runs
                            // before MenuSeeder, so this picks up the variant's first post.
                            ['title' => 'Blog Single', 'url' => $postUrl],
                        ],
                    ],

                    [
                        'title' => 'Pages',
                        'url' => '/about',
                        'children' => [
                            ['title' => 'About Us', 'url' => '/about'],
                            ['title' => 'Contact Us', 'url' => '/contact'],
                            ['title' => 'Our Store', 'url' => '/our-stores'],
                            ['title' => 'Invoice', 'url' => '/orders/tracking'],
                            ['title' => '404', 'url' => '/page-not-found'],
                            ['title' => 'Compare', 'url' => $compareUrl],
                            ['title' => 'My Account', 'url' => '/customer/overview'],
                        ],
                    ],
                ],
            ],

            // CUSTOMER column — mirrors html/home-pet-care.html footer (5 items, demo-verbatim labels).
            // Includes Terms & Conditions between Privacy Policy and Orders FAQs.
            [
                'name' => 'Footer Help',
                'location' => 'footer-menu-1',
                'items' => [
                    ['title' => 'Shipping',           'url' => '/shipping'],
                    ['title' => 'Return & Refund',    'url' => '/returns-refunds'],
                    ['title' => 'Privacy Policy',     'url' => '/privacy-policy'],
                    ['title' => 'Terms & Conditions', 'url' => '/terms-of-service'],
                    ['title' => 'Orders FAQs',        'url' => '/faq'],
                ],
            ],

            // COMPANY column — mirrors html/home-fashion.html footer (5 items, demo-verbatim labels).
            [
                'name' => 'Footer Company',
                'location' => 'footer-menu-2',
                'items' => [
                    ['title' => 'About Us',    'url' => '/about'],
                    ['title' => 'Our Stories', 'url' => '/our-stores'],
                    ['title' => 'Contact us',  'url' => '/contact'],
                    ['title' => 'Latest New',  'url' => '/blog'],
                    ['title' => 'My Account',  'url' => '/customer/overview'],
                ],
            ],
        ];
    }
}
