@php
    use Botble\Base\Facades\BaseHelper;
    use Botble\Media\Facades\RvMedia;

    // Resolve and validate the chosen footer style.
    $allowedFooterStyles = ['style-1', 'style-2', 'style-3', 'style-4', 'style-5', 'style-6', 'style-7', 'style-8', 'style-9'];
    $footerStyle = (string) theme_option('footer_style', 'style-1');

    if (! in_array($footerStyle, $allowedFooterStyles, true)) {
        $footerStyle = 'style-1';
    }

    // Per-style modifier classes appended to `tf-footer`. Outer wrapper does NOT
    // emit `footer-style-{N}` — the demo HTML uses pure semantic classes only
    // (e.g. `tf-footer position-relative` for the home-fashion default).
    $footerModifiers = [
        'style-1' => 'position-relative',
        'style-2' => 'footer-s2 type-reverse bg-dark',
        'style-3' => 'footer-s3 bg-dark',
        'style-4' => 'footer-s4 position-relative',
        'style-5' => 'footer-s5 bg-dark',
        // Style-6 = light cream variant of style-5 (matches home-jewelry's `tf-footer footer-s5 bg-main-5`).
        // Demo home-jewelry footer wrapper has NO `type-light` token — drop to match demo verbatim.
        'style-6' => 'footer-s5 bg-main-5',
        // Style-7 = light 4-col footer with `footer-s6` wrapper (matches home-baby + home-decor).
        'style-7' => 'footer-s6',
        // Style-8 = white-bg variant of style-5 (matches home-fashion-2 `footer-s5 bg-white` verbatim — no `type-light`).
        'style-8' => 'footer-s5 bg-white',
        // Style-9 = bare `tf-footer` (no modifier — matches home-decor + home-fashion-3 footer wrappers).
        // Inner partial (style-9.blade.php) handles content layout. Falls back to style-1 if missing.
        'style-9' => '',
    ];
    $extraModifier = $footerModifiers[$footerStyle] ?? '';
    // Per-preset wrapper modifier OVERRIDE — replaces $extraModifier entirely.
    // Use when a demo's `<footer>` class needs a unique combination not covered by the
    // 8 styles above (e.g. home-pod `footer-s5 type-2 bg-dark`, home-sneaker bare `bg-main`).
    $footerWrapperOverride = trim((string) theme_option('footer_wrapper_override', ''));
    if ($footerWrapperOverride !== '') {
        $extraModifier = $footerWrapperOverride;
    }
    // Per-preset bg override — replaces the bg-* class in the modifier (e.g. preset 17
    // home-garden wants `bg-main-6` instead of style-2's default `bg-dark`).
    $footerExtraBg = trim((string) theme_option('footer_extra_bg', ''));
    if ($footerExtraBg !== '') {
        $extraModifier = trim(preg_replace('/\bbg-[a-z0-9-]+\b/', '', $extraModifier) . ' ' . $footerExtraBg);
    }
    // Per-preset extra class (e.g. `bg-main` cream wash for sneaker preset).
    $footerExtraClass = trim((string) theme_option('footer_extra_class', ''));
    if ($footerExtraClass !== '') {
        $extraModifier = trim($extraModifier . ' ' . $footerExtraClass);
    }
    // Per-preset wrapper modifier append (e.g. preset 9 home-headphone wants `type-2`
    // appended to the style-5 wrapper).
    $footerStyleModifier = trim((string) theme_option('footer_style_modifier', ''));
    if ($footerStyleModifier !== '') {
        $extraModifier = trim($extraModifier . ' ' . $footerStyleModifier);
    }

    // ---------------------------------------------------------------------
    // Shared variables consumed by every style partial.
    // ---------------------------------------------------------------------

    // Contact details — admin-driven. Empty values cause partials to hide.
    extract(amerce_footer_contact());

    // Translation defaults — labels always have a value from __().
    $companyTitle    = (string) theme_option('footer_company_title', __('COMPANY'));
    $customerTitle   = (string) theme_option('footer_customer_title', __('CUSTOMER'));
    $newsletterTitle = (string) theme_option('footer_newsletter_title', __('NEWSLETTER'));
    $newsletterDesc  = (string) theme_option('footer_newsletter_desc', __('Subscribe for store updates and discounts.'));

    $footerCompanySidebar  = dynamic_sidebar('footer_company_sidebar');
    $footerCustomerSidebar = dynamic_sidebar('footer_customer_sidebar');
    // Optional admin-driven strips above the columns row and above the copyright row.
    // Empty = nothing renders (existing design preserved).
    $footerTopSidebar      = trim((string) dynamic_sidebar('footer_top_sidebar'));
    $footerBottomSidebar   = trim((string) dynamic_sidebar('footer_bottom_sidebar'));

    // Default Company / Customer link lists — used when no widget is assigned to the sidebar.
    // URLs match actual page slugs created by PageSeeder.
    // Order mirrors html/home-fashion.html demo footer (5 + 4 items, demo-verbatim labels).
    $defaultCompanyLinks = [
        ['label' => __('About Us'),       'url' => '/about'],
        ['label' => __('Our Stories'),    'url' => '/our-stores'],
        ['label' => __('Contact us'),     'url' => '/contact'],
        ['label' => __('Latest New'),     'url' => '/blog'],
        ['label' => __('My Account'),     'url' => '/account'],
    ];
    $defaultCustomerLinks = [
        ['label' => __('Shipping'),           'url' => '/shipping'],
        ['label' => __('Return & Refund'),    'url' => '/returns-refunds'],
        ['label' => __('Privacy Policy'),     'url' => '/privacy-policy'],
        ['label' => __('Terms & Conditions'), 'url' => '/terms-of-service'],
        ['label' => __('Orders FAQs'),        'url' => '/faq'],
    ];

    // Payment icons — comma-separated storage paths seeded into public storage by
    // ThemeOptionSeeder::getFooterPaymentIcons() (database/seeders/files/payment/).
    // Each entry is resolved to a public URL via RvMedia and rendered with an alt
    // derived from the filename. Empty value hides the row.
    $paymentIconsRaw = (string) theme_option('footer_payment_icons', '');
    $paymentIcons = array_values(array_filter(array_map(
        fn (string $path) => [
            'url' => RvMedia::getImageUrl($path),
            'alt' => pathinfo($path, PATHINFO_FILENAME),
        ],
        array_filter(array_map('trim', explode(',', $paymentIconsRaw)))
    ), fn (array $icon) => $icon['url'] !== ''));

    $socialLinks = method_exists(Theme::class, 'getSocialLinks') ? Theme::getSocialLinks() : '';

    // Social icons — only render entries that have a configured URL.
    $defaultSocials = array_values(array_filter([
        ['url' => (string) theme_option('facebook_url'),  'icon' => 'icon-FacebookLogo',  'name' => __('Facebook')],
        ['url' => (string) theme_option('twitter_url'),   'icon' => 'icon-XLogo',         'name' => __('X')],
        ['url' => (string) theme_option('instagram_url'), 'icon' => 'icon-InstagramLogo', 'name' => __('Instagram')],
        ['url' => (string) theme_option('tiktok_url'),    'icon' => 'icon-TiktokLogo',    'name' => __('TikTok')],
        ['url' => (string) theme_option('snapchat_url'),  'icon' => 'icon-SnapchatLogo',  'name' => __('Snapchat')],
    ], fn (array $s) => $s['url'] !== ''));

    $copyright = Theme::getSiteCopyright();
    $footerContainerClass = theme_option('footer_container_class', 'container-full');

    $footerStylePartialData = compact(
        'footerAddress', 'footerMapUrl', 'footerEmail', 'footerPhone',
        'companyTitle', 'customerTitle', 'newsletterTitle', 'newsletterDesc',
        'footerCompanySidebar', 'footerCustomerSidebar',
        'footerTopSidebar', 'footerBottomSidebar',
        'defaultCompanyLinks', 'defaultCustomerLinks',
        'paymentIcons', 'socialLinks', 'defaultSocials', 'copyright',
        'footerContainerClass'
    );
@endphp

<footer class="tf-footer{{ $extraModifier !== '' ? ' ' . $extraModifier : '' }}">
    @if ($footerTopSidebar)
        <div class="footer-top-strip flat-spacing-sm">
            <div class="container">
                {!! BaseHelper::clean($footerTopSidebar) !!}
            </div>
        </div>
    @endif
    @include(Theme::getThemeNamespace("partials.footer.styles.{$footerStyle}"), $footerStylePartialData)
    @if ($footerBottomSidebar)
        <div class="footer-bottom-strip">
            <div class="container">
                {!! BaseHelper::clean($footerBottomSidebar) !!}
            </div>
        </div>
    @endif
</footer>
