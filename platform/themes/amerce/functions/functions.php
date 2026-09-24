<?php

use Botble\Base\Facades\MetaBox;
use Botble\Base\Forms\FormAbstract;
use Botble\Base\Models\BaseModel;
use Botble\Blog\Models\Post;
use Botble\Contact\Forms\Fronts\ContactForm;
use Botble\Ecommerce\Facades\Cart;
use Botble\Ecommerce\Facades\EcommerceHelper;
use Botble\Ecommerce\Models\ProductCategory;
use Botble\Media\Facades\RvMedia;
use Botble\Menu\Facades\Menu;
use Botble\Newsletter\Facades\Newsletter;
use Botble\Theme\Facades\Theme;
use Botble\Theme\Supports\ThemeSupport;
use Illuminate\Http\Request;

// === Sidebars (16 — shofy parity + amerce-specific) ===
// Header is rendered via 14 hardcoded style files (partials/header/styles/style-N.blade.php),
// not widget-driven — no `header_sidebar` registration. Top bar promo strip CAN be widget-driven.
register_sidebar(['id' => 'header_top_sidebar',                   'name' => __('Header Top'),                      'description' => __('Top bar contact info / promo — overrides theme_option topbar_slides when populated')]);
register_sidebar(['id' => 'blog_sidebar',                         'name' => __('Blog Sidebar'),                    'description' => __('Blog listing & detail sidebar')]);
register_sidebar(['id' => 'footer_top_sidebar',                   'name' => __('Footer Top'),                      'description' => __('Optional strip above footer columns')]);
register_sidebar(['id' => 'footer_company_sidebar',               'name' => __('Footer Company Menu'),             'description' => __('Footer "Company" link list — overrides hardcoded defaults when populated')]);
register_sidebar(['id' => 'footer_customer_sidebar',              'name' => __('Footer Customer Menu'),            'description' => __('Footer "Customer" link list — overrides hardcoded defaults when populated')]);
register_sidebar(['id' => 'footer_bottom_sidebar',                'name' => __('Footer Bottom'),                   'description' => __('Optional strip above copyright bar')]);
register_sidebar(['id' => 'product_details_sidebar',              'name' => __('Product Details'),                 'description' => __('Single product sidebar')]);
register_sidebar(['id' => 'products_listing_top_sidebar',         'name' => __('Products Listing — Top'),          'description' => __('Above shop product grid')]);
register_sidebar(['id' => 'products_listing_bottom_sidebar',      'name' => __('Products Listing — Bottom'),       'description' => __('Below shop product grid')]);
register_sidebar(['id' => 'products_by_category_top_sidebar',     'name' => __('Products by Category — Top'),      'description' => __('Above category archive grid')]);
register_sidebar(['id' => 'products_by_category_bottom_sidebar',  'name' => __('Products by Category — Bottom'),   'description' => __('Below category archive grid')]);
register_sidebar(['id' => 'products_by_brand_top_sidebar',        'name' => __('Products by Brand — Top'),         'description' => __('Above brand archive grid')]);
register_sidebar(['id' => 'products_by_brand_bottom_sidebar',     'name' => __('Products by Brand — Bottom'),      'description' => __('Below brand archive grid')]);
register_sidebar(['id' => 'products_by_tag_top_sidebar',          'name' => __('Products by Tag — Top'),           'description' => __('Above tag archive grid')]);
register_sidebar(['id' => 'products_by_tag_bottom_sidebar',       'name' => __('Products by Tag — Bottom'),        'description' => __('Below tag archive grid')]);
// Note: newsletter popup is managed by the newsletter plugin (registerNewsletterPopup() below) —
// no `popup_sidebar` registration needed.

// === Helpers ===

if (! function_exists('amerce_footer_contact')) {
    /**
     * Single source of truth for footer contact details (address / map URL / email / phone).
     * Consumed by partials/footer.blade.php AND partials/mobile-offcanvas.blade.php.
     * Map URL falls back to a Google Maps search of the address when not explicitly set.
     */
    function amerce_footer_contact(): array
    {
        $address = (string) theme_option('footer_address');

        return [
            'footerAddress' => $address,
            'footerMapUrl' => (string) theme_option('footer_map_url', $address ? 'https://www.google.com/maps?q=' . urlencode($address) : ''),
            'footerEmail' => (string) theme_option('footer_email'),
            'footerPhone' => (string) theme_option('footer_phone'),
        ];
    }
}

// === Page templates ===
register_page_template([
    'default' => __('Default'),
    'homepage' => __('Homepage'),
    'full-width' => __('Full Width'),
    'landing' => __('Landing'),
    'blog-with-sidebar' => __('Blog with Sidebar'),
    'blog-no-sidebar' => __('Blog without Sidebar'),
]);

app()->booted(function () {

    // === Image sizes (responsive thumbnails) ===
    // hero-sm / hero-md use width-only addSize → proportional scaling, preserves
    // any source aspect ratio (hero images vary per customer upload).
    RvMedia::addSize('product-thumb', 480, 600)
        ->addSize('product-grid', 400, 500)
        ->addSize('product-list', 800, 600)
        ->addSize('hero-banner', 1920, 1080)
        ->addSize('hero-sm', 400)
        ->addSize('hero-md', 768)
        ->addSize('medium', 800, 800)
        ->addSize('thumb', 400, 400);

    // === Hero width-only thumbnail height seed ===
    // hero-sm / hero-md are registered width-only via RvMedia::addSize(),
    // which stores the height literal 'auto' in core config. The Settings →
    // Media form renders the height as <input type="number"> which can't
    // display 'auto', so the field looks empty and saving fails as required
    // (MediaSettingRequest enforces required|numeric|min:0 on every size).
    // Pre-seed 0 — which the ThumbnailService treats identically to 'auto'
    // (scales by width only). Only writes if never saved by the admin, so
    // a customer who later sets a fixed height won't have it clobbered.
    // Try/catch guards against fresh-install / migrate-fresh contexts where
    // the settings table may not exist yet when this booted callback fires.
    try {
        foreach (['hero-sm', 'hero-md'] as $widthOnlySize) {
            $settingKey = 'media_sizes_' . $widthOnlySize . '_height';

            if (setting($settingKey) === null) {
                setting()->set($settingKey, 0)->save();
            }
        }
    } catch (\Throwable $exception) {
        // Settings table not ready (fresh install / migrate). Silently skip;
        // next request after migration completes will run the seed.
    }

    // === LCP hero preload cache invalidation ===
    // base.blade.php caches the homepage hero URL via Cache::rememberForever.
    // Without this observer the preload <link> would point at a stale image
    // after admins edit/delete the slider until manual cache:forget.
    if (class_exists(\Botble\SimpleSlider\Models\SimpleSlider::class)) {
        $forgetLcpCache = fn () => \Illuminate\Support\Facades\Cache::forget('amerce.lcp_hero_url');
        \Botble\SimpleSlider\Models\SimpleSlider::saved($forgetLcpCache);
        \Botble\SimpleSlider\Models\SimpleSlider::deleted($forgetLcpCache);
        \Botble\SimpleSlider\Models\SimpleSliderItem::saved($forgetLcpCache);
        \Botble\SimpleSlider\Models\SimpleSliderItem::deleted($forgetLcpCache);
    }

    // === Menu support ===
    Menu::useMenuItemIconImage();

    // === ThemeSupport features ===
    ThemeSupport::registerSiteCopyright();
    ThemeSupport::registerSocialLinks();
    ThemeSupport::registerSocialSharing();
    ThemeSupport::registerPreloader();
    ThemeSupport::registerLazyLoadImages();
    ThemeSupport::registerSiteLogoHeight(40);
    ThemeSupport::registerToastNotification();
    ThemeSupport::registerDateFormatOption();

    // === Newsletter popup (cookie-gated, plugin-managed theme options + JS + view) ===
    if (is_plugin_active('newsletter')) {
        Newsletter::registerNewsletterPopup();
    }

    // === Social Login modal CSS preload ===
    // The social-login plugin enqueues its CSS lazily via BASE_FILTER_AFTER_LOGIN_OR_REGISTER_FORM,
    // which the sign-in / register modal partials call AFTER Theme::header() has emitted assets.
    // As a result the social buttons render unstyled inside the popup. Pre-register the CSS here
    // so it lands in <head> on every frontend page where the modals may render.
    if (is_plugin_active('social-login') && is_plugin_active('ecommerce') && ! auth('customer')->check()) {
        Theme::asset()
            ->usePath(false)
            ->add(
                'social-login-css',
                asset('vendor/core/plugins/social-login/css/social-login.css'),
                [],
                [],
                '1.2.1'
            );
    }
});

// === Single post detail flag ===
// BlogService fires BASE_ACTION_PUBLIC_RENDER_SINGLE before rendering the
// post view. Stash the post on the Theme bag so partials/breadcrumb.blade.php
// can early-return and let post.blade.php render its own page-title-single
// section (matches html/blog-single.html demo, which has no h3 + has a
// nav-post-list of prev/all/next icons).
if (defined('POST_MODULE_SCREEN_NAME')) {
    add_action(BASE_ACTION_PUBLIC_RENDER_SINGLE, function ($screen, $object) {
        if ($screen === POST_MODULE_SCREEN_NAME && $object instanceof Post) {
            Theme::set('renderingPost', $object);
        }
    }, 99, 2);
}

// === Extend contact form to match html/contact.html demo styling ===
// FormAbstract::setupExtended() runs do_action(BASE_FILTER_EXTENDED_FORM, $form)
// after setup(). do_action uses Action listeners (not Filter), so register with
// add_action — add_filter on this hook silently no-ops. At this point the form
// has all fields, but FormFront::renderForm() hasn't yet applied wrapper/input/
// label classes — so mutating $form->setFormInputWrapperClass(...) here flows
// through to every field on render.
if (defined('BASE_FILTER_EXTENDED_FORM')) {
    add_action(BASE_FILTER_EXTENDED_FORM, function ($form) {
        if (! is_plugin_active('contact')) {
            return;
        }

        if (! $form instanceof ContactForm) {
            return;
        }

        // Demo wraps the form in `.form-get`; preserve the existing `contact-form`
        // class so plugin JS (contact-public.js submit handler) still binds.
        $form->setFormOption('class', trim((string) $form->getFormOption('class') . ' form-get'));
        $form->setFormInputWrapperClass('tf-field');
        $form->setFormLabelClass('tf-lable fw-medium');
    }, 100);
}

// Demo wraps every field except the submit button in `<div class="form-content">`.
// The contact plugin's `pre_contact_form` filter renders right after the form
// open tag; `after_contact_form` renders right before the submit-field wrapper —
// exactly where we want to close form-content. Using `form_front_*` filters
// instead would inject inside the submit wrapper and corrupt div nesting.
add_filter('pre_contact_form', function (?string $content): string {
    return ((string) $content) . '<div class="form-content">';
}, 100);

add_filter('after_contact_form', function (?string $content): string {
    return ((string) $content) . '</div>';
}, 100);

// === Mega-menu group support ===
// Default Menu loader eager-loads only `menuNodes.child` (2 levels). The
// Shop dropdown's "Shop Layout / Browse / Account" groups live at level 3,
// so extend the eager-load chain to fetch grandchildren in one query.
add_filter('cms_menu_load_with_relations', function (array $relations): array {
    return array_unique(array_merge($relations, [
        'menuNodes.child.child',
        'menuNodes.child.child.metadata',
        'menuNodes.child.child.reference',
        'menuNodes.child.child.reference.slugable',
    ]));
}, 10);

// === Custom fonts (theme's bundled fonts in admin font picker) ===
add_filter('cms_custom_fonts', function (array $fonts): array {
    return array_merge($fonts, ['DM Sans', 'Urbanist', 'Outfit', 'Kumbh Sans', 'Red Hat Display']);
}, 120);

// === Demo installer presets ===
// theme.json presets[] is read natively by Botble\Theme\Manager::getThemePresets()
// and rendered by the installer's ThemePresetController. No filter wiring needed
// here — entries in theme.json with {id, name, screenshot} are enough. Add a
// 'database' field per preset when shipping a SQL dump per preset.
//
// Per-preset screenshots live at theme root (Botble convention): each preset
// entry references screenshot-{preset-id}.jpg, picked up by
// Theme::getThemeScreenshot() from platform/themes/amerce/.

// Mini-cart needs tax and grand-total values in cart-event AJAX responses so
// the panel can live-update those rows without re-rendering. The plugin only
// emits `total_price` (= subtotal) by default — we extend its response payload
// here with `tax_amount` and `grand_total`, keyed on `tax_enabled` so the
// frontend can decide whether to show the rows.
if (is_plugin_active('ecommerce')) {
    add_filter(BASE_FILTER_BEFORE_RENDER_FORM, function (FormAbstract $form, $data): FormAbstract {
        if (get_class($data) === ProductCategory::class) {
            $form->addAfter('status', 'enabled_size_guide', 'onOff', [
                'label' => __('Enable Size Guide'),
                'label_attr' => ['class' => 'control-label'],
                'default_value' => true,
            ]);
        }

        return $form;
    }, 120, 2);

    add_action(BASE_ACTION_AFTER_CREATE_CONTENT, function (string $type, Request $request, BaseModel $object): void {
        if ($object instanceof ProductCategory && $request->has('enabled_size_guide')) {
            MetaBox::saveMetaBoxData($object, 'enabled_size_guide', $request->input('enabled_size_guide'));
        }
    }, 230, 3);

    add_action(BASE_ACTION_AFTER_UPDATE_CONTENT, function (string $type, Request $request, BaseModel $object): void {
        if ($object instanceof ProductCategory && $request->has('enabled_size_guide')) {
            MetaBox::saveMetaBoxData($object, 'enabled_size_guide', $request->input('enabled_size_guide'));
        }
    }, 230, 3);

    add_filter('ecommerce_cart_data_for_response', function (array $data): array {
        $cart = Cart::instance('cart');
        $taxEnabled = EcommerceHelper::isTaxEnabled();

        $data['tax_enabled'] = $taxEnabled;
        $data['tax_amount']  = $taxEnabled ? format_price($cart->rawTax()) : null;
        $data['grand_total'] = format_price($cart->rawTotal());

        return $data;
    }, 10);
}
