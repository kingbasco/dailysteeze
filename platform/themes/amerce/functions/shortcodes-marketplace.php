<?php

// ============================================================
// Marketplace shortcodes registry
// Filled by phase-10f (1 shortcode: ecommerce-vendors).
// All registrations gated by is_plugin_active('marketplace') early-return below.
// ============================================================

use Botble\Base\Forms\FieldOptions\NumberFieldOption;
use Botble\Base\Forms\FieldOptions\TextFieldOption;
use Botble\Base\Forms\FieldOptions\UiSelectorFieldOption;
use Botble\Base\Forms\Fields\NumberField;
use Botble\Base\Forms\Fields\TextField;
use Botble\Base\Forms\Fields\UiSelectorField;
use Botble\Marketplace\Models\Store;
use Botble\Marketplace\Repositories\Interfaces\StoreInterface;
use Botble\Shortcode\Facades\Shortcode;
use Botble\Shortcode\Forms\ShortcodeForm;
use Botble\Theme\Facades\Theme;

if (! is_plugin_active('marketplace')) {
    return;
}

// ============================================================
// 1. [ecommerce-vendors] — Marketplace stores grid/slider
// ============================================================
Shortcode::register(
    'ecommerce-vendors',
    __('Marketplace: Vendors'),
    __('Display marketplace stores in a grid or slider'),
    function ($shortcode) {
        if (! is_plugin_active('marketplace')) {
            return '';
        }

        $ids = Shortcode::fields()->getIds('vendor_ids', $shortcode);
        $params = ['condition' => ['status' => 'published']];

        if (! empty($ids)) {
            $params['condition'][] = ['id', 'IN', $ids];
        }

        $params['take'] = (int) $shortcode->limit ?: 12;
        $params['with'] = ['slugable'];

        $vendors = app(StoreInterface::class)
            ->advancedGet($params);

        return Theme::partial('shortcodes.ecommerce-vendors.index', compact('shortcode', 'vendors'));
    }
);

Shortcode::setAdminConfig('ecommerce-vendors', function (array $attributes) {
    return ShortcodeForm::createFromArray($attributes)
        ->withLazyLoading()
        ->add('style', UiSelectorField::class, UiSelectorFieldOption::make()
            ->label(__('Layout'))
            ->choices([
                'style-grid' => ['label' => __('Grid'), 'image' => Theme::asset()->url('images/shortcodes/ecommerce-vendors/grid.png')],
                'style-slider' => ['label' => __('Slider'), 'image' => Theme::asset()->url('images/shortcodes/ecommerce-vendors/slider.png')],
            ])
            ->defaultValue($attributes['style'] ?? 'style-grid')
            ->numberItemsPerRow(2))
        ->add('title', TextField::class, TextFieldOption::make()->label(__('Title')))
        ->add('subtitle', TextField::class, TextFieldOption::make()->label(__('Subtitle')))
        ->add('vendor_ids', 'multiCheckList', [
            'label' => __('Vendors'),
            'choices' => Store::query()->pluck('name', 'id')->all(),
        ])
        ->add('limit', NumberField::class, NumberFieldOption::make()->label(__('Limit'))->defaultValue($attributes['limit'] ?? 12))
        ->add('items_per_row', NumberField::class, NumberFieldOption::make()->label(__('Items per row'))->defaultValue($attributes['items_per_row'] ?? 4));
});

Shortcode::setPreviewImage('ecommerce-vendors', Theme::asset()->url('images/ui-blocks/ecommerce-vendors.png'));
