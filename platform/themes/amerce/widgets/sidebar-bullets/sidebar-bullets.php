<?php

namespace Theme\Amerce\Widgets;

use Botble\Base\Forms\FieldOptions\TextFieldOption;
use Botble\Base\Forms\Fields\TextField;
use Botble\Shortcode\Forms\FieldOptions\ShortcodeTabsFieldOption;
use Botble\Shortcode\Forms\Fields\ShortcodeTabsField;
use Botble\Widget\AbstractWidget;
use Botble\Widget\Forms\WidgetForm;

class SidebarBulletsWidget extends AbstractWidget
{
    public function __construct()
    {
        parent::__construct([
            'name' => __('Sidebar Bullets'),
            'description' => __('Freeform list of icon + text bullets for the product detail sidebar (e.g. shipping promises, in-store pickup, region-specific delivery options).'),
            'title' => '',
            'icon' => 'icon-CheckCircle',
        ]);
    }

    protected function settingForm(): WidgetForm|string|null
    {
        return WidgetForm::createFromArray($this->getConfig())
            ->add('title', TextField::class, TextFieldOption::make()
                ->label(__('Title (optional — e.g. "Shipping & Delivery"). Leave empty for plain list.')))
            ->add('icon', TextField::class, TextFieldOption::make()
                ->label(__('Default icon class (used when a row has no per-row icon override). Example: icon-CheckCircle, icon-Truck, icon-Timer.')))
            ->add('items', ShortcodeTabsField::class, ShortcodeTabsFieldOption::make()
                ->label(__('Bullets'))
                ->fields([
                    'text' => ['title' => __('Text'), 'type' => 'text'],
                    'icon' => ['title' => __('Icon class (optional, overrides default)'), 'type' => 'text'],
                ]));
    }

    protected function requiredPlugins(): array
    {
        return ['ecommerce'];
    }
}
