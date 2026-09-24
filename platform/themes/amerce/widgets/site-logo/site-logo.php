<?php

namespace Theme\Amerce\Widgets;

use Botble\Base\Forms\FieldOptions\HtmlFieldOption;
use Botble\Base\Forms\Fields\HtmlField;
use Botble\Widget\AbstractWidget;
use Botble\Widget\Forms\WidgetForm;

class SiteLogoWidget extends AbstractWidget
{
    public function __construct()
    {
        parent::__construct([
            'name' => __('Site Logo'),
            'description' => __('Display the site logo with dark/light mode support.'),
        ]);
    }

    protected function settingForm(): WidgetForm|string|null
    {
        return WidgetForm::createFromArray($this->getConfig())
            ->add('info', HtmlField::class, HtmlFieldOption::make()
                ->content(__('Displays logo from Theme Options → General → Logo.')));
    }
}
