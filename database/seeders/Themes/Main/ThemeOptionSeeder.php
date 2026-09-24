<?php

namespace Database\Seeders\Themes\Main;

use Botble\Base\Supports\BaseSeeder;
use Botble\Page\Models\Page;
use Botble\Theme\Database\Traits\HasThemeOptionSeeder;

class ThemeOptionSeeder extends BaseSeeder
{
    use HasThemeOptionSeeder;

    /**
     * Public so variant ThemeOptionSeeders can spread it:
     *   public function getThemeOptions(): array {
     *       return [...parent::getThemeOptions(), 'header_style' => 'style-3', ...];
     *   }
     */
    public function getThemeOptions(): array
    {
        // Preserve homepage_id across re-seeds. The HasThemeOptionSeeder trait
        // truncates ALL theme options before saving — without this, PageSeeder's
        // homepage_id (set earlier in the run) gets wiped when ThemeOptionSeeder
        // runs after it in variant DatabaseSeeders.
        $homepageId = optional(Page::query()->where('name', 'Homepage')->first())->id;
        $blogPageId = optional(Page::query()->where('name', 'Blog')->first())->id;

        return [
            'homepage_id' => $homepageId,
            'blog_page_id' => $blogPageId,
            'logo' => $this->safeFilePath('general/logo.png'),
            // logo_dark = the white-fill variant shown when the header overlays a
            // dark/colored hero (style-3 transparent overlay). The CSS class
            // `logo-dark` toggles based on header state — at top (transparent) the
            // white logo shows; once scrolled (sticky white bg) the dark logo wins.
            'logo_dark' => $this->safeFilePath('general/logo-white.png'),
            'logo_text' => 'Amerce',
            'favicon' => $this->safeFilePath('general/favicon.png'),
            'default_theme_mode' => 'light',
            'header_style' => 'style-3',
            'show_topbar' => true,
            'contact_phone' => '(+01) 1234 8888',
            // Newline-delimited slides for the topbar swiper. Two demo sale messages
            // mirror the html/home-jewelry.html "Midseason Sale" topbar copy.
            'topbar_slides' => "Midseason Sale: 20% Off - Auto Applied at Checkout - Limited Time Only\n20% Off - Auto Applied at Checkout - Limited Time Only",
            'sticky_header' => true,
            'header_transparent_on_homepage' => false,
            'header_top_background_color' => '#010F1C',
            'header_top_text_color' => '#FFFFFF',
            'header_main_background_color' => '#FFFFFF',
            'header_main_text_color' => '#1E1E1E',
            'primary_color' => '#DC4646',
            'secondary_color' => '#70857A',
            'heading_color' => '#101010',
            'body_text_color' => '#696E73',
            'link_color' => '#DC4646',
            'link_hover_color' => '#B83838',
            'border_color' => '#E9E9E9',
            'success_color' => '#3DAB25',
            'danger_color' => '#F03E3E',
            'footer_style' => 'style-1',
            // Comma-separated storage paths. Each PNG in database/seeders/files/payment/
            // is uploaded to public storage on first seed; resulting paths (e.g.
            // payment/visa.png) are stored here and rendered via RvMedia in the footer.
            // water.png = Diners Club, discover.png = Discover (canonical 76x48 PNGs
            // sourced from amerce.botble.com/themes/amerce/images/payment/).
            'footer_payment_icons' => $this->getFooterPaymentIcons(),
            // Footer "About" widget — mirrors the tfamerce.vercel.app reference design.
            'footer_address' => '600 N Michigan Ave, Chicago, IL 60611, USA',
            'footer_email' => 'hi.amere@gmail.com',
            'footer_phone' => '315-666-6688',
            'facebook_url' => 'https://facebook.com',
            'twitter_url' => 'https://x.com',
            'instagram_url' => 'https://instagram.com',
            'tiktok_url' => 'https://tiktok.com',
            'snapchat_url' => 'https://snapchat.com',
            'product_card_default_style' => 'style-1',
            // Show color swatches under product card price (home-fashion demo style).
            'product_card_show_color_swatches' => true,
            'default_filter_position' => 'sidebar',
            'default_pagination_style' => 'numbered',
            // Default product card layout on /products. Each variant ThemeOptionSeeder
            // can spread parent::getThemeOptions() and override to 'list' if its niche
            // (tools/parts/B2B) prefers a list-first showcase.
            'ecommerce_product_item_layout' => 'grid',
            // Responsive column counts for the shop archive grid. Maps to
            // tf-col-{mobile} md-col-{tablet} xl-col-{desktop} on .wrapper-shop.
            'ecommerce_products_per_row' => 4,
            'ecommerce_products_per_row_tablet' => 3,
            'ecommerce_products_per_row_mobile' => 2,
            'enable_quick_view' => true,
            'enable_quick_shop' => true,
            'preloader_enabled' => true,
            'scroll_to_top_enabled' => true,
            'homepage_body_class' => 'home-fashion',
            'site_title' => 'Amerce',
            'seo_title' => 'Amerce — Multi-Purpose eCommerce Theme',
            'seo_description' => 'Amerce is a multi-purpose eCommerce and marketplace theme for Botble CMS — 21 niche presets, sustainable shopping, and fast checkout.',
            'copyright' => '©' . date('Y') . ' Amerce. All Rights Reserved.',
            'newsletter_popup_enable' => true,
            'newsletter_popup_image' => $this->safeFilePath('section/banner-newsletter.jpg'),
            'newsletter_popup_subtitle' => __('Subscribe & Enjoy'),
            'newsletter_popup_title' => __('10% OFF'),
            'newsletter_popup_description' => __('Join our email list & be first to Receive 10% OFF your next order, exclusive offers & more!'),
            'newsletter_popup_delay' => 5,
            'newsletter_popup_display_pages' => json_encode(['public.index']),
            // Contact page defaults — mirror html/contact.html demo so the
            // Contact view renders with realistic info even before an admin
            // edits Theme Options.
            'store_phone' => '+1 666 234 8888',
            'store_email' => 'hi.amere@gmail.com',
            'store_address' => '2163 Phillips Gap Rd, West Jefferson, North Carolina, United States',
            'store_business_hours_weekday' => 'Mon - Sat: 7:30am - 8:00pm PST',
            'store_business_hours_weekend' => 'Sunday: 9:00am - 5:00pm PST',
            'store_map_address' => '2163 Phillips Gap Rd, West Jefferson, NC',
            // Six demo store locations for /our-stores. Storing here removes
            // the need for hardcoded image paths inside our-store.blade.php —
            // safeFilePath() also uploads each image into public storage and
            // generates RvMedia thumbnails on first seed.
            'store_locations' => $this->getStoreLocations(),
        ];
    }

    /**
     * Comma-separated storage paths for footer payment icons. Each PNG in
     * database/seeders/files/payment/ is uploaded via safeFilePath() so it
     * lands in public storage on first seed; the footer blade then resolves
     * these paths through RvMedia::getImageUrl().
     *
     * Missing files are skipped silently (slim installs may not ship them).
     */
    protected function getFooterPaymentIcons(): string
    {
        $files = ['visa.png', 'master-card.png', 'amex.png', 'paypal.png', 'water.png', 'discover.png'];

        $paths = array_filter(array_map(
            fn (string $file) => $this->safeFilePath('payment/' . $file),
            $files
        ));

        return implode(',', $paths);
    }

    /**
     * Demo store cards rendered by views/our-store.blade.php. Image keys are
     * resolved via safeFilePath() so the underlying files in
     * database/seeders/files/section/ are uploaded into public storage with
     * RvMedia thumbnails generated on first seed.
     */
    protected function getStoreLocations(): array
    {
        $stores = [
            ['name' => 'New York Office',     'file' => 'section/store-1.jpg', 'address' => '900 Ocean Dr, Miami Beach, FL 33139, US',                'phone' => '+1 305 555 2468',  'email' => 'hi.amerce@gmail.com'],
            ['name' => 'Los Angeles Store',   'file' => 'section/store-2.jpg', 'address' => '8723 Melrose Avenue, CA 90069, USA',                     'phone' => '+1 305 555 2468',  'email' => 'hi.amerce@gmail.com'],
            ['name' => 'Chicago Boutique',    'file' => 'section/store-3.jpg', 'address' => '415 North Clark Street, Chicago, IL 60654, USA',         'phone' => '+1 305 555 2468',  'email' => 'hi.amerce@gmail.com'],
            ['name' => 'Miami Showroom',      'file' => 'section/store-4.jpg', 'address' => '1101 Brickell Avenue, Miami, FL 33131, USA',             'phone' => '+1 305 555 2468',  'email' => 'hi.amerce@gmail.com'],
            ['name' => 'London Flagship Store', 'file' => 'section/store-5.jpg', 'address' => '152 Regent Street, London W1B 5TF, UK',                  'phone' => '+44 20 555 2468',  'email' => 'hi.amerce@gmail.com'],
            ['name' => 'Paris Atelier',       'file' => 'section/store-6.jpg', 'address' => '18 Rue du Faubourg Saint-Honoré, Paris, France',         'phone' => '+33 1 555 2468',   'email' => 'hi.amerce@gmail.com'],
        ];

        return array_map(function (array $row): array {
            return [
                'name' => $row['name'],
                'image' => $this->safeFilePath($row['file']),
                'address' => $row['address'],
                'phone' => $row['phone'],
                'email' => $row['email'],
            ];
        }, $stores);
    }

    public function run(): void
    {
        $this->createThemeOptions($this->getThemeOptions());
    }

    /**
     * Tolerate missing assets so a slim install can still seed theme options
     * — a missing logo silently becomes null rather than aborting the seeder.
     */
    private function safeFilePath(string $path): ?string
    {
        try {
            return $this->filePath($path);
        } catch (\Throwable) {
            return null;
        }
    }
}
