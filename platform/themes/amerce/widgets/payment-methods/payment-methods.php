<?php

namespace Theme\Amerce\Widgets;

use Botble\Base\Forms\FieldOptions\TextFieldOption;
use Botble\Base\Forms\Fields\TextField;
use Botble\Shortcode\Forms\FieldOptions\ShortcodeTabsFieldOption;
use Botble\Shortcode\Forms\Fields\ShortcodeTabsField;
use Botble\Widget\AbstractWidget;
use Botble\Widget\Forms\WidgetForm;

class PaymentMethodsWidget extends AbstractWidget
{
    public function __construct()
    {
        parent::__construct([
            'name' => __('Payment Methods'),
            'description' => __('Display accepted payment method icons.'),
            'title' => '',
        ]);
    }

    protected function settingForm(): WidgetForm|string|null
    {
        return WidgetForm::createFromArray($this->getConfig())
            ->add('title', TextField::class, TextFieldOption::make()
                ->label(__('Title (e.g. "Guaranteed Safe Checkout:") — leave empty for plain icon row')))
            ->add('images', ShortcodeTabsField::class, ShortcodeTabsFieldOption::make()
                ->label(__('Payment Method Icons'))
                ->fields([
                    'image' => ['title' => __('Icon image'), 'type' => 'mediaImage'],
                ]));
    }
}
