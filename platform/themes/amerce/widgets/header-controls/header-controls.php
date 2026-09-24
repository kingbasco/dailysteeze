<?php

namespace Theme\Amerce\Widgets;

use Botble\Base\Forms\FieldOptions\OnOffFieldOption;
use Botble\Base\Forms\Fields\OnOffField;
use Botble\Widget\AbstractWidget;
use Botble\Widget\Forms\WidgetForm;

class HeaderControlsWidget extends AbstractWidget
{
    public function __construct()
    {
        parent::__construct([
            'name' => __('Header Controls'),
            'description' => __('Display header action buttons (search, dark mode, language).'),
        ]);
    }

    protected function settingForm(): WidgetForm|string|null
    {
        return WidgetForm::createFromArray($this->getConfig())
            ->add('show_search', OnOffField::class, OnOffFieldOption::make()
                ->label(__('Show Search')))
            ->add('show_dark_toggle', OnOffField::class, OnOffFieldOption::make()
                ->label(__('Show Dark Mode Toggle')))
            ->add('show_language_switcher', OnOffField::class, OnOffFieldOption::make()
                ->label(__('Show Language Switcher')));
    }
}
