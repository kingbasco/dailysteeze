<?php

namespace Theme\Amerce\Widgets;

use Botble\Base\Forms\FieldOptions\SelectFieldOption;
use Botble\Base\Forms\FieldOptions\TextFieldOption;
use Botble\Base\Forms\Fields\SelectField;
use Botble\Base\Forms\Fields\TextField;
use Botble\Widget\AbstractWidget;
use Botble\Widget\Forms\WidgetForm;

class SocialLinksWidget extends AbstractWidget
{
    public function __construct()
    {
        parent::__construct([
            'name' => __('Social Links'),
            'description' => __('Display social media links from theme settings.'),
        ]);
    }

    protected function settingForm(): WidgetForm|string|null
    {
        return WidgetForm::createFromArray($this->getConfig())
            ->add('title', TextField::class, TextFieldOption::make()
                ->label(__('Title')))
            ->add('target', SelectField::class, SelectFieldOption::make()
                ->label(__('Link Target'))
                ->choices(['_self' => __('Same Window'), '_blank' => __('New Window')])
                ->defaultValue('_blank'));
    }
}
