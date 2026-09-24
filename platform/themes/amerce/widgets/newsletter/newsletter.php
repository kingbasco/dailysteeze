<?php

namespace Theme\Amerce\Widgets;

use Botble\Base\Forms\FieldOptions\TextareaFieldOption;
use Botble\Base\Forms\FieldOptions\TextFieldOption;
use Botble\Base\Forms\Fields\TextareaField;
use Botble\Base\Forms\Fields\TextField;
use Botble\Widget\AbstractWidget;
use Botble\Widget\Forms\WidgetForm;

class NewsletterWidget extends AbstractWidget
{
    public function __construct()
    {
        parent::__construct([
            'name' => __('Newsletter'),
            'description' => __('Email subscription form (requires newsletter plugin).'),
        ]);
    }

    protected function settingForm(): WidgetForm|string|null
    {
        return WidgetForm::createFromArray($this->getConfig())
            ->add('heading', TextField::class, TextFieldOption::make()
                ->label(__('Heading')))
            ->add('subheading', TextareaField::class, TextareaFieldOption::make()
                ->label(__('Subheading')))
            ->add('button_text', TextField::class, TextFieldOption::make()
                ->label(__('Button Text')));
    }
}
