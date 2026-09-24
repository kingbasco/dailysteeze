<?php

use Botble\Theme\Events\RenderingThemeOptionSettings;
use Botble\Theme\Facades\Theme;
use Botble\Theme\ThemeOption\Fields\UiSelectorField;
use Botble\Theme\Typography\TypographyItem;

app()->booted(function (): void {
    // Typography registration — drives the admin Font Picker.
    // `heading` is special-cased by Typography::renderCssVariables() (applies font-weight
    // to h1-h6 automatically); see _typography.scss for the font-family wiring.
    Theme::typography()
        ->registerFontFamilies([
            new TypographyItem('primary', __('Primary (Body)'), 'DM Sans'),
            new TypographyItem('heading', __('Heading'), 'DM Sans'),
            new TypographyItem('secondary', __('Secondary'), 'Urbanist'),
            new TypographyItem('display', __('Display'), 'Red Hat Display'),
            new TypographyItem('accent', __('Accent'), 'Outfit'),
        ])
        ->registerFontSizes([
            new TypographyItem('h1', __('Heading 1'), 60),
            new TypographyItem('h2', __('Heading 2'), 48),
            new TypographyItem('h3', __('Heading 3'), 38),
            new TypographyItem('h4', __('Heading 4'), 31),
            new TypographyItem('h5', __('Heading 5'), 25),
            new TypographyItem('h6', __('Heading 6'), 20),
            new TypographyItem('body', __('Body'), 16),
        ]);
});

app('events')->listen(RenderingThemeOptionSettings::class, function (): void {
    // === Logo section — extend the core "opt-text-subsection-logo" section
    // (which already provides `logo` and `favicon`) with theme-specific extras.
    theme_option()
        ->setField([
            'id' => 'logo_dark',
            'section_id' => 'opt-text-subsection-logo',
            'type' => 'mediaImage',
            'label' => __('Logo (dark mode)'),
            'attributes' => ['name' => 'logo_dark', 'value' => null, 'attributes' => ['allow_thumb' => false]],
        ])
        ->setField([
            'id' => 'logo_text',
            'section_id' => 'opt-text-subsection-logo',
            'type' => 'text',
            'label' => __('Logo text'),
            'helper' => __('Fallback text shown when no logo image is set.'),
            'attributes' => ['name' => 'logo_text', 'value' => 'Amerce', 'options' => ['class' => 'form-control']],
        ])

        // === Section 1 — General ===
        ->setSection([
            'title' => __('General'),
            'desc' => __('Default theme mode and global toggles'),
            'id' => 'opt-text-subsection-general',
            'subsection' => true,
            'icon' => 'ti ti-settings',
            'fields' => [
                [
                    'id' => 'default_theme_mode',
                    'type' => 'customRadio',
                    'label' => __('Default theme mode'),
                    // Note: key order matters — ThemeOption::renderField unpacks
                    // attributes positionally into Form::customRadio($name, $values, $selected).
                    'attributes' => [
                        'name' => 'default_theme_mode',
                        'values' => [
                            'light' => __('Light'),
                            'dark' => __('Dark'),
                            'system' => __('System (auto)'),
                        ],
                        'value' => 'light',
                    ],
                ],
            ],
        ])

        // === Section 2 — Header ===
        ->setSection([
            'title' => __('Header'),
            'id' => 'opt-text-subsection-header',
            'subsection' => true,
            'icon' => 'ti ti-layout-navbar',
            'fields' => [
                UiSelectorField::make()
                    ->name('header_style')
                    ->label(__('Header style'))
                    ->options([
                        'style-1' => ['label' => __('Simple'),                            'image' => Theme::asset()->url('images/theme-options/header/style-1.png')],
                        'style-2' => ['label' => __('Top bar + Mega menu'),               'image' => Theme::asset()->url('images/theme-options/header/style-2.png')],
                        'style-3' => ['label' => __('Transparent overlay (centered)'),    'image' => Theme::asset()->url('images/theme-options/header/style-3.png')],
                        'style-4' => ['label' => __('Boxed centered'),                    'image' => Theme::asset()->url('images/theme-options/header/style-4.png')],
                        'style-5' => ['label' => __('Modern minimal (light)'),            'image' => Theme::asset()->url('images/theme-options/header/style-5.png')],
                        'style-6' => ['label' => __('Modern minimal (dark)'),             'image' => Theme::asset()->url('images/theme-options/header/style-6.png')],
                        'style-7' => ['label' => __('Category dropdown + classic nav'),   'image' => Theme::asset()->url('images/theme-options/header/style-7.png')],
                        'style-8' => ['label' => __('Mega menu + category'),              'image' => Theme::asset()->url('images/theme-options/header/style-8.png')],
                        'style-9' => ['label' => __('Classic with inline search'),        'image' => Theme::asset()->url('images/theme-options/header/style-9.png')],
                        'style-10' => ['label' => __('Furniture boutique with category'),  'image' => Theme::asset()->url('images/theme-options/header/style-10.png')],
                        'style-11' => ['label' => __('Modern minimal centered'),           'image' => Theme::asset()->url('images/theme-options/header/style-11.png')],
                        'style-12' => ['label' => __('Jewelry boutique'),                  'image' => Theme::asset()->url('images/theme-options/header/style-12.png')],
                        'style-13' => ['label' => __('Transparent overlay (variant)'),     'image' => Theme::asset()->url('images/theme-options/header/style-13.png')],
                        'style-14' => ['label' => __('Transparent overlay (organic)'),     'image' => Theme::asset()->url('images/theme-options/header/style-14.png')],
                    ])
                    ->defaultValue('style-1')
                    ->numberItemsPerRow(3),
                ['id' => 'show_topbar',                    'type' => 'onOff',  'label' => __('Show top bar'),                'attributes' => ['name' => 'show_topbar', 'value' => true]],
                ['id' => 'topbar_slides',                  'type' => 'textarea', 'label' => __('Top bar slides'), 'helper' => __('One slide per line. Leave empty to hide the top bar.'), 'attributes' => ['name' => 'topbar_slides', 'value' => null, 'options' => ['rows' => 3, 'class' => 'form-control']]],
                ['id' => 'header_transparent_on_homepage', 'type' => 'onOff',  'label' => __('Transparent on homepage'),     'attributes' => ['name' => 'header_transparent_on_homepage', 'value' => false]],
                ['id' => 'sticky_header',                  'type' => 'onOff',  'label' => __('Sticky header'),               'attributes' => ['name' => 'sticky_header', 'value' => true]],
                ['id' => 'header_bottom_offer_text',       'type' => 'text',   'label' => __('Bottom offer text'),           'attributes' => ['name' => 'header_bottom_offer_text', 'value' => null, 'options' => ['class' => 'form-control']]],
                ['id' => 'header_bottom_offer_url',        'type' => 'text',   'label' => __('Bottom offer URL'),            'attributes' => ['name' => 'header_bottom_offer_url', 'value' => null, 'options' => ['class' => 'form-control', 'placeholder' => 'https://...']]],
                ['id' => 'header_bottom_offer_target',     'type' => 'text',   'label' => __('Bottom offer link target'),    'attributes' => ['name' => 'header_bottom_offer_target', 'value' => null, 'options' => ['class' => 'form-control', 'placeholder' => '_blank']]],
                ['id' => 'header_special_offers_text',     'type' => 'text',   'label' => __('Special offers text (Header 10)'), 'attributes' => ['name' => 'header_special_offers_text', 'value' => 'Special Offers!', 'options' => ['class' => 'form-control']]],
                ['id' => 'header_special_offers_url',      'type' => 'text',   'label' => __('Special offers URL (Header 10)'),  'attributes' => ['name' => 'header_special_offers_url',  'value' => null, 'options' => ['class' => 'form-control', 'placeholder' => 'https://...']]],
                // Header colors — split top-bar / main-bar (consumed by phase-01's partialComposer('header.*'))
                ['id' => 'header_top_background_color',    'type' => 'color',            'label' => __('Top bar background'),          'attributes' => ['name' => 'header_top_background_color',  'value' => '#010F1C']],
                ['id' => 'header_top_text_color',          'type' => 'color',            'label' => __('Top bar text'),                'attributes' => ['name' => 'header_top_text_color',        'value' => '#FFFFFF']],
                ['id' => 'header_main_background_color',   'type' => 'color',            'label' => __('Main bar background'),         'attributes' => ['name' => 'header_main_background_color', 'value' => '#FFFFFF']],
                ['id' => 'header_main_text_color',         'type' => 'color',            'label' => __('Main bar text'),               'attributes' => ['name' => 'header_main_text_color',       'value' => '#1E1E1E']],
            ],
        ])

        // === Section 3 — Colors ===
        ->setSection([
            'title' => __('Colors'),
            'id' => 'opt-text-subsection-colors',
            'subsection' => true,
            'icon' => 'ti ti-palette',
            'fields' => [
                ['id' => 'primary_color',     'type' => 'customColor', 'label' => __('Primary'),       'attributes' => ['name' => 'primary_color',    'value' => '#DC4646']],
                ['id' => 'secondary_color',   'type' => 'customColor', 'label' => __('Secondary'),     'attributes' => ['name' => 'secondary_color',  'value' => '#70857A']],
                ['id' => 'heading_color',     'type' => 'customColor', 'label' => __('Heading'),       'attributes' => ['name' => 'heading_color',    'value' => '#101010']],
                ['id' => 'body_text_color',   'type' => 'customColor', 'label' => __('Body text'),     'attributes' => ['name' => 'body_text_color',  'value' => '#696E73']],
                ['id' => 'link_color',        'type' => 'customColor', 'label' => __('Link'),          'attributes' => ['name' => 'link_color',       'value' => '#DC4646']],
                ['id' => 'link_hover_color',  'type' => 'customColor', 'label' => __('Link hover'),    'attributes' => ['name' => 'link_hover_color', 'value' => '#C93A0B']],
                ['id' => 'border_color',      'type' => 'customColor', 'label' => __('Border'),        'attributes' => ['name' => 'border_color',     'value' => '#E9E9E9']],
                ['id' => 'success_color',     'type' => 'customColor', 'label' => __('Success'),       'attributes' => ['name' => 'success_color',    'value' => '#3DAB25']],
                ['id' => 'danger_color',      'type' => 'customColor', 'label' => __('Danger / Sale'), 'attributes' => ['name' => 'danger_color',     'value' => '#F03E3E']],
            ],
        ])

        // === Section 4 — Footer ===
        ->setSection([
            'title' => __('Footer'),
            'id' => 'opt-text-subsection-footer',
            'subsection' => true,
            'icon' => 'ti ti-layout-bottombar',
            'fields' => [
                UiSelectorField::make()
                    ->name('footer_style')
                    ->label(__('Footer style'))
                    ->options([
                        'style-1' => ['label' => __('Light'),         'image' => Theme::asset()->url('images/theme-options/footer/style-1.png')],
                        'style-2' => ['label' => __('Dark'),          'image' => Theme::asset()->url('images/theme-options/footer/style-2.png')],
                        'style-3' => ['label' => __('Dark variant'),  'image' => Theme::asset()->url('images/theme-options/footer/style-3.png')],
                        'style-4' => ['label' => __('Stacked'),       'image' => Theme::asset()->url('images/theme-options/footer/style-4.png')],
                    ])
                    ->defaultValue('style-1')
                    ->numberItemsPerRow(4),
                [
                    'id' => 'footer_container_class',
                    'type' => 'customRadio',
                    'label' => __('Footer container width'),
                    'attributes' => [
                        'name' => 'footer_container_class',
                        'values' => [
                            'container' => __('Standard (1440px)'),
                            'container-2' => __('Compact (1320px)'),
                            'container-full' => __('Full Width (1800px)'),
                        ],
                        'value' => 'container-full',
                    ],
                ],
                // Comma-separated storage paths uploaded via the media library (e.g. payment/visa.png,payment/master-card.png).
                // Seeded by ThemeOptionSeeder::getFooterPaymentIcons() from database/seeders/files/payment/.
                // Empty value hides the row. Read by partials/footer.blade.php → $paymentIcons.
                ['id' => 'footer_payment_icons',    'type' => 'text',     'label' => __('Payment icons'), 'helper' => __('Comma-separated storage paths (uploaded via Media). Leave blank to hide.'), 'attributes' => ['name' => 'footer_payment_icons', 'value' => null, 'options' => ['class' => 'form-control', 'placeholder' => 'payment/visa.png,payment/master-card.png']]],

                // Contact details rendered by partials/footer/styles/style-{1..4}.
                // Empty values cause the corresponding row in the footer "About" widget to hide.
                // Column headings — partials/footer.blade.php falls back to translated COMPANY/CUSTOMER/NEWSLETTER when blank.
                ['id' => 'footer_company_title',    'type' => 'text', 'label' => __('Company column title'),     'attributes' => ['name' => 'footer_company_title',    'value' => null, 'options' => ['class' => 'form-control', 'placeholder' => 'COMPANY']]],
                ['id' => 'footer_customer_title',   'type' => 'text', 'label' => __('Customer column title'),    'attributes' => ['name' => 'footer_customer_title',   'value' => null, 'options' => ['class' => 'form-control', 'placeholder' => 'CUSTOMER']]],
                ['id' => 'footer_newsletter_title', 'type' => 'text', 'label' => __('Newsletter title'),         'attributes' => ['name' => 'footer_newsletter_title', 'value' => null, 'options' => ['class' => 'form-control', 'placeholder' => 'NEWSLETTER']]],
                ['id' => 'footer_newsletter_desc',  'type' => 'text', 'label' => __('Newsletter description'),   'attributes' => ['name' => 'footer_newsletter_desc',  'value' => null, 'options' => ['class' => 'form-control', 'placeholder' => 'Subscribe for store updates and discounts.']]],
                // Marquee strip — only rendered by footer style-2.
                ['id' => 'footer_marquee_text',     'type' => 'text', 'label' => __('Marquee text (style-2 only)'), 'attributes' => ['name' => 'footer_marquee_text', 'value' => null, 'options' => ['class' => 'form-control', 'placeholder' => 'Free shipping over $99 — Worldwide delivery']]],

                ['id' => 'footer_address',  'type' => 'textarea', 'label' => __('Address'),  'attributes' => ['name' => 'footer_address',  'value' => null, 'options' => ['rows' => 2, 'class' => 'form-control', 'placeholder' => '600 N Michigan Ave, Chicago, IL 60611, USA']]],
                ['id' => 'footer_map_url',  'type' => 'text',     'label' => __('Map URL'),  'helper' => __('Optional. If empty, derived from the address via Google Maps search.'), 'attributes' => ['name' => 'footer_map_url', 'value' => null, 'options' => ['class' => 'form-control', 'placeholder' => 'https://maps.google.com/?q=...']]],
                ['id' => 'footer_email',    'type' => 'text',     'label' => __('Email'),    'attributes' => ['name' => 'footer_email',    'value' => null, 'options' => ['class' => 'form-control', 'placeholder' => 'hi@example.com']]],
                ['id' => 'footer_phone',    'type' => 'text',     'label' => __('Phone'),    'attributes' => ['name' => 'footer_phone',    'value' => null, 'options' => ['class' => 'form-control', 'placeholder' => '+1 555 000 0000']]],

                // Social URLs — keys consumed by partials/footer.blade.php $defaultSocials.
                // Empty value hides that icon. Icon classes are fixed icomoon glyphs in the partial.
                ['id' => 'facebook_url',  'type' => 'text', 'label' => __('Facebook URL'),     'attributes' => ['name' => 'facebook_url',  'value' => null, 'options' => ['class' => 'form-control']]],
                ['id' => 'twitter_url',   'type' => 'text', 'label' => __('X (Twitter) URL'),  'attributes' => ['name' => 'twitter_url',   'value' => null, 'options' => ['class' => 'form-control']]],
                ['id' => 'instagram_url', 'type' => 'text', 'label' => __('Instagram URL'),    'attributes' => ['name' => 'instagram_url', 'value' => null, 'options' => ['class' => 'form-control']]],
                ['id' => 'tiktok_url',    'type' => 'text', 'label' => __('TikTok URL'),       'attributes' => ['name' => 'tiktok_url',    'value' => null, 'options' => ['class' => 'form-control']]],
                ['id' => 'snapchat_url',  'type' => 'text', 'label' => __('Snapchat URL'),     'attributes' => ['name' => 'snapchat_url',  'value' => null, 'options' => ['class' => 'form-control']]],
            ],
        ]);

    // === Section 5 — Ecommerce (gated) ===
    if (is_plugin_active('ecommerce')) {
        theme_option()->setSection([
            'title' => __('Ecommerce'),
            'id' => 'opt-text-subsection-ecommerce',
            'subsection' => true,
            'icon' => 'ti ti-shopping-cart',
            'fields' => [
                UiSelectorField::make()
                    ->name('product_card_default_style')
                    ->label(__('Product card style'))
                    ->options([
                        'style-1' => ['label' => __('Standard'),     'image' => Theme::asset()->url('images/theme-options/card/style-1.png')],
                        'style-2' => ['label' => __('Slide-up'),     'image' => Theme::asset()->url('images/theme-options/card/style-2.png')],
                        'style-3' => ['label' => __('Image overlay'), 'image' => Theme::asset()->url('images/theme-options/card/style-3.png')],
                        'style-4' => ['label' => __('3D flip'),      'image' => Theme::asset()->url('images/theme-options/card/style-4.png')],
                        'style-5' => ['label' => __('Icon spread'),  'image' => Theme::asset()->url('images/theme-options/card/style-5.png')],
                    ])
                    ->defaultValue('style-1')
                    ->numberItemsPerRow(5),
                // Structural shop layout — controls sidebar position, container width, sub-collection swiper.
                // Read by views/ecommerce/products.blade.php and product-collection.blade.php as fallback
                // when no `Theme::set('shopLayout', …)` override is in play (e.g. demo /shop-* routes).
                ['id' => 'ecommerce_shop_layout',       'type' => 'customRadio',     'label' => __('Shop page layout'),     'attributes' => ['name' => 'ecommerce_shop_layout', 'values' => ['default' => __('Default'), 'left-sidebar' => __('Left Sidebar'), 'right-sidebar' => __('Right Sidebar'), 'full-width' => __('Full Width'), 'sub-collection' => __('Sub Collection swiper')], 'value' => 'default']],
                // Default product card layout on /products. Visitors can override per-request via ?layout=grid|list;
                // each variant ThemeOptionSeeder may set its own preferred default (e.g. tools/parts presets default to list).
                ['id' => 'ecommerce_product_item_layout', 'type' => 'customRadio',     'label' => __('Product item layout'),  'attributes' => ['name' => 'ecommerce_product_item_layout', 'values' => ['grid' => __('Grid'), 'list' => __('List')], 'value' => 'grid']],
                ['id' => 'number_of_products_per_page', 'type' => 'number',          'label' => __('Products per page'),   'attributes' => ['name' => 'number_of_products_per_page', 'value' => 12, 'options' => ['min' => 1, 'class' => 'form-control']]],
                ['id' => 'default_filter_position',     'type' => 'customRadio',     'label' => __('Filter position'),     'attributes' => ['name' => 'default_filter_position', 'values' => ['sidebar' => __('Sidebar'), 'drawer' => __('Drawer'), 'dropdown' => __('Dropdown'), 'hidden' => __('Hidden')], 'value' => 'sidebar']],
                ['id' => 'default_pagination_style',    'type' => 'customRadio',     'label' => __('Pagination style'),    'attributes' => ['name' => 'default_pagination_style', 'values' => ['numbered' => __('Numbered'), 'load-more' => __('Load more'), 'infinite' => __('Infinite scroll')], 'value' => 'numbered']],
                // Responsive column counts on the shop archive grid. Wired into views/ecommerce/includes/products-listing.blade.php
                // as `tf-col-{mobile} md-col-{tablet} xl-col-{desktop}` (mobile-first; matches theme.css breakpoints
                // base / md ≥768px / xl ≥1200px).
                ['id' => 'ecommerce_products_per_row',         'type' => 'customRadio', 'label' => __('Products per row (desktop)'), 'attributes' => ['name' => 'ecommerce_products_per_row',         'values' => [3 => '3', 4 => '4', 5 => '5', 6 => '6'], 'value' => 4]],
                ['id' => 'ecommerce_products_per_row_tablet',  'type' => 'customRadio', 'label' => __('Products per row (tablet)'),  'attributes' => ['name' => 'ecommerce_products_per_row_tablet',  'values' => [2 => '2', 3 => '3', 4 => '4'],          'value' => 3]],
                ['id' => 'ecommerce_products_per_row_mobile',  'type' => 'customRadio', 'label' => __('Products per row (mobile)'),  'attributes' => ['name' => 'ecommerce_products_per_row_mobile',  'values' => [1 => '1', 2 => '2'],                    'value' => 2]],
                // Product detail page — gallery layout (selects views/ecommerce/includes/product-gallery-{value}.blade.php).
                // Per-product override available via $product->gallery_layout.
                ['id' => 'ecommerce_gallery_layout',    'type' => 'customRadio',     'label' => __('Product gallery layout'), 'attributes' => ['name' => 'ecommerce_gallery_layout', 'values' => ['default' => __('Default'), 'right-thumbnail' => __('Right Thumbnail'), 'bottom-thumbnail' => __('Bottom Thumbnail'), 'grid' => __('Grid'), 'grid-2' => __('Grid 2'), 'stacked' => __('Stacked')], 'value' => 'default']],
                // Product detail page — description/specification/reviews UI: tabs vs accordion.
                ['id' => 'ecommerce_product_description_style', 'type' => 'customRadio', 'label' => __('Product description style'), 'attributes' => ['name' => 'ecommerce_product_description_style', 'values' => ['tabs' => __('Tabs'), 'accordion' => __('Accordion')], 'value' => 'tabs']],
                ['id' => 'enable_quick_view',           'type' => 'onOff', 'label' => __('Enable Quick View'),   'attributes' => ['name' => 'enable_quick_view', 'value' => true]],
                ['id' => 'enable_quick_shop',           'type' => 'onOff', 'label' => __('Enable Quick Shop'),   'attributes' => ['name' => 'enable_quick_shop', 'value' => true]],
                // Show variation color swatches under price on product cards (home-fashion demo style).
                // Reads from Product::variationAttributeSwatchesForProductList — only attribute sets
                // with display_layout='visual' and is_use_in_product_listing=1 surface.
                ['id' => 'product_card_show_color_swatches', 'type' => 'onOff', 'label' => __('Show color swatches on product card'), 'attributes' => ['name' => 'product_card_show_color_swatches', 'value' => false]],
                // Free-shipping threshold shown in the mini-cart progress bar.
                // Set to 0 to hide the message entirely.
                ['id' => 'mini_cart_freeship_threshold', 'type' => 'number', 'label' => __('Free-shipping threshold'), 'helper' => __('Order subtotal needed to unlock free shipping. Mini-cart shows the remaining amount and progress bar based on this value. Set to 0 to disable.'), 'attributes' => ['name' => 'mini_cart_freeship_threshold', 'value' => 100, 'options' => ['min' => 0, 'step' => 1, 'class' => 'form-control']]],
                ['id' => 'compare_max_items',           'type' => 'number',          'label' => __('Compare max items'),   'attributes' => ['name' => 'compare_max_items', 'value' => 4, 'options' => ['min' => 2, 'max' => 6, 'class' => 'form-control']]],
                ['id' => 'enabled_product_size_guide',  'type' => 'onOff',           'label' => __('Enable Product Size Guide'), 'attributes' => ['name' => 'enabled_product_size_guide', 'value' => true]],
            ],
        ]);
    }

    // === Section 6 — Misc ===
    theme_option()->setSection([
        'title' => __('Miscellaneous'),
        'id' => 'opt-text-subsection-misc',
        'subsection' => true,
        'icon' => 'ti ti-tools',
        'fields' => [
            ['id' => 'preloader_enabled',     'type' => 'onOff', 'label' => __('Show preloader'),     'attributes' => ['name' => 'preloader_enabled', 'value' => true]],
            ['id' => 'scroll_to_top_enabled', 'type' => 'onOff', 'label' => __('Scroll-to-top'),      'attributes' => ['name' => 'scroll_to_top_enabled', 'value' => true]],
            // Toggle the page sidebar for Default-template Pages — read by views/page.blade.php.
            ['id' => 'sidebar_enabled',       'type' => 'onOff', 'label' => __('Page sidebar (default template)'), 'helper' => __('Render the blog sidebar on Default-template Pages.'), 'attributes' => ['name' => 'sidebar_enabled', 'value' => false]],
            ['id' => 'homepage_body_class',   'type' => 'text',  'label' => __('Homepage body class'), 'helper' => __('Optional CSS class added to <body> on the homepage (e.g. <code>home-fashion</code>).'), 'attributes' => ['name' => 'homepage_body_class', 'value' => '', 'options' => ['class' => 'form-control', 'placeholder' => 'home-fashion']]],

        ],
    ]);
});
