<?php

namespace Theme\Amerce\Widgets;

use Botble\Base\Forms\FieldOptions\TextareaFieldOption;
use Botble\Base\Forms\FieldOptions\TextFieldOption;
use Botble\Base\Forms\Fields\TextareaField;
use Botble\Base\Forms\Fields\TextField;
use Botble\Widget\AbstractWidget;
use Botble\Widget\Forms\WidgetForm;

class SiteInfoWidget extends AbstractWidget
{
    public function __construct()
    {
        parent::__construct([
            'name' => __('Site Information'),
            'description' => __('Company info and contact details for footer.'),
        ]);
    }

    protected function settingForm(): WidgetForm|string|null
    {
        return WidgetForm::createFromArray($this->getConfig())
            ->add('name', TextField::class, TextFieldOption::make()
                ->label(__('Company Name')))
            ->add('address', TextField::class, TextFieldOption::make()
                ->label(__('Address')))
            ->add('phone', TextField::class, TextFieldOption::make()
                ->label(__('Phone')))
            ->add('email', TextField::class, TextFieldOption::make()
                ->label(__('Email')))
            ->add('description', TextareaField::class, TextareaFieldOption::make()
                ->label(__('Description')));
    }
}
