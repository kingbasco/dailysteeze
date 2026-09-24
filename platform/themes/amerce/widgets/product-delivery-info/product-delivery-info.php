<?php

namespace Theme\Amerce\Widgets;

use Botble\Base\Forms\FieldOptions\TextFieldOption;
use Botble\Base\Forms\Fields\TextField;
use Botble\Widget\AbstractWidget;
use Botble\Widget\Forms\WidgetForm;

class ProductDeliveryInfoWidget extends AbstractWidget
{
    public function __construct()
    {
        parent::__construct([
            'name' => __('Product Delivery & Return'),
            'description' => __('Estimated delivery and return policy lines for the product detail sidebar.'),
            'estimated_intl' => '12-26 Days',
            'estimated_intl_label' => 'International',
            'estimated_local' => '3-6 Days',
            'estimated_local_label' => 'United States',
            'return_within' => '45 Days',
            'return_text' => 'of purchase. Duties & taxes are non-refundable.',
        ]);
    }

    protected function settingForm(): WidgetForm|string|null
    {
        return WidgetForm::createFromArray($this->getConfig())
            ->add('estimated_intl', TextField::class, TextFieldOption::make()
                ->label(__('International Delivery (e.g. "12-26 Days")')))
            ->add('estimated_intl_label', TextField::class, TextFieldOption::make()
                ->label(__('International Region Label (e.g. "International")')))
            ->add('estimated_local', TextField::class, TextFieldOption::make()
                ->label(__('Domestic Delivery (e.g. "3-6 Days")')))
            ->add('estimated_local_label', TextField::class, TextFieldOption::make()
                ->label(__('Domestic Region Label (e.g. "United States")')))
            ->add('return_within', TextField::class, TextFieldOption::make()
                ->label(__('Return Window (e.g. "45 Days")')))
            ->add('return_text', TextField::class, TextFieldOption::make()
                ->label(__('Return Notice (text after the window)')));
    }

    protected function requiredPlugins(): array
    {
        return ['ecommerce'];
    }
}
