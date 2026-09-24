<?php

// ============================================================
// Generic shortcodes registry
// Filled by phases 04 (core), 05 (content), 06 (promotional).
// Lane A execution: each phase APPENDs to this file in sequence.
// ============================================================

use Botble\Base\Forms\FieldOptions\ColorFieldOption;
use Botble\Base\Forms\FieldOptions\MediaImageFieldOption;
use Botble\Base\Forms\FieldOptions\NumberFieldOption;
use Botble\Base\Forms\FieldOptions\OnOffFieldOption;
use Botble\Base\Forms\FieldOptions\SelectFieldOption;
use Botble\Base\Forms\FieldOptions\TextareaFieldOption;
use Botble\Base\Forms\FieldOptions\TextFieldOption;
use Botble\Base\Forms\FieldOptions\UiSelectorFieldOption;
use Botble\Base\Forms\Fields\ColorField;
use Botble\Base\Forms\Fields\MediaImageField;
use Botble\Base\Forms\Fields\NumberField;
use Botble\Base\Forms\Fields\OnOffField;
use Botble\Base\Forms\Fields\SelectField;
use Botble\Base\Forms\Fields\TextareaField;
use Botble\Base\Forms\Fields\TextField;
use Botble\Base\Forms\Fields\UiSelectorField;
use Botble\Blog\Models\Category;
use Botble\Ecommerce\Models\Brand;
use Botble\Ecommerce\Models\Product;
use Botble\Ecommerce\Models\ProductCategory;
use Botble\Ecommerce\Repositories\Interfaces\ProductInterface;
use Botble\Faq\Models\FaqCategory;
use Botble\Gallery\Models\Gallery;
use Botble\Shortcode\Compilers\Shortcode as ShortcodeCompiler;
use Botble\Shortcode\Facades\Shortcode;
use Botble\Shortcode\Forms\FieldOptions\ShortcodeTabsFieldOption;
use Botble\Shortcode\Forms\Fields\ShortcodeTabsField;
use Botble\Shortcode\Forms\ShortcodeForm;
use Botble\Shortcode\ShortcodeField;
use Botble\Theme\Facades\Theme;
use Botble\Theme\Supports\ThemeSupport;

app()->booted(function () {
    ThemeSupport::registerGoogleMapsShortcode();
    ThemeSupport::registerYoutubeShortcode();
});

// === Core shortcodes (phase-04) ===

// ---- [hero-slideshow] ----
Shortcode::register(
    'hero-slideshow',
    __('Hero Slideshow'),
    __('Full-width slider with text overlay and CTA buttons'),
    function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.hero-slideshow.index', compact('shortcode'));
    }
);

Shortcode::setAdminConfig('hero-slideshow', function (array $attributes) {
    return ShortcodeForm::createFromArray($attributes)
        ->withLazyLoading()
        ->add('style', UiSelectorField::class, UiSelectorFieldOption::make()
            ->label(__('Layout'))
            ->choices([
                'style-default' => ['label' => __('Default'),            'image' => Theme::asset()->url('images/shortcodes/hero-slideshow/style-default.png')],
                'style-fashion' => ['label' => __('Fashion'),            'image' => Theme::asset()->url('images/shortcodes/hero-slideshow/style-fashion.png')],
                'style-furniture-parallax' => ['label' => __('Furniture Parallax'), 'image' => Theme::asset()->url('images/shortcodes/hero-slideshow/style-furniture-parallax.png')],
                'style-organic' => ['label' => __('Organic'),            'image' => Theme::asset()->url('images/shortcodes/hero-slideshow/style-organic.png')],
            ])
            ->defaultValue($attributes['style'] ?? 'style-default')
            ->numberItemsPerRow(4))
        ->add('slides', ShortcodeTabsField::class, ShortcodeTabsFieldOption::make()
            ->label(__('Slides'))
            ->fields([
                'image' => ['title' => __('Image'),       'type' => 'image'],
                'subtitle' => ['title' => __('Subtitle')],
                'title' => ['title' => __('Title')],
                'button_text' => ['title' => __('Button text')],
                'button_url' => ['title' => __('Button URL')],
                'alignment' => ['title' => __('Alignment'), 'type' => 'select', 'options' => ['left' => __('Left'), 'center' => __('Center'), 'right' => __('Right')]],
            ])
            ->attrs($attributes))
        ->add('autoplay', OnOffField::class, OnOffFieldOption::make()
            ->label(__('Autoplay'))
            ->defaultValue($attributes['autoplay'] ?? 'yes'))
        ->add('interval', NumberField::class, NumberFieldOption::make()
            ->label(__('Interval (ms)'))
            ->defaultValue((int) ($attributes['interval'] ?? 3000)))
        ->add('show_arrows', OnOffField::class, OnOffFieldOption::make()
            ->label(__('Show arrows'))
            ->defaultValue($attributes['show_arrows'] ?? 'yes'))
        ->add('show_dots', OnOffField::class, OnOffFieldOption::make()
            ->label(__('Show dots'))
            ->defaultValue($attributes['show_dots'] ?? 'no'));
});

Shortcode::setPreviewImage('hero-slideshow', Theme::asset()->url('images/ui-blocks/hero-slideshow.png'));

// ---- [banner-image-text] ----
Shortcode::register(
    'banner-image-text',
    __('Banner with Image & Text'),
    __('Promotional banner combining a background image with heading, subheading, and CTA'),
    function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.banner-image-text.index', compact('shortcode'));
    }
);

Shortcode::setAdminConfig('banner-image-text', function (array $attributes) {
    return ShortcodeForm::createFromArray($attributes)
        ->withLazyLoading()
        ->add('style', UiSelectorField::class, UiSelectorFieldOption::make()
            ->label(__('Layout'))
            ->choices([
                'style-1' => ['label' => __('Full bleed'),  'image' => Theme::asset()->url('images/shortcodes/banner-image-text/style-1.png')],
                'style-2' => ['label' => __('Text left'),   'image' => Theme::asset()->url('images/shortcodes/banner-image-text/style-2.png')],
                'style-3' => ['label' => __('Text right'),  'image' => Theme::asset()->url('images/shortcodes/banner-image-text/style-3.png')],
            ])
            ->defaultValue($attributes['style'] ?? 'style-1')
            ->numberItemsPerRow(3))
        ->add('image', MediaImageField::class, MediaImageFieldOption::make()
            ->label(__('Image'))
            ->defaultValue($attributes['image'] ?? null))
        ->add('heading', TextField::class, TextFieldOption::make()
            ->label(__('Heading'))
            ->defaultValue($attributes['heading'] ?? ''))
        ->add('subheading', TextareaField::class, TextareaFieldOption::make()
            ->label(__('Subheading'))
            ->defaultValue($attributes['subheading'] ?? ''))
        ->add('button_text', TextField::class, TextFieldOption::make()
            ->label(__('Button text'))
            ->defaultValue($attributes['button_text'] ?? ''))
        ->add('button_url', TextField::class, TextFieldOption::make()
            ->label(__('Button URL'))
            ->defaultValue($attributes['button_url'] ?? ''))
        ->add('overlay_color', ColorField::class, ColorFieldOption::make()
            ->label(__('Overlay color'))
            ->defaultValue($attributes['overlay_color'] ?? ''))
        ->add('text_color', ColorField::class, ColorFieldOption::make()
            ->label(__('Text color'))
            ->defaultValue($attributes['text_color'] ?? ''));
});

Shortcode::setPreviewImage('banner-image-text', Theme::asset()->url('images/ui-blocks/banner-image-text.png'));

// ---- [categories-grid] ----
Shortcode::register(
    'categories-grid',
    __('Categories Grid'),
    __('Showcase product categories in a grid or slider'),
    function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.categories-grid.index', compact('shortcode'));
    }
);

Shortcode::setAdminConfig('categories-grid', function (array $attributes) {
    $categoryChoices = [];
    if (is_plugin_active('ecommerce') && class_exists(ProductCategory::class)) {
        $categoryChoices = ProductCategory::query()
            ->wherePublished()
            ->pluck('name', 'id')
            ->all();
    }

    return ShortcodeForm::createFromArray($attributes)
        ->withLazyLoading()
        ->add('style', UiSelectorField::class, UiSelectorFieldOption::make()
            ->label(__('Layout'))
            ->choices([
                'style-grid-4' => ['label' => __('Grid 4 cols'), 'image' => Theme::asset()->url('images/shortcodes/categories-grid/style-grid-4.png')],
                'style-grid-5' => ['label' => __('Grid 5 cols'), 'image' => Theme::asset()->url('images/shortcodes/categories-grid/style-grid-5.png')],
                'style-grid-6' => ['label' => __('Grid 6 cols'), 'image' => Theme::asset()->url('images/shortcodes/categories-grid/style-grid-6.png')],
                'style-slider' => ['label' => __('Slider'),       'image' => Theme::asset()->url('images/shortcodes/categories-grid/style-slider.png')],
                'style-slider-icon' => ['label' => __('Slider — icon cards'), 'image' => Theme::asset()->url('images/shortcodes/categories-grid/style-slider-icon.png')],
                'style-slider-cta' => ['label' => __('Slider — with CTA card'), 'image' => Theme::asset()->url('images/shortcodes/categories-grid/style-slider-cta.png')],
                'style-slider-circle' => ['label' => __('Slider — circular'), 'image' => Theme::asset()->url('images/shortcodes/categories-grid/style-slider-circle.png')],
                'style-card-vertical' => ['label' => __('Card — vertical'),   'image' => Theme::asset()->url('images/shortcodes/categories-grid/style-card-vertical.png')],
            ])
            ->defaultValue($attributes['style'] ?? 'style-grid-4')
            ->numberItemsPerRow(4))
        ->add('title', TextField::class, TextFieldOption::make()
            ->label(__('Title'))
            ->defaultValue($attributes['title'] ?? ''))
        ->add('subtitle', TextareaField::class, TextareaFieldOption::make()
            ->label(__('Subtitle'))
            ->defaultValue($attributes['subtitle'] ?? ''))
        ->add('category_ids', SelectField::class, SelectFieldOption::make()
            ->label(__('Categories'))
            ->choices($categoryChoices)
            ->multiple()
            ->searchable()
            ->selected(ShortcodeField::parseIds($attributes['category_ids'] ?? null) ?? []))
        ->add('show_count', OnOffField::class, OnOffFieldOption::make()
            ->label(__('Show product count'))
            ->defaultValue($attributes['show_count'] ?? 'no'))
        ->add('limit', NumberField::class, NumberFieldOption::make()
            ->label(__('Limit'))
            ->defaultValue((int) ($attributes['limit'] ?? 8)))
        ->add('cta_label', TextField::class, TextFieldOption::make()
            ->label(__('CTA card label (style-slider-cta only)'))
            ->helperText(__('Leave blank to hide the leading promo card.'))
            ->defaultValue($attributes['cta_label'] ?? ''))
        ->add('cta_count', TextField::class, TextFieldOption::make()
            ->label(__('CTA card count text'))
            ->defaultValue($attributes['cta_count'] ?? ''))
        ->add('cta_url', TextField::class, TextFieldOption::make()
            ->label(__('CTA card link URL'))
            ->defaultValue($attributes['cta_url'] ?? ''))
        ->add('cta_icon', TextField::class, TextFieldOption::make()
            ->label(__('CTA card icon class'))
            ->helperText(__('icomoon class — e.g. icon-SealPercent'))
            ->defaultValue($attributes['cta_icon'] ?? 'icon-SealPercent'));
});

Shortcode::setPreviewImage('categories-grid', Theme::asset()->url('images/ui-blocks/categories-grid.png'));

// ---- [parallax-banner] ----
Shortcode::register(
    'parallax-banner',
    __('Parallax Banner'),
    __('Banner section with parallax background and overlayed content'),
    function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.parallax-banner.index', compact('shortcode'));
    }
);

Shortcode::setAdminConfig('parallax-banner', function (array $attributes) {
    return ShortcodeForm::createFromArray($attributes)
        ->withLazyLoading()
        ->add('style', UiSelectorField::class, UiSelectorFieldOption::make()
            ->label(__('Layout'))
            ->choices([
                'style-1' => ['label' => __('Full width'),  'image' => Theme::asset()->url('images/shortcodes/parallax-banner/style-1.png')],
                'style-2' => ['label' => __('Constrained'), 'image' => Theme::asset()->url('images/shortcodes/parallax-banner/style-2.png')],
            ])
            ->defaultValue($attributes['style'] ?? 'style-1')
            ->numberItemsPerRow(2))
        ->add('image', MediaImageField::class, MediaImageFieldOption::make()
            ->label(__('Background image'))
            ->defaultValue($attributes['image'] ?? $attributes['background_image'] ?? null))
        ->add('heading', TextField::class, TextFieldOption::make()
            ->label(__('Heading'))
            ->defaultValue($attributes['heading'] ?? ''))
        ->add('subheading', TextareaField::class, TextareaFieldOption::make()
            ->label(__('Subheading'))
            ->defaultValue($attributes['subheading'] ?? ''))
        ->add('button_text', TextField::class, TextFieldOption::make()
            ->label(__('Button text'))
            ->defaultValue($attributes['button_text'] ?? ''))
        ->add('button_url', TextField::class, TextFieldOption::make()
            ->label(__('Button URL'))
            ->defaultValue($attributes['button_url'] ?? ''))
        ->add('height', NumberField::class, NumberFieldOption::make()
            ->label(__('Height (px)'))
            ->defaultValue((int) ($attributes['height'] ?? 480)))
        ->add('text_alignment', SelectField::class, SelectFieldOption::make()
            ->label(__('Text alignment'))
            ->choices(['left' => __('Left'), 'center' => __('Center'), 'right' => __('Right')])
            ->selected($attributes['text_alignment'] ?? 'center'))
        ->add('marquee_text', TextField::class, TextFieldOption::make()
            ->label(__('Marquee ribbon (comma-separated, style-1 only)'))
            ->helperText(__('Leave empty to hide the looping ribbon under the banner.'))
            ->defaultValue($attributes['marquee_text'] ?? 'NEW SEASON PICKS, TRENDING STYLES, LIMITED DROPS'));
});

Shortcode::setPreviewImage('parallax-banner', Theme::asset()->url('images/ui-blocks/parallax-banner.png'));

// ---- [banner-contact-form] ----
Shortcode::register(
    'banner-contact-form',
    __('Banner + Contact Form'),
    __('Two-column section with a promotional banner on the left and a contact form on the right'),
    function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.banner-contact-form.index', compact('shortcode'));
    }
);

Shortcode::setAdminConfig('banner-contact-form', function (array $attributes) {
    return ShortcodeForm::createFromArray($attributes)
        ->withLazyLoading()
        ->add('image', MediaImageField::class, MediaImageFieldOption::make()
            ->label(__('Banner image'))
            ->defaultValue($attributes['image'] ?? null))
        ->add('title', TextField::class, TextFieldOption::make()
            ->label(__('Banner title'))
            ->defaultValue($attributes['title'] ?? ''))
        ->add('subtitle', TextareaField::class, TextareaFieldOption::make()
            ->label(__('Banner subtitle'))
            ->defaultValue($attributes['subtitle'] ?? ''))
        ->add('button_text', TextField::class, TextFieldOption::make()
            ->label(__('Banner button text'))
            ->defaultValue($attributes['button_text'] ?? ''))
        ->add('button_url', TextField::class, TextFieldOption::make()
            ->label(__('Banner button URL'))
            ->defaultValue($attributes['button_url'] ?? ''))
        ->add('contact_title', TextField::class, TextFieldOption::make()
            ->label(__('Contact form title'))
            ->defaultValue($attributes['contact_title'] ?? ''))
        ->add('contact_subtitle', TextareaField::class, TextareaFieldOption::make()
            ->label(__('Contact form subtitle'))
            ->defaultValue($attributes['contact_subtitle'] ?? ''));
});

Shortcode::setPreviewImage('banner-contact-form', Theme::asset()->url('images/ui-blocks/banner-contact-form.png'));

// ---- [banner-products-composite] ----
// Mirrors html/home-fashion.html "Weekly Top Highlights" — 2-column row with
// banner LEFT and a 2x2 product grid RIGHT (4 latest/featured products).
Shortcode::register(
    'banner-products-composite',
    __('Banner + Products Composite'),
    __('Two-column layout: hero banner on left + 2x2 product grid on right (Weekly Top Highlights demo)'),
    function (ShortcodeCompiler $shortcode) {
        $products = collect();
        if (is_plugin_active('ecommerce') && class_exists(Product::class)) {
            $repo = app(ProductInterface::class);
            $source = $shortcode->source ?: 'featured';
            $with = ['slugable', 'productCollections', 'productLabels', 'productAttributeSets', 'variations.productAttributes', 'taxes'];
            if (is_plugin_active('marketplace')) {
                $with[] = 'store';
            }
            $params = [
                'paginate' => false,
                'take' => (int) ($shortcode->limit ?: 4),
                'with' => $with,
            ];
            if ($source === 'featured') {
                $params['condition']['ec_products.is_featured'] = 1;
            } elseif ($source === 'best-seller') {
                $params['order_by'] = ['ec_products.views' => 'DESC'];
            } else {
                $params['order_by'] = ['ec_products.created_at' => 'DESC'];
            }
            $products = $repo->getProducts($params);
        }

        return Theme::partial('shortcodes.banner-products-composite.index', compact('shortcode', 'products'));
    }
);

Shortcode::setAdminConfig('banner-products-composite', function (array $attributes) {
    return ShortcodeForm::createFromArray($attributes)
        ->withLazyLoading()
        ->add('style', 'customSelect', [
            'label' => __('Layout style'),
            'choices' => [
                'style-fashion' => __('Fashion (banner LEFT col-6 + 2x2 grid)'),
                'style-organic' => __('Organic (banner LEFT col-4 + 3x2 grid + View All CTA)'),
            ],
            'default_value' => $attributes['style'] ?? 'style-fashion',
        ])
        ->add('title', TextField::class, TextFieldOption::make()->label(__('Section title')))
        ->add('subtitle', TextareaField::class, TextareaFieldOption::make()->label(__('Section subtitle')))
        ->add('image', MediaImageField::class, MediaImageFieldOption::make()
            ->label(__('Banner image'))
            ->defaultValue($attributes['image'] ?? null))
        ->add('overline', TextField::class, TextFieldOption::make()
            ->label(__('Banner overline (style-fashion)'))
            ->defaultValue($attributes['overline'] ?? ''))
        ->add('heading', TextField::class, TextFieldOption::make()
            ->label(__('Banner heading (style-fashion)'))
            ->defaultValue($attributes['heading'] ?? ''))
        ->add('banner_subtitle', TextField::class, TextFieldOption::make()
            ->label(__('Banner subtitle (style-organic)'))
            ->defaultValue($attributes['banner_subtitle'] ?? ''))
        ->add('banner_heading', TextField::class, TextFieldOption::make()
            ->label(__('Banner heading (style-organic)'))
            ->defaultValue($attributes['banner_heading'] ?? ''))
        ->add('banner_button_text', TextField::class, TextFieldOption::make()
            ->label(__('Banner button text (style-organic)'))
            ->defaultValue($attributes['banner_button_text'] ?? __('Shop Now')))
        ->add('banner_button_url', TextField::class, TextFieldOption::make()
            ->label(__('Banner button URL (style-organic)'))
            ->defaultValue($attributes['banner_button_url'] ?? '/products'))
        ->add('button_text', TextField::class, TextFieldOption::make()
            ->label(__('Banner button text (style-fashion)'))
            ->defaultValue($attributes['button_text'] ?? __('Shop Now')))
        ->add('button_url', TextField::class, TextFieldOption::make()
            ->label(__('Banner button URL (style-fashion)'))
            ->defaultValue($attributes['button_url'] ?? '/products'))
        ->add('view_all_url', TextField::class, TextFieldOption::make()
            ->label(__('View All URL (style-organic)'))
            ->defaultValue($attributes['view_all_url'] ?? '/products'))
        ->add('view_all_text', TextField::class, TextFieldOption::make()
            ->label(__('View All text (style-organic)'))
            ->defaultValue($attributes['view_all_text'] ?? __('View All Products')))
        ->add('source', 'customRadio', [
            'label' => __('Product source'),
            'choices' => [
                'latest' => __('Latest'),
                'featured' => __('Featured'),
                'best-seller' => __('Best sellers'),
            ],
            'default_value' => $attributes['source'] ?? 'featured',
        ])
        ->add('limit', NumberField::class, NumberFieldOption::make()
            ->label(__('Product limit'))
            ->defaultValue((int) ($attributes['limit'] ?? 4)));
});

Shortcode::setPreviewImage('banner-products-composite', Theme::asset()->url('images/ui-blocks/banner-products-composite.png'));

// ---- [banner-countdown] ----
Shortcode::register(
    'banner-countdown',
    __('Banner with Countdown'),
    __('Promotional banner with image, heading and a countdown timer'),
    function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.banner-countdown.index', compact('shortcode'));
    }
);

Shortcode::setAdminConfig('banner-countdown', function (array $attributes) {
    return ShortcodeForm::createFromArray($attributes)
        ->withLazyLoading()
        ->add('style', UiSelectorField::class, UiSelectorFieldOption::make()
            ->label(__('Layout'))
            ->choices([
                'style-1' => ['label' => __('Style 1'), 'image' => Theme::asset()->url('images/shortcodes/banner-countdown/style-1.png')],
                'style-2' => ['label' => __('Style 2'), 'image' => Theme::asset()->url('images/shortcodes/banner-countdown/style-2.png')],
                'style-3' => ['label' => __('Style 3'), 'image' => Theme::asset()->url('images/shortcodes/banner-countdown/style-3.png')],
                'style-4' => ['label' => __('Style 4'), 'image' => Theme::asset()->url('images/shortcodes/banner-countdown/style-4.png')],
            ])
            ->defaultValue($attributes['style'] ?? 'style-1')
            ->numberItemsPerRow(4))
        ->add('background_image', MediaImageField::class, MediaImageFieldOption::make()
            ->label(__('Background image'))
            ->defaultValue($attributes['background_image'] ?? null))
        ->add('heading', TextField::class, TextFieldOption::make()
            ->label(__('Heading'))
            ->defaultValue($attributes['heading'] ?? ''))
        ->add('subheading', TextareaField::class, TextareaFieldOption::make()
            ->label(__('Subheading'))
            ->defaultValue($attributes['subheading'] ?? ''))
        ->add('target_date', TextField::class, TextFieldOption::make()
            ->label(__('Target date (YYYY-MM-DD HH:MM)'))
            ->defaultValue($attributes['target_date'] ?? ''))
        ->add('button_text', TextField::class, TextFieldOption::make()
            ->label(__('Button text'))
            ->defaultValue($attributes['button_text'] ?? __('Shop Now')))
        ->add('button_url', TextField::class, TextFieldOption::make()
            ->label(__('Button URL'))
            ->defaultValue($attributes['button_url'] ?? ''))
        ->add('target_url_label', TextField::class, TextFieldOption::make()
            ->label(__('Target URL label'))
            ->defaultValue($attributes['target_url_label'] ?? ''))
        // Style-1 (banner-countdown-v01) advanced layout overrides — used to mirror
        // specific HTML demo variants (bg-primary, bg-dark, style-2/3/4 modifiers,
        // container vs container-2 vs container-full).
        ->add('background_class', SelectField::class, SelectFieldOption::make()
            ->label(__('Background variant (style-1 only)'))
            ->choices([
                '' => __('— Default —'),
                'bg-primary' => __('Primary'),
                'bg-dark' => __('Dark'),
            ])
            ->selected($attributes['background_class'] ?? ''))
        ->add('style_modifier', SelectField::class, SelectFieldOption::make()
            ->label(__('Layout modifier (style-1 only)'))
            ->choices([
                '' => __('— None —'),
                'style-2' => __('Style 2 (full-width dark)'),
                'style-3' => __('Style 3 (compact)'),
                'style-4' => __('Style 4 (with background image)'),
            ])
            ->selected($attributes['style_modifier'] ?? ''))
        ->add('container_class', SelectField::class, SelectFieldOption::make()
            ->label(__('Container width (style-1 only)'))
            ->choices([
                'container' => __('Standard'),
                'container-2' => __('Wide'),
                'container-full' => __('Full width'),
            ])
            ->selected($attributes['container_class'] ?? 'container'))
        ->add('show_image', SelectField::class, SelectFieldOption::make()
            ->label(__('Show background image (style-1 + style-4 modifier)'))
            ->choices(['' => __('No'), 'yes' => __('Yes')])
            ->selected($attributes['show_image'] ?? ''));
});

Shortcode::setPreviewImage('banner-countdown', Theme::asset()->url('images/ui-blocks/banner-countdown.png'));

// ---- [site-features] ----
Shortcode::register(
    'site-features',
    __('Site Features'),
    __('Trust badges row (free shipping, secure payment, returns, support)'),
    function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.site-features.index', compact('shortcode'));
    }
);

Shortcode::setAdminConfig('site-features', function (array $attributes) {
    return ShortcodeForm::createFromArray($attributes)
        ->withLazyLoading()
        ->add('style', UiSelectorField::class, UiSelectorFieldOption::make()
            ->label(__('Layout'))
            ->choices([
                'style-1' => ['label' => __('4-icon bar'),         'image' => Theme::asset()->url('images/shortcodes/site-features/style-1.png')],
                'style-2' => ['label' => __('3-col w/background'), 'image' => Theme::asset()->url('images/shortcodes/site-features/style-2.png')],
                'style-3' => ['label' => __('Icons only'),         'image' => Theme::asset()->url('images/shortcodes/site-features/style-3.png')],
                'style-flat-swiper' => ['label' => __('Flat 4-up swiper'), 'image' => Theme::asset()->url('images/shortcodes/site-features/style-flat-swiper.png')],
            ])
            ->defaultValue($attributes['style'] ?? 'style-1')
            ->numberItemsPerRow(2))
        ->add('items', ShortcodeTabsField::class, ShortcodeTabsFieldOption::make()
            ->label(__('Features'))
            ->fields([
                'icon_class' => ['title' => __('Icon class')],
                'title' => ['title' => __('Title')],
                'description' => ['title' => __('Description')],
            ])
            ->attrs($attributes));
});

Shortcode::setPreviewImage('site-features', Theme::asset()->url('images/ui-blocks/site-features.png'));

// === Content shortcodes (phase-05) ===

// ---- [testimonials] ----
Shortcode::register(
    'testimonials',
    __('Testimonials'),
    __('Customer testimonials slider with avatar, name, role, quote, rating'),
    function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.testimonials.index', compact('shortcode'));
    }
);

Shortcode::setAdminConfig('testimonials', function (array $attributes) {
    return ShortcodeForm::createFromArray($attributes)
        ->withLazyLoading()
        ->add('style', UiSelectorField::class, UiSelectorFieldOption::make()
            ->label(__('Layout'))
            ->choices([
                'style-v1' => ['label' => __('Default'),       'image' => Theme::asset()->url('images/shortcodes/testimonials/style-v1.png')],
                'style-v2' => ['label' => __('Cards'),         'image' => Theme::asset()->url('images/shortcodes/testimonials/style-v2.png')],
                'style-thumbs' => ['label' => __('With thumbs'),   'image' => Theme::asset()->url('images/shortcodes/testimonials/style-thumbs.png')],
                'style-v3-product' => ['label' => __('With product'),  'image' => Theme::asset()->url('images/shortcodes/testimonials/style-v3-product.png')],
                'style-image-card' => ['label' => __('Image card'),    'image' => Theme::asset()->url('images/shortcodes/testimonials/style-image-card.png')],
                'style-organic-verified' => ['label' => __('Organic verified'), 'image' => Theme::asset()->url('images/shortcodes/testimonials/style-organic-verified.png')],
            ])
            ->defaultValue($attributes['style'] ?? 'style-v1')
            ->numberItemsPerRow(6))
        ->add('title', TextField::class, TextFieldOption::make()
            ->label(__('Title'))
            ->defaultValue($attributes['title'] ?? ''))
        ->add('subtitle', TextareaField::class, TextareaFieldOption::make()
            ->label(__('Subtitle'))
            ->defaultValue($attributes['subtitle'] ?? ''))
        ->add('items', ShortcodeTabsField::class, ShortcodeTabsFieldOption::make()
            ->label(__('Testimonials'))
            ->fields([
                'avatar' => ['title' => __('Image / avatar'), 'type' => 'image'],
                'name' => ['title' => __('Name')],
                'role' => ['title' => __('Role / badge')],
                'content' => ['title' => __('Content')],
                'rating' => ['title' => __('Rating (1-5)')],
                'product_image' => ['title' => __('Product image (style "with product")'), 'type' => 'image'],
                'product_name' => ['title' => __('Product name (style "with product")')],
                'product_price' => ['title' => __('Product price (style "with product")')],
                'product_url' => ['title' => __('Product URL (style "with product")')],
            ])
            ->attrs($attributes))
        ->add('autoplay', OnOffField::class, OnOffFieldOption::make()
            ->label(__('Autoplay'))
            ->defaultValue($attributes['autoplay'] ?? 'yes'));
});

Shortcode::setPreviewImage('testimonials', Theme::asset()->url('images/ui-blocks/testimonials.png'));

// ---- [lookbook-hotspot] ----
Shortcode::register(
    'lookbook-hotspot',
    __('Lookbook with Hotspots'),
    __('Image with shoppable hotspots linked to products'),
    function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.lookbook-hotspot.index', compact('shortcode'));
    }
);

Shortcode::setAdminConfig('lookbook-hotspot', function (array $attributes) {
    return ShortcodeForm::createFromArray($attributes)
        ->withLazyLoading()
        ->add('style', UiSelectorField::class, UiSelectorFieldOption::make()
            ->label(__('Layout'))
            ->choices([
                'style-v1' => ['label' => __('Single image'),    'image' => Theme::asset()->url('images/shortcodes/lookbook-hotspot/style-v1.png')],
                'style-v2' => ['label' => __('Image + product list'), 'image' => Theme::asset()->url('images/shortcodes/lookbook-hotspot/style-v2.png')],
                'style-v3' => ['label' => __('Two images'),       'image' => Theme::asset()->url('images/shortcodes/lookbook-hotspot/style-v3.png')],
                'style-v4-carousel' => ['label' => __('Carousel + Banner'), 'image' => Theme::asset()->url('images/shortcodes/lookbook-hotspot/style-v4-carousel.png')],
                'style-bundle-carousel-left' => ['label' => __('Bundle: Carousel left + Banner right'), 'image' => Theme::asset()->url('images/shortcodes/lookbook-hotspot/style-bundle-carousel-left.png')],
            ])
            ->defaultValue($attributes['style'] ?? 'style-v1')
            ->numberItemsPerRow(4))
        ->add('image', MediaImageField::class, MediaImageFieldOption::make()
            ->label(__('Lookbook image'))
            ->defaultValue($attributes['image'] ?? null))
        ->add('image_2', MediaImageField::class, MediaImageFieldOption::make()
            ->label(__('Second image (used by "Two images" layout)'))
            ->defaultValue($attributes['image_2'] ?? null))
        ->add('hotspots', ShortcodeTabsField::class, ShortcodeTabsFieldOption::make()
            ->label(__('Hotspots'))
            ->fields([
                'x_percent' => ['title' => __('X (%)')],
                'y_percent' => ['title' => __('Y (%)')],
                'product_id' => ['title' => __('Product ID')],
                'column' => ['title' => __('Column (1 or 2 — only "Two images" layout)')],
            ])
            ->attrs($attributes));
});

Shortcode::setPreviewImage('lookbook-hotspot', Theme::asset()->url('images/ui-blocks/lookbook-hotspot.png'));

// ---- [blog-posts] ----
Shortcode::register(
    'blog-posts',
    __('Blog Posts'),
    __('Latest blog posts as grid, slider, or list'),
    function (ShortcodeCompiler $shortcode) {
        if (! is_plugin_active('blog')) {
            return '';
        }

        return Theme::partial('shortcodes.blog-posts.index', compact('shortcode'));
    }
);

Shortcode::setAdminConfig('blog-posts', function (array $attributes) {
    $categoryChoices = [];
    if (is_plugin_active('blog') && class_exists(Category::class)) {
        $categoryChoices = Category::query()
            ->wherePublished()
            ->pluck('name', 'id')
            ->all();
    }

    return ShortcodeForm::createFromArray($attributes)
        ->withLazyLoading()
        ->add('style', UiSelectorField::class, UiSelectorFieldOption::make()
            ->label(__('Layout'))
            ->choices([
                'style-grid' => ['label' => __('Grid'),   'image' => Theme::asset()->url('images/shortcodes/blog-posts/style-grid.png')],
                'style-slider' => ['label' => __('Slider'), 'image' => Theme::asset()->url('images/shortcodes/blog-posts/style-slider.png')],
                'style-list' => ['label' => __('List'),   'image' => Theme::asset()->url('images/shortcodes/blog-posts/style-list.png')],
            ])
            ->defaultValue($attributes['style'] ?? 'style-grid')
            ->numberItemsPerRow(3))
        ->add('title', TextField::class, TextFieldOption::make()
            ->label(__('Title'))
            ->defaultValue($attributes['title'] ?? ''))
        ->add('category_ids', SelectField::class, SelectFieldOption::make()
            ->label(__('Categories'))
            ->choices($categoryChoices)
            ->multiple()
            ->searchable()
            ->selected(ShortcodeField::parseIds($attributes['category_ids'] ?? null) ?? []))
        ->add('limit', NumberField::class, NumberFieldOption::make()
            ->label(__('Limit'))
            ->defaultValue((int) ($attributes['limit'] ?? 6)))
        ->add('show_excerpt', OnOffField::class, OnOffFieldOption::make()
            ->label(__('Show excerpt'))
            ->defaultValue($attributes['show_excerpt'] ?? 'yes'))
        ->add('show_meta', OnOffField::class, OnOffFieldOption::make()
            ->label(__('Show meta (date, author)'))
            ->defaultValue($attributes['show_meta'] ?? 'yes'));
});

Shortcode::setPreviewImage('blog-posts', Theme::asset()->url('images/ui-blocks/blog-posts.png'));

// ---- [team-members] ----
Shortcode::register(
    'team-members',
    __('Team Members'),
    __('Showcase team members with photo, role, bio, and socials'),
    function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.team-members.index', compact('shortcode'));
    }
);

Shortcode::setAdminConfig('team-members', function (array $attributes) {
    return ShortcodeForm::createFromArray($attributes)
        ->withLazyLoading()
        ->add('style', UiSelectorField::class, UiSelectorFieldOption::make()
            ->label(__('Layout'))
            ->choices([
                'style-grid' => ['label' => __('Grid'),   'image' => Theme::asset()->url('images/shortcodes/team-members/style-grid.png')],
                'style-slider' => ['label' => __('Slider'), 'image' => Theme::asset()->url('images/shortcodes/team-members/style-slider.png')],
            ])
            ->defaultValue($attributes['style'] ?? 'style-grid')
            ->numberItemsPerRow(2))
        ->add('title', TextField::class, TextFieldOption::make()
            ->label(__('Title'))
            ->defaultValue($attributes['title'] ?? ''))
        ->add('members', ShortcodeTabsField::class, ShortcodeTabsFieldOption::make()
            ->label(__('Members'))
            ->fields([
                'photo' => ['title' => __('Photo'), 'type' => 'image'],
                'name' => ['title' => __('Name')],
                'role' => ['title' => __('Role')],
                'bio' => ['title' => __('Bio')],
                'social_links' => ['title' => __('Social links (JSON)')],
            ])
            ->attrs($attributes));
});

Shortcode::setPreviewImage('team-members', Theme::asset()->url('images/ui-blocks/team-members.png'));

// ---- [faq-list] ----
Shortcode::register(
    'faq-list',
    __('FAQ List'),
    __('Frequently asked questions in accordion or tabbed layout'),
    function (ShortcodeCompiler $shortcode) {
        if (! is_plugin_active('faq')) {
            return '';
        }

        return Theme::partial('shortcodes.faq-list.index', compact('shortcode'));
    }
);

Shortcode::setAdminConfig('faq-list', function (array $attributes) {
    $categoryChoices = [];
    if (is_plugin_active('faq') && class_exists(FaqCategory::class)) {
        $categoryChoices = FaqCategory::query()
            ->wherePublished()
            ->pluck('name', 'id')
            ->all();
    }

    return ShortcodeForm::createFromArray($attributes)
        ->withLazyLoading()
        ->add('style', UiSelectorField::class, UiSelectorFieldOption::make()
            ->label(__('Layout'))
            ->choices([
                'style-accordion' => ['label' => __('Accordion'), 'image' => Theme::asset()->url('images/shortcodes/faq-list/style-accordion.png')],
                'style-tabs' => ['label' => __('Tabbed'),    'image' => Theme::asset()->url('images/shortcodes/faq-list/style-tabs.png')],
                'style-side-cta' => ['label' => __('Two-column (side CTA)'), 'image' => Theme::asset()->url('images/shortcodes/faq-list/style-side-cta.png')],
            ])
            ->defaultValue($attributes['style'] ?? 'style-accordion')
            ->numberItemsPerRow(2))
        ->add('title', TextField::class, TextFieldOption::make()
            ->label(__('Title'))
            ->defaultValue($attributes['title'] ?? ''))
        // subtitle / button_text / button_url drive the LEFT column of the
        // style-side-cta two-column layout; ignored by accordion / tabs.
        ->add('subtitle', TextareaField::class, TextareaFieldOption::make()
            ->label(__('Subtitle (side-CTA layout only)'))
            ->defaultValue($attributes['subtitle'] ?? ''))
        ->add('button_text', TextField::class, TextFieldOption::make()
            ->label(__('Button text (side-CTA layout only)'))
            ->defaultValue($attributes['button_text'] ?? ''))
        ->add('button_url', TextField::class, TextFieldOption::make()
            ->label(__('Button URL (side-CTA layout only)'))
            ->defaultValue($attributes['button_url'] ?? ''))
        ->add('faq_category_id', SelectField::class, SelectFieldOption::make()
            ->label(__('FAQ category'))
            ->choices(['' => __('All categories')] + $categoryChoices)
            ->selected($attributes['faq_category_id'] ?? ''))
        ->add('limit', NumberField::class, NumberFieldOption::make()
            ->label(__('Limit'))
            ->defaultValue((int) ($attributes['limit'] ?? 10)));
});

Shortcode::setPreviewImage('faq-list', Theme::asset()->url('images/ui-blocks/faq-list.png'));

// === Promotional shortcodes (phase-06) ===

// ---- [product-feature-zoom] ----
Shortcode::register(
    'product-feature-zoom',
    __('Product Feature with Zoom'),
    __('Zoom-on-hover product showcase with optional hotspots'),
    function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.product-feature-zoom.index', compact('shortcode'));
    }
);

Shortcode::setAdminConfig('product-feature-zoom', function (array $attributes) {
    $productChoices = [];
    if (is_plugin_active('ecommerce') && class_exists(Product::class)) {
        $productChoices = Product::query()
            ->wherePublished()
            ->where('is_variation', 0)
            ->limit(200)
            ->pluck('name', 'id')
            ->all();
    }

    return ShortcodeForm::createFromArray($attributes)
        ->withLazyLoading()
        ->add('style', UiSelectorField::class, UiSelectorFieldOption::make()
            ->label(__('Layout'))
            ->choices([
                'style-1' => ['label' => __('Default'), 'image' => Theme::asset()->url('images/shortcodes/product-feature-zoom/style-1.png')],
                'style-2-detail' => ['label' => __('Detail (vertical thumbs + zoom + product info)'), 'image' => Theme::asset()->url('images/shortcodes/product-feature-zoom/style-2-detail.png')],
            ])
            ->defaultValue($attributes['style'] ?? 'style-1')
            ->numberItemsPerRow(2))
        ->add('image', MediaImageField::class, MediaImageFieldOption::make()
            ->label(__('Image'))
            ->defaultValue($attributes['image'] ?? null))
        ->add('product_id', SelectField::class, SelectFieldOption::make()
            ->label(__('Product'))
            ->choices(['' => __('— Select product —')] + $productChoices)
            ->searchable()
            ->selected($attributes['product_id'] ?? ''))
        ->add('heading', TextField::class, TextFieldOption::make()
            ->label(__('Heading'))
            ->defaultValue($attributes['heading'] ?? ''))
        ->add('subheading', TextareaField::class, TextareaFieldOption::make()
            ->label(__('Subheading'))
            ->defaultValue($attributes['subheading'] ?? ''))
        ->add('hotspots', ShortcodeTabsField::class, ShortcodeTabsFieldOption::make()
            ->label(__('Hotspots'))
            ->fields([
                'x' => ['title' => __('X (%)')],
                'y' => ['title' => __('Y (%)')],
                'label' => ['title' => __('Label')],
            ])
            ->attrs($attributes));
});

Shortcode::setPreviewImage('product-feature-zoom', Theme::asset()->url('images/ui-blocks/product-feature-zoom.png'));

// ---- [banner-collection] ----
Shortcode::register(
    'banner-collection',
    __('Banner Collection'),
    __('Promotional collection banner with badge and CTA'),
    function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.banner-collection.index', compact('shortcode'));
    }
);

Shortcode::setAdminConfig('banner-collection', function (array $attributes) {
    return ShortcodeForm::createFromArray($attributes)
        ->withLazyLoading()
        ->add('style', UiSelectorField::class, UiSelectorFieldOption::make()
            ->label(__('Layout'))
            ->choices([
                'style-1' => ['label' => __('Style 1'), 'image' => Theme::asset()->url('images/shortcodes/banner-collection/style-1.png')],
                'style-2' => ['label' => __('Style 2'), 'image' => Theme::asset()->url('images/shortcodes/banner-collection/style-2.png')],
            ])
            ->defaultValue($attributes['style'] ?? 'style-1')
            ->numberItemsPerRow(2))
        ->add('image', MediaImageField::class, MediaImageFieldOption::make()
            ->label(__('Image'))
            ->defaultValue($attributes['image'] ?? null))
        ->add('heading', TextField::class, TextFieldOption::make()
            ->label(__('Heading'))
            ->defaultValue($attributes['heading'] ?? ''))
        ->add('subheading', TextareaField::class, TextareaFieldOption::make()
            ->label(__('Subheading'))
            ->defaultValue($attributes['subheading'] ?? ''))
        ->add('button_text', TextField::class, TextFieldOption::make()
            ->label(__('Button text'))
            ->defaultValue($attributes['button_text'] ?? ''))
        ->add('button_url', TextField::class, TextFieldOption::make()
            ->label(__('Button URL'))
            ->defaultValue($attributes['button_url'] ?? ''))
        ->add('badge_text', TextField::class, TextFieldOption::make()
            ->label(__('Badge text'))
            ->defaultValue($attributes['badge_text'] ?? ''))
        ->add('badge_color', ColorField::class, ColorFieldOption::make()
            ->label(__('Badge color'))
            ->defaultValue($attributes['badge_color'] ?? ''));
});

Shortcode::setPreviewImage('banner-collection', Theme::asset()->url('images/ui-blocks/banner-collection.png'));

// ---- [banner-step-feature] ----
// Composite: full-bleed bg + heading top + 6 benefit pills bottom-left + 2 product cards bottom-right.
// Mirrors home-sneaker.html §6 `<section class="banner-v07">`.
Shortcode::register(
    'banner-step-feature',
    __('Banner with Step Features + Products'),
    __('Full-bleed bg + heading + 6 benefit pills LEFT + 2 product cards RIGHT'),
    function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.banner-step-feature.index', compact('shortcode'));
    }
);

Shortcode::setAdminConfig('banner-step-feature', function (array $attributes) {
    $productChoices = [];
    if (is_plugin_active('ecommerce') && class_exists(Product::class)) {
        $productChoices = Product::query()
            ->wherePublished()->where('is_variation', 0)->limit(200)
            ->pluck('name', 'id')->all();
    }
    $form = ShortcodeForm::createFromArray($attributes)->withLazyLoading();
    $form->add('image', MediaImageField::class, MediaImageFieldOption::make()
        ->label(__('Background image'))->defaultValue($attributes['image'] ?? null));
    $form->add('heading', TextField::class, TextFieldOption::make()
        ->label(__('Heading (supports <br>)'))->defaultValue($attributes['heading'] ?? ''));
    foreach ([1, 2, 3, 4, 5, 6] as $i) {
        $form->add("benefit_{$i}_icon", TextField::class, TextFieldOption::make()
            ->label(__('Benefit :n icon class', ['n' => $i]))->defaultValue($attributes["benefit_{$i}_icon"] ?? ''));
        $form->add("benefit_{$i}_name", TextField::class, TextFieldOption::make()
            ->label(__('Benefit :n name', ['n' => $i]))->defaultValue($attributes["benefit_{$i}_name"] ?? ''));
    }
    foreach ([1, 2] as $i) {
        $form->add("product_id_$i", SelectField::class, SelectFieldOption::make()
            ->label(__('Product :n', ['n' => $i]))
            ->choices(['' => __('— Select product —')] + $productChoices)
            ->searchable()
            ->selected($attributes["product_id_$i"] ?? ''));
    }

    return $form;
});

Shortcode::setPreviewImage('banner-step-feature', Theme::asset()->url('images/ui-blocks/banner-step-feature.png'));

// ---- [feature-callout-quad] ----
// Composite: central exploded product image + 4 feature callouts arranged 2x2 around it.
// Mirrors home-sneaker.html §7 (`section-feature-v2 > banner-feature style-2`).
Shortcode::register(
    'feature-callout-quad',
    __('Feature Callout Quad'),
    __('Central product image surrounded by 4 feature callouts (2x2 grid)'),
    function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.feature-callout-quad.index', compact('shortcode'));
    }
);

Shortcode::setAdminConfig('feature-callout-quad', function (array $attributes) {
    $form = ShortcodeForm::createFromArray($attributes)->withLazyLoading();
    $form->add('title', TextField::class, TextFieldOption::make()
        ->label(__('Section title'))->defaultValue($attributes['title'] ?? ''));
    $form->add('subtitle', TextareaField::class, TextareaFieldOption::make()
        ->label(__('Section subtitle (supports <br>)'))->defaultValue($attributes['subtitle'] ?? ''));
    $form->add('image', MediaImageField::class, MediaImageFieldOption::make()
        ->label(__('Central product image (e.g. exploded view)'))->defaultValue($attributes['image'] ?? null));
    foreach ([1, 2, 3, 4] as $i) {
        $form->add("feature_{$i}_icon", TextField::class, TextFieldOption::make()
            ->label(__('Feature :n icon class (e.g. icon-Wind)', ['n' => $i]))->defaultValue($attributes["feature_{$i}_icon"] ?? ''));
        $form->add("feature_{$i}_name", TextField::class, TextFieldOption::make()
            ->label(__('Feature :n name', ['n' => $i]))->defaultValue($attributes["feature_{$i}_name"] ?? ''));
        $form->add("feature_{$i}_desc", TextareaField::class, TextareaFieldOption::make()
            ->label(__('Feature :n description', ['n' => $i]))->defaultValue($attributes["feature_{$i}_desc"] ?? ''));
    }

    return $form;
});

Shortcode::setPreviewImage('feature-callout-quad', Theme::asset()->url('images/ui-blocks/feature-callout-quad.png'));

// ---- [banner-duo-bottom] ----
// Composite: 2 banner cards in `tf-grid-layout md-col-2` with text BELOW image
// (centered) + per-card bg/text color. Mirrors home-sneaker.html §4.
Shortcode::register(
    'banner-duo-bottom',
    __('Banner Duo Bottom (2-up text-below)'),
    __('Two cards side-by-side with text below image and per-card bg color'),
    function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.banner-duo-bottom.index', compact('shortcode'));
    }
);

Shortcode::setAdminConfig('banner-duo-bottom', function (array $attributes) {
    $form = ShortcodeForm::createFromArray($attributes)->withLazyLoading();
    foreach ([1, 2] as $i) {
        $form->add("image_$i", MediaImageField::class, MediaImageFieldOption::make()
            ->label(__('Card :n image', ['n' => $i]))->defaultValue($attributes["image_$i"] ?? null));
        $form->add("title_$i", TextField::class, TextFieldOption::make()
            ->label(__('Card :n title', ['n' => $i]))->defaultValue($attributes["title_$i"] ?? ''));
        $form->add("desc_$i", TextareaField::class, TextareaFieldOption::make()
            ->label(__('Card :n description', ['n' => $i]))->defaultValue($attributes["desc_$i"] ?? ''));
        $form->add("button_text_$i", TextField::class, TextFieldOption::make()
            ->label(__('Card :n button text', ['n' => $i]))->defaultValue($attributes["button_text_$i"] ?? __('Order Now')));
        $form->add("button_url_$i", TextField::class, TextFieldOption::make()
            ->label(__('Card :n button URL', ['n' => $i]))->defaultValue($attributes["button_url_$i"] ?? '/products'));
        $form->add("bg_class_$i", TextField::class, TextFieldOption::make()
            ->label(__('Card :n bg class (e.g. bg-main / bg-primary)', ['n' => $i]))->defaultValue($attributes["bg_class_$i"] ?? ''));
        $form->add("text_class_$i", TextField::class, TextFieldOption::make()
            ->label(__('Card :n text color class (e.g. text-white)', ['n' => $i]))->defaultValue($attributes["text_class_$i"] ?? ''));
    }

    return $form;
});

Shortcode::setPreviewImage('banner-duo-bottom', Theme::asset()->url('images/ui-blocks/banner-duo-bottom.png'));

// ---- [banner-duo] ----
Shortcode::register(
    'banner-duo',
    __('Banner Duo (2-up grid)'),
    __('Two square banner cards side-by-side with bottom-left text overlay'),
    function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.banner-duo.index', compact('shortcode'));
    }
);

Shortcode::setAdminConfig('banner-duo', function (array $attributes) {
    $form = ShortcodeForm::createFromArray($attributes)->withLazyLoading();
    foreach ([1, 2] as $i) {
        $form->add("image_$i", MediaImageField::class, MediaImageFieldOption::make()
            ->label(__('Banner :n image', ['n' => $i]))
            ->defaultValue($attributes["image_$i"] ?? null));
        $form->add("title_$i", TextField::class, TextFieldOption::make()
            ->label(__('Banner :n title', ['n' => $i]))
            ->defaultValue($attributes["title_$i"] ?? ''));
        $form->add("subtitle_$i", TextareaField::class, TextareaFieldOption::make()
            ->label(__('Banner :n subtitle', ['n' => $i]))
            ->defaultValue($attributes["subtitle_$i"] ?? ''));
        $form->add("button_text_$i", TextField::class, TextFieldOption::make()
            ->label(__('Banner :n button text', ['n' => $i]))
            ->defaultValue($attributes["button_text_$i"] ?? ''));
        $form->add("button_url_$i", TextField::class, TextFieldOption::make()
            ->label(__('Banner :n button URL', ['n' => $i]))
            ->defaultValue($attributes["button_url_$i"] ?? ''));
    }

    return $form;
});

Shortcode::setPreviewImage('banner-duo', Theme::asset()->url('images/ui-blocks/banner-duo.png'));

// ---- [countdown-banner-quad] ----
// Composite: 1 countdown card LEFT + 4 banner-image-text cards (2 in col 2, 2 in col 3)
// in a `tf-grid-layout sm-col-2 xl-col-3` 1+2+2 grid. Mirrors home-organic.html §4.
Shortcode::register(
    'countdown-banner-quad',
    __('Countdown + Banner Quad'),
    __('Countdown card LEFT + four banner-image-text cards in a 1+2+2 grid'),
    function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.countdown-banner-quad.index', compact('shortcode'));
    }
);

Shortcode::setAdminConfig('countdown-banner-quad', function (array $attributes) {
    $form = ShortcodeForm::createFromArray($attributes)->withLazyLoading();

    $form->add('countdown_image', MediaImageField::class, MediaImageFieldOption::make()
        ->label(__('Countdown background image'))
        ->defaultValue($attributes['countdown_image'] ?? null));
    $form->add('countdown_heading', TextField::class, TextFieldOption::make()
        ->label(__('Countdown heading'))
        ->defaultValue($attributes['countdown_heading'] ?? ''));
    $form->add('countdown_subheading', TextareaField::class, TextareaFieldOption::make()
        ->label(__('Countdown subheading'))
        ->defaultValue($attributes['countdown_subheading'] ?? ''));
    $form->add('target_date', TextField::class, TextFieldOption::make()
        ->label(__('Target date (Y-m-d H:i)'))
        ->defaultValue($attributes['target_date'] ?? ''));
    $form->add('countdown_button_text', TextField::class, TextFieldOption::make()
        ->label(__('Countdown button text'))
        ->defaultValue($attributes['countdown_button_text'] ?? ''));
    $form->add('countdown_button_url', TextField::class, TextFieldOption::make()
        ->label(__('Countdown button URL'))
        ->defaultValue($attributes['countdown_button_url'] ?? ''));

    foreach ([1, 2, 3, 4] as $i) {
        $form->add("banner_{$i}_image", MediaImageField::class, MediaImageFieldOption::make()
            ->label(__('Banner :n image', ['n' => $i]))
            ->defaultValue($attributes["banner_{$i}_image"] ?? null));
        $form->add("banner_{$i}_overline", TextField::class, TextFieldOption::make()
            ->label(__('Banner :n overline (red)', ['n' => $i]))
            ->defaultValue($attributes["banner_{$i}_overline"] ?? ''));
        $form->add("banner_{$i}_title", TextField::class, TextFieldOption::make()
            ->label(__('Banner :n title', ['n' => $i]))
            ->defaultValue($attributes["banner_{$i}_title"] ?? ''));
        $form->add("banner_{$i}_button_text", TextField::class, TextFieldOption::make()
            ->label(__('Banner :n button text', ['n' => $i]))
            ->defaultValue($attributes["banner_{$i}_button_text"] ?? ''));
        $form->add("banner_{$i}_button_url", TextField::class, TextFieldOption::make()
            ->label(__('Banner :n button URL', ['n' => $i]))
            ->defaultValue($attributes["banner_{$i}_button_url"] ?? ''));
    }

    return $form;
});

Shortcode::setPreviewImage('countdown-banner-quad', Theme::asset()->url('images/ui-blocks/countdown-banner-quad.png'));

// ---- [hero-grid-asymmetric] ----
// Composite: 1 large hero card + 2 small stacked cards in `grid-cls-layout grid-cls-v3`
// asymmetric grid. Mirrors home-sport.html §1.
Shortcode::register(
    'hero-grid-asymmetric',
    __('Hero Grid (Asymmetric 1+2)'),
    __('Large hero card + 2 small stacked cards in asymmetric grid'),
    function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.hero-grid-asymmetric.index', compact('shortcode'));
    }
);

Shortcode::setAdminConfig('hero-grid-asymmetric', function (array $attributes) {
    $form = ShortcodeForm::createFromArray($attributes)->withLazyLoading();
    $form->add('hero_image', MediaImageField::class, MediaImageFieldOption::make()
        ->label(__('Hero image'))->defaultValue($attributes['hero_image'] ?? null));
    $form->add('hero_title', TextField::class, TextFieldOption::make()
        ->label(__('Hero title (supports <br>)'))->defaultValue($attributes['hero_title'] ?? ''));
    $form->add('hero_desc', TextareaField::class, TextareaFieldOption::make()
        ->label(__('Hero description'))->defaultValue($attributes['hero_desc'] ?? ''));
    $form->add('hero_button_text', TextField::class, TextFieldOption::make()
        ->label(__('Hero button text'))->defaultValue($attributes['hero_button_text'] ?? __('Shop Now')));
    $form->add('hero_button_url', TextField::class, TextFieldOption::make()
        ->label(__('Hero button URL'))->defaultValue($attributes['hero_button_url'] ?? '/products'));
    foreach ([1, 2] as $i) {
        $form->add("card_{$i}_image", MediaImageField::class, MediaImageFieldOption::make()
            ->label(__('Card :n image', ['n' => $i]))->defaultValue($attributes["card_{$i}_image"] ?? null));
        $form->add("card_{$i}_title", TextField::class, TextFieldOption::make()
            ->label(__('Card :n title (supports <br>)', ['n' => $i]))->defaultValue($attributes["card_{$i}_title"] ?? ''));
        $form->add("card_{$i}_desc", TextField::class, TextFieldOption::make()
            ->label(__('Card :n description', ['n' => $i]))->defaultValue($attributes["card_{$i}_desc"] ?? ''));
        $form->add("card_{$i}_button_text", TextField::class, TextFieldOption::make()
            ->label(__('Card :n button text', ['n' => $i]))->defaultValue($attributes["card_{$i}_button_text"] ?? __('Shop Now')));
        $form->add("card_{$i}_button_url", TextField::class, TextFieldOption::make()
            ->label(__('Card :n button URL', ['n' => $i]))->defaultValue($attributes["card_{$i}_button_url"] ?? '/products'));
    }

    return $form;
});

Shortcode::setPreviewImage('hero-grid-asymmetric', Theme::asset()->url('images/ui-blocks/hero-grid-asymmetric.png'));

// ---- [tab-product-showcase] ----
// Composite: heading + numbered tab list LEFT + tab-pane image+product overlay RIGHT.
// Mirrors home-sport.html §5 (`banner-collect-v03 flat-animate-tab-2`).
Shortcode::register(
    'tab-product-showcase',
    __('Tab Product Showcase'),
    __('Numbered tab list LEFT + tab-pane image with product overlay card RIGHT'),
    function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.tab-product-showcase.index', compact('shortcode'));
    }
);

Shortcode::setAdminConfig('tab-product-showcase', function (array $attributes) {
    $productChoices = [];
    if (is_plugin_active('ecommerce') && class_exists(Product::class)) {
        $productChoices = Product::query()
            ->wherePublished()->where('is_variation', 0)->limit(200)
            ->pluck('name', 'id')->all();
    }
    $form = ShortcodeForm::createFromArray($attributes)->withLazyLoading();
    $form->add('title', TextField::class, TextFieldOption::make()
        ->label(__('Section title'))->defaultValue($attributes['title'] ?? ''));
    $form->add('subtitle', TextareaField::class, TextareaFieldOption::make()
        ->label(__('Section subtitle'))->defaultValue($attributes['subtitle'] ?? ''));
    $form->add('view_all_url', TextField::class, TextFieldOption::make()
        ->label(__('View More URL'))->defaultValue($attributes['view_all_url'] ?? '/products'));
    $form->add('view_all_text', TextField::class, TextFieldOption::make()
        ->label(__('View More text'))->defaultValue($attributes['view_all_text'] ?? __('View More')));
    foreach ([1, 2, 3, 4] as $i) {
        $form->add("tab_{$i}_label", TextField::class, TextFieldOption::make()
            ->label(__('Tab :n label', ['n' => $i]))->defaultValue($attributes["tab_{$i}_label"] ?? ''));
        $form->add("tab_{$i}_image", MediaImageField::class, MediaImageFieldOption::make()
            ->label(__('Tab :n image', ['n' => $i]))->defaultValue($attributes["tab_{$i}_image"] ?? null));
        $form->add("tab_{$i}_product_id", SelectField::class, SelectFieldOption::make()
            ->label(__('Tab :n product', ['n' => $i]))
            ->choices(['' => __('— Select product —')] + $productChoices)
            ->searchable()
            ->selected($attributes["tab_{$i}_product_id"] ?? ''));
    }

    return $form;
});

Shortcode::setPreviewImage('tab-product-showcase', Theme::asset()->url('images/ui-blocks/tab-product-showcase.png'));

// ---- [banner-thumbs-product] ----
Shortcode::register(
    'banner-thumbs-product',
    __('Banner with Product Thumbs'),
    __('Hero banner with product thumbnails strip below'),
    function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.banner-thumbs-product.index', compact('shortcode'));
    }
);

Shortcode::setAdminConfig('banner-thumbs-product', function (array $attributes) {
    $productChoices = [];
    if (is_plugin_active('ecommerce') && class_exists(Product::class)) {
        $productChoices = Product::query()
            ->wherePublished()
            ->where('is_variation', 0)
            ->limit(200)
            ->pluck('name', 'id')
            ->all();
    }

    return ShortcodeForm::createFromArray($attributes)
        ->withLazyLoading()
        ->add('style', UiSelectorField::class, UiSelectorFieldOption::make()
            ->label(__('Layout'))
            ->choices([
                'style-1' => ['label' => __('Default'), 'image' => Theme::asset()->url('images/shortcodes/banner-thumbs-product/style-1.png')],
                'style-thumbs-grid' => ['label' => __('Thumbs Grid'), 'image' => Theme::asset()->url('images/shortcodes/banner-thumbs-product/style-thumbs-grid.png')],
            ])
            ->defaultValue($attributes['style'] ?? 'style-1')
            ->numberItemsPerRow(2))
        ->add('main_image', MediaImageField::class, MediaImageFieldOption::make()
            ->label(__('Main image'))
            ->defaultValue($attributes['main_image'] ?? null))
        ->add('heading', TextField::class, TextFieldOption::make()
            ->label(__('Heading'))
            ->defaultValue($attributes['heading'] ?? ''))
        ->add('subheading', TextareaField::class, TextareaFieldOption::make()
            ->label(__('Subheading'))
            ->defaultValue($attributes['subheading'] ?? ''))
        ->add('button_text', TextField::class, TextFieldOption::make()
            ->label(__('Button text'))
            ->defaultValue($attributes['button_text'] ?? ''))
        ->add('button_url', TextField::class, TextFieldOption::make()
            ->label(__('Button URL'))
            ->defaultValue($attributes['button_url'] ?? ''))
        ->add('product_ids', SelectField::class, SelectFieldOption::make()
            ->label(__('Products'))
            ->choices($productChoices)
            ->multiple()
            ->searchable()
            ->selected(ShortcodeField::parseIds($attributes['product_ids'] ?? null) ?? []))
        ->add('thumb_1', MediaImageField::class, MediaImageFieldOption::make()
            ->label(__('Thumb image 1 (style-thumbs-grid)'))
            ->defaultValue($attributes['thumb_1'] ?? null))
        ->add('thumb_2', MediaImageField::class, MediaImageFieldOption::make()
            ->label(__('Thumb image 2 (style-thumbs-grid)'))
            ->defaultValue($attributes['thumb_2'] ?? null))
        ->add('thumb_3', MediaImageField::class, MediaImageFieldOption::make()
            ->label(__('Thumb image 3 (style-thumbs-grid)'))
            ->defaultValue($attributes['thumb_3'] ?? null))
        ->add('thumb_4', MediaImageField::class, MediaImageFieldOption::make()
            ->label(__('Thumb image 4 (style-thumbs-grid)'))
            ->defaultValue($attributes['thumb_4'] ?? null));
});

Shortcode::setPreviewImage('banner-thumbs-product', Theme::asset()->url('images/ui-blocks/banner-thumbs-product.png'));

// ---- [gear-bundle] ----
// Mirrors home-electronics §6 (lines 3716-4279): vertical paired-products swiper LEFT
// + sticky bundle-save widget RIGHT (progress bar, pre-filled bundle, subtotal, CTA).
Shortcode::register(
    'gear-bundle',
    __('Gear Bundle'),
    __('Two-column section: paired product slider + bundle save widget (home-electronics §6)'),
    function (ShortcodeCompiler $shortcode) {
        $products = collect();
        $bundleProducts = collect();
        if (is_plugin_active('ecommerce') && class_exists(Product::class)) {
            $listIds = ShortcodeField::parseIds($shortcode->product_ids ?? null);
            if (! empty($listIds)) {
                $products = Product::query()
                    ->whereIn('id', $listIds)
                    ->wherePublished()
                    ->with(['slugable'])
                    ->orderByRaw('FIELD(id, ' . implode(',', array_map('intval', $listIds)) . ')')
                    ->get();
            }
            $bundleIds = ShortcodeField::parseIds($shortcode->bundle_product_ids ?? null);
            if (! empty($bundleIds)) {
                $bundleProducts = Product::query()
                    ->whereIn('id', $bundleIds)
                    ->wherePublished()
                    ->with(['slugable'])
                    ->orderByRaw('FIELD(id, ' . implode(',', array_map('intval', $bundleIds)) . ')')
                    ->get();
            }
        }

        return Theme::partial('shortcodes.gear-bundle.index', compact('shortcode', 'products', 'bundleProducts'));
    }
);

Shortcode::setAdminConfig('gear-bundle', function (array $attributes) {
    $productChoices = [];
    if (is_plugin_active('ecommerce') && class_exists(Product::class)) {
        $productChoices = Product::query()
            ->wherePublished()
            ->where('is_variation', 0)
            ->limit(200)
            ->pluck('name', 'id')
            ->all();
    }

    return ShortcodeForm::createFromArray($attributes)
        ->withLazyLoading()
        ->add('title', TextField::class, TextFieldOption::make()
            ->label(__('Title'))
            ->defaultValue($attributes['title'] ?? ''))
        ->add('subtitle', TextareaField::class, TextareaFieldOption::make()
            ->label(__('Subtitle'))
            ->defaultValue($attributes['subtitle'] ?? ''))
        ->add('view_all_url', TextField::class, TextFieldOption::make()
            ->label(__('View All URL'))
            ->defaultValue($attributes['view_all_url'] ?? ''))
        ->add('view_all_text', TextField::class, TextFieldOption::make()
            ->label(__('View All text'))
            ->defaultValue($attributes['view_all_text'] ?? ''))
        ->add('product_ids', SelectField::class, SelectFieldOption::make()
            ->label(__('Slider products (paired in 2s)'))
            ->choices($productChoices)
            ->multiple()
            ->searchable()
            ->selected(ShortcodeField::parseIds($attributes['product_ids'] ?? null) ?? []))
        ->add('bundle_caption', TextField::class, TextFieldOption::make()
            ->label(__('Bundle caption'))
            ->defaultValue($attributes['bundle_caption'] ?? __('Buy 3 products and save up to 30%')))
        ->add('bundle_progress', NumberField::class, NumberFieldOption::make()
            ->label(__('Bundle progress %'))
            ->defaultValue($attributes['bundle_progress'] ?? 50))
        ->add('bundle_product_ids', SelectField::class, SelectFieldOption::make()
            ->label(__('Bundle products (3 displayed in cart widget)'))
            ->choices($productChoices)
            ->multiple()
            ->searchable()
            ->selected(ShortcodeField::parseIds($attributes['bundle_product_ids'] ?? null) ?? []))
        ->add('bundle_button_text', TextField::class, TextFieldOption::make()
            ->label(__('Bundle CTA text'))
            ->defaultValue($attributes['bundle_button_text'] ?? __('Add To Cart')))
        ->add('bundle_button_url', TextField::class, TextFieldOption::make()
            ->label(__('Bundle CTA URL'))
            ->defaultValue($attributes['bundle_button_url'] ?? ''));
});

Shortcode::setPreviewImage('gear-bundle', Theme::asset()->url('images/ui-blocks/gear-bundle.png'));

// ---- [newsletter-cta] ----
Shortcode::register(
    'newsletter-cta',
    __('Newsletter CTA'),
    __('Newsletter signup section with optional banner image'),
    function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.newsletter-cta.index', compact('shortcode'));
    }
);

Shortcode::setAdminConfig('newsletter-cta', function (array $attributes) {
    return ShortcodeForm::createFromArray($attributes)
        ->withLazyLoading()
        ->add('style', UiSelectorField::class, UiSelectorFieldOption::make()
            ->label(__('Layout'))
            ->choices([
                'style-default' => ['label' => __('Default'), 'image' => Theme::asset()->url('images/shortcodes/newsletter-cta/style-default.png')],
                'style-banner' => ['label' => __('Banner'),  'image' => Theme::asset()->url('images/shortcodes/newsletter-cta/style-banner.png')],
            ])
            ->defaultValue($attributes['style'] ?? 'style-default')
            ->numberItemsPerRow(2))
        ->add('heading', TextField::class, TextFieldOption::make()
            ->label(__('Heading'))
            ->defaultValue($attributes['heading'] ?? ''))
        ->add('subheading', TextareaField::class, TextareaFieldOption::make()
            ->label(__('Subheading'))
            ->defaultValue($attributes['subheading'] ?? ''))
        ->add('image', MediaImageField::class, MediaImageFieldOption::make()
            ->label(__('Image (optional)'))
            ->defaultValue($attributes['image'] ?? null))
        ->add('submit_button_text', TextField::class, TextFieldOption::make()
            ->label(__('Submit button text'))
            ->defaultValue($attributes['submit_button_text'] ?? __('Subscribe')))
        ->add('mailchimp_list_id', TextField::class, TextFieldOption::make()
            ->label(__('Mailchimp list ID (optional)'))
            ->defaultValue($attributes['mailchimp_list_id'] ?? ''))
        ->add('background_color', ColorField::class, ColorFieldOption::make()
            ->label(__('Background color'))
            ->defaultValue($attributes['background_color'] ?? ''));
});

Shortcode::setPreviewImage('newsletter-cta', Theme::asset()->url('images/ui-blocks/newsletter-cta.png'));

// ---- [brand-logos] ----
Shortcode::register(
    'brand-logos',
    __('Brand Logos'),
    __('Showcase brand logos in a grid or slider'),
    function (ShortcodeCompiler $shortcode) {
        if (! is_plugin_active('ecommerce')) {
            return '';
        }

        return Theme::partial('shortcodes.brand-logos.index', compact('shortcode'));
    }
);

Shortcode::setAdminConfig('brand-logos', function (array $attributes) {
    $brandChoices = [];
    if (is_plugin_active('ecommerce') && class_exists(Brand::class)) {
        $brandChoices = Brand::query()
            ->wherePublished()
            ->pluck('name', 'id')
            ->all();
    }

    return ShortcodeForm::createFromArray($attributes)
        ->withLazyLoading()
        ->add('style', UiSelectorField::class, UiSelectorFieldOption::make()
            ->label(__('Layout'))
            ->choices([
                'style-grid' => ['label' => __('Grid'),   'image' => Theme::asset()->url('images/shortcodes/brand-logos/style-grid.png')],
                'style-slider' => ['label' => __('Slider'), 'image' => Theme::asset()->url('images/shortcodes/brand-logos/style-slider.png')],
                'style-infinite' => ['label' => __('Infinite'), 'image' => Theme::asset()->url('images/shortcodes/brand-logos/style-slider.png')],
            ])
            ->defaultValue($attributes['style'] ?? 'style-grid')
            ->numberItemsPerRow(2))
        ->add('title', TextField::class, TextFieldOption::make()
            ->label(__('Title'))
            ->defaultValue($attributes['title'] ?? ''))
        ->add('brand_ids', SelectField::class, SelectFieldOption::make()
            ->label(__('Brands'))
            ->choices($brandChoices)
            ->multiple()
            ->searchable()
            ->selected(ShortcodeField::parseIds($attributes['brand_ids'] ?? null) ?? []))
        ->add('items_per_row', NumberField::class, NumberFieldOption::make()
            ->label(__('Items per row'))
            ->defaultValue((int) ($attributes['items_per_row'] ?? 6)));
});

Shortcode::setPreviewImage('brand-logos', Theme::asset()->url('images/ui-blocks/brand-logos.png'));

// ---- [image-gallery] ----
// Uses 'image-gallery' (NOT 'gallery') because the Botble Gallery plugin
// already registers a 'gallery' shortcode for its own gallery model.
Shortcode::register(
    'image-gallery',
    __('Image Gallery'),
    __('Image gallery slider with hover-to-view link (e.g. Shop Instagram)'),
    function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.image-gallery.index', compact('shortcode'));
    }
);

Shortcode::setAdminConfig('image-gallery', function (array $attributes) {
    return ShortcodeForm::createFromArray($attributes)
        ->withLazyLoading()
        ->add('style', UiSelectorField::class, UiSelectorFieldOption::make()
            ->label(__('Layout'))
            ->choices([
                'style-default' => ['label' => __('Default'), 'image' => Theme::asset()->url('images/shortcodes/image-gallery/style-default.png')],
            ])
            ->defaultValue($attributes['style'] ?? 'style-default')
            ->numberItemsPerRow(1))
        ->add('title', TextField::class, TextFieldOption::make()
            ->label(__('Title'))
            ->defaultValue($attributes['title'] ?? ''))
        ->add('subtitle', TextareaField::class, TextareaFieldOption::make()
            ->label(__('Subtitle'))
            ->defaultValue($attributes['subtitle'] ?? ''))
        ->add('items', ShortcodeTabsField::class, ShortcodeTabsFieldOption::make()
            ->label(__('Items'))
            ->fields([
                'image' => ['title' => __('Image'), 'type' => 'image'],
                'link' => ['title' => __('Link URL')],
            ])
            ->attrs($attributes));
});

Shortcode::setPreviewImage('image-gallery', Theme::asset()->url('images/ui-blocks/image-gallery.png'));

// ---- [infinity-marquee] ----
// Infinite horizontal scroller with circular images interspersed between
// captions. Backed by the bundled infinityslide.js vendor (already loaded
// via config.php). Mirrors the html/index.html "Style in Motion / Own Your
// Look / Chic by Nature ..." block.
Shortcode::register(
    'infinity-marquee',
    __('Infinity Marquee'),
    __('Continuous horizontal slider with captions and circular images'),
    function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.infinity-marquee.index', compact('shortcode'));
    }
);

Shortcode::setAdminConfig('infinity-marquee', function (array $attributes) {
    return ShortcodeForm::createFromArray($attributes)
        ->withLazyLoading()
        ->add('style', UiSelectorField::class, UiSelectorFieldOption::make()
            ->label(__('Layout'))
            ->choices([
                'style-1' => ['label' => __('Default'), 'image' => Theme::asset()->url('images/shortcodes/infinity-marquee/style-1.png')],
            ])
            ->defaultValue($attributes['style'] ?? 'style-1')
            ->numberItemsPerRow(1))
        ->add('background_class', SelectField::class, SelectFieldOption::make()
            ->label(__('Background'))
            ->choices([
                'bg-main-2' => __('Soft (default)'),
                'bg-main' => __('Main'),
                '' => __('Transparent'),
            ])
            ->selected($attributes['background_class'] ?? 'bg-main-2'))
        ->add('clone_count', NumberField::class, NumberFieldOption::make()
            ->label(__('Clone count (loop multiplier)'))
            ->defaultValue((int) ($attributes['clone_count'] ?? 3)))
        ->add('items', ShortcodeTabsField::class, ShortcodeTabsFieldOption::make()
            ->label(__('Items'))
            ->fields([
                'heading' => ['title' => __('Heading')],
                'image' => ['title' => __('Image'), 'type' => 'image'],
                'link' => ['title' => __('Link URL')],
            ])
            ->attrs($attributes));
});

Shortcode::setPreviewImage('infinity-marquee', Theme::asset()->url('images/ui-blocks/infinity-marquee.png'));

// ---- [before-after-image] ----
// Interactive Before/After image slider powered by the bundled
// image-compare-viewer vendor (public/js/vendors/image-compare-viewer.min.js +
// public/css/vendors/image-compare-viewer.min.css). Common cosmetic /
// skincare niche component (e.g. retouching, treatment results).
Shortcode::register(
    'before-after-image',
    __('Before / After Image'),
    __('Interactive image comparison slider with draggable handle (cosmetic, skincare, retouch demos)'),
    function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.before-after-image.index', compact('shortcode'));
    }
);

Shortcode::setAdminConfig('before-after-image', function (array $attributes) {
    return ShortcodeForm::createFromArray($attributes)
        ->withLazyLoading()
        ->add('style', UiSelectorField::class, UiSelectorFieldOption::make()
            ->label(__('Layout'))
            ->choices([
                'style-default' => ['label' => __('Default'), 'image' => Theme::asset()->url('images/shortcodes/before-after-image/style-default.png')],
            ])
            ->defaultValue($attributes['style'] ?? 'style-default')
            ->numberItemsPerRow(1))
        ->add('before_image', MediaImageField::class, MediaImageFieldOption::make()
            ->label(__('Before image'))
            ->defaultValue($attributes['before_image'] ?? null))
        ->add('after_image', MediaImageField::class, MediaImageFieldOption::make()
            ->label(__('After image'))
            ->defaultValue($attributes['after_image'] ?? null))
        ->add('heading', TextField::class, TextFieldOption::make()
            ->label(__('Heading'))
            ->defaultValue($attributes['heading'] ?? ''))
        ->add('subheading', TextareaField::class, TextareaFieldOption::make()
            ->label(__('Subheading'))
            ->defaultValue($attributes['subheading'] ?? ''))
        ->add('before_label', TextField::class, TextFieldOption::make()
            ->label(__('Before label'))
            ->defaultValue($attributes['before_label'] ?? __('Before')))
        ->add('after_label', TextField::class, TextFieldOption::make()
            ->label(__('After label'))
            ->defaultValue($attributes['after_label'] ?? __('After')))
        ->add('orientation', SelectField::class, SelectFieldOption::make()
            ->label(__('Orientation'))
            ->choices([
                'horizontal' => __('Horizontal'),
                'vertical' => __('Vertical'),
            ])
            ->selected($attributes['orientation'] ?? 'horizontal'))
        ->add('slider_color', ColorField::class, ColorFieldOption::make()
            ->label(__('Slider handle color'))
            ->defaultValue($attributes['slider_color'] ?? '#ffffff'))
        ->add('slider_position_percent', NumberField::class, NumberFieldOption::make()
            ->label(__('Initial slider position (%)'))
            ->defaultValue((int) ($attributes['slider_position_percent'] ?? 50)));
});

Shortcode::setPreviewImage('before-after-image', Theme::asset()->url('images/ui-blocks/before-after-image.png'));

// ---- [instagram-feed] ----
// Instagram-style feed sourced from a Botble Gallery record. The merchant
// picks a published gallery; its images (managed via the gallery metabox)
// render in a grid OR Swiper carousel and link to the gallery detail page.
// Falls back to a friendly empty-state in admin when no gallery is selected
// or the gallery has no images.
Shortcode::register(
    'instagram-feed',
    __('Instagram Feed'),
    __('Display images from a Gallery in an Instagram-style grid or carousel'),
    function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.instagram-feed.index', compact('shortcode'));
    }
);

Shortcode::setAdminConfig('instagram-feed', function (array $attributes) {
    $galleryChoices = is_plugin_active('gallery')
        ? Gallery::query()
            ->wherePublished()
            ->orderBy('order')
            ->latest()
            ->pluck('name', 'id')
            ->all()
        : [];

    return ShortcodeForm::createFromArray($attributes)
        ->withLazyLoading()
        ->add('style', UiSelectorField::class, UiSelectorFieldOption::make()
            ->label(__('Layout'))
            ->choices([
                'style-grid' => ['label' => __('Grid'),     'image' => Theme::asset()->url('images/shortcodes/instagram-feed/style-grid.png')],
                'style-carousel' => ['label' => __('Carousel'), 'image' => Theme::asset()->url('images/shortcodes/instagram-feed/style-carousel.png')],
            ])
            ->defaultValue($attributes['style'] ?? 'style-grid')
            ->numberItemsPerRow(2))
        ->add('gallery_id', SelectField::class, SelectFieldOption::make()
            ->label(__('Gallery'))
            ->helperText(__('Pick a published gallery; its images will be displayed and linked to the gallery detail page.'))
            ->choices(['' => __('— Select a gallery —')] + $galleryChoices)
            ->selected((string) ($attributes['gallery_id'] ?? '')))
        ->add('heading', TextField::class, TextFieldOption::make()
            ->label(__('Heading (optional, falls back to gallery name)'))
            ->defaultValue($attributes['heading'] ?? ''))
        ->add('subheading', TextareaField::class, TextareaFieldOption::make()
            ->label(__('Subheading (optional, falls back to gallery description)'))
            ->defaultValue($attributes['subheading'] ?? ''))
        ->add('limit', NumberField::class, NumberFieldOption::make()
            ->label(__('Maximum images to display (0 = all)'))
            ->defaultValue((int) ($attributes['limit'] ?? 12)))
        ->add('columns', NumberField::class, NumberFieldOption::make()
            ->label(__('Columns (grid layout only, 2-8)'))
            ->defaultValue((int) ($attributes['columns'] ?? 6)))
        ->add('gap', NumberField::class, NumberFieldOption::make()
            ->label(__('Gap between images (px)'))
            ->defaultValue((int) ($attributes['gap'] ?? 8)))
        ->add('show_overlay', OnOffField::class, OnOffFieldOption::make()
            ->label(__('Show overlay icon on hover'))
            ->defaultValue($attributes['show_overlay'] ?? 'yes'));
});

Shortcode::setPreviewImage('instagram-feed', Theme::asset()->url('images/ui-blocks/instagram-feed.png'));

// ============================================================
// CMS page-content shortcodes — render full pages whose content
// would otherwise need bespoke views. Admin places one shortcode
// per page; the page template stays generic (`landing`).
// ============================================================

// ---- [page-banner] ----
Shortcode::register(
    'page-banner',
    __('Page Title Banner'),
    __('Reusable page-title section with breadcrumb, heading, and optional subtitle'),
    function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.page-banner.index', compact('shortcode'));
    }
);

Shortcode::setAdminConfig('page-banner', function (array $attributes) {
    return ShortcodeForm::createFromArray($attributes)
        ->withLazyLoading()
        ->add('heading', TextField::class, TextFieldOption::make()
            ->label(__('Heading'))
            ->defaultValue($attributes['heading'] ?? ''))
        ->add('subtitle', TextareaField::class, TextareaFieldOption::make()
            ->label(__('Subtitle (HTML allowed)'))
            ->defaultValue($attributes['subtitle'] ?? ''))
        ->add('home_label', TextField::class, TextFieldOption::make()
            ->label(__('Home breadcrumb label'))
            ->defaultValue($attributes['home_label'] ?? __('Home')));
});

// ---- [stats-counter] ----
Shortcode::register(
    'stats-counter',
    __('Hero + Stats Counter'),
    __('Hero image, heading, description, and a swipeable counter row (animated count-up)'),
    function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.stats-counter.index', compact('shortcode'));
    }
);

Shortcode::setAdminConfig('stats-counter', function (array $attributes) {
    return ShortcodeForm::createFromArray($attributes)
        ->withLazyLoading()
        ->add('hero_image', MediaImageField::class, MediaImageFieldOption::make()
            ->label(__('Hero image'))
            ->defaultValue($attributes['hero_image'] ?? ''))
        ->add('heading', TextField::class, TextFieldOption::make()
            ->label(__('Heading'))
            ->defaultValue($attributes['heading'] ?? ''))
        ->add('description', TextareaField::class, TextareaFieldOption::make()
            ->label(__('Description'))
            ->defaultValue($attributes['description'] ?? ''))
        ->add('items', ShortcodeTabsField::class, ShortcodeTabsFieldOption::make()
            ->label(__('Stats'))
            ->fields([
                'value' => ['title' => __('Static value (used when animate_to is empty)')],
                'animate_to' => ['title' => __('Animate count-up target (number)')],
                'suffix' => ['title' => __('Suffix (e.g. k, +)')],
                'label' => ['title' => __('Label')],
                'desc' => ['title' => __('Description'), 'type' => 'textarea'],
            ])
            ->attrs($attributes));
});

// ---- [image-accordion] ----
Shortcode::register(
    'image-accordion',
    __('Image + Accordion'),
    __('Side-by-side banner image with an accordion FAQ list'),
    function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.image-accordion.index', compact('shortcode'));
    }
);

Shortcode::setAdminConfig('image-accordion', function (array $attributes) {
    return ShortcodeForm::createFromArray($attributes)
        ->withLazyLoading()
        ->add('image', MediaImageField::class, MediaImageFieldOption::make()
            ->label(__('Image'))
            ->defaultValue($attributes['image'] ?? ''))
        ->add('heading', TextField::class, TextFieldOption::make()
            ->label(__('Heading'))
            ->defaultValue($attributes['heading'] ?? ''))
        ->add('items', ShortcodeTabsField::class, ShortcodeTabsFieldOption::make()
            ->label(__('FAQ items'))
            ->fields([
                'title' => ['title' => __('Question / heading')],
                'body' => ['title' => __('Answer (HTML allowed)'), 'type' => 'textarea'],
            ])
            ->attrs($attributes));
});

// ---- [about-testimonials] ----
Shortcode::register(
    'about-testimonials',
    __('Testimonials (image-side card)'),
    __('2-up testimonial swiper with image-left + content layout (matches about reference)'),
    function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.about-testimonials.index', compact('shortcode'));
    }
);

Shortcode::setAdminConfig('about-testimonials', function (array $attributes) {
    return ShortcodeForm::createFromArray($attributes)
        ->withLazyLoading()
        ->add('heading', TextField::class, TextFieldOption::make()
            ->label(__('Heading'))
            ->defaultValue($attributes['heading'] ?? ''))
        ->add('subtitle', TextareaField::class, TextareaFieldOption::make()
            ->label(__('Subtitle'))
            ->defaultValue($attributes['subtitle'] ?? ''))
        ->add('verified_label', TextField::class, TextFieldOption::make()
            ->label(__('"Verified Buyer" label'))
            ->defaultValue($attributes['verified_label'] ?? __('Verified Buyer')))
        ->add('items', ShortcodeTabsField::class, ShortcodeTabsFieldOption::make()
            ->label(__('Testimonials'))
            ->fields([
                'image' => ['title' => __('Image'), 'type' => 'image'],
                'name' => ['title' => __('Customer name')],
                'text' => ['title' => __('Quote'), 'type' => 'textarea'],
            ])
            ->attrs($attributes));
});

// ---- [about-team] ----
Shortcode::register(
    'about-team',
    __('Team Members (social-hover card)'),
    __('Team members swiper with hover-revealed social icons (matches about reference)'),
    function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.about-team.index', compact('shortcode'));
    }
);

Shortcode::setAdminConfig('about-team', function (array $attributes) {
    return ShortcodeForm::createFromArray($attributes)
        ->withLazyLoading()
        ->add('heading', TextField::class, TextFieldOption::make()
            ->label(__('Heading'))
            ->defaultValue($attributes['heading'] ?? ''))
        ->add('subtitle', TextareaField::class, TextareaFieldOption::make()
            ->label(__('Subtitle'))
            ->defaultValue($attributes['subtitle'] ?? ''))
        ->add('items', ShortcodeTabsField::class, ShortcodeTabsFieldOption::make()
            ->label(__('Members'))
            ->fields([
                'image' => ['title' => __('Photo'), 'type' => 'image'],
                'name' => ['title' => __('Name')],
                'role' => ['title' => __('Role')],
                'social_links' => ['title' => __('Social links JSON ({"icon-FacebookLogo":"https://..."})')],
            ])
            ->attrs($attributes));
});

// ---- [faq-page] ----
Shortcode::register(
    'faq-page',
    __('FAQ List with Sidebar'),
    __('FAQ accordion list grouped by category, with sidebar nav and optional promo banner'),
    function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.faq-page.index', compact('shortcode'));
    }
);

Shortcode::setAdminConfig('faq-page', function (array $attributes) {
    return ShortcodeForm::createFromArray($attributes)
        ->withLazyLoading()
        ->add('items', ShortcodeTabsField::class, ShortcodeTabsFieldOption::make()
            ->label(__('Q&As'))
            ->fields([
                'category' => ['title' => __('Category heading (group label)')],
                'category_id' => ['title' => __('Category id (anchor slug)')],
                'question' => ['title' => __('Question')],
                'answer' => ['title' => __('Answer (HTML allowed)'), 'type' => 'textarea'],
            ])
            ->attrs($attributes))
        ->add('categories_label', TextField::class, TextFieldOption::make()
            ->label(__('Sidebar "Categories" heading'))
            ->defaultValue($attributes['categories_label'] ?? __('Categories')))
        ->add('sidebar_image', MediaImageField::class, MediaImageFieldOption::make()
            ->label(__('Sidebar promo image'))
            ->defaultValue($attributes['sidebar_image'] ?? ''))
        ->add('sidebar_title', TextField::class, TextFieldOption::make()
            ->label(__('Sidebar promo title'))
            ->defaultValue($attributes['sidebar_title'] ?? ''))
        ->add('sidebar_subtitle', TextField::class, TextFieldOption::make()
            ->label(__('Sidebar promo subtitle'))
            ->defaultValue($attributes['sidebar_subtitle'] ?? ''))
        ->add('sidebar_cta', TextField::class, TextFieldOption::make()
            ->label(__('Sidebar CTA button text'))
            ->defaultValue($attributes['sidebar_cta'] ?? ''))
        ->add('sidebar_url', TextField::class, TextFieldOption::make()
            ->label(__('Sidebar promo URL'))
            ->defaultValue($attributes['sidebar_url'] ?? ''));
});

// ---- [term-content] ----
Shortcode::register(
    'term-content',
    __('Terms / Policy Sections'),
    __('Section-term-user wrapper with a list of term-items (Privacy / Terms / Returns / Shipping)'),
    function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.term-content.index', compact('shortcode'));
    }
);

Shortcode::setAdminConfig('term-content', function (array $attributes) {
    return ShortcodeForm::createFromArray($attributes)
        ->withLazyLoading()
        ->add('items', ShortcodeTabsField::class, ShortcodeTabsFieldOption::make()
            ->label(__('Sections'))
            ->fields([
                'title' => ['title' => __('Heading')],
                'body' => ['title' => __('Body (HTML)'), 'type' => 'textarea'],
            ])
            ->attrs($attributes));
});
