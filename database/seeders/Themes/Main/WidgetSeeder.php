<?php

namespace Database\Seeders\Themes\Main;

use Botble\Base\Supports\BaseSeeder;
use Botble\Widget\Database\Traits\HasWidgetSeeder;
use Theme\Amerce\Widgets\BlogAboutMeWidget;
use Theme\Amerce\Widgets\BlogCategoriesWidget;
use Theme\Amerce\Widgets\BlogPostsWidget;
use Theme\Amerce\Widgets\BlogSearchWidget;
use Theme\Amerce\Widgets\BlogTagsWidget;
use Theme\Amerce\Widgets\FooterMenuWidget;
use Theme\Amerce\Widgets\PaymentMethodsWidget;
use Theme\Amerce\Widgets\ProductDeliveryInfoWidget;

class WidgetSeeder extends BaseSeeder
{
    use HasWidgetSeeder;

    /**
     * Seedings only target sidebars that templates actually render via dynamic_sidebar().
     * The header_sidebar is intentionally NOT seeded — the 14 header styles compose
     * logo / menu / controls via hardcoded HTML and theme_options, not widget injection.
     *
     * Per-sidebar template-method pattern — variants override individual
     * get*SidebarData() methods to swap one block without rewriting the rest.
     */
    public function run(): void
    {
        $this->createWidgets([
            ...$this->getFooterTopSidebarData(),
            ...$this->getFooterCompanySidebarData(),
            ...$this->getFooterCustomerSidebarData(),
            ...$this->getFooterBottomSidebarData(),
            ...$this->getBlogSidebarData(),
            ...$this->getProductDetailsSidebarData(),
        ]);
    }

    /**
     * Optional strip ABOVE the main footer columns — wired in partials/footer.blade.php
     * via $footerTopSidebar. Empty by default (the existing hardcoded footer column 4
     * already contains a newsletter form, so seeding here would duplicate that form).
     * Admins can opt in by adding widgets to this sidebar via the admin UI.
     */
    public function getFooterTopSidebarData(): array
    {
        return [];
    }

    /**
     * Footer "Company" column — overrides $defaultCompanyLinks in
     * partials/footer.blade.php when populated.
     */
    public function getFooterCompanySidebarData(): array
    {
        return [
            [
                'widget_id' => FooterMenuWidget::class,
                'sidebar_id' => 'footer_company_sidebar',
                'position' => 0,
                'data' => [
                    // `name` doubles as the optional column heading rendered by
                    // templates/frontend.blade.php. Header text in the footer
                    // styles partial uses theme_options.footer_company_title and
                    // suppresses this when set.
                    'name' => 'Company',
                    'menu_id' => 'footer-company',
                ],
            ],
        ];
    }

    /**
     * Footer "Customer" column — overrides $defaultCustomerLinks in
     * partials/footer.blade.php when populated.
     */
    public function getFooterCustomerSidebarData(): array
    {
        return [
            [
                'widget_id' => FooterMenuWidget::class,
                'sidebar_id' => 'footer_customer_sidebar',
                'position' => 0,
                'data' => [
                    'name' => 'Customer',
                    'menu_id' => 'footer-help',
                ],
            ],
        ];
    }

    /**
     * Optional strip BELOW the main footer columns (above the copyright row) — wired
     * in partials/footer.blade.php via $footerBottomSidebar. Empty by default because
     * the existing hardcoded `<div class="footer-bottom">` section already renders
     * copyright, social icons, and payment methods. Seeding here would duplicate them.
     * Admins can opt in via the admin UI.
     */
    public function getFooterBottomSidebarData(): array
    {
        return [];
    }

    /**
     * Order mirrors html/blog.html demo's right sidebar:
     * about-me → search → categories → recent posts → tags. `name` is the admin-facing
     * widget instance label; `title` (when present) is the public h5 heading.
     */
    public function getBlogSidebarData(): array
    {
        return [
            [
                'widget_id' => BlogAboutMeWidget::class,
                'sidebar_id' => 'blog_sidebar',
                'position' => 0,
                'data' => [
                    // Note: BlogAboutMeWidget reuses `name` for the rendered author name
                    // (per its settingForm label "Author Name"), not the admin-facing
                    // widget instance label.
                    'name' => 'Amerce Editorial',
                    'title' => 'About Me',
                    'image' => null,
                    'bio' => 'Style notes, product spotlights, and how we curate the catalog — written by the Amerce team.',
                    'social_links' => [
                        ['platform' => 'facebook',  'url' => 'https://facebook.com'],
                        ['platform' => 'instagram', 'url' => 'https://instagram.com'],
                        ['platform' => 'tiktok',    'url' => 'https://tiktok.com'],
                    ],
                ],
            ],
            [
                'widget_id' => BlogSearchWidget::class,
                'sidebar_id' => 'blog_sidebar',
                'position' => 1,
                'data' => [
                    'name' => 'Search',
                    'placeholder' => 'Search...',
                ],
            ],
            [
                'widget_id' => BlogCategoriesWidget::class,
                'sidebar_id' => 'blog_sidebar',
                'position' => 2,
                'data' => [
                    'name' => 'Categories',
                    'title' => 'Categories',
                    'display_posts_count' => 'yes',
                    'category_ids' => [],
                ],
            ],
            [
                'widget_id' => BlogPostsWidget::class,
                'sidebar_id' => 'blog_sidebar',
                'position' => 3,
                'data' => [
                    'name' => 'Recent Posts',
                    'title' => 'Recent Posts',
                    'type' => 'recent',
                    'number_display' => 4,
                ],
            ],
            [
                'widget_id' => BlogTagsWidget::class,
                'sidebar_id' => 'blog_sidebar',
                'position' => 4,
                'data' => [
                    'name' => 'Tags',
                    'title' => 'Popular Tags',
                    'number_display' => 11,
                ],
            ],
        ];
    }

    /**
     * Single-product sidebar — wired in includes/product-detail.blade.php via
     * dynamic_sidebar('product_details_sidebar'). Renders inside
     * .tf-product-info-list so the scoped product-info CSS applies.
     *
     * Order: delivery → safe checkout. (ProductCategoriesWidget remains
     * available in the widget palette — admins can add it manually if
     * desired, but it's no longer seeded by default.)
     */
    public function getProductDetailsSidebarData(): array
    {
        return [
            [
                'widget_id' => ProductDeliveryInfoWidget::class,
                'sidebar_id' => 'product_details_sidebar',
                'position' => 0,
                'data' => [
                    'name' => 'Product Delivery & Return',
                    'estimated_intl' => '12-26 Days',
                    'estimated_intl_label' => 'International',
                    'estimated_local' => '3-6 Days',
                    'estimated_local_label' => 'United States',
                    'return_within' => '45 Days',
                    'return_text' => 'of purchase. Duties & taxes are non-refundable.',
                ],
            ],
            [
                'widget_id' => PaymentMethodsWidget::class,
                'sidebar_id' => 'product_details_sidebar',
                'position' => 1,
                'data' => [
                    'name' => 'Payment Methods',
                    'title' => 'Guaranteed Safe Checkout:',
                    'images' => [],
                ],
            ],
        ];
    }
}
